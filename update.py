import subprocess
from datetime import datetime
import time
print('Pull(d) or push(u)?')
n = str(input())
if n == 'd':
    subprocess.run(['git','pull'],check=True)
if n == 'u':
    msg = datetime.now().strftime("Commit made on: %m/%d/%Y, %H:%M:%S ") + time.tzname[time.daylight]
    subprocess.run(['git','add','.'],check=True)
    subprocess.run(['git','commit','-m','Commit from update.py','-m',msg],check=True)
    subprocess.run(['git','push','origin','master'],check=True)
else:
    print('Invalid choice. Execute this again')
