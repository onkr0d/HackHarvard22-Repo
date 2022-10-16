import os

import matplotlib.pyplot as plt
# from fer import FER
from flask import Flask, request

from moods import getCity
from spotifyPlay import generateSongFromSearch, generateToken

basedir = os.path.abspath(os.path.dirname(__file__))
savesPath = os.path.join(basedir, 'tempSaveFolder')

app = Flask(__name__)

token = None


@app.route('/searchbymood', methods=['POST'])
def search_for_songs_based_on_mood():
    global token
    if token is None:
        token = generateToken()

    mood = request.args.get('mood')
    generated_songs = generateSongFromSearch(mood, token)
    # There was an error, token probably expired.
    if generated_songs is None:
        # Let's refresh the token and try again.
        token = generateToken()
        generated_songs = generateSongFromSearch(mood, token)

    return generated_songs


@app.route('/findcity', methods=['POST'])
def find_city():
    return getCity()


@app.route('/image', methods=['POST'])
def receive_image():
    print("received image")
    print(request.files)

    file = request.files['image']

    file.save(os.path.join(savesPath, file.filename))

    # Save the image to the filesystem
    image = request.files['image']
    image.save(os.path.join(savesPath, image.filename))
    return "received image"


@app.route('/analyzeEmotions', methods=['POST'])
def model():
    image = request.files['image']
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
