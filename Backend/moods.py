import geocoder
import time

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

