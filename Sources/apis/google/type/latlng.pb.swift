// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: google/type/latlng.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// Copyright 2016 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// An object representing a latitude/longitude pair. This is expressed as a pair
/// of doubles representing degrees latitude and degrees longitude. Unless
/// specified otherwise, this must conform to the
/// <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
/// standard</a>. Values must be within normalized ranges.
///
/// Example of normalization code in Python:
///
///     def NormalizeLongitude(longitude):
///       """Wraps decimal degrees longitude to [-180.0, 180.0]."""
///       q, r = divmod(longitude, 360.0)
///       if r > 180.0 or (r == 180.0 and q <= -1.0):
///         return r - 360.0
///       return r
///
///     def NormalizeLatLng(latitude, longitude):
///       """Wraps decimal degrees latitude and longitude to
///       [-90.0, 90.0] and [-180.0, 180.0], respectively."""
///       r = latitude % 360.0
///       if r <= 90.0:
///         return r, NormalizeLongitude(longitude)
///       elif r >= 270.0:
///         return r - 360, NormalizeLongitude(longitude)
///       else:
///         return 180 - r, NormalizeLongitude(longitude + 180.0)
///
///     assert 180.0 == NormalizeLongitude(180.0)
///     assert -180.0 == NormalizeLongitude(-180.0)
///     assert -179.0 == NormalizeLongitude(181.0)
///     assert (0.0, 0.0) == NormalizeLatLng(360.0, 0.0)
///     assert (0.0, 0.0) == NormalizeLatLng(-360.0, 0.0)
///     assert (85.0, 180.0) == NormalizeLatLng(95.0, 0.0)
///     assert (-85.0, -170.0) == NormalizeLatLng(-95.0, 10.0)
///     assert (90.0, 10.0) == NormalizeLatLng(90.0, 10.0)
///     assert (-90.0, -10.0) == NormalizeLatLng(-90.0, -10.0)
///     assert (0.0, -170.0) == NormalizeLatLng(-180.0, 10.0)
///     assert (0.0, -170.0) == NormalizeLatLng(180.0, 10.0)
///     assert (-90.0, 10.0) == NormalizeLatLng(270.0, 10.0)
///     assert (90.0, 10.0) == NormalizeLatLng(-270.0, 10.0)
public struct Google_Type_LatLng {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The latitude in degrees. It must be in the range [-90.0, +90.0].
  public var latitude: Double = 0

  /// The longitude in degrees. It must be in the range [-180.0, +180.0].
  public var longitude: Double = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "google.type"

extension Google_Type_LatLng: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".LatLng"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "latitude"),
    2: .same(proto: "longitude"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularDoubleField(value: &self.latitude)
      case 2: try decoder.decodeSingularDoubleField(value: &self.longitude)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.latitude != 0 {
      try visitor.visitSingularDoubleField(value: self.latitude, fieldNumber: 1)
    }
    if self.longitude != 0 {
      try visitor.visitSingularDoubleField(value: self.longitude, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Type_LatLng, rhs: Google_Type_LatLng) -> Bool {
    if lhs.latitude != rhs.latitude {return false}
    if lhs.longitude != rhs.longitude {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
