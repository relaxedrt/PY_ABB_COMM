import socket
import time

abb = socket.socket()
abb.connect(('127.0.0.1', 8000))
respuesta = abb.recv(1024)
print(respuesta)

while True:
    datos = input("coordenadas: ")
    abb.send(str(datos))

    time.sleep(10)