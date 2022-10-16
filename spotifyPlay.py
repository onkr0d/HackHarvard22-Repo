import requests
import base64
import json

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

# Step 2 - Use Access Token to query Spotify API and return a playlist ID

q = 'happy'
searchUrl = f"https://api.spotify.com/v1/search?q={q}&type=playlist&market=US&limit=1&offset=4"
headers = {
    "Authorization": "Bearer " + token
}

res = requests.get(url=searchUrl, headers=headers)

playlistId = res.json()['playlists']['items'][0]['id'] 

# Step 3 - Use Token and playlist ID to return track information

playlistUrl = f"https://api.spotify.com/v1/playlists/{playlistId}/tracks?market=US&limit=5"
headers = {
    "Authorization": "Bearer " + token
}

res = requests.get(url=playlistUrl, headers=headers)

for i in range(3):
    artist = res.json()['items'][i]['track']['album']['artists'][0]['name']
    title = res.json()['items'][i]['track']['album']['name']
    image = res.json()['items'][i]['track']['album']['images'][0]['url']

    print(title)
    print(artist)
    print(image)
    print('\n')



# print(json.dumps(res.json(), indent=2))


