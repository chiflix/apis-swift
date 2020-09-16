// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: google/api/http.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// Copyright 2018 Google LLC
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

/// Defines the HTTP configuration for an API service. It contains a list of
/// [HttpRule][google.api.HttpRule], each specifying the mapping of an RPC method
/// to one or more HTTP REST API methods.
public struct Google_Api_Http {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// A list of HTTP configuration rules that apply to individual API methods.
  ///
  /// **NOTE:** All service configuration rules follow "last one wins" order.
  public var rules: [Google_Api_HttpRule] = []

  /// When set to true, URL path parmeters will be fully URI-decoded except in
  /// cases of single segment matches in reserved expansion, where "%2F" will be
  /// left encoded.
  ///
  /// The default behavior is to not decode RFC 6570 reserved characters in multi
  /// segment matches.
  public var fullyDecodeReservedExpansion: Bool = false

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// `HttpRule` defines the mapping of an RPC method to one or more HTTP
/// REST API methods. The mapping specifies how different portions of the RPC
/// request message are mapped to URL path, URL query parameters, and
/// HTTP request body. The mapping is typically specified as an
/// `google.api.http` annotation on the RPC method,
/// see "google/api/annotations.proto" for details.
///
/// The mapping consists of a field specifying the path template and
/// method kind.  The path template can refer to fields in the request
/// message, as in the example below which describes a REST GET
/// operation on a resource collection of messages:
///
///
///     service Messaging {
///       rpc GetMessage(GetMessageRequest) returns (Message) {
///         option (google.api.http).get = "/v1/messages/{message_id}/{sub.subfield}";
///       }
///     }
///     message GetMessageRequest {
///       message SubMessage {
///         string subfield = 1;
///       }
///       string message_id = 1; // mapped to the URL
///       SubMessage sub = 2;    // `sub.subfield` is url-mapped
///     }
///     message Message {
///       string text = 1; // content of the resource
///     }
///
/// The same http annotation can alternatively be expressed inside the
/// `GRPC API Configuration` YAML file.
///
///     http:
///       rules:
///         - selector: <proto_package_name>.Messaging.GetMessage
///           get: /v1/messages/{message_id}/{sub.subfield}
///
/// This definition enables an automatic, bidrectional mapping of HTTP
/// JSON to RPC. Example:
///
/// HTTP | RPC
/// -----|-----
/// `GET /v1/messages/123456/foo`  | `GetMessage(message_id: "123456" sub: SubMessage(subfield: "foo"))`
///
/// In general, not only fields but also field paths can be referenced
/// from a path pattern. Fields mapped to the path pattern cannot be
/// repeated and must have a primitive (non-message) type.
///
/// Any fields in the request message which are not bound by the path
/// pattern automatically become (optional) HTTP query
/// parameters. Assume the following definition of the request message:
///
///
///     service Messaging {
///       rpc GetMessage(GetMessageRequest) returns (Message) {
///         option (google.api.http).get = "/v1/messages/{message_id}";
///       }
///     }
///     message GetMessageRequest {
///       message SubMessage {
///         string subfield = 1;
///       }
///       string message_id = 1; // mapped to the URL
///       int64 revision = 2;    // becomes a parameter
///       SubMessage sub = 3;    // `sub.subfield` becomes a parameter
///     }
///
///
/// This enables a HTTP JSON to RPC mapping as below:
///
/// HTTP | RPC
/// -----|-----
/// `GET /v1/messages/123456?revision=2&sub.subfield=foo` | `GetMessage(message_id: "123456" revision: 2 sub: SubMessage(subfield: "foo"))`
///
/// Note that fields which are mapped to HTTP parameters must have a
/// primitive type or a repeated primitive type. Message types are not
/// allowed. In the case of a repeated type, the parameter can be
/// repeated in the URL, as in `...?param=A&param=B`.
///
/// For HTTP method kinds which allow a request body, the `body` field
/// specifies the mapping. Consider a REST update method on the
/// message resource collection:
///
///
///     service Messaging {
///       rpc UpdateMessage(UpdateMessageRequest) returns (Message) {
///         option (google.api.http) = {
///           put: "/v1/messages/{message_id}"
///           body: "message"
///         };
///       }
///     }
///     message UpdateMessageRequest {
///       string message_id = 1; // mapped to the URL
///       Message message = 2;   // mapped to the body
///     }
///
///
/// The following HTTP JSON to RPC mapping is enabled, where the
/// representation of the JSON in the request body is determined by
/// protos JSON encoding:
///
/// HTTP | RPC
/// -----|-----
/// `PUT /v1/messages/123456 { "text": "Hi!" }` | `UpdateMessage(message_id: "123456" message { text: "Hi!" })`
///
/// The special name `*` can be used in the body mapping to define that
/// every field not bound by the path template should be mapped to the
/// request body.  This enables the following alternative definition of
/// the update method:
///
///     service Messaging {
///       rpc UpdateMessage(Message) returns (Message) {
///         option (google.api.http) = {
///           put: "/v1/messages/{message_id}"
///           body: "*"
///         };
///       }
///     }
///     message Message {
///       string message_id = 1;
///       string text = 2;
///     }
///
///
/// The following HTTP JSON to RPC mapping is enabled:
///
/// HTTP | RPC
/// -----|-----
/// `PUT /v1/messages/123456 { "text": "Hi!" }` | `UpdateMessage(message_id: "123456" text: "Hi!")`
///
/// Note that when using `*` in the body mapping, it is not possible to
/// have HTTP parameters, as all fields not bound by the path end in
/// the body. This makes this option more rarely used in practice of
/// defining REST APIs. The common usage of `*` is in custom methods
/// which don't use the URL at all for transferring data.
///
/// It is possible to define multiple HTTP methods for one RPC by using
/// the `additional_bindings` option. Example:
///
///     service Messaging {
///       rpc GetMessage(GetMessageRequest) returns (Message) {
///         option (google.api.http) = {
///           get: "/v1/messages/{message_id}"
///           additional_bindings {
///             get: "/v1/users/{user_id}/messages/{message_id}"
///           }
///         };
///       }
///     }
///     message GetMessageRequest {
///       string message_id = 1;
///       string user_id = 2;
///     }
///
///
/// This enables the following two alternative HTTP JSON to RPC
/// mappings:
///
/// HTTP | RPC
/// -----|-----
/// `GET /v1/messages/123456` | `GetMessage(message_id: "123456")`
/// `GET /v1/users/me/messages/123456` | `GetMessage(user_id: "me" message_id: "123456")`
///
/// # Rules for HTTP mapping
///
/// The rules for mapping HTTP path, query parameters, and body fields
/// to the request message are as follows:
///
/// 1. The `body` field specifies either `*` or a field path, or is
///    omitted. If omitted, it indicates there is no HTTP request body.
/// 2. Leaf fields (recursive expansion of nested messages in the
///    request) can be classified into three types:
///     (a) Matched in the URL template.
///     (b) Covered by body (if body is `*`, everything except (a) fields;
///         else everything under the body field)
///     (c) All other fields.
/// 3. URL query parameters found in the HTTP request are mapped to (c) fields.
/// 4. Any body sent with an HTTP request can contain only (b) fields.
///
/// The syntax of the path template is as follows:
///
///     Template = "/" Segments [ Verb ] ;
///     Segments = Segment { "/" Segment } ;
///     Segment  = "*" | "**" | LITERAL | Variable ;
///     Variable = "{" FieldPath [ "=" Segments ] "}" ;
///     FieldPath = IDENT { "." IDENT } ;
///     Verb     = ":" LITERAL ;
///
/// The syntax `*` matches a single path segment. The syntax `**` matches zero
/// or more path segments, which must be the last part of the path except the
/// `Verb`. The syntax `LITERAL` matches literal text in the path.
///
/// The syntax `Variable` matches part of the URL path as specified by its
/// template. A variable template must not contain other variables. If a variable
/// matches a single path segment, its template may be omitted, e.g. `{var}`
/// is equivalent to `{var=*}`.
///
/// If a variable contains exactly one path segment, such as `"{var}"` or
/// `"{var=*}"`, when such a variable is expanded into a URL path, all characters
/// except `[-_.~0-9a-zA-Z]` are percent-encoded. Such variables show up in the
/// Discovery Document as `{var}`.
///
/// If a variable contains one or more path segments, such as `"{var=foo/*}"`
/// or `"{var=**}"`, when such a variable is expanded into a URL path, all
/// characters except `[-_.~/0-9a-zA-Z]` are percent-encoded. Such variables
/// show up in the Discovery Document as `{+var}`.
///
/// NOTE: While the single segment variable matches the semantics of
/// [RFC 6570](https://tools.ietf.org/html/rfc6570) Section 3.2.2
/// Simple String Expansion, the multi segment variable **does not** match
/// RFC 6570 Reserved Expansion. The reason is that the Reserved Expansion
/// does not expand special characters like `?` and `#`, which would lead
/// to invalid URLs.
///
/// NOTE: the field paths in variables and in the `body` must not refer to
/// repeated fields or map fields.
public struct Google_Api_HttpRule {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Selects methods to which this rule applies.
  ///
  /// Refer to [selector][google.api.DocumentationRule.selector] for syntax details.
  public var selector: String = String()

