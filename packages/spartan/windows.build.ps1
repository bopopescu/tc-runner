$ErrorActionPreference = "stop"
copy-item -recurse "c:\pkg\src\spartan\" "c:\"
push-location "c:\spartan"
& "${env:ProgramFiles}\erlang\bin\escript" "c:\spartan\rebar3" "update"
& "${env:ProgramFiles}\erlang\bin\escript" "c:\spartan\rebar3" "compile"
& "${env:ProgramFiles}\erlang\bin\escript" "c:\spartan\rebar3" "release" "-d"
copy-item -recurse "c:\spartan\_build\default\rel\spartan\*" "$env:PKG_PATH"
copy-item "c:\pkg\build\extra\*" "$env:PKG_PATH"
