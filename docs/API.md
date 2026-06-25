# std/math Guide

`std/math` provides common mathematical constants, thin type-generic wrappers
around C++ `<cmath>` and `<algorithm>`, and a few Doof-native helpers for angles
and interpolation.

## Quick Start

```doof
import { PI, approxEqual, lerp, radians, sin, wrapRadians } from "std/math"

x := sin(PI / 4.0)
half := lerp(0.0, 10.0, 0.5)
angle := radians(180.0)
wrapped := wrapRadians(4.0)

if approxEqual(half, 5.0) {
  println("close enough")
}
```

## Constants

- `PI = 3.141592653589793`
- `TAU = 6.283185307179586`
- `E = 2.718281828459045`

## Numeric Helpers

These wrappers accept `int`, `long`, `float`, or `double` where the underlying
C++ function supports that family:

- `abs(x)`
- `min(a, b)`
- `max(a, b)`
- `clamp(x, lo, hi)`

`clamp` follows the platform `std::clamp` behavior: `lo` should be less than or
equal to `hi`.

## Floating Point Functions

Trigonometry:

- `sin`, `cos`, `tan`
- `asin`, `acos`, `atan`, `atan2`

Powers, roots, logs, and rounding:

- `sqrt`, `pow`, `exp`
- `log`, `log2`, `log10`
- `floor`, `ceil`, `round`
- `hypot`, `fmod`

Classification:

- `isnan(x)`
- `isinf(x)`
- `isfinite(x)`

These functions are thin native imports. Domain behavior follows the platform
math library: for example, `sqrt(-1.0)` returns NaN rather than a `Result`.

## Doof Helpers

```doof
export function radians(degrees: double): double
export function degrees(radiansValue: double): double
export function lerp(a: double, b: double, t: double): double
export function approxEqual(a: double, b: double, tolerance: double = 0.000001): bool
export function mod(x: double, y: double): double
export function wrapRadians(angle: double): double
```

`mod` normalizes negative values into `[0, y)`. `wrapRadians` uses that behavior
to normalize angles into `[-PI, PI)`.

## API Source

All declarations are defined in [index.do](../index.do). The module is
intentionally small, so the source file is usually the clearest place to inspect
exact signatures.
