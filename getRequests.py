import requests
import time
import statistics
from PIL import Image
from urllib.request import urlopen

# Input que recibe el número de requests que se quieren realizar
numberRequests = int(input("How many requests do you want to make: "))
# Lista para mantener los tiempos de cada request
list_of_times = [0 for i in range(numberRequests)]
succesfullCalls = 0  # Counter para contar la cantidad de requests que fueron exitosas

# Url de base de datos almacenando JSON de Centros
urlCentros = "https://dif-huixquilucan-app-default-rtdb.firebaseio.com/Centros.json"
# Url de base de datos almacenando JSON de Servicios
urlServicios = "https://dif-huixquilucan-app-default-rtdb.firebaseio.com/Servicios.json"
# Lista de urls para poder acceder a cada uno utilizando input
urls = [urlCentros, urlServicios]
urlIndex = int(input(
    "Press 0 to request Centers information or press 1 to request Services information: "))  # Input que recibe la información a la que se le quieren hacer los requests
total_time = time.time()  # Timer que mantiene el tiempo total de la ejecución
for i in range(numberRequests):  # For loop que itera las veces que el usuario pidió
    start_time = time.time()  # Timer para medir el tiempo de cada request
    r = requests.get(url=urls[urlIndex])  # Realizar el GET request
    end_time = time.time() - start_time  # Parar el timer
    list_of_times[i] = end_time  # Agregar el tiempo a lista total de timers
    print(
        end_time, f"\tStatus Code: {r.status_code} Request Fulfilled: {r.status_code == 200}")  # Imprimir el tiempo que tomó la prueba y si fue exitosa 200 significa que lo fue
    if r.status_code == 200:  # Si la prueba fue exitosa sumar 1 a succesfullCalls
        succesfullCalls += 1

data = r.json()  # Convertir la data del request a JSON
# Obtener el tiempo total que tomo la ejecución
total_time = time.time() - total_time
print(  # Imprimir toda la información final
    f"Total time: {total_time}\nAverage time of each request: {statistics.mean(list_of_times)}\nNumber of Succesfull Requests {succesfullCalls} out of {numberRequests}\nRequested Data from \"{urls[urlIndex]}\": \n{data}")