  /// Determines the URL pattern is matched by this rules. This pattern can be
  /// used with any of the {get|put|post|delete|patch} methods. A custom method
  /// can be defined using the 'custom' field.
  public var pattern: Google_Api_HttpRule.OneOf_Pattern? = nil

  /// Used for listing and getting information about resources.
  public var get: String {
    get {
      if case .get(let v)? = pattern {return v}
      return String()
    }
    set {pattern = .get(newValue)}
  }

  /// Used for updating a resource.
  public var put: String {
    get {
      if case .put(let v)? = pattern {return v}
      return String()
    }
    set {pattern = .put(newValue)}
  }

  /// Used for creating a resource.
  public var post: String {
    get {
      if case .post(let v)? = pattern {return v}
      return String()
    }
    set {pattern = .post(newValue)}
  }

  /// Used for deleting a resource.
  public var delete: String {
    get {
      if case .delete(let v)? = pattern {return v}
      return String()
    }
    set {pattern = .delete(newValue)}
  }

  /// Used for updating a resource.
  public var patch: String {
    get {
      if case .patch(let v)? = pattern {return v}
      return String()
    }
    set {pattern = .patch(newValue)}
  }

  /// The custom pattern is used for specifying an HTTP method that is not
  /// included in the `pattern` field, such as HEAD, or "*" to leave the
  /// HTTP method unspecified for this rule. The wild-card rule is useful
  /// for services that provide content to Web (HTML) clients.
  public var custom: Google_Api_CustomHttpPattern {
    get {
      if case .custom(let v)? = pattern {return v}
      return Google_Api_CustomHttpPattern()
    }
    set {pattern = .custom(newValue)}
  }

