# This file will be configured to contain variables for CPack. These variables
# should be set in the CMake list file of the project before CPack module is
# included. The list of available CPACK_xxx variables and their associated
# documentation may be obtained using
#  cpack --help-variable-list
#
# Some variables are common to all generators (e.g. CPACK_PACKAGE_NAME)
# and some are specific to a generator
# (e.g. CPACK_NSIS_EXTRA_INSTALL_COMMANDS). The generator specific variables
# usually begin with CPACK_<GENNAME>_xxxx.


set(CPACK_BUILD_SOURCE_DIRS "/home/synth/synspades;/home/synth/synspades/synspades.mk")
set(CPACK_CMAKE_GENERATOR "Unix Makefiles")
set(CPACK_COMPONENTS_ALL "ALL")
set(CPACK_COMPONENTS_ALL_SET_BY_USER "TRUE")
set(CPACK_COMPONENT_UNSPECIFIED_HIDDEN "TRUE")
set(CPACK_COMPONENT_UNSPECIFIED_REQUIRED "TRUE")
set(CPACK_DEBIAN_ARCHITECTURE "x86_64")
set(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA "/home/synth/synspades/Resources/Unix/Control/postinst")
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libc6 (>= 2.19), libgcc1 (>= 1:4.9), libstdc++6 (>= 4.8.2), zlib1g (>= 1:1.2.8), libcurl3 (>= 7.35.0), libglew1.10 (>= 1.10.0), libsdl2-2.0-0 (>= 2.0.2), libsdl2-image-2.0-0 (>= 2.0.0), libfreetype6 (>= 2.4.0)")
set(CPACK_DEBIAN_PACKAGE_DESCRIPTION "Open-source clone of Ace of Spades - free FPS sandbox game
 OpenSpades is a clone of Voxlap Ace of Spades 0.75, which is a free 
 multiplayer game created by Ben Aksoy.
 .
 Here are some features:
 .
   - Ability to connect to vanilla/pyspades server
   - Better performance on some modern computers/netbooks
   - Sophisticated graphics
   - Fully open source (GPLv3 compliant)
   - Cross-platform")
set(CPACK_DEBIAN_PACKAGE_PRIORITY "optional")
set(CPACK_DEBIAN_PACKAGE_RECOMMENDS "")
set(CPACK_DEBIAN_PACKAGE_SECTION "games")
set(CPACK_DEBIAN_PACKAGE_SUGGESTS "")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_FILE "/usr/share/cmake-3.23/Templates/CPack.GenericDescription.txt")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_SUMMARY "OpenSpades built using CMake")
set(CPACK_DMG_SLA_USE_RESOURCE_FILE_LICENSE "ON")
set(CPACK_GENERATOR "DEB;TGZ")
set(CPACK_INCLUDE_TOPLEVEL_DIRECTORY "FALSE")
set(CPACK_INSTALL_CMAKE_PROJECTS "/home/synth/synspades/synspades.mk;OpenSpades;ALL;/")
set(CPACK_INSTALL_PREFIX "/usr/local")
set(CPACK_MODULE_PATH "")
set(CPACK_NSIS_DISPLAY_NAME "OpenSpades 0.1.3")
set(CPACK_NSIS_INSTALLER_ICON_CODE "")
set(CPACK_NSIS_INSTALLER_MUI_ICON_CODE "")
set(CPACK_NSIS_INSTALL_ROOT "$PROGRAMFILES")
set(CPACK_NSIS_PACKAGE_NAME "OpenSpades 0.1.3")
set(CPACK_NSIS_UNINSTALL_NAME "Uninstall")
set(CPACK_OUTPUT_CONFIG_FILE "/home/synth/synspades/synspades.mk/CPackConfig.cmake")
set(CPACK_PACKAGE_CONTACT "yvt <i@yvt.jp>")
set(CPACK_PACKAGE_DEFAULT_LOCATION "/")
set(CPACK_PACKAGE_DESCRIPTION "Open-source clone of Ace of Spades - free FPS sandbox game")
set(CPACK_PACKAGE_DESCRIPTION_FILE "/home/synth/synspades/README.md")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Open-source clone of Ace of Spades")
set(CPACK_PACKAGE_EXECUTABLES "openspades;Launch OpenSpades")
set(CPACK_PACKAGE_FILE_NAME "openspades-0.1.3-Linux-x86_64")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "OpenSpades 0.1.3")
set(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "OpenSpades 0.1.3")
set(CPACK_PACKAGE_NAME "OpenSpades")
set(CPACK_PACKAGE_RELOCATABLE "true")
set(CPACK_PACKAGE_VENDOR "yvt, assorted")
set(CPACK_PACKAGE_VERSION "0.1.3")
set(CPACK_PACKAGE_VERSION_MAJOR "0")
set(CPACK_PACKAGE_VERSION_MINOR "1")
set(CPACK_PACKAGE_VERSION_PATCH "3")
set(CPACK_PACKAGING_INSTALL_PREFIX "/usr")
set(CPACK_RESOURCE_FILE_LICENSE "/home/synth/synspades/LICENSE")
set(CPACK_RESOURCE_FILE_README "/home/synth/synspades/README.md")
set(CPACK_RESOURCE_FILE_WELCOME "/usr/share/cmake-3.23/Templates/CPack.GenericWelcome.txt")
set(CPACK_SET_DESTDIR "on")
set(CPACK_SOURCE_GENERATOR "TBZ2;TGZ;TXZ;TZ")
set(CPACK_SOURCE_OUTPUT_CONFIG_FILE "/home/synth/synspades/synspades.mk/CPackSourceConfig.cmake")
set(CPACK_SOURCE_PACKAGE_FILE_NAME "openspades-0.1.3")
set(CPACK_SOURCE_RPM "OFF")
set(CPACK_SOURCE_TBZ2 "ON")
set(CPACK_SOURCE_TGZ "ON")
set(CPACK_SOURCE_TXZ "ON")
set(CPACK_SOURCE_TZ "ON")
set(CPACK_SOURCE_ZIP "OFF")
set(CPACK_STRIP_FILES "bin/openspades")
set(CPACK_SYSTEM_NAME "Linux-x86_64")
set(CPACK_THREADS "1")
set(CPACK_TOPLEVEL_TAG "Linux-x86_64")
set(CPACK_WIX_SIZEOF_VOID_P "8")

if(NOT CPACK_PROPERTIES_FILE)
  set(CPACK_PROPERTIES_FILE "/home/synth/synspades/synspades.mk/CPackProperties.cmake")
endif()

if(EXISTS ${CPACK_PROPERTIES_FILE})
  include(${CPACK_PROPERTIES_FILE})
endif()
