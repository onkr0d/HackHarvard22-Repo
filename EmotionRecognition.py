#!/usr/bin/env python
# coding: utf-8

# In[7]:


from fer import FER
import matplotlib.pyplot as plt 
get_ipython().run_line_magic('matplotlib', 'inline')


# In[30]:


test_image_one = plt.imread(r"/Users/jason/Downloads/test.jpg")
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

convert = { 
    'angry': '37i9dQZF1DWWJOmJ7nRx0C', 
    'disgust': '37i9dQZF1DWY1j3jZdCWOQ', 
    'fear': '37i9dQZF1DWWY64wDtewQt',
    'happy': '37i9dQZF1DWSThc8QnzIme', 
    'neutral': '37i9dQZF1DWZqd5JICZI0u', 
    'sad': '37i9dQZF1DWSqBruwoIXkA', 
    'surprise': '37i9dQZF1DXcb6CQIjdqKy'
    }


# In[55]:





# In[1]:


import firebase_admin
from firebase_admin import credentials
from firebase_admin import db

cred = credentials.Certificate("/Users/jason/Documents/Projects/HackHarvard22-Repo/hackharvard2022-4724b-firebase-adminsdk-vhlj6-7ea3366982.json")
firebase_admin.initialize_app(cred, {
    'databaseURL': 'z'
})
ref = db.reference('/')


# In[24]:


print(ref.get())


# In[31]:


users_ref = ref.child('users')
users_ref.set({
    'playlistId':convert.dominant_emotion
    }
)


# In[44]:





# In[11]:





# In[20]:





# In[ ]:




