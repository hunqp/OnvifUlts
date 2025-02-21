CXXFLAGS += -Isources/libraries/libonvif/include
CXXFLAGS += -Isources/libraries/libonvif/include/rapidjson
CXXFLAGS += -Isources/libraries/libonvif/error
CXXFLAGS += -Isources/libraries/libonvif/internal
CXXFLAGS += -Isources/libraries/libonvif/msinttypes

# CXXFLAGS += -Isources/libraries/libonvif/pybind11/include
# CXXFLAGS += -Isources/libraries/libonvif/pybind11/include/pybind11/conduit
# CXXFLAGS += -Isources/libraries/libonvif/pybind11/include/pybind11/detail
# CXXFLAGS += -Isources/libraries/libonvif/pybind11/include/pybind11/eigen
# CXXFLAGS += -Isources/libraries/libonvif/pybind11/include/pybind11/stl

VPATH += sources/libraries/libonvif/src

OBJ += $(OBJ_DIR)/sha1.o
OBJ += $(OBJ_DIR)/onvif.o
OBJ += $(OBJ_DIR)/onvif.o
OBJ += $(OBJ_DIR)/cencode.o