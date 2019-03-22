##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=PackMan
ConfigurationName      :=Debug
WorkspacePath          :=D:/PackMan
ProjectPath            :=D:/PackMan/PackMan
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=oscalm
Date                   :=07/03/2019
CodeLitePath           :=C:/cseapp/CodeLite
LinkerName             :=$(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-g++.exe
SharedObjectLinkerName :=$(CodeLiteDir)/tools/gcc-arm/arm-none-eabi-g++.exe -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName).elf
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="PackMan.txt"
PCHCompileFlags        :=
MakeDirCommand         :=makedir
RcCmpOptions           := 
RcCompilerName         :=
LinkOptions            :=  -T$(ProjectPath)/md407-ram.x -L$(ARM_V6LIB) -L$(ARM_GCC_V6LIB) -nostartfiles
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)gcc $(LibrarySwitch)c_nano 
ArLibs                 :=  "gcc" "c_nano" 
LibPath                := $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-ar.exe rcu
CXX      := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-g++.exe
CC       := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-gcc.exe
CXXFLAGS :=  -g -O0 -W $(Preprocessors)
CFLAGS   :=  -Wa,-adhln=test.s -g -O0 -w -mthumb -march=armv6-m  -mfloat-abi=soft -std=c99 -mthumb -march=armv6-m $(Preprocessors)
ASFLAGS  := 
AS       := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-as.exe


##
## User defined environment variables
##
CodeLiteDir:=C:\cseapp\CodeLite
ARM_V6LIB:=$(CodeLiteDir)/tools/gcc-arm/arm-none-eabi/lib/thumb/v6-m
ARM_GCC_V6LIB:=$(CodeLiteDir)/tools/gcc-arm/lib/gcc/arm-none-eabi/7.2.1/thumb/v6-m
ARM_M4FPLIB:=$(CodeLiteDir)/tools/gcc-arm/arm-none-eabi/lib/thumb/v7e-m/fpv4-sp/hard
ARM_GCC_M4FPLIB:=$(CodeLiteDir)/tools/gcc-arm/lib/gcc/arm-none-eabi/7.2.1/thumb/v7e-m
Objects0=$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IntermediateDirectory)/systick.c$(ObjectSuffix) $(IntermediateDirectory)/Image.c$(ObjectSuffix) $(IntermediateDirectory)/snack.c$(ObjectSuffix) $(IntermediateDirectory)/keyb.c$(ObjectSuffix) $(IntermediateDirectory)/PackMan.c$(ObjectSuffix) $(IntermediateDirectory)/graphic-disp.c$(ObjectSuffix) $(IntermediateDirectory)/alfa-disp.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

PostBuild:
	@echo Executing Post Build commands ...
	arm-none-eabi-objcopy -S -O srec  ./Debug/PackMan.elf ./Debug/PackMan.s19
	arm-none-eabi-objdump -D -S ./Debug/PackMan.elf > ./Debug/PackMan.dass
	@echo Done

MakeIntermediateDirs:
	@$(MakeDirCommand) "./Debug"


$(IntermediateDirectory)/.d:
	@$(MakeDirCommand) "./Debug"

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/startup.c$(ObjectSuffix): startup.c $(IntermediateDirectory)/startup.c$(DependSuffix)
	$(CC) $(SourceSwitch) "D:/PackMan/PackMan/startup.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/startup.c$(DependSuffix): startup.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/startup.c$(ObjectSuffix) -MF$(IntermediateDirectory)/startup.c$(DependSuffix) -MM startup.c

$(IntermediateDirectory)/startup.c$(PreprocessSuffix): startup.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/startup.c$(PreprocessSuffix) startup.c

$(IntermediateDirectory)/systick.c$(ObjectSuffix): systick.c $(IntermediateDirectory)/systick.c$(DependSuffix)
	$(CC) $(SourceSwitch) "D:/PackMan/PackMan/systick.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/systick.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/systick.c$(DependSuffix): systick.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/systick.c$(ObjectSuffix) -MF$(IntermediateDirectory)/systick.c$(DependSuffix) -MM systick.c

