package main

import "fmt"

func main() {
	// x increases from left to right
	// y increases from top to bottom
	Line(3, 8, 15, 4) // NE bottom-left to top-right
	Line(3, 4, 15, 8) // SE top-left to bottom-right
	Line(15, 4, 3, 8) // SW top-right to bottom-left
	Line(15, 8, 3, 4) // NW bottom-right to top-left
}

// line by bresenham's algorithm
func Line(x1, y1, x2, y2 int) {
	fmt.Printf("Line(%d,%d,%d,%d)\n", x1, y1, x2, y2)

	var dx, dy, sx, sy, e, e2 int

	dx = x2 - x1
	if dx < 0 {
		dx = -dx
	}

	dy = y2 - y1
	if dy < 0 {
		dy = -dy
	}

	if x1 < x2 {
		sx = 1
	} else {
		sx = -1
	}

	if y1 < y2 {
		sy = 1
	} else {
		sy = -1
	}

	e = dx - dy

	for !(x1 == x2 && y1 == y2) {
		fmt.Printf("(%d,%d)", x1, y1)
		e2 = e + e
		if e2 > -dy {
			e -= dy
			x1 += sx
		}
		if e2 < dx {
			e += dx
			y1 += sy
		}
	}
	fmt.Printf("(%d,%d)\n\n", x1, y1)
}
