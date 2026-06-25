# std/math

Common mathematical constants and lightweight wrappers around the C++ `<cmath>` functions. Provides type-generic imports for Doof numeric types plus a few small helpers like unit conversions, linear interpolation, and angle normalization.

## Documentation

- [Guide and API reference](docs/API.md) groups constants, numeric helpers, trigonometry, classification, and angle utilities.
- Tests can be run with `doof test math`.

## Usage

```doof
import { PI, TAU, E, sin, cos, radians, degrees, lerp, approxEqual, wrapRadians } from "std/math"

x := sin(PI / 4.0)
angle := radians(180.0)
deg := degrees(PI)
mid := lerp(0.0, 10.0, 0.5)
close := approxEqual(0.000001, 0.000002)
wrapped := wrapRadians(4.0) // keeps value within (-PI, PI]
```

## Exports

### Constants

- `PI` — Double precision π (3.141592653589793)
- `TAU` — Double precision τ (2·π, 6.283185307179586)
- `E` — Double precision Euler's number (2.718281828459045)

---

### Trigonometry and math functions

Type-generic imports of common `<cmath>` and `<algorithm>` functions. These are declared to accept appropriate Doof numeric types (`float`, `double`, `int`, `long`) and forward to the platform C++ implementation:

- `sin`, `cos`, `tan`, `asin`, `acos`, `atan`, `atan2`
- `sqrt`, `pow`, `exp`, `log`, `floor`, `ceil`, `round`
- `hypot`, `log2`, `log10`, `fmod`, `isnan`, `isinf`, `isfinite`
- `abs`, `min`, `max`, `clamp`

Use them as you would standard math functions; type parameters are inferred from the arguments.

---

### Helpers

- `radians(degrees: double): double` — Convert degrees to radians.
- `degrees(radiansValue: double): double` — Convert radians to degrees.
- `lerp(a: double, b: double, t: double): double` — Linear interpolation; returns `a + (b - a) * t`.
- `approxEqual(a: double, b: double, tolerance: double = 0.000001): bool` — Approximate equality with a default tolerance.
- `wrapRadians(angle: double): double` — Normalize an angle into the range (-PI, PI].
- `mod(x: double, y: double): double` — Modulo operation that handles negative values correctly, returning a result in the range [0, y).

## Notes

- This module is intentionally small and thin: it re-exports and adapts platform math primitives for Doof and adds a few convenience helpers commonly needed in applications.
