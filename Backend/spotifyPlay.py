import base64
import random
import requests

def generateToken():
    # Step 1 - Authorization 
    url = "https://accounts.spotify.com/api/token"
    headers = {}
    data = {}

    clientId = '1af2aaffd4ed412bba5b2c342b36d132'
    clientSecret = 'c10b92ba70cb40538e4188f75f432d21'

    # Encode as Base64
    message = f"{clientId}:{clientSecret}"
    messageBytes = message.encode('ascii')
    base64Bytes = base64.b64encode(messageBytes)
    base64Message = base64Bytes.decode('ascii')

    headers['Authorization'] = f"Basic {base64Message}"
    data['grant_type'] = "client_credentials"

    r = requests.post(url, headers=headers, data=data)

    token = r.json()['access_token']

    return token

def generateSongFromSearch(query, token):
    # Step 2 - Use Access Token to query Spotify API and return a playlist ID

    random.seed()
    rand_song = random.randint(0, 5)  # randomize query

    q = query
    searchUrl = f"https://api.spotify.com/v1/search?q={q}&type=playlist&market=US&limit=1&offset={rand_song}"
    headers = {
        "Authorization": "Bearer " + token
    }

    res = requests.get(url=searchUrl, headers=headers)

    playlistId = res.json()['playlists']['items'][0]['id']

    # Step 3 - Use Token and playlist ID to return track information

    playlistUrl = f"https://api.spotify.com/v1/playlists/{playlistId}/tracks?market=US&limit=10"
    headers = {
        "Authorization": "Bearer " + token
    }

    res = requests.get(url=playlistUrl, headers=headers)

    artist = res.json()['items'][rand_song]['track']['album']['artists'][0]['name']
    title = res.json()['items'][rand_song]['track']['name']
    image = res.json()['items'][rand_song]['track']['album']['images'][0]['url']
    song_url = res.json()['items'][rand_song]['track']['external_urls']['spotify']
    duration = (res.json()['items'][rand_song]['track']['duration_ms'])

    return {
        'artist': artist,
        'title': title,
        'cover': image,
        'song_url': song_url,
        'duration': duration
    }

    # print(title)
    # print(artist)
    # print(image)
    # print(duration)
    # print(song_url)
    # print('\n')

    # print(json.dumps(res.json(), indent=2))


