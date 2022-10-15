#!/usr/bin/env python
# coding: utf-8

# In[7]:


from fer import FER
import matplotlib.pyplot as plt 
get_ipython().run_line_magic('matplotlib', 'inline')


# In[30]:


test_image_one = plt.imread(r"C:\Users\rishi\Downloads\Photo_on_10-15-22_at_4.07_PM.jpg")
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


# In[55]:





# In[1]:


import firebase_admin
from firebase_admin import credentials
from firebase_admin import db

cred = credentials.Certificate("C:/Users/rishi/OneDrive/Desktop/EmotionRecognition/hackharvard2022-4724b-firebase-adminsdk-vhlj6-7ea3366982.json")
firebase_admin.initialize_app(cred, {
    'databaseURL': 'https://hackharvard2022-4724b-default-rtdb.firebaseio.com/'
})
ref = db.reference('/')


# In[24]:


print(ref.get())


# In[31]:


users_ref = ref.child('users')
users_ref.set({
    'mood':dominant_emotion
    }
)


# In[44]:





# In[11]:





# In[20]:





# In[ ]:




