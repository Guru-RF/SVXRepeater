import serial
import socket
import subprocess
import signal
import sys
import time


def getIP():
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.settimeout(0)
    try:
        # doesn't even have to be reachable
        s.connect(('10.254.254.254', 1))
        IP = s.getsockname()[0]
    except Exception:
        IP = '127.0.0.1'
    finally:
        s.close()
    return IP

ser = serial.Serial()

def sendOLED(data):
    global ser
    if not ser.isOpen():
        ser = serial.Serial(
            port='/dev/tty.usbmodem83101', baudrate=4000000
        )

    data = data + "\n\r"
    ser.write(bytes(data, 'ascii'))

    while ser.inWaiting() > 0:
        ser.read(1)
    
    return True    

def recvOLED():
    if ser is not None:
        if ser.inWaiting() > 0:
            letter = ser.read()
            return letter

def signal_term_handler(signal, frame):
    print("shutdown")
    sendOLED('Safe 2 Turn Off')
    time.sleep(5)
    sys.exit(0)
 
signal.signal(signal.SIGTERM, signal_term_handler)

sendOLED(getIP())

buf = ""

while True:
    input = recvOLED()
    if input is not None:
        buf = buf + input.decode('utf-8')
        if input == b'\r':
            if buf == 'shutdown\r':
                subprocess.run(["ls", "-l"]) 

