########################################################################################
# Configuration file for setting SDK_BASE_DIR for co-exsiting JN5148 SDK and JN516x SDK.
######################################################################################## 

# The DEFAULT CHIP definition.
TWE_CHIP_MODEL ?= JN5164

# Set SDK_BASE_DIR
JENNIC_CHIP = $(word 1, $(TWE_CHIP_MODEL))
ifeq ($(JENNIC_CHIP),JN5148)
SDK_BASE_DIR   	 	= $(abspath ../../../../514x)
else ifeq ($(JENNIC_CHIP),JN5161)
SDK_BASE_DIR   	 	= $(abspath ../../../../516x)
else ifeq ($(JENNIC_CHIP),JN5164)
SDK_BASE_DIR   	 	= $(abspath ../../../../516x)
CFLAGS += -DEMBEDDED
CFLAGS += -DUSER_VSR_HANDLER
#CFLAGS += -DNO_NESTED_INTERRUPTS
else ifeq ($(JENNIC_CHIP),JN5168)
SDK_BASE_DIR   	 	= $(abspath ../../../../516x)
else
$(error "Bad JENNIC_CHIP definition.")
endif

# some other 
DIRUP_LST = $(subst /, ,$(abspath ..))
TARGET_DIR ?= $(word $(words $(DIRUP_LST)), $(DIRUP_LST))

DIRUPUP_LST = $(subst /, ,$(abspath ../..))
PROJNAME ?= $(word $(words $(DIRUPUP_LST)), $(DIRUPUP_LST))
