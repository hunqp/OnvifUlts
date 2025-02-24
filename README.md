## COMPILE LIBXML2

sed -i 's/1.16.3/1.15/g' configure.ac

./autogen.sh --host=arm-anycloud-linux --with-pic --with-sax1 --with-xpath --with-c14n --with-iso8859x --with-output --without-iconv --without-http --without-ftp --without-html --with-minimum --without-python --without-zlib --without-lzma --prefix=$(pwd)/out

make CC=/home/hunqp/Toolchains/arm-anycloud-linux-uclibcgnueabi-v7.3.0/bin/arm-anycloud_v7.3.0-linux-uclibcgnueabi-gcc AR=/home/hunqp/Toolchains/arm-anycloud-linux-uclibcgnueabi-v7.3.0/bin/arm-anycloud_v7.3.0-linux-uclibcgnueabi-ar RANLIB=/home/hunqp/Toolchains/arm-anycloud-linux-uclibcgnueabi-v7.3.0/bin/arm-anycloud_v7.3.0-linux-uclibcgnueabi-ranlib


sudo make install
