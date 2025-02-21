CXXFLAGS += -Isources/libraries/libxml
CXXFLAGS += -Isources/libraries/libxml/include

LDFLAGS += -Lsources/libraries/libxml/lib

LDLIBS 	+= -lxml2