
import pandas as pd
df = pd.read_csv("../data/PS_20174392719_1491204439457_log.csv")
new = df.head(500).to_csv("../data/testdata.csv")