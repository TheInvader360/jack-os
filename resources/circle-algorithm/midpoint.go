package main

import (
	"fmt"
)

const (
	screenWidth  = 40
	screenHeight = 40
)

type screen struct {
	// x increases from left to right
	// y increases from top to bottom
	pixels [screenWidth * screenHeight]int
}

func main() {
	s := screen{}
	s.drawPixel(1, 3)               // simple test pixel
	s.drawHorizontalLine(2, 10, 25) // simple test line
	s.drawCircle(10, 8, 3)          // equivalent to the "door handle" circle
	s.drawCircle(28, 25, 10)        // and a bigger circle just for fun...
	s.print()
}

func (s *screen) drawPixel(x, y int) {
	fmt.Printf("drawPixel(x=%d,y=%d)\n", x, y)
	s.pixels[y*screenWidth+x] = 1
}

func (s *screen) drawHorizontalLine(x1, x2, y int) {
	fmt.Printf("drawHorizontalLine(x1=%d,x2=%d,y=%d)\n", x1, x2, y)
	if x1 > x2 {
		swap := x1
		x1 = x2
		x2 = swap
	}
	for x1 < x2 {
		s.pixels[y*screenWidth+x1] = 1
		x1++
	}
}

func (s *screen) drawCircle(x, y, r int) {
	fmt.Printf("drawCircle(x=%d,y=%d,r=%d)\n", x, y, r)
	xk := r
	yk := 0
	rError := 1 - xk
	for !(xk < yk) { // while (xk >= yk) {
		startX := -xk + x
		endX := xk + x
		s.drawHorizontalLine(startX, endX, yk+y)
		if yk != 0 {
			s.drawHorizontalLine(startX, endX, -yk+y)
		}
		yk++
		if rError < 0 {
			rError += 2*yk + 1
		} else {
			if xk >= yk {
				startX = -yk + 1 + x
				endX = yk - 1 + x
				s.drawHorizontalLine(startX, endX, xk+y)
				s.drawHorizontalLine(startX, endX, -xk+y)
			}
			xk--
			rError += 2 * (yk - xk + 1)
		}
	}
}

func (s *screen) print() {
	x := 0
	y := 0
	for y < screenHeight {
		for x < screenWidth {
			if s.pixels[y*screenWidth+x] == 1 {
				fmt.Print("█")
			} else {
				fmt.Print(".")
			}
			x++
		}
		fmt.Print("\n")
		x = 0
		y++
	}
	fmt.Print("\n")
}
