//
//  simd_float4x4+Rotate.swift
//  MetalMath
//
//  Created by Zehua Chen on 12/31/20.
//

import simd

extension simd_float4x4 {
  /// Create a rotation matrix around Y axis
  /// - Parameter rotation: rotation around y in radians
  /// - Returns: a rotation matrix
  @inlinable
  public static func rotateY(_ rotation: Float32) -> Self {
    return simd_float4x4(rows: [
      SIMD4<Float32>([cos(rotation), 0, sin(rotation), 0]),
      SIMD4<Float32>([0, 1, 0, 0]),
      SIMD4<Float32>([-sin(rotation), 0, cos(rotation), 0]),
      SIMD4<Float32>([0, 0, 0, 1]),
    ])
  }

  @inlinable
  public static func rotateY(_ rotation: Float32, around center: SIMD3<Float32>) -> Self {
    return .translate(center) * .rotateY(rotation) * .translate(-center)
  }
}