  /// The name of the request field whose value is mapped to the HTTP body, or
  /// `*` for mapping all fields not captured by the path pattern to the HTTP
  /// body. NOTE: the referred field must not be a repeated field and must be
  /// present at the top-level of request message type.
  public var body: String = String()

  /// Additional HTTP bindings for the selector. Nested bindings must
  /// not contain an `additional_bindings` field themselves (that is,
  /// the nesting may only be one level deep).
  public var additionalBindings: [Google_Api_HttpRule] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Determines the URL pattern is matched by this rules. This pattern can be
  /// used with any of the {get|put|post|delete|patch} methods. A custom method
  /// can be defined using the 'custom' field.
  public enum OneOf_Pattern: Equatable {
    /// Used for listing and getting information about resources.
    case get(String)
    /// Used for updating a resource.
    case put(String)
    /// Used for creating a resource.
    case post(String)
    /// Used for deleting a resource.
    case delete(String)
    /// Used for updating a resource.
    case patch(String)
    /// The custom pattern is used for specifying an HTTP method that is not
    /// included in the `pattern` field, such as HEAD, or "*" to leave the
    /// HTTP method unspecified for this rule. The wild-card rule is useful
    /// for services that provide content to Web (HTML) clients.
    case custom(Google_Api_CustomHttpPattern)

  #if !swift(>=4.1)
    public static func ==(lhs: Google_Api_HttpRule.OneOf_Pattern, rhs: Google_Api_HttpRule.OneOf_Pattern) -> Bool {
      switch (lhs, rhs) {
      case (.get(let l), .get(let r)): return l == r
      case (.put(let l), .put(let r)): return l == r
      case (.post(let l), .post(let r)): return l == r
      case (.delete(let l), .delete(let r)): return l == r
      case (.patch(let l), .patch(let r)): return l == r
      case (.custom(let l), .custom(let r)): return l == r
      default: return false
      }
    }
  #endif
  }

  public init() {}
}

/// A custom pattern is used for defining custom HTTP verb.
public struct Google_Api_CustomHttpPattern {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The name of this custom HTTP verb.
  public var kind: String = String()

