package main

import (
	"fmt"
	"math"
	"os"
	"strconv"
)

func main() {
	if len(os.Args) != 3 {
		fmt.Fprintln(os.Stderr, "Usage: force-field <time delta> <count>")
		os.Exit(1)
	}

	timeDelta, _ := strconv.ParseFloat(os.Args[1], 64)
	count, _ := strconv.Atoi(os.Args[2])

	p1 := Particle{Vector{0.3, 0}, -1, Vector{0, 0}}
	p2 := Particle{Vector{-0.3, 1}, 1, Vector{0, 0}}
	for i := 0; i < count; i++ {
		force1 := p1.ForceFrom(&p2)
		force2 := p2.ForceFrom(&p1)
		p1.ApplyForce(force1, timeDelta)
		p2.ApplyForce(force2, timeDelta)
	}

	fmt.Println("p1 =", p1)
	fmt.Println("p2 =", p2)
}

type Particle struct {
	Position Vector
	Mass     float64
	Velocity Vector
}

func (p *Particle) ApplyForce(force Vector, timeDelta float64) {
	AddInPlace(&p.Velocity, force.Scale(timeDelta/math.Abs(p.Mass)))
	AddInPlace(&p.Position, p.Velocity.Scale(timeDelta))
}

func (p *Particle) ForceFrom(p1 *Particle) Vector {
	distance := p1.Position.Subtract(p.Position)
	magnitude := p.Mass * p1.Mass / distance.Dot(distance)
	return distance.Normalize().Scale(magnitude)
}

func (p *Particle) String() string {
	return fmt.Sprintf("{Particle mass: %f velocity: %s position: %s}",
		p.Mass, p.Velocity.String(), p.Position.String())
}

type Vector struct {
	X float64
	Y float64
}

func (v Vector) Add(v2 Vector) Vector {
	return Vector{v.X + v2.X, v.Y + v2.Y}
}

func (v Vector) Dot(v2 Vector) float64 {
	return v.X*v2.X + v.Y*v2.Y
}

func (v Vector) Normalize() Vector {
	magnitude := math.Sqrt(v.Dot(v))
	if magnitude == 0 {
		return Vector{0, 0}
	}
	return v.Scale(1.0 / magnitude)
}

func (v Vector) Scale(scaler float64) Vector {
	return Vector{v.X * scaler, v.Y * scaler}
}

func (v Vector) String() string {
	return fmt.Sprintf("(%f, %f)", v.X, v.Y)
}

func (v Vector) Subtract(v2 Vector) Vector {
	return Vector{v.X - v2.X, v.Y - v2.Y}
}

func AddInPlace(v *Vector, v2 Vector) {
	v.X += v2.X
	v.Y += v2.Y
}
