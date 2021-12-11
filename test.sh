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
#./TextComparer.sh ../../jack-os/fixtures/Math.vm-golden ../../jack-os/Math.vm        # intentionally disabled: my implementation differs from the provided golden vm file, but all tests pass.
./TextComparer.sh ../../jack-os/fixtures/Memory.vm-golden ../../jack-os/Memory.vm
#./TextComparer.sh ../../jack-os/fixtures/Output.vm-golden ../../jack-os/Output.vm    # intentionally disabled: my implementation differs from the provided golden vm file, but all tests pass.
#./TextComparer.sh ../../jack-os/fixtures/Screen.vm-golden ../../jack-os/Screen.vm    # intentionally disabled: my implementation differs from the provided golden vm file, but all tests pass.
./TextComparer.sh ../../jack-os/fixtures/String.vm-golden ../../jack-os/String.vm
./TextComparer.sh ../../jack-os/fixtures/Sys.vm-golden ../../jack-os/Sys.vm
echo

echo "Compiling tests..."
cp ../../jack-os/Array.vm ../../jack-os/test/ArrayTest/Array.vm
cp ../../jack-os/Keyboard.vm ../../jack-os/test/KeyboardTest/Keyboard.vm
cp ../../jack-os/Math.vm ../../jack-os/test/MathTest/Math.vm
cp ../../jack-os/Math.vm ../../jack-os/test/ScreenTest/Math.vm                        # the required mod() extension is not available in the built-in implementation of math.
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

echo "Compiling games..."
cp ../../jack-os/Array.vm ../../jack-os/games/Pong/Array.vm
cp ../../jack-os/Keyboard.vm ../../jack-os/games/Pong/Keyboard.vm
cp ../../jack-os/Math.vm ../../jack-os/games/Pong/Math.vm
cp ../../jack-os/Memory.vm ../../jack-os/games/Pong/Memory.vm
cp ../../jack-os/Output.vm ../../jack-os/games/Pong/Output.vm
cp ../../jack-os/Screen.vm ../../jack-os/games/Pong/Screen.vm
cp ../../jack-os/String.vm ../../jack-os/games/Pong/String.vm
cp ../../jack-os/Sys.vm ../../jack-os/games/Pong/Sys.vm
cp ../../jack-os/Array.vm ../../jack-os/games/Sokoban/Array.vm
cp ../../jack-os/Keyboard.vm ../../jack-os/games/Sokoban/Keyboard.vm
cp ../../jack-os/Math.vm ../../jack-os/games/Sokoban/Math.vm
cp ../../jack-os/Memory.vm ../../jack-os/games/Sokoban/Memory.vm
cp ../../jack-os/Output.vm ../../jack-os/games/Sokoban/Output.vm
cp ../../jack-os/Screen.vm ../../jack-os/games/Sokoban/Screen.vm
cp ../../jack-os/String.vm ../../jack-os/games/Sokoban/String.vm
cp ../../jack-os/Sys.vm ../../jack-os/games/Sokoban/Sys.vm
cp ../../jack-os/Array.vm ../../jack-os/games/Square/Array.vm
cp ../../jack-os/Keyboard.vm ../../jack-os/games/Square/Keyboard.vm
cp ../../jack-os/Math.vm ../../jack-os/games/Square/Math.vm
cp ../../jack-os/Memory.vm ../../jack-os/games/Square/Memory.vm
cp ../../jack-os/Output.vm ../../jack-os/games/Square/Output.vm
cp ../../jack-os/Screen.vm ../../jack-os/games/Square/Screen.vm
cp ../../jack-os/String.vm ../../jack-os/games/Square/String.vm
cp ../../jack-os/Sys.vm ../../jack-os/games/Square/Sys.vm
./JackCompiler.sh ../../jack-os/games/Pong
./JackCompiler.sh ../../jack-os/games/Sokoban
./JackCompiler.sh ../../jack-os/games/Square

echo "Launching emulator..."
./VMEmulator.sh
echo