  /// The path matched by this custom verb.
  public var path: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "google.api"

extension Google_Api_Http: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Http"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "rules"),
    2: .standard(proto: "fully_decode_reserved_expansion"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.rules)
      case 2: try decoder.decodeSingularBoolField(value: &self.fullyDecodeReservedExpansion)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.rules.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.rules, fieldNumber: 1)
    }
    if self.fullyDecodeReservedExpansion != false {
      try visitor.visitSingularBoolField(value: self.fullyDecodeReservedExpansion, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Api_Http, rhs: Google_Api_Http) -> Bool {
    if lhs.rules != rhs.rules {return false}
    if lhs.fullyDecodeReservedExpansion != rhs.fullyDecodeReservedExpansion {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Api_HttpRule: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".HttpRule"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "selector"),
    2: .same(proto: "get"),
    3: .same(proto: "put"),
    4: .same(proto: "post"),
    5: .same(proto: "delete"),
    6: .same(proto: "patch"),
    8: .same(proto: "custom"),
    7: .same(proto: "body"),
    11: .standard(proto: "additional_bindings"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.selector)
      case 2:
        if self.pattern != nil {try decoder.handleConflictingOneOf()}
        var v: String?
        try decoder.decodeSingularStringField(value: &v)
        if let v = v {self.pattern = .get(v)}
      case 3:
        if self.pattern != nil {try decoder.handleConflictingOneOf()}
        var v: String?
        try decoder.decodeSingularStringField(value: &v)
        if let v = v {self.pattern = .put(v)}
      case 4:
        if self.pattern != nil {try decoder.handleConflictingOneOf()}
        var v: String?
        try decoder.decodeSingularStringField(value: &v)
        if let v = v {self.pattern = .post(v)}
      case 5:
        if self.pattern != nil {try decoder.handleConflictingOneOf()}
        var v: String?
        try decoder.decodeSingularStringField(value: &v)
        if let v = v {self.pattern = .delete(v)}
      case 6:
        if self.pattern != nil {try decoder.handleConflictingOneOf()}
        var v: String?
        try decoder.decodeSingularStringField(value: &v)
        if let v = v {self.pattern = .patch(v)}
      case 7: try decoder.decodeSingularStringField(value: &self.body)
      case 8:
        var v: Google_Api_CustomHttpPattern?
        if let current = self.pattern {
          try decoder.handleConflictingOneOf()
          if case .custom(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.pattern = .custom(v)}
      case 11: try decoder.decodeRepeatedMessageField(value: &self.additionalBindings)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.selector.isEmpty {
      try visitor.visitSingularStringField(value: self.selector, fieldNumber: 1)
    }
    switch self.pattern {
    case .get(let v)?:
      try visitor.visitSingularStringField(value: v, fieldNumber: 2)
    case .put(let v)?:
      try visitor.visitSingularStringField(value: v, fieldNumber: 3)
    case .post(let v)?:
      try visitor.visitSingularStringField(value: v, fieldNumber: 4)
    case .delete(let v)?:
      try visitor.visitSingularStringField(value: v, fieldNumber: 5)
    case .patch(let v)?:
      try visitor.visitSingularStringField(value: v, fieldNumber: 6)
    case nil: break
    default: break
    }
    if !self.body.isEmpty {
      try visitor.visitSingularStringField(value: self.body, fieldNumber: 7)
    }
    if case .custom(let v)? = self.pattern {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 8)
    }
    if !self.additionalBindings.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.additionalBindings, fieldNumber: 11)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Api_HttpRule, rhs: Google_Api_HttpRule) -> Bool {
    if lhs.selector != rhs.selector {return false}
    if lhs.pattern != rhs.pattern {return false}
    if lhs.body != rhs.body {return false}
    if lhs.additionalBindings != rhs.additionalBindings {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Api_CustomHttpPattern: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".CustomHttpPattern"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "kind"),
    2: .same(proto: "path"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.kind)
      case 2: try decoder.decodeSingularStringField(value: &self.path)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.kind.isEmpty {
      try visitor.visitSingularStringField(value: self.kind, fieldNumber: 1)
    }
    if !self.path.isEmpty {
      try visitor.visitSingularStringField(value: self.path, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Api_CustomHttpPattern, rhs: Google_Api_CustomHttpPattern) -> Bool {
    if lhs.kind != rhs.kind {return false}
    if lhs.path != rhs.path {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
