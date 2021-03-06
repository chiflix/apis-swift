// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: google/api/quota.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// Copyright 2017 Google Inc.
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

/// Quota configuration helps to achieve fairness and budgeting in service
/// usage.
///
/// The quota configuration works this way:
/// - The service configuration defines a set of metrics.
/// - For API calls, the quota.metric_rules maps methods to metrics with
///   corresponding costs.
/// - The quota.limits defines limits on the metrics, which will be used for
///   quota checks at runtime.
///
/// An example quota configuration in yaml format:
///
///    quota:
///      limits:
///
///      - name: apiWriteQpsPerProject
///        metric: library.googleapis.com/write_calls
///        unit: "1/min/{project}"  # rate limit for consumer projects
///        values:
///          STANDARD: 10000
///
///      # The metric rules bind all methods to the read_calls metric,
///      # except for the UpdateBook and DeleteBook methods. These two methods
///      # are mapped to the write_calls metric, with the UpdateBook method
///      # consuming at twice rate as the DeleteBook method.
///      metric_rules:
///      - selector: "*"
///        metric_costs:
///          library.googleapis.com/read_calls: 1
///      - selector: google.example.library.v1.LibraryService.UpdateBook
///        metric_costs:
///          library.googleapis.com/write_calls: 2
///      - selector: google.example.library.v1.LibraryService.DeleteBook
///        metric_costs:
///          library.googleapis.com/write_calls: 1
///
///  Corresponding Metric definition:
///
///      metrics:
///      - name: library.googleapis.com/read_calls
///        display_name: Read requests
///        metric_kind: DELTA
///        value_type: INT64
///
///      - name: library.googleapis.com/write_calls
///        display_name: Write requests
///        metric_kind: DELTA
///        value_type: INT64
public struct Google_Api_Quota {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// List of `QuotaLimit` definitions for the service.
  ///
  /// Used by metric-based quotas only.
  public var limits: [Google_Api_QuotaLimit] = []

  /// List of `MetricRule` definitions, each one mapping a selected method to one
  /// or more metrics.
  ///
  /// Used by metric-based quotas only.
  public var metricRules: [Google_Api_MetricRule] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Bind API methods to metrics. Binding a method to a metric causes that
/// metric's configured quota, billing, and monitoring behaviors to apply to the
/// method call.
///
/// Used by metric-based quotas only.
public struct Google_Api_MetricRule {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Selects the methods to which this rule applies.
  ///
  /// Refer to [selector][google.api.DocumentationRule.selector] for syntax details.
  public var selector: String = String()

  /// Metrics to update when the selected methods are called, and the associated
  /// cost applied to each metric.
  ///
  /// The key of the map is the metric name, and the values are the amount
  /// increased for the metric against which the quota limits are defined.
  /// The value must not be negative.
  public var metricCosts: Dictionary<String,Int64> = [:]

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// `QuotaLimit` defines a specific limit that applies over a specified duration
/// for a limit type. There can be at most one limit for a duration and limit
/// type combination defined within a `QuotaGroup`.
public struct Google_Api_QuotaLimit {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Name of the quota limit. The name is used to refer to the limit when
  /// overriding the default limit on per-consumer basis.
  ///
  /// For group-based quota limits, the name must be unique within the quota
  /// group. If a name is not provided, it will be generated from the limit_by
  /// and duration fields.
  ///
  /// For metric-based quota limits, the name must be provided, and it must be
  /// unique within the service. The name can only include alphanumeric
  /// characters as well as '-'.
  ///
  /// The maximum length of the limit name is 64 characters.
  ///
  /// The name of a limit is used as a unique identifier for this limit.
  /// Therefore, once a limit has been put into use, its name should be
  /// immutable. You can use the display_name field to provide a user-friendly
  /// name for the limit. The display name can be evolved over time without
  /// affecting the identity of the limit.
  public var name: String = String()

  /// Optional. User-visible, extended description for this quota limit.
  /// Should be used only when more context is needed to understand this limit
  /// than provided by the limit's display name (see: `display_name`).
  public var description_p: String = String()

  /// Default number of tokens that can be consumed during the specified
  /// duration. This is the number of tokens assigned when a client
  /// application developer activates the service for his/her project.
  ///
  /// Specifying a value of 0 will block all requests. This can be used if you
  /// are provisioning quota to selected consumers and blocking others.
  /// Similarly, a value of -1 will indicate an unlimited quota. No other
  /// negative values are allowed.
  ///
  /// Used by group-based quotas only.
  public var defaultLimit: Int64 = 0