$(IntermediateDirectory)/systick.c$(PreprocessSuffix): systick.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/systick.c$(PreprocessSuffix) systick.c

$(IntermediateDirectory)/Image.c$(ObjectSuffix): Image.c $(IntermediateDirectory)/Image.c$(DependSuffix)
	$(CC) $(SourceSwitch) "D:/PackMan/PackMan/Image.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Image.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/Image.c$(DependSuffix): Image.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/Image.c$(ObjectSuffix) -MF$(IntermediateDirectory)/Image.c$(DependSuffix) -MM Image.c

$(IntermediateDirectory)/Image.c$(PreprocessSuffix): Image.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/Image.c$(PreprocessSuffix) Image.c

$(IntermediateDirectory)/snack.c$(ObjectSuffix): snack.c $(IntermediateDirectory)/snack.c$(DependSuffix)
	$(CC) $(SourceSwitch) "D:/PackMan/PackMan/snack.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/snack.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/snack.c$(DependSuffix): snack.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/snack.c$(ObjectSuffix) -MF$(IntermediateDirectory)/snack.c$(DependSuffix) -MM snack.c

$(IntermediateDirectory)/snack.c$(PreprocessSuffix): snack.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/snack.c$(PreprocessSuffix) snack.c

$(IntermediateDirectory)/keyb.c$(ObjectSuffix): keyb.c $(IntermediateDirectory)/keyb.c$(DependSuffix)
	$(CC) $(SourceSwitch) "D:/PackMan/PackMan/keyb.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/keyb.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/keyb.c$(DependSuffix): keyb.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/keyb.c$(ObjectSuffix) -MF$(IntermediateDirectory)/keyb.c$(DependSuffix) -MM keyb.c

$(IntermediateDirectory)/keyb.c$(PreprocessSuffix): keyb.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/keyb.c$(PreprocessSuffix) keyb.c

$(IntermediateDirectory)/PackMan.c$(ObjectSuffix): PackMan.c $(IntermediateDirectory)/PackMan.c$(DependSuffix)
	$(CC) $(SourceSwitch) "D:/PackMan/PackMan/PackMan.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/PackMan.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/PackMan.c$(DependSuffix): PackMan.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/PackMan.c$(ObjectSuffix) -MF$(IntermediateDirectory)/PackMan.c$(DependSuffix) -MM PackMan.c

$(IntermediateDirectory)/PackMan.c$(PreprocessSuffix): PackMan.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/PackMan.c$(PreprocessSuffix) PackMan.c

$(IntermediateDirectory)/graphic-disp.c$(ObjectSuffix): graphic-disp.c $(IntermediateDirectory)/graphic-disp.c$(DependSuffix)
	$(CC) $(SourceSwitch) "D:/PackMan/PackMan/graphic-disp.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/graphic-disp.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/graphic-disp.c$(DependSuffix): graphic-disp.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/graphic-disp.c$(ObjectSuffix) -MF$(IntermediateDirectory)/graphic-disp.c$(DependSuffix) -MM graphic-disp.c

$(IntermediateDirectory)/graphic-disp.c$(PreprocessSuffix): graphic-disp.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/graphic-disp.c$(PreprocessSuffix) graphic-disp.c

$(IntermediateDirectory)/alfa-disp.c$(ObjectSuffix): alfa-disp.c $(IntermediateDirectory)/alfa-disp.c$(DependSuffix)
	$(CC) $(SourceSwitch) "D:/PackMan/PackMan/alfa-disp.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/alfa-disp.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/alfa-disp.c$(DependSuffix): alfa-disp.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/alfa-disp.c$(ObjectSuffix) -MF$(IntermediateDirectory)/alfa-disp.c$(DependSuffix) -MM alfa-disp.c

$(IntermediateDirectory)/alfa-disp.c$(PreprocessSuffix): alfa-disp.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/alfa-disp.c$(PreprocessSuffix) alfa-disp.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


