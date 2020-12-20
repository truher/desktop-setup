from flask import Flask
from lcdbackpack import LcdBackpack
from datetime import datetime

server = Flask(__name__)

lcdbackpack = LcdBackpack("/dev/ttyACM0", 115200)

@server.route("/")
def hello():
  lcdbackpack.connect()
  lcdbackpack.set_backlight_green()
  lcdbackpack.set_brightness(255)
  lcdbackpack.set_contrast(245)
  lcdbackpack.set_lcd_size(20,4) # need power cycle after this
  lcdbackpack.clear()
  lcdbackpack.set_cursor_position(1, 1)
  lcdbackpack.write("Hello World")
  lcdbackpack.set_cursor_position(2, 2)
  lcdbackpack.write(datetime.now().strftime("%H:%M:%S"))
  lcdbackpack.set_cursor_position(10, 4)
  lcdbackpack.write("All Done!")
  lcdbackpack.disconnect()
  return "Hello World"

if __name__ == "__main__":
  server.run(host="0.0.0.0", port=8000)
