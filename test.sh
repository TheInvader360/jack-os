cd ../nand2tetris/tools/

echo "Compiling os files..."
./JackCompiler.sh ../../jack-os/Array.jack
./JackCompiler.sh ../../jack-os/Keyboard.jack
./JackCompiler.sh ../../jack-os/Math.jack
./JackCompiler.sh ../../jack-os/Memory.jack
./JackCompiler.sh ../../jack-os/Output.jack
./JackCompiler.sh ../../jack-os/Screen.jack
./JackCompiler.sh ../../jack-os/String.jack
./JackCompiler.sh ../../jack-os/Sys.jack
echo

echo "Comparing vm files..."
./TextComparer.sh ../../jack-os/fixtures/Array.vm-golden ../../jack-os/Array.vm
./TextComparer.sh ../../jack-os/fixtures/Keyboard.vm-golden ../../jack-os/Keyboard.vm
#./TextComparer.sh ../../jack-os/fixtures/Math.vm-golden ../../jack-os/Math.vm
#./TextComparer.sh ../../jack-os/fixtures/Memory.vm-golden ../../jack-os/Memory.vm
#./TextComparer.sh ../../jack-os/fixtures/Output.vm-golden ../../jack-os/Output.vm
#./TextComparer.sh ../../jack-os/fixtures/Screen.vm-golden ../../jack-os/Screen.vm
./TextComparer.sh ../../jack-os/fixtures/String.vm-golden ../../jack-os/String.vm
./TextComparer.sh ../../jack-os/fixtures/Sys.vm-golden ../../jack-os/Sys.vm
echo

echo "Compiling tests..."
cp ../../jack-os/Array.vm ../../jack-os/test/ArrayTest/Array.vm
cp ../../jack-os/Keyboard.vm ../../jack-os/test/KeyboardTest/Keyboard.vm
cp ../../jack-os/Math.vm ../../jack-os/test/MathTest/Math.vm
cp ../../jack-os/Memory.vm ../../jack-os/test/MemoryDiag/Memory.vm
cp ../../jack-os/Memory.vm ../../jack-os/test/MemoryTest/Memory.vm
cp ../../jack-os/Output.vm ../../jack-os/test/OutputTest/Output.vm
cp ../../jack-os/Screen.vm ../../jack-os/test/ScreenTest/Screen.vm
cp ../../jack-os/String.vm ../../jack-os/test/StringTest/String.vm
cp ../../jack-os/Sys.vm ../../jack-os/test/SysTest/Sys.vm
./JackCompiler.sh ../../jack-os/test/ArrayTest
./JackCompiler.sh ../../jack-os/test/KeyboardTest
./JackCompiler.sh ../../jack-os/test/MathTest
./JackCompiler.sh ../../jack-os/test/MemoryDiag
./JackCompiler.sh ../../jack-os/test/MemoryTest
./JackCompiler.sh ../../jack-os/test/OutputTest
./JackCompiler.sh ../../jack-os/test/ScreenTest
./JackCompiler.sh ../../jack-os/test/StringTest
./JackCompiler.sh ../../jack-os/test/SysTest
echo

echo "Launching emulator..."
./VMEmulator.sh
echo
