#!/usr/bin/env julia

using InteractiveUtils

versioninfo(verbose = true)
Sys.CPU_THREADS
Sys.cpu_summary()
Sys.cpu_info()
Sys.CPU_NAME
Sys.isunix()
Sys.isapple()
Sys.islinux()
Sys.isbsd()
Sys.iswindows()
Sys.free_memory()
Sys.total_memory()
VersionNumber

varinfo()
