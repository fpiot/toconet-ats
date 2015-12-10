########################################################################################
# Configuration file for setting SDK_BASE_DIR for co-exsiting JN5148 SDK and JN516x SDK.
######################################################################################## 

##############################################################################
# Select the network stack (e.g. MAC, ZBPRO)
JENNIC_STACK ?= MAC
# Specify device type (e.g. CR (Coordinator/router), ED (End Device))
DEVICE_TYPE ?= ED

##############################################################################
# Debug options define DEBUG for HW debug
#DEBUG ?=HW

# Define which UART to use for debug
#DEBUG_PORT ?= UART1

##############################################################################
# Path definitions
# Select definitions for either single or multiple targets

# Use if application directory contains multiple targets
APP_BASE           	= $(abspath ../..)
APP_BLD_DIR			= $(APP_BASE)/$(TARGET_DIR)/Build
APP_SRC_DIR 	    = $(APP_BASE)/$(TARGET_DIR)/Source

APP_COMMON_SRC_DIR = $(APP_BASE)/Common/Source

# TOCOS:additonal directories
APP_STACK_SRC_DIR_ADD1 = $(APP_BASE)/../../Wks_libToCoNet/libToCoNet/include/ToCoNet
APP_STACK_SRC_DIR_ADD2 = $(APP_BASE)/../../Wks_libToCoNet/libToCoNet/include/ToCoNetUtils 

##############################################################################
# Application Source files


##############################################################################
# Additional Application Library

ifeq ($(TOCONET_DEBUG),1)
ADDITIONAL_LIBS += $(APP_BASE)/../../Wks_libToCoNet/libToCoNet/lib/libToCoNet_$(JENNIC_CHIP)_DBG.a
ADDITIONAL_LIBS += $(APP_BASE)/../../Wks_libToCoNet/libToCoNet/lib/libToCoNetExt_$(JENNIC_CHIP)_DBG.a
ADDITIONAL_LIBS += $(APP_BASE)/../../Wks_libToCoNet/libToCoNet/lib/libToCoNetUtils_$(JENNIC_CHIP).a
TARGET_SUFF += _TDBG
else
ADDITIONAL_LIBS += $(APP_BASE)/../../Wks_libToCoNet/libToCoNet/lib/libToCoNet_$(JENNIC_CHIP).a
ADDITIONAL_LIBS += $(APP_BASE)/../../Wks_libToCoNet/libToCoNet/lib/libToCoNetExt_$(JENNIC_CHIP).a
ADDITIONAL_LIBS += $(APP_BASE)/../../Wks_libToCoNet/libToCoNet/lib/libToCoNetUtils_$(JENNIC_CHIP).a
endif

##############################################################################
# Additional Application Source directories
# Define any additional application directories outside the application directory
# e.g. for AppQueueApi

ADDITIONAL_SRC_DIR += $(APP_COMMON_SRC_DIR)

##############################################################################
# Standard Application header search paths

INCFLAGS += -I$(APP_SRC_DIR)
INCFLAGS += -I$(APP_SRC_DIR)/..
INCFLAGS += -I$(APP_COMMON_SRC_DIR)

INCFLAGS += -I$(APP_STACK_SRC_DIR_ADD1)
INCFLAGS += -I$(APP_STACK_SRC_DIR_ADD2)

INCFLAGS += -I$(COMPONENTS_BASE_DIR)/Utilities/Include

##############################################################################
