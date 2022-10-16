import geocoder
import time
import pyowm
import datetime
import moods

# Key for weather API
api_key = '7eb17edd975c877bb6b1c92e555b182c'
owm = pyowm.OWM(api_key).weather_manager()

#return city of where you are located
def getCity(): 
    g = geocoder.ip('me')
    return g.city

# return the time of the day
def getTime():
    t = time.localtime()
    current_time = int(time.strftime("%H", t))
    if(current_time >= 7 and current_time < 11):
        return 'morning'
    if(current_time >= 11 and current_time < 15):
        return 'afternoon'
    if(current_time >= 15 and current_time < 18):
        return 'commute'
    if((current_time >= 18 and current_time <= 23) or (current_time >= 0 and current_time < 7)):
        return 'night'


# Runs the API and returns a string of what kind of weather it is
def getCurrentWeather():
    type_of_weather = "sunny"
    weather_api = owm.weather_at_place()  # give where you need to see the weather
    weather_data = weather_api.weather          # get out data in the mentioned location
    if "rain" in weather_data:
        type_of_weather = "rain"
    elif "snow" in weather_data:
        type_of_weather = "snow"
    elif "hail" in weather_data:
        type_of_weather = "hail"
    elif "wind" in weather_data:
        type_of_weather = "wind"
    return type_of_weather