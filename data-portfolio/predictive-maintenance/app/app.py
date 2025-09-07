# app.py
import streamlit as st
import numpy as np
import joblib
import shap
import matplotlib.pyplot as plt

# Load the saved pipeline
pipeline = joblib.load("models/xgb_multiclass_pipeline.pkl")

# Define feature names
feature_names = ['Air temperature [K]', 'Process temperature [K]', 'Rotational speed [rpm]',
                 'Torque [Nm]', 'Tool wear [min]', 'Type_encoded']

# Title
st.title("Predictive Maintenance - Failure Type Classification")

# Sidebar Header
st.sidebar.header("Enter Sensor Readings")

# Numerical input fields with improved defaults
input_data = []
numerical_features = ['Air temperature [K]', 'Process temperature [K]',
                      'Rotational speed [rpm]', 'Torque [Nm]', 'Tool wear [min]']

for feature in numerical_features:
    default_val = 300.0 if 'temperature' in feature.lower() else 0.0
    val = st.sidebar.number_input(f"{feature}", value=float(default_val))
    input_data.append(val)

# Machine Type selection
type_map = {'Low': 0, 'Medium': 1, 'High': 2}
type_selected = st.sidebar.selectbox("Machine Type", options=list(type_map.keys()))
type_encoded = type_map[type_selected]
input_data.append(type_encoded)

# Predict Button
if st.sidebar.button("Predict Failure Type"):
    input_array = np.array(input_data).reshape(1, -1)

    # Make Prediction
    prediction = pipeline.predict(input_array)[0]
    pred_label = {
        0: "No Failure",
        1: "Heat Dissipation Failure",
        2: "Power Failure",
        3: "Overstrain Failure",
        4: "Tool Wear Failure",
        5: "Random Failure"
    }.get(int(prediction), "Unknown")

    st.success(f"Predicted Failure Type: **{pred_label}**")

    # SHAP Explanation with error handling
    st.subheader("Feature Impact (SHAP Explanation)")
    try:
        clf = pipeline.named_steps.get('classifier', None)
        scaler = pipeline.named_steps.get('scaler', None)

        if clf is None or scaler is None:
            st.warning("Pipeline must include 'scaler' and 'classifier' steps for SHAP to work.")
        else:
            transformed_input = scaler.transform(input_array)
            explainer = shap.TreeExplainer(clf)
            shap_values = explainer.shap_values(transformed_input)

            shap.initjs()

            # Handle multiclass vs binary
            if isinstance(shap_values, list):
                class_shap_values = shap_values[int(prediction)]
                base_value = explainer.expected_value[int(prediction)]
            else:
                class_shap_values = shap_values
                base_value = explainer.expected_value

            explanation = shap.Explanation(
                values=class_shap_values[0],
                base_values=base_value,
                data=transformed_input[0],
                feature_names=numerical_features + ['Type_encoded']
            )

            fig = shap.plots.waterfall(explanation, show=False)
            st.pyplot(fig)

    except Exception as e:
        st.error(f"Could not generate SHAP plot: {e}")

    # Failure Type Legend
    st.markdown("#### Failure Type Codes")
    st.markdown(\"\"\"
    - 0: No Failure  
    - 1: Heat Dissipation Failure  
    - 2: Power Failure  
    - 3: Overstrain Failure  
    - 4: Tool Wear Failure  
    - 5: Random Failure
    \"\"\")