  /// Maximum number of tokens that can be consumed during the specified
  /// duration. Client application developers can override the default limit up
  /// to this maximum. If specified, this value cannot be set to a value less
  /// than the default limit. If not specified, it is set to the default limit.
  ///
  /// To allow clients to apply overrides with no upper bound, set this to -1,
  /// indicating unlimited maximum quota.
  ///
  /// Used by group-based quotas only.
  public var maxLimit: Int64 = 0

  /// Free tier value displayed in the Developers Console for this limit.
  /// The free tier is the number of tokens that will be subtracted from the
  /// billed amount when billing is enabled.
  /// This field can only be set on a limit with duration "1d", in a billable
  /// group; it is invalid on any other limit. If this field is not set, it
  /// defaults to 0, indicating that there is no free tier for this service.
  ///
  /// Used by group-based quotas only.
  public var freeTier: Int64 = 0

  /// Duration of this limit in textual notation. Example: "100s", "24h", "1d".
  /// For duration longer than a day, only multiple of days is supported. We
  /// support only "100s" and "1d" for now. Additional support will be added in
  /// the future. "0" indicates indefinite duration.
  ///
  /// Used by group-based quotas only.
  public var duration: String = String()

  /// The name of the metric this quota limit applies to. The quota limits with
  /// the same metric will be checked together during runtime. The metric must be
  /// defined within the service config.
  ///
  /// Used by metric-based quotas only.
  public var metric: String = String()

  /// Specify the unit of the quota limit. It uses the same syntax as
  /// [Metric.unit][]. The supported unit kinds are determined by the quota
  /// backend system.
  ///
  /// The [Google Service Control](https://cloud.google.com/service-control)
  /// supports the following unit components:
  /// * One of the time intevals:
  ///   * "/min"  for quota every minute.
  ///   * "/d"  for quota every 24 hours, starting 00:00 US Pacific Time.
  ///   * Otherwise the quota won't be reset by time, such as storage limit.
  /// * One and only one of the granted containers:
  ///   * "/{organization}" quota for an organization.
  ///   * "/{project}" quota for a project.
  ///   * "/{folder}" quota for a folder.
  ///   * "/{resource}" quota for a universal resource.
  /// * Zero or more quota segmentation dimension. Not all combos are valid.
  ///   * "/{region}" quota for every region. Not to be used with time intervals.
  ///   * Otherwise the resources granted on the target is not segmented.
  ///   * "/{zone}" quota for every zone. Not to be used with time intervals.
  ///   * Otherwise the resources granted on the target is not segmented.
  ///   * "/{resource}" quota for a resource associated with a project or org.
  ///
  /// Here are some examples:
  /// * "1/min/{project}" for quota per minute per project.
  /// * "1/min/{user}" for quota per minute per user.
  /// * "1/min/{organization}" for quota per minute per organization.
  ///
  /// Note: the order of unit components is insignificant.
  /// The "1" at the beginning is required to follow the metric unit syntax.
  ///
  /// Used by metric-based quotas only.
  public var unit: String = String()

  /// Tiered limit values. Also allows for regional or zone overrides for these
  /// values if "/{region}" or "/{zone}" is specified in the unit field.
  ///
  /// Currently supported tiers from low to high:
  /// VERY_LOW, LOW, STANDARD, HIGH, VERY_HIGH
  ///
  /// To apply different limit values for users according to their tiers, specify
  /// the values for the tiers you want to differentiate. For example:
  /// {LOW:100, STANDARD:500, HIGH:1000, VERY_HIGH:5000}
  ///
  /// The limit value for each tier is optional except for the tier STANDARD.
  /// The limit value for an unspecified tier falls to the value of its next
  /// tier towards tier STANDARD. For the above example, the limit value for tier
  /// STANDARD is 500.
  ///
  /// To apply the same limit value for all users, just specify limit value for
  /// tier STANDARD. For example: {STANDARD:500}.
  ///
  /// To apply a regional overide for a tier, add a map entry with key
  /// "<TIER>/<region>", where <region> is a region name. Similarly, for a zone
  /// override, add a map entry with key "<TIER>/{zone}".
  /// Further, a wildcard can be used at the end of a zone name in order to
  /// specify zone level overrides. For example:
  /// LOW: 10, STANDARD: 50, HIGH: 100,
  /// LOW/us-central1: 20, STANDARD/us-central1: 60, HIGH/us-central1: 200,
  /// LOW/us-central1-*: 10, STANDARD/us-central1-*: 20, HIGH/us-central1-*: 80
  ///
  /// The regional overrides tier set for each region must be the same as
  /// the tier set for default limit values. Same rule applies for zone overrides
  /// tier as well.
  ///
  /// Used by metric-based quotas only.
  public var values: Dictionary<String,Int64> = [:]

