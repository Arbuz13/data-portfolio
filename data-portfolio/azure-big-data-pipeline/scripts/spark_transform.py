from pyspark.sql import SparkSession
from pyspark.sql.functions import col, to_date, year, month, dayofweek, quarter

spark = SparkSession.builder.appName("azure-transform").getOrCreate()

# Example reads/writes (replace placeholders):
# df = spark.read.option("header", True).csv("abfss://raw@<storage-account>.dfs.core.windows.net/superstore.csv")

# df = df.withColumn("OrderDate", to_date(col("Order Date"), "MM/dd/yyyy")) #        .withColumn("ShipDate",  to_date(col("Ship Date"),  "MM/dd/yyyy")) #        .withColumn("Year", year(col("OrderDate"))) #        .withColumn("Month", month(col("OrderDate"))) #        .withColumn("Quarter", quarter(col("OrderDate"))) #        .withColumn("DayOfWeek", dayofweek(col("OrderDate")))

# df.write.mode("overwrite").format("delta").save("abfss://curated@<storage-account>.dfs.core.windows.net/superstore_delta")

spark.stop()
