from gettext import install
from flask import Flask, request
import os
from spotifyPlay import generateSongFromSearch, generateToken

import matplotlib.pyplot as plt 
from fer import FER

app = Flask(__name__)

token = None


@app.route('/')
def hello_world():
    return 'Hello World!'


@app.route('/whatever', methods=['GET'])
def do_whatever():
    print('I am doing whatever!')
    return "okay!"


@app.route('/analyzeEmotion', methods=['POST'])
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

def model():
    image = request.files
    test_image_one = plt.imread(image)
    emo_detector = FER(mtcnn=True)
# Capture all the emotions on the image
    captured_emotions = emo_detector.detect_emotions(test_image_one)
# Print all captured emotions with the image
    print(captured_emotions)
    plt.imshow(test_image_one)

# Use the top Emotion() function to call for the dominant emotion in the image
    dominant_emotion, emotion_score = emo_detector.top_emotion(test_image_one)
    print(dominant_emotion, emotion_score)
    print(dominant_emotion)
    return dominant_emotion


if __name__ == '__main__':
    app.run()
