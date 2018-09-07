ifndef Ps4Sdk
ifdef ps4sdk
Ps4Sdk := $(ps4sdk)
endif
ifdef PS4SDK
Ps4Sdk := $(PS4SDK)
endif
ifndef Ps4Sdk
$(error Neither PS4SDK, Ps4Sdk nor ps4sdk set)
endif
endif

target := ps4_lib
OutPath := lib
TargetFile := libtiff
AllTarget = $(OutPath)/$(TargetFile).a

include $(Ps4Sdk)/make/ps4sdk.mk


$(OutPath)/$(TargetFile).a: $(ObjectFiles)
	$(dirp)
	$(archive)

install:
	@cp $(OutPath)/$(TargetFile).a $(Ps4Sdk)/lib
	@cp include/tif_config.h $(Ps4Sdk)/include
	@cp include/tiffconf.h $(Ps4Sdk)/include
	@cp include/tiff.h $(Ps4Sdk)/include
	@cp include/tiffio.h $(Ps4Sdk)/include
	@cp include/tiffvers.h $(Ps4Sdk)/include
	@echo "Installed!" 