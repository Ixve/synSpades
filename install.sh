cd $XDG_DATA_HOME
git clone https://www.github.com/c-um/synSpades.git && cd synSpades
mkdir synspades.mk
cd synspades.mk
clear
cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo && make
mv synspades.mk $XDG_DATA_HOME/
rm synspades
cd $XDG_DATA_HOME/synspades.mk
sudo make install
clear
echo "synSpades has been installed successfully - run it using openspades"
echo "Or navigate to synspades.mk inside your home folder, go to bin and run './openspades'."
