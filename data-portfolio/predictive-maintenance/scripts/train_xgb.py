import argparse
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import Pipeline
from sklearn.metrics import classification_report, accuracy_score
from imblearn.over_sampling import SMOTE
from xgboost import XGBClassifier
import joblib

NUMERIC = ['Air temperature [K]', 'Process temperature [K]', 'Rotational speed [rpm]',
           'Torque [Nm]', 'Tool wear [min]']

def winsorize_series(s, lower=0.05, upper=0.95):
    lo = s.quantile(lower)
    hi = s.quantile(upper)
    return s.clip(lo, hi)

def build_features(df):
    # Drop non-predictive columns if present
    for col in ['UDI', 'Product ID']:
        if col in df.columns:
            df = df.drop(columns=[col])
    # Encode type
    if 'Type' in df.columns and 'Type_encoded' not in df.columns:
        df['Type'] = df['Type'].astype('category')
        df['Type_encoded'] = df['Type'].cat.codes
    # Feature engineering
    if 'Process temperature [K]' in df.columns and 'Air temperature [K]' in df.columns:
        df['temperature_diff'] = df['Process temperature [K]'] - df['Air temperature [K]']
    # Winsorize outliers
    for col in ['Rotational speed [rpm]', 'Torque [Nm]']:
        if col in df.columns:
            df[col] = winsorize_series(df[col])
    return df

def main(args):
    df = pd.read_csv(args.data)
    df = build_features(df)

    feature_cols = NUMERIC + ['Type_encoded']
    X = df[feature_cols].copy()

    # Multiclass label expected as 'Failure Type' with textual classes; create numeric codes if needed
    if 'Failure Type' in df.columns:
        y = df['Failure Type'].astype('category').cat.codes
    elif 'failure_type_code' in df.columns:
        y = df['failure_type_code']
    else:
        raise ValueError("Expected 'Failure Type' column for multiclass training.")

    # Train/test split
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42, stratify=y)

    # SMOTE for imbalance
    smote = SMOTE(random_state=42)
    X_train_res, y_train_res = smote.fit_resample(X_train, y_train)

    # Pipeline: scale → XGB
    pipe = Pipeline([
        ('scaler', StandardScaler()),
        ('classifier', XGBClassifier(
            n_estimators=575,
            max_depth=12,
            learning_rate=0.167,
            subsample=0.98,
            colsample_bytree=1.0,
            objective='multi:softprob',
            num_class=len(np.unique(y)),
            reg_lambda=1.0,
            random_state=42,
            n_jobs=-1
        ))
    ])

    pipe.fit(X_train_res, y_train_res)
    preds = pipe.predict(X_test)

    print("Accuracy:", accuracy_score(y_test, preds))
    print(classification_report(y_test, preds))

    # Save pipeline
    out_path = args.out
    joblib.dump(pipe, out_path)
    print(f"Saved pipeline to {out_path}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--data", required=True, help="Path to predictive maintenance CSV")
    parser.add_argument("--out", default="models/xgb_multiclass_pipeline.pkl", help="Output joblib path")
    args = parser.parse_args()
    main(args)
