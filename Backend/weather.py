import pyowm
import datetime
import moods

api_key = '7eb17edd975c877bb6b1c92e555b182c'     #your API Key here as string
owm = pyowm.OWM(7eb17edd975c877bb6b1c92e555b182c).weather_manager()     # Use API key to get data

def get_current_weather():
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