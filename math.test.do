import { Assert } from "std/assert"
import {
    PI,
    abs,
    approxEqual,
    clamp,
    cos,
    degrees,
    floor,
    hypot,
    isnan,
    isfinite,
    isinf,
    lerp,
    log,
    log2,
    max,
    min,
    pow,
    radians,
    round,
    sin,
    sqrt,
    wrapRadians,
} from "./index"

export function testIntegerAndFloatAbs(): void {
    Assert.equal(abs(-7), 7)
    Assert.isTrue(approxEqual(abs(-3.25), 3.25))
}

export function testClampMinAndMax(): void {
    Assert.equal(min(4, 9), 4)
    Assert.equal(max(4, 9), 9)
    Assert.equal(clamp(15, 0, 10), 10)
    Assert.equal(clamp(-3, 0, 10), 0)
}

export function testTrigAndRoots(): void {
    Assert.isTrue(approxEqual(cos(0.0), 1.0))
    Assert.isTrue(approxEqual(sin(PI / 2.0), 1.0))
    Assert.isTrue(approxEqual(sqrt(9.0), 3.0))
    Assert.isTrue(approxEqual(pow(3.0, 2.0), 9.0))
}

export function testAngleHelpers(): void {
    sixty := radians(60.0)
    Assert.isTrue(approxEqual(degrees(sixty), 60.0))
    Assert.isTrue(approxEqual(wrapRadians(3.5), -2.783185307179586))
}

export function testConvenienceHelpers(): void {
    Assert.isTrue(approxEqual(lerp(10.0, 20.0, 0.25), 12.5))
    Assert.isTrue(approxEqual(floor(3.9), 3.0))
    Assert.isTrue(approxEqual(round(3.6), 4.0))
}

export function testHypotBasic(): void {
    Assert.isTrue(approxEqual(hypot(3.0, 4.0), 5.0))
}

export function testHypotFloat(): void {
    Assert.isTrue(approxEqual(hypot(3.0f, 4.0f), 5.0f))
}

export function testHypotZero(): void {
    Assert.isTrue(approxEqual(hypot(0.0, 0.0), 0.0))
}

export function testHypotSymmetric(): void {
    Assert.isTrue(approxEqual(hypot(3.0, 4.0), hypot(4.0, 3.0)))
}

export function testLog2PowersOfTwo(): void {
    Assert.isTrue(approxEqual(log2(1.0), 0.0))
    Assert.isTrue(approxEqual(log2(2.0), 1.0))
    Assert.isTrue(approxEqual(log2(8.0), 3.0))
    Assert.isTrue(approxEqual(log2(1024.0), 10.0))
}

export function testLog2Float(): void {
    Assert.isTrue(approxEqual(log2(8.0f), 3.0f))
}

export function testIsnanWithNan(): void {
    Assert.isTrue(isnan(0.0 / 0.0))
}

export function testIsnanWithNanFloat(): void {
    Assert.isTrue(isnan(0.0f / 0.0f))
}

export function testIsnanWithNormal(): void {
    Assert.isFalse(isnan(1.0))
    Assert.isFalse(isnan(-1.0))
    Assert.isFalse(isnan(0.0))
}

export function testIsnanSqrtNegative(): void {
    Assert.isTrue(isnan(sqrt(-1.0)))
}

export function testIsnanLogNegative(): void {
    Assert.isTrue(isnan(log(-1.0)))
}

export function testIsinfWithInf(): void {
    Assert.isTrue(isinf(1.0 / 0.0))
    Assert.isTrue(isinf(-1.0 / 0.0))
}

export function testIsinfWithInfFloat(): void {
    Assert.isTrue(isinf(1.0f / 0.0f))
}

export function testIsinfWithNormal(): void {
    Assert.isFalse(isinf(1.0))
    Assert.isFalse(isinf(0.0))
}

export function testIsinfWithNan(): void {
    Assert.isFalse(isinf(0.0 / 0.0))
}

export function testIsfiniteWithNormal(): void {
    Assert.isTrue(isfinite(1.0))
    Assert.isTrue(isfinite(-1.0))
    Assert.isTrue(isfinite(0.0))
}

export function testIsfiniteWithInf(): void {
    Assert.isFalse(isfinite(1.0 / 0.0))
    Assert.isFalse(isfinite(-1.0 / 0.0))
}

export function testIsfiniteWithNan(): void {
    Assert.isFalse(isfinite(0.0 / 0.0))
}

export function testIsfiniteFloat(): void {
    Assert.isTrue(isfinite(1.0f))
    Assert.isFalse(isfinite(1.0f / 0.0f))
}

export function testMutualExclusion(): void {
    let nan = 0.0 / 0.0
    let inf = 1.0 / 0.0
    let normal = 1.0

    // exactly one of these should be true for any value
    Assert.isTrue(isnan(nan) && !isinf(nan) && !isfinite(nan))
    Assert.isTrue(!isnan(inf) && isinf(inf) && !isfinite(inf))
    Assert.isTrue(!isnan(normal) && !isinf(normal) && isfinite(normal))
}
