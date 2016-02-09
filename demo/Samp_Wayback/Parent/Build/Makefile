##########################################################################
#  * (C) Tokyo Cosmos Electric, Inc. (TOCOS) - 2013 all rights reserved.
##########################################################################

##########################################################################
### Chip selection (do not edit here)
#TWE_CHIP_MODEL ?= JN5148
TWE_CHIP_MODEL ?= JN5164
#
include ../../../../mk/chipsel.mk
##########################################################################

### Version information
include ../Version.mk

### Serial Port
SERIAL_PORT = /dev/ttyUSB0

### Build Names
#PROJNAME=MyProject

### Source files
APPSRC += $(TARGET_DIR).c
APPSRC += common.c
#APPSRC += flash.c
APPSRC += AddrKeyAry.c

### Target type
TARGET_TYPE=bin # for building final application
#TARGET_TYPE=a  # for building library

### ToCoNet debug build
TOCONET_DEBUG ?= 0

##########################################################################
### Basic definitions (do not edit here)
include ../../../../mk/toconet.mk
##########################################################################

### CPP Definition, C flags
#CFLAGS += -DDUMMY

### Build Options
#ifeq ($(DEBUGOPT),1)
#  CFLAGS += -DDEBUG
#  OBJDIR_SUFF += _Debug
#  TARGET_SUFF += _Debug
#endif 

### Additional Src/Include Path
#APP_COMMON_SRC_DIR_ADD1 = ../dummy1  
#APP_COMMON_SRC_DIR_ADD2 = 
#APP_COMMON_SRC_DIR_ADD3 = 
#APP_COMMON_SRC_DIR_ADD4 =
#INCFLAGS += -I../dummy 

### Additional user objects (.a,.o)
#ADDITIONAL_LIBS += ../../Common/libDummy_$(JENNIC_CHIP).a

### Additional library 
#LDLIBS += m

### Additional linker options 
#LDFLAGS += -u dummy

include ../../../../mk/rules.mk
