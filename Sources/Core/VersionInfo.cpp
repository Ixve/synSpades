#if __linux__
	#define OS_PLATFORM_LINUX
#elif TARGET_OS_MAC
	#define OS_PLATFORM_MAC
#elif defined _WIN32 || defined _WIN64
	#define OS_PLATFORM_WINDOWS
	#include <Windows.h>
	#include <sstream>
	#include <VersionHelpers.h>
#endif

#include "VersionInfo.h"

std::string VersionInfo::GetVersionInfo() {
#if defined(OS_PLATFORM_LINUX)
	return std::string("synSpades - www.github.com/c-um/synSpades");
#elif defined(TARGET_OS_MAC)
	return std::string("Mac OS X | This user has compiled synSpades for macOS, GG! - www.github.com/c-um/synSpades");
#elif defined(OS_PLATFORM_WINDOWS)

	std::string windowsVersion;

	if (IsWindowsXPOrGreater() && !IsWindowsVistaOrGreater()) {
		windowsVersion = "Windows XP | synSpades - Whoever is this player, is a psychopath. Who plays on XP these days. - www.github.com/c-um/synSpades";
	} else if (IsWindowsVistaOrGreater() && !IsWindows7OrGreater()) {
		windowsVersion = "Windows Vista | synSpades - Why is this player using Vista.. - www.github.com/c-um/synSpades";
	} else if (IsWindows7OrGreater() && !IsWindows8OrGreater()) {
		windowsVersion = "Windows 7 | synSpades - Windows 7 Best Windows version no cap. - www.github.com/c-um/synSpades";
	} else if (IsWindows8OrGreater() && !IsWindows8Point1OrGreater()) {
		windowsVersion = "Windows 8 | synSpades - www.github.com/c-um/synSpades";
	} else if (IsWindows8Point1OrGreater()) {
		windowsVersion = "Windows 8.1 | synSpades - www.github.com/c-um/synSpades";
	} else {
		windowsVersion = "Windows 10 | synSpades - www.github.com/c-um/synSpades";
	}

	if (IsWindowsServer())
		windowsVersion += " Server";
	return windowsVersion;
#elif defined(__FreeBSD__)
	return std::string("FreeBSD");
#elif defined(__OpenBSD__)
	return std::string("OpenBSD");
#else
	return std::string("Unknown OS");
#endif
}