  /// User-visible display name for this limit.
  /// Optional. If not set, the UI will provide a default display name based on
  /// the quota configuration. This field can be used to override the default
  /// display name generated from the configuration.
  public var displayName: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "google.api"

extension Google_Api_Quota: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Quota"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    3: .same(proto: "limits"),
    4: .standard(proto: "metric_rules"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 3: try decoder.decodeRepeatedMessageField(value: &self.limits)
      case 4: try decoder.decodeRepeatedMessageField(value: &self.metricRules)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.limits.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.limits, fieldNumber: 3)
    }
    if !self.metricRules.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.metricRules, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Api_Quota, rhs: Google_Api_Quota) -> Bool {
    if lhs.limits != rhs.limits {return false}
    if lhs.metricRules != rhs.metricRules {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Api_MetricRule: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MetricRule"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "selector"),
    2: .standard(proto: "metric_costs"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.selector)
      case 2: try decoder.decodeMapField(fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufString,SwiftProtobuf.ProtobufInt64>.self, value: &self.metricCosts)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.selector.isEmpty {
      try visitor.visitSingularStringField(value: self.selector, fieldNumber: 1)
    }
    if !self.metricCosts.isEmpty {
      try visitor.visitMapField(fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufString,SwiftProtobuf.ProtobufInt64>.self, value: self.metricCosts, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Api_MetricRule, rhs: Google_Api_MetricRule) -> Bool {
    if lhs.selector != rhs.selector {return false}
    if lhs.metricCosts != rhs.metricCosts {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Api_QuotaLimit: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".QuotaLimit"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    6: .same(proto: "name"),
    2: .same(proto: "description"),
    3: .standard(proto: "default_limit"),
    4: .standard(proto: "max_limit"),
    7: .standard(proto: "free_tier"),
    5: .same(proto: "duration"),
    8: .same(proto: "metric"),
    9: .same(proto: "unit"),
    10: .same(proto: "values"),
    12: .standard(proto: "display_name"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 2: try decoder.decodeSingularStringField(value: &self.description_p)
      case 3: try decoder.decodeSingularInt64Field(value: &self.defaultLimit)
      case 4: try decoder.decodeSingularInt64Field(value: &self.maxLimit)
      case 5: try decoder.decodeSingularStringField(value: &self.duration)
      case 6: try decoder.decodeSingularStringField(value: &self.name)
      case 7: try decoder.decodeSingularInt64Field(value: &self.freeTier)
      case 8: try decoder.decodeSingularStringField(value: &self.metric)
      case 9: try decoder.decodeSingularStringField(value: &self.unit)
      case 10: try decoder.decodeMapField(fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufString,SwiftProtobuf.ProtobufInt64>.self, value: &self.values)
      case 12: try decoder.decodeSingularStringField(value: &self.displayName)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 2)
    }
    if self.defaultLimit != 0 {
      try visitor.visitSingularInt64Field(value: self.defaultLimit, fieldNumber: 3)
    }
    if self.maxLimit != 0 {
      try visitor.visitSingularInt64Field(value: self.maxLimit, fieldNumber: 4)
    }
    if !self.duration.isEmpty {
      try visitor.visitSingularStringField(value: self.duration, fieldNumber: 5)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 6)
    }
    if self.freeTier != 0 {
      try visitor.visitSingularInt64Field(value: self.freeTier, fieldNumber: 7)
    }
    if !self.metric.isEmpty {
      try visitor.visitSingularStringField(value: self.metric, fieldNumber: 8)
    }
    if !self.unit.isEmpty {
      try visitor.visitSingularStringField(value: self.unit, fieldNumber: 9)
    }
    if !self.values.isEmpty {
      try visitor.visitMapField(fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufString,SwiftProtobuf.ProtobufInt64>.self, value: self.values, fieldNumber: 10)
    }
    if !self.displayName.isEmpty {
      try visitor.visitSingularStringField(value: self.displayName, fieldNumber: 12)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Api_QuotaLimit, rhs: Google_Api_QuotaLimit) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.defaultLimit != rhs.defaultLimit {return false}
    if lhs.maxLimit != rhs.maxLimit {return false}
    if lhs.freeTier != rhs.freeTier {return false}
    if lhs.duration != rhs.duration {return false}
    if lhs.metric != rhs.metric {return false}
    if lhs.unit != rhs.unit {return false}
    if lhs.values != rhs.values {return false}
    if lhs.displayName != rhs.displayName {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
