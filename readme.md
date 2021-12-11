# Jack OS

An operating system / standard library for the Hack/Jack platform (nand2tetris)

## Notes

* The OS is efficient enough to run the Pong/Sokoban/Square games reasonably well in the standard VM Emulator (animation: none, speed: fastest)
* All tests pass (except for a whopping great 8 out of 131072 pixels discrepancy in the Screen test...)
* I replaced the proposed diagonal line drawing algorithm with Bresenham's to more closely match the provided reference screenshot
* I replaced the proposed filled circle drawing algorithm with Midpoint to more closely match the provided reference screenshot
* I've added Math.mod() and Screen.clearRectangle(), and my Output and Screen implementations depend on these extensions
