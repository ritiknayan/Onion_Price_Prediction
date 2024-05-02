import pickle
import json
import numpy as np
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
from sklearn.preprocessing import StandardScaler
import pandas as pd

# __locations = None
__State = None
__District = None
__Variety = None
__Month = None

__model = None






def get_estimated_price(State,District,Variety,Month,isProducing,Harvesting_month):

    d=pd.read_csv('newDataFile.csv')
    
#     d['State_code']=le.fit_transform(d['State'])
#     sc[i]=le.transform(onion_producing_states)         
    x=d.values[:,[1,4,9,10,12,13]]
    y=d.values[:,11]


    labelencoder_X = LabelEncoder()
    x[: ,0]= labelencoder_X.fit_transform(x[: ,0])
#     data2=labelencoder_X.transform(data[0])
    x[: ,1]= labelencoder_X.fit_transform(x[: ,1])
    # X[: ,2]= labelencoder_X.fit_transform(X[: ,2])
#     data3=labelencoder_X.transform(data[1])
#     data4=
    onehotencoder= OneHotEncoder(categories='auto')
    x= onehotencoder.fit_transform(x).toarray()
#     data3=onehotencoder.transform(data2)
    # X=np.delete(X,[0,28,368,1288],1)

    c_District= __District.index(District.lower())
    c_Variety=375+__Variety.index(Variety.lower())
    c_Month=396+__Month.index(Month.lower())
    c_State=408+__State.index(State.lower())
    if(isProducing==0):
        c_isProducing=436
    else:
        c_isProducing=337
    if(Harvesting_month==0):
        c_Harvesting_month=438
    else:
        c_Harvesting_month=439
         
    # c_isProducing=397+np.where(df6.columns==isProducing)[0][0]
    # c_Harvesting_month=399+np.where(df7.columns==Harvesting_month)[0][0]
    # c_isDrought=401+np.where(df8.columns==isDrought)[0][0]
    
    pridictData=np.zeros(440)
    pridictData[c_District]=1
    pridictData[c_Variety]=1
    pridictData[c_Month]=1
    pridictData[c_State]=1
    pridictData[c_isProducing]=1
    pridictData[c_Harvesting_month]=1

    scaler = StandardScaler()
    scaler.fit(x)
    newdata = scaler.transform([pridictData])     
    
    return  __model.predict(newdata)[0]


# def get_estimated_price(location,sqft,bhk,bath):
#     try:
#         loc_index = __data_columns.index(location.lower())
#     except:
#         loc_index = -1

#     x = np.zeros(len(__data_columns))
#     x[0] = sqft
#     x[1] = bath
#     x[2] = bhk
#     if loc_index>=0:
#         x[loc_index] = 1

#     return round(__model.predict([x])[0],2)


def load_saved_artifacts():
    print("loading saved artifacts...start")
    # global  __data_columns
    global __District
    global __State
    global __Month
    global __Variety

    with open("columns.json", "r") as f:
        # __data_columns = data['data_columns']
        data=json.load(f)
        __District = data['district'] 
        __State = data['States'] 
        __Month = data['Month'] 
        __Variety = data['variety'] 

        
        
       

    global __model
    if __model is None:
        with open('Model.pkl', 'rb') as f:
            __model = pickle.load(f)
    print("loading saved artifacts...done")

def get_District():
    return __District

def get_Variety():
    return __Variety
def get_Month():
    return __Month
def get_State():
    return __State

if __name__ == '__main__':
    load_saved_artifacts()
    print(get_State())
    print(get_estimated_price('Madhya Pradesh','Jabalpur','Other','06',0,0))
    # print(get_estimated_price('1st Phase JP Nagar', 1000, 2, 2))
    # print(get_estimated_price('Kalhalli', 1000, 2, 2)) # other location
    # print(get_estimated_price('Ejipura', 1000, 2, 2))  # other location