from flask import Flask, request
import os
from spotifyPlay import generateSongFromSearch

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello World!'


@app.route('/whatever', methods=['GET'])
def do_whatever():
    print('I am doing whatever!')
    return "okay!"


@app.route('/searchbymood', methods=['POST'])
def search_for_songs_based_on_mood():
    return generateSongFromSearch(request.args.get('mood'))


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
