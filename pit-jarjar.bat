@echo off
setlocal EnableDelayedExpansion

set JARJAR_PATH=%~dp0

REM comment out below to see the issue
set HAMCREST_PATH=%JARJAR_PATH%/lib/hamcrest-all-1.1.jar

set PIT_REPORT_DIR=target/pitest
set PIT_LOG_FILE=%PIT_REPORT_DIR%/pitest-out-nohamcrest.log
set PIT_PATH=%JARJAR_PATH%/pit_lib/pitest-0.32.jar;%JARJAR_PATH%/pit_lib/pitest-command-line-0.32.jar


echo Started at %TIME% | tee %PIT_LOG_FILE%

java -cp "%JARJAR_PATH%/lib/junit-4.8.1.jar;%HAMCREST_PATH%;%PIT_PATH%;%JARJAR_PATH%/target/classes" org.pitest.mutationtest.commandline.MutationCoverageReport --reportDir %PIT_REPORT_DIR% --targetClasses com.tonicsystems* --targetTests com.tonicsystems* --verbose --sourceDirs %JARJAR_PATH%/src/main,%JARJAR_PATH%/src/test 2>&1 | tee -a %PIT_LOG_FILE%

echo Done at  %TIME% | tee -a %PIT_LOG_FILE%