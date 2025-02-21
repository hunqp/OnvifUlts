###############################################################################
# author: ThanNT
# date: 6/1/2017
###############################################################################

OBJ_DIR			= build
CROSS_COMPILE 	= $(HOME)/Toolchains/arm-anycloud-linux-uclibcgnueabi-v7.3.0/bin/arm-anycloud_v7.3.0-linux-uclibcgnueabi-
NAME_MODULE		= PeerConnection

CXX	  =	$(CROSS_COMPILE)g++
CC	  =	$(CROSS_COMPILE)gcc
AR	  =	$(CROSS_COMPILE)ar
STRIP =	$(CROSS_COMPILE)strip

OPTIMIZE_OPTION	=	-g -s -Os
# WARNNING_OPTION	=	-Werror -W -Wno-missing-field-initializers

-include sources/ak/Makefile.mk
-include sources/sys/Makefile.mk
-include sources/app/Makefile.mk
-include sources/common/Makefile.mk
-include sources/driver/Makefile.mk
-include sources/libraries/Makefile.mk

CXXFLAGS	+=	$(OPTIMIZE_OPTION)	\
				$(WARNNING_OPTION)	\
				-Wall				\
				-pipe

LDFLAGS	+= -Wl,-Map=$(OBJ_DIR)/$(NAME_MODULE).map

DEPENDENCIES += sources/libraries/arm_rts

LDLIBS += 	-L$(DEPENDENCIES)/lib
LDLIBS += 	-lpthread	\
			-lrt		\
			-lm
		
all: create $(OBJ_DIR)/$(NAME_MODULE)
	@$(STRIP) $(OBJ_DIR)/$(NAME_MODULE)
	@size $(OBJ_DIR)/$(NAME_MODULE)
	@echo BUILD DONE
	@cp -f $(OBJ_DIR)/$(NAME_MODULE) $(HOME)/Shared/net/bin
	@echo FLASH DONE

create:
	@echo mkdir -p $(OBJ_DIR)
	@mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o: %.cpp
	@echo CXX $<
	@$(CXX) -c -o $@ $< $(CXXFLAGS) -std=c++17 $(LDFLAGS)

$(OBJ_DIR)/%.o: %.c
	@echo CC $<
	@$(CC) -c -o $@ $< $(CXXFLAGS) $(LDFLAGS) -DLIBXML_XPATH_ENABLED -DLIBXML_OUTPUT_ENABLED

$(OBJ_DIR)/$(NAME_MODULE): $(OBJ)
	@echo ---------- START LINK PROJECT ----------
	@echo $(CXX) -o $@ $^ $(CXXFLAGS)
	@$(CXX) -o $@ $^ $(CXXFLAGS) $(LDFLAGS) $(LDLIBS)
	
flash: $(OBJ_DIR)/$(NAME_MODULE)
	@sudo cp -f $(OBJ_DIR)/$(NAME_MODULE) /mnt/nfs/bin
	@echo FLASH DONE

clean:
	@rm -rf $(OBJ_DIR)
	@echo REMOVE $(OBJ_DIR)

.PHONY: create flash strip 

# ./autogen.sh --with-pic --disable-shared --with-sax1 --with-xpath --with-c14n --with-icu --with-iso8859x --with-output --without-iconv --without-http --without-ftp --without-html --with-icu --with-minimum --without-python --without-zlib --without-lzma --prefix=$(pwd)/out

# ./autogen.sh --with-pic --disable-shared --with-sax1 --with-xpath --with-c14n --with-iso8859x --with-output --without-iconv --without-http --without-ftp --without-html --with-icu --with-minimum --without-python --without-zlib --without-lzma --prefix=$(pwd)/out