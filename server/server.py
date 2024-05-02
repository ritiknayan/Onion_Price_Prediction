import json
from flask import Flask, request, jsonify
import util

app = Flask(__name__)


@app.route('/get_District_names', methods=['GET'])
def get_District():
    response = jsonify({
        'District': util.get_District()
    })
    response.headers.add('Access-Control-Allow-Origin', '*')

    return response


@app.route('/get_State_names', methods=['GET'])
def get_State():
    response = jsonify({
        'State': util.get_State()
    })
    response.headers.add('Access-Control-Allow-Origin', '*')

    return response


@app.route('/get_Month_names', methods=['GET'])
def get_Month():
    response = jsonify({
        'Month': util.get_Month()
    })
    response.headers.add('Access-Control-Allow-Origin', '*')

    return response


@app.route('/get_variety_names', methods=['GET'])
def get_Variety():
    response = jsonify({
        'Variety': util.get_Variety()
    })
    response.headers.add('Access-Control-Allow-Origin', '*')

    return response



@app.route('/login', methods=['GET', 'POST'])
def login():
    print("hello")

@app.route('/predict_Onion_price', methods=['GET', 'POST'])
def predict_Onion_price():
    # print("hello")
    # try:
    #     print(request.form['State'])
    #     print(request.form['District'])
    #     print(request.form['Variety'])
    # except response :
    #     print("error")
    # except:
    #     print("eeeee")
    # print(request.form['Month'])
    # print(request.form['isProducing'])
    # print(request.form['Harvesting_month'])
    # print(request.form['isDrought'])

    # print(request.form['State'])
    # print(request.form['District'])
    # print(request.form['Variety'])
    # print(request.form['Month'])
    # print(request.form['isProducing'])
    # print(request.form['Harvesting_month'])
    # print(request.form['isDrought'])
    # print("hello2")
    # print(request)
    # print("a")
    # print(request.method)
    # print(request.form)
    # # request.form['Harvesting_month']
    # State = request.form.get("State")
    # State2 = request.data("State")
    # print(State)
    # print(State2)
    # print("b")
    # print(request.data)
    # District = request.form['District']
    # Variety = request.form['Variety']
    # Month = request.form['Month']
    # isProducing = request.form['isProducing']
    # Harvesting_month = request.form['Harvesting_month']
    # isDrought = request.form['isDrought']
    # print(State)
    # print(District)
    # print(Variety)

    # print(Month)
    # print(isProducing)
    # print(Harvesting_month)
    # print(isDrought)
    

    if request.method == 'POST':
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        print(request_data)
        State = request_data["State"]
        District = request_data['District']
        Variety = request_data['Variety']
        Month = request_data['Month']
        isProducing = request_data['isProducing']
        Harvesting_month = request_data['Harvesting_month']
        
        print("state : "+State)
        response = jsonify({
            'estimated_price': util.get_estimated_price(State, District, Variety, Month, isProducing, Harvesting_month)
        })
        response.headers.add('Access-Control-Allow-Origin', '*')
        return response

    return  jsonify({
            'estimated_price': 0
        })


if __name__ == "__main__":
    print("Starting Python Flask Server For Home Price Prediction...")
    util.load_saved_artifacts()
    app.run(host="0.0.0.0", port=int("3000"))
