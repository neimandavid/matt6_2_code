# Install script for directory: /home/rosie2/dneiman/daisy_workspace_matt61/src/hebi-ros-daisy

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/rosie2/dneiman/daisy_workspace_matt61/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/rosie2/dneiman/daisy_workspace_matt61/build/hebi-ros-daisy/catkin_generated/installspace/hebi-ros-daisy.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hebi-ros-daisy/cmake" TYPE FILE FILES
    "/home/rosie2/dneiman/daisy_workspace_matt61/build/hebi-ros-daisy/catkin_generated/installspace/hebi-ros-daisyConfig.cmake"
    "/home/rosie2/dneiman/daisy_workspace_matt61/build/hebi-ros-daisy/catkin_generated/installspace/hebi-ros-daisyConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hebi-ros-daisy" TYPE FILE FILES "/home/rosie2/dneiman/daisy_workspace_matt61/src/hebi-ros-daisy/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hebi-ros-daisy" TYPE FILE FILES
    "/home/rosie2/dneiman/daisy_workspace_matt61/src/hebi-ros-daisy/launch/daisy.launch"
    "/home/rosie2/dneiman/daisy_workspace_matt61/src/hebi-ros-daisy/resources/gains18.xml"
    "/home/rosie2/dneiman/daisy_workspace_matt61/src/hebi-ros-daisy/resources/gains3.xml"
    "/home/rosie2/dneiman/daisy_workspace_matt61/src/hebi-ros-daisy/resources/hex_config.xml"
    "/home/rosie2/dneiman/daisy_workspace_matt61/src/hebi-ros-daisy/resources/left.hrdf"
    "/home/rosie2/dneiman/daisy_workspace_matt61/src/hebi-ros-daisy/resources/right.hrdf"
    )
endif()

