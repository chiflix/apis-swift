// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: google/api/consumer.proto
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

/// A descriptor for defining project properties for a service. One service may
/// have many consumer projects, and the service may want to behave differently
/// depending on some properties on the project. For example, a project may be
/// associated with a school, or a business, or a government agency, a business
/// type property on the project may affect how a service responds to the client.
/// This descriptor defines which properties are allowed to be set on a project.
///
/// Example:
///
///    project_properties:
///      properties:
///      - name: NO_WATERMARK
///        type: BOOL
///        description: Allows usage of the API without watermarks.
///      - name: EXTENDED_TILE_CACHE_PERIOD
///        type: INT64
public struct Google_Api_ProjectProperties {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// List of per consumer project-specific properties.
  public var properties: [Google_Api_Property] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Defines project properties.
///
/// API services can define properties that can be assigned to consumer projects
/// so that backends can perform response customization without having to make
/// additional calls or maintain additional storage. For example, Maps API
/// defines properties that controls map tile cache period, or whether to embed a
/// watermark in a result.
///
/// These values can be set via API producer console. Only API providers can
/// define and set these properties.
public struct Google_Api_Property {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The name of the property (a.k.a key).
  public var name: String = String()

  /// The type of this property.
  public var type: Google_Api_Property.PropertyType = .unspecified

  /// The description of the property
  public var description_p: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Supported data type of the property values
  public enum PropertyType: SwiftProtobuf.Enum {
    public typealias RawValue = Int

    /// The type is unspecified, and will result in an error.
    case unspecified // = 0

    /// The type is `int64`.
    case int64 // = 1

    /// The type is `bool`.
    case bool // = 2

    /// The type is `string`.
    case string // = 3

    /// The type is 'double'.
    case double // = 4
    case UNRECOGNIZED(Int)

    public init() {
      self = .unspecified
    }

    public init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .unspecified
      case 1: self = .int64
      case 2: self = .bool
      case 3: self = .string
      case 4: self = .double
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    public var rawValue: Int {
      switch self {
      case .unspecified: return 0
      case .int64: return 1
      case .bool: return 2
      case .string: return 3
      case .double: return 4
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  public init() {}
}

#if swift(>=4.2)

extension Google_Api_Property.PropertyType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Google_Api_Property.PropertyType] = [
    .unspecified,
    .int64,
    .bool,
    .string,
    .double,
  ]
}

#endif  // swift(>=4.2)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "google.api"

extension Google_Api_ProjectProperties: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ProjectProperties"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "properties"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.properties)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.properties.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.properties, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Api_ProjectProperties, rhs: Google_Api_ProjectProperties) -> Bool {
    if lhs.properties != rhs.properties {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Api_Property: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Property"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "type"),
    3: .same(proto: "description"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.name)
      case 2: try decoder.decodeSingularEnumField(value: &self.type)
      case 3: try decoder.decodeSingularStringField(value: &self.description_p)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    if self.type != .unspecified {
      try visitor.visitSingularEnumField(value: self.type, fieldNumber: 2)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Api_Property, rhs: Google_Api_Property) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.type != rhs.type {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Api_Property.PropertyType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "UNSPECIFIED"),
    1: .same(proto: "INT64"),
    2: .same(proto: "BOOL"),
    3: .same(proto: "STRING"),
    4: .same(proto: "DOUBLE"),
  ]
}
