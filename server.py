import math
import socket
import pyautogui

HOST = '192.168.43.10'
PORT = 7800
SPEED = 10
connected_devices = set()


def listen_for_connections():
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.bind((HOST, PORT))
        s.listen()
        print("Sunucu dinlemede...")

        while True:
            conn, addr = s.accept()

            connected_devices.add(conn)

            handle_connection(conn)


def handle_connection(conn):
    with conn:
        while True:
            data = conn.recv(1024)
            if not data:
                break
            else:
                print(data.decode())
                try:
                    dictionary = {}
                    raw_data = data.decode().strip("}{")
                    raw_data = raw_data.replace("=", ":")
                    raw_datas = raw_data.split(",")
                    for raw_data in raw_datas:
                        key = raw_data.split(":")[0].strip(" ")
                        value = raw_data.split(":")[1].strip(" ")
                        dictionary[key] = value
                    if dictionary['type'] == 'rightClick':
                        pyautogui.rightClick()
                    if dictionary['type'] == 'leftClick':
                        pyautogui.leftClick()
                    if dictionary['type'] == 'drag':
                        try:
                            length = SPEED * float(dictionary['length'])
                            if length > 5:
                                break
                            else:
                                degree = float(dictionary['degree'])
                                dx = length * math.cos(math.radians(degree))
                                dy = length * math.sin(math.radians(degree))
                                current_x, current_y = pyautogui.position()
                                if dx != 0 and dy != 0:
                                    pyautogui.moveTo(dx + current_x, dy + current_y)
                        except:
                            break
                    if dictionary['type'] == 'open':
                        pyautogui.doubleClick()
                except UnicodeDecodeError:
                    print("Error while decoding")
                except SyntaxError:
                    print("Syntax Error")
                except NameError:
                    print("Name Error")

    # Bağlantıyı kaldırın
    connected_devices.remove(conn)


if __name__ == "__main__":
    listen_for_connections()
