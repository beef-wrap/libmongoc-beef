cd mongo-c-driver
cmake .
msbuild .\mongo-c-driver.sln
move src\libbson\Debug\bson-static-1.0.lib ..\libs
move src\libbson\Debug\bson-static-1.0.pdb ..\libs
