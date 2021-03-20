import subprocess
from datetime import datetime
print('Pull(d) or push(u)?')
n = str(input())
if n == 'd':
    subprocess.run(['git','pull'],check=True)
if n == 'u':
    nw = datetime.now()
    msg = nw.strftime("%m/%d/%Y, %H:%M:%S")
    subprocess.run(['git','add','.'],check=True)
    subprocess.run(['git','commit','-m','Commit from script','-m',msg],check=True)
    subprocess.run(['git','push','origin','master'],check=True)
else:
    print('Invalid choice. Execute this again')
