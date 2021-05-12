# NOTE: The code assumes that the following requirements are satisfied:
#       1. vim-tiny is uninstalled and vim-gtk3 is installed along with vim
#           (somehow the clipboard works properly if vim-gtk3 is installed)
#       2. git installed and configured, SSH is key is added to github.
#       3. 
# 


import subprocess
import time
nsec = 7
print('Need to download some plugins and copy some files\nRough size of download at the time of writing this is 160 MB some time will be needed for compilation\n\nPress Ctrl-c to terminate the download\n\n')

#for i in range(nsec):
#    time.sleep(1);
#print('Starting download...\nA suggestion would be to let this run while you work.\nMake sure you have a stable internet connection\n\n')
#subprocess.run(['sudo','apt','update','-y'],check=True)
#subprocess.run(['sudo','apt','upgrade','-y'],check=True)
#subprocess.run(['sudo','apt','remove','vim-tiny','-y'], check=True)
#subprocess.run(['sudo','apt','autoremove'],check=True)
#subprocess.run(['mv','~/.vim','~/vim-folder-backup'],check=True)
#subprocess.run(['mv','~/.vimrc','~/backup-vimrc.vim'],check=True)
#subprocess.run(['mv','~/vim-settings','~/.vim'],check=True)
#subprocess.run(['echo','source ~/.vim/myvimrc.vim','>>','~/.vimrc'],check=True)
subprocess.run(['sudo','apt','install', '-y', 'vim-gtk3','build-essential','cmake', 'vim-nox', 'python3-dev'])
subprocess.run(['sudo','apt','install', '-y', 'mono-complete', 'golang', 'nodejs', 'default-jdk', 'npm'])
subprocess.run(['git','clone','git@github.com:VundleVim/Vundle.vim.git','~/.vim/bundle/Vundle.vim'])
subprocess.run(['git','clone','git@github.com:tpope/vim-fugitive.git','~/.vim/bundle/vim-fugitive'])
subprocess.run(['git','clone','git@github.com:jiangmiao/auto-pairs.git','~/.vim/bundle/'])
subprocess.run(['git','clone','git@github.com:vim-airline/vim-airline.git','~/.vim/bundle/vim-airline'])
subprocess.run(['git','clone','git@github.com:vim-airline/vim-airline-themes.git','~/.vim/bundle/vim-airline-themes'])
subprocess.run(['git','clone','git@github.com:enricobacis/vim-airline-clock.git','~/.vim/bundle/vim-airline-clock'])
subprocess.run(['git','clone','git@github.com:ycm-core/YouCompleteMe.git','~/.vim/bundle/YouCompleteMe'])
subprocess.run(['cd', '~/.vim/bundle/YouCompleteMe'], check=True)
subprocess.run(['python3','install.py','--all'])
