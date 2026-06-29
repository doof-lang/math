export readonly PI = 3.141592653589793
export readonly TAU = 6.283185307179586
export readonly E = 2.718281828459045

export import function abs<T: int | long | float | double>(x: T): T from "<cmath>" as std::abs
export import function min<T: int | long | float | double>(a: T, b: T): T from "<algorithm>" as std::min
export import function max<T: int | long | float | double>(a: T, b: T): T from "<algorithm>" as std::max
export import function clamp<T: int | long | float | double>(x: T, lo: T, hi: T): T from "<algorithm>" as std::clamp

export import function sin<T: float | double>(x: T): T from "<cmath>" as std::sin
export import function cos<T: float | double>(x: T): T from "<cmath>" as std::cos
export import function tan<T: float | double>(x: T): T from "<cmath>" as std::tan
export import function asin<T: float | double>(x: T): T from "<cmath>" as std::asin
export import function acos<T: float | double>(x: T): T from "<cmath>" as std::acos
export import function atan<T: float | double>(x: T): T from "<cmath>" as std::atan
export import function atan2<T: float | double>(y: T, x: T): T from "<cmath>" as std::atan2
export import function sqrt<T: float | double>(x: T): T from "<cmath>" as std::sqrt
export import function pow<T: float | double>(base: T, exponent: T): T from "<cmath>" as std::pow
export import function exp<T: float | double>(x: T): T from "<cmath>" as std::exp
export import function log<T: float | double>(x: T): T from "<cmath>" as std::log
export import function floor<T: float | double>(x: T): T from "<cmath>" as std::floor
export import function ceil<T: float | double>(x: T): T from "<cmath>" as std::ceil
export import function round<T: float | double>(x: T): T from "<cmath>" as std::round
export import function hypot<T: float | double>(x: T, y: T): T from "<cmath>" as std::hypot
export import function log2<T: float | double>(x: T): T from "<cmath>" as std::log2
export import function log10<T: float | double>(x: T): T from "<cmath>" as std::log10
export import function isnan<T: float | double>(x: T): bool from "<cmath>" as std::isnan
export import function isinf<T: float | double>(x: T): bool from "<cmath>" as std::isinf
export import function isfinite<T: float | double>(x: T): bool from "<cmath>" as std::isfinite

export function radians(degrees: double): double => degrees * (PI / 180.0)

export function degrees(radiansValue: double): double => radiansValue * (180.0 / PI)

export function lerp(a: double, b: double, t: double): double => a + (b - a) * t

export function approxEqual(a: double, b: double, tolerance: double = 0.000001): bool {
    return abs(a - b) <= tolerance
}

export import function fmod<T: float | double>(x: T, y: T): T from "<cmath>" as std::fmod

export function mod(x: double, y: double): double {
    return fmod(fmod(x, y) + y, y)
}

export function wrapRadians(angle: double): double {
    return mod(angle + PI, TAU) - PI
}
