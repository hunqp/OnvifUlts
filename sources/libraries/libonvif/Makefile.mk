CXXFLAGS += -Isources/libraries/libonvif/include
CXXFLAGS += -Isources/libraries/libonvif/include/rapidjson
CXXFLAGS += -Isources/libraries/libonvif/error
CXXFLAGS += -Isources/libraries/libonvif/internal
CXXFLAGS += -Isources/libraries/libonvif/msinttypes

VPATH += sources/libraries/libonvif/src

OBJ += $(OBJ_DIR)/sha1.o
OBJ += $(OBJ_DIR)/onvif.o
OBJ += $(OBJ_DIR)/onvif.o
OBJ += $(OBJ_DIR)/cencode.o