@echo off

set _msbuildPath="C:\Program Files\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin"

%_msbuildPath%\msbuild "..\src\CommandLine.sln" /t:Build /p:Configuration=Debug /v:m /m

"..\src\CommandLine\bin\Debug\net461\roslynator" find-symbols "..\src\Roslynator.sln" ^
 --msbuild-path %_msbuildPath% ^
 --visibility public internal ^
 --symbol-kinds type ^
 --ignored-attributes ^
  "System.ObsoleteAttribute" ^
  "Microsoft.CodeAnalysis.Diagnostics.DiagnosticAnalyzerAttribute" ^
  "Microsoft.CodeAnalysis.CodeFixes.ExportCodeFixProviderAttribute" ^
 --unused-only ^
 --ignored-projects Analyzers.Tests CodeFixes.Tests Refactorings.Tests ^
 --verbosity n ^
 --file-log "roslynator.log" ^
 --file-log-verbosity diag

pause
