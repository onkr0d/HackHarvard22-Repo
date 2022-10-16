from flask import Flask, request
import os
from fer import FER
import matplotlib.pyplot as plt

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello World!'


@app.route('/image', methods=['POST'])
def receive_image():
    print("received image")
    print(request.files)



    # Save the image to the filesystem
    image = request.files['image']
    image.save(os.path.join('images', image.filename))
    return "received image"


if __name__ == '__main__':
    app.run()
