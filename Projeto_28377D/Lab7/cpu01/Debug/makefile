################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

CG_TOOL_ROOT := C:/ti/ccsv6/tools/compiler/ti-cgt-c2000_6.4.2

ORDERED_OBJS += \
"./Adc.obj" \
"./CodeStartBranch.obj" \
"./Dac.obj" \
"./DefaultIsr_7.obj" \
"./DelayUs.obj" \
"./ECap.obj" \
"./EPwm.obj" \
"./F2837xD_Adc.obj" \
"./F2837xD_GlobalVariableDefs.obj" \
"./Gpio.obj" \
"./Main_7.obj" \
"./PieCtrl.obj" \
"./PieVect.obj" \
"./SysCtrl.obj" \
"./Watchdog.obj" \
"./Xbar.obj" \
"../F2837xD_Headers_nonBIOS_cpu1.cmd" \
"../Lab_5_6_7.cmd" \
$(GEN_CMDS__FLAG) \
-l"libc.a" \

-include ../makefile.init

RM := DEL /F
RMDIR := RMDIR /S/Q

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir_vars.mk
-include subdir_rules.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(S62_DEPS)),)
-include $(S62_DEPS)
endif
ifneq ($(strip $(C64_DEPS)),)
-include $(C64_DEPS)
endif
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(S55_DEPS)),)
-include $(S55_DEPS)
endif
ifneq ($(strip $(C67_DEPS)),)
-include $(C67_DEPS)
endif
ifneq ($(strip $(CLA_DEPS)),)
-include $(CLA_DEPS)
endif
ifneq ($(strip $(C??_DEPS)),)
-include $(C??_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(S??_DEPS)),)
-include $(S??_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(C62_DEPS)),)
-include $(C62_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(ASM_UPPER_DEPS)),)
-include $(ASM_UPPER_DEPS)
endif
ifneq ($(strip $(K_DEPS)),)
-include $(K_DEPS)
endif
ifneq ($(strip $(C43_DEPS)),)
-include $(C43_DEPS)
endif
ifneq ($(strip $(INO_DEPS)),)
-include $(INO_DEPS)
endif
ifneq ($(strip $(S67_DEPS)),)
-include $(S67_DEPS)
endif
ifneq ($(strip $(SA_DEPS)),)
-include $(SA_DEPS)
endif
ifneq ($(strip $(S43_DEPS)),)
-include $(S43_DEPS)
endif
ifneq ($(strip $(OPT_DEPS)),)
-include $(OPT_DEPS)
endif
ifneq ($(strip $(PDE_DEPS)),)
-include $(PDE_DEPS)
endif
ifneq ($(strip $(S64_DEPS)),)
-include $(S64_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
ifneq ($(strip $(C55_DEPS)),)
-include $(C55_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
EXE_OUTPUTS += \
Lab7.out \

EXE_OUTPUTS__QUOTED += \
"Lab7.out" \

BIN_OUTPUTS += \
Lab7.hex \

BIN_OUTPUTS__QUOTED += \
"Lab7.hex" \


# All Target
all: Lab7.out

# Tool invocations
Lab7.out: $(OBJS) $(CMD_SRCS) $(GEN_CMDS)
	@echo 'Building target: $@'
	@echo 'Invoking: C2000 Linker'
	"C:/ti/ccsv6/tools/compiler/ti-cgt-c2000_6.4.2/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -g --define=CPU1 --diag_warning=225 --display_error_number --diag_wrap=off -z -m"Lab7.map" --stack_size=0x200 --warn_sections -i"C:/ti/ccsv6/tools/compiler/ti-cgt-c2000_6.4.2/lib" -i"C:/ti/ccsv6/tools/compiler/ti-cgt-c2000_6.4.2/include" --reread_libs --display_error_number --diag_wrap=off --xml_link_info="Lab7_linkInfo.xml" --rom_model -o "Lab7.out" $(ORDERED_OBJS)
	@echo 'Finished building target: $@'
	@echo ' '

Lab7.hex: $(EXE_OUTPUTS)
	@echo 'Invoking: C2000 Hex Utility'
	"C:/ti/ccsv6/tools/compiler/ti-cgt-c2000_6.4.2/bin/hex2000"  -o "Lab7.hex" $(EXE_OUTPUTS__QUOTED)
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXE_OUTPUTS__QUOTED)$(BIN_OUTPUTS__QUOTED)
	-$(RM) "Adc.pp" "Dac.pp" "DefaultIsr_7.pp" "ECap.pp" "EPwm.pp" "F2837xD_Adc.pp" "F2837xD_GlobalVariableDefs.pp" "Gpio.pp" "Main_7.pp" "PieCtrl.pp" "PieVect.pp" "SysCtrl.pp" "Watchdog.pp" "Xbar.pp" 
	-$(RM) "Adc.obj" "CodeStartBranch.obj" "Dac.obj" "DefaultIsr_7.obj" "DelayUs.obj" "ECap.obj" "EPwm.obj" "F2837xD_Adc.obj" "F2837xD_GlobalVariableDefs.obj" "Gpio.obj" "Main_7.obj" "PieCtrl.obj" "PieVect.obj" "SysCtrl.obj" "Watchdog.obj" "Xbar.obj" 
	-$(RM) "CodeStartBranch.pp" "DelayUs.pp" 
	-@echo 'Finished clean'
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets

