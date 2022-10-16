from flask import Flask, request
import os
from spotifyPlay import generateSongFromSearch, generateToken

app = Flask(__name__)

token = None


@app.route('/')
def hello_world():
    return 'Hello World!'


@app.route('/whatever', methods=['GET'])
def do_whatever():
    print('I am doing whatever!')
    return "okay!"


@app.route('analyzeEmotion', methods=['POST'])
def analyze_emotion():
    image = request.files

    return "received image"


@app.route('/searchbymood', methods=['POST'])
def search_for_songs_based_on_mood():
    global token
    if token is None:
        token = generateToken()

    generated_songs = generateSongFromSearch(request.get_json()['mood'], token)
    # There was an error, token probably expired.
    if generated_songs is None:
        # Let's refresh the token and try again.
        token = generateToken()
        generated_songs = generateSongFromSearch(request.get_json()['mood'], token)

    return generated_songs


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
