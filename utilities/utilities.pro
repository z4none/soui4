######################################################################
# Automatically generated by qmake (2.01a) ?? ?? 23 19:29:15 2014
######################################################################

TEMPLATE = lib
TARGET = utilities
CONFIG(x64){
TARGET = $$TARGET"64"
}
INCLUDEPATH += .
INCLUDEPATH += ./include

dir = ..
include($$dir/common.pri)

!LIB_ALL:!LIB_CORE{
	DEFINES += UTILITIES_EXPORTS
	RC_FILE += utilities.rc
	CONFIG += dll
}
else{
    CONFIG += staticlib
}


# Input
HEADERS += include/gdialpha.h \
           include/souicoll.h \
           include/trace.h \
           include/snew.h \
           include/utilities-def.h \
           include/utilities.h \
           include/soui_mem_wrapper.h \
           include/atl.mini/atldef.h \
           include/atl.mini/SComCli.h \
           include/atl.mini/SComHelper.h \
           include/pugixml/pugiconfig.hpp \
           include/pugixml/pugixml.hpp \
           include/string/sstring-i.h \
           include/string/strcpcvt.h \
           include/string/sstringa.h \
           include/string/sstringw.h \
           include/string/sstringdata.h \
           include/string/tstring.h \
           include/com-loader.hpp \
           include/wtl.mini/msgcrack.h \
           include/wtl.mini/souimisc.h \
           include/sobject/sobject-i.h \
           include/sobject/sobject.hpp \
           include/sobject/sobject-state-i.h \
           include/sobject/sobject-state-impl.hpp \
           include/helper/SCriticalSection.h \
           include/helper/SSemaphore.h \
           include/helper/SSharedPtr.hpp \
           include/helper/SNoCopyable.hpp \
           include/helper/SEmptyable.hpp \
           include/helper/SSharedPtr.hpp \
           include/helper/SAutoBuf.h \
           
SOURCES += src/gdialpha.cpp \
           src/trace.cpp \
           src/utilities.cpp \
           src/soui_mem_wrapper.cpp\
           src/pugixml/pugixml.cpp \
           src/string/strcpcvt.cpp \
           src/string/sstringa.cpp \
           src/string/sstringw.cpp \
           src/string/sstringdata.cpp \
           src/sobject/sobject.cpp \
           src/helper/SCriticalSection.cpp \
           src/helper/SSemaphore.cpp \
           src/helper/SAutoBuf.cpp \
