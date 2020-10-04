import pandas as pd  
import numpy as np
import os

os.getcwd()

mydata = pd.read_csv("NFL_Data.csv")

mydata.drop(mydata.columns[[0,1,2,3]], axis = 1, inplace = True)

mydata['Yds'] = mydata['Yds'].str.replace(',','')

mydata['Yds'] = mydata['Yds'].astype(int)

mydata['Lng'] = mydata['Lng'].str.replace('T','')

mydata['Lng'] = mydata['Lng'].str.replace('--','0')

mydata['Lng'] = mydata['Lng'].astype(int)

mydata.head(10)