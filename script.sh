# Instalar freetds
# Preparar variable con enlace de descarga
cd $HOME
freetds_element=$(wget http://www.freetds.org/software.html -q -O - | grep "Last stable release")
freetds_download=$(echo "$freetds_element" | cut -d'"' -f 2)

# Descargar freetds y preparar directorio
wget $freetds_download --output-document=freetds.tar.gz
mkdir .freetds
tar -xzf freetds.tar.gz -C .freetds --strip-components=1
cd $HOME/.freetds

# Preparar instalación y ejecutarla
./configure --prefix=/usr/local --with-tdsver=7.3
sudo make
sudo make install
