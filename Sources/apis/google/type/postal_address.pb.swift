// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: google/type/postal_address.proto
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

/// Represents a postal address, e.g. for postal delivery or payments addresses.
/// Given a postal address, a postal service can deliver items to a premise, P.O.
/// Box or similar.
/// It is not intended to model geographical locations (roads, towns,
/// mountains).
///
/// In typical usage an address would be created via user input or from importing
/// existing data, depending on the type of process.
///
/// Advice on address input / editing:
///  - Use an i18n-ready address widget such as
///    https://github.com/googlei18n/libaddressinput)
/// - Users should not be presented with UI elements for input or editing of
///   fields outside countries where that field is used.
///
/// For more guidance on how to use this schema, please see:
/// https://support.google.com/business/answer/6397478
public struct Google_Type_PostalAddress {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The schema revision of the `PostalAddress`.
  /// All new revisions **must** be backward compatible with old revisions.
  public var revision: Int32 = 0

  /// Required. CLDR region code of the country/region of the address. This
  /// is never inferred and it is up to the user to ensure the value is
  /// correct. See http://cldr.unicode.org/ and
  /// http://www.unicode.org/cldr/charts/30/supplemental/territory_information.html
  /// for details. Example: "CH" for Switzerland.
  public var regionCode: String = String()

  /// Optional. BCP-47 language code of the contents of this address (if
  /// known). This is often the UI language of the input form or is expected
  /// to match one of the languages used in the address' country/region, or their
  /// transliterated equivalents.
  /// This can affect formatting in certain countries, but is not critical
  /// to the correctness of the data and will never affect any validation or
  /// other non-formatting related operations.
  ///
  /// If this value is not known, it should be omitted (rather than specifying a
  /// possibly incorrect default).
  ///
  /// Examples: "zh-Hant", "ja", "ja-Latn", "en".
  public var languageCode: String = String()

  /// Optional. Postal code of the address. Not all countries use or require
  /// postal codes to be present, but where they are used, they may trigger
  /// additional validation with other parts of the address (e.g. state/zip
  /// validation in the U.S.A.).
  public var postalCode: String = String()

  /// Optional. Additional, country-specific, sorting code. This is not used
  /// in most regions. Where it is used, the value is either a string like
  /// "CEDEX", optionally followed by a number (e.g. "CEDEX 7"), or just a number
  /// alone, representing the "sector code" (Jamaica), "delivery area indicator"
  /// (Malawi) or "post office indicator" (e.g. Côte d'Ivoire).
  public var sortingCode: String = String()

  /// Optional. Highest administrative subdivision which is used for postal
  /// addresses of a country or region.
  /// For example, this can be a state, a province, an oblast, or a prefecture.
  /// Specifically, for Spain this is the province and not the autonomous
  /// community (e.g. "Barcelona" and not "Catalonia").
  /// Many countries don't use an administrative area in postal addresses. E.g.
  /// in Switzerland this should be left unpopulated.
  public var administrativeArea: String = String()

  /// Optional. Generally refers to the city/town portion of the address.
  /// Examples: US city, IT comune, UK post town.
  /// In regions of the world where localities are not well defined or do not fit
  /// into this structure well, leave locality empty and use address_lines.
  public var locality: String = String()

  /// Optional. Sublocality of the address.
  /// For example, this can be neighborhoods, boroughs, districts.
  public var sublocality: String = String()

  /// Unstructured address lines describing the lower levels of an address.
  ///
  /// Because values in address_lines do not have type information and may
  /// sometimes contain multiple values in a single field (e.g.
  /// "Austin, TX"), it is important that the line order is clear. The order of
  /// address lines should be "envelope order" for the country/region of the
  /// address. In places where this can vary (e.g. Japan), address_language is
  /// used to make it explicit (e.g. "ja" for large-to-small ordering and
  /// "ja-Latn" or "en" for small-to-large). This way, the most specific line of
  /// an address can be selected based on the language.
  ///
  /// The minimum permitted structural representation of an address consists
  /// of a region_code with all remaining information placed in the
  /// address_lines. It would be possible to format such an address very
  /// approximately without geocoding, but no semantic reasoning could be
  /// made about any of the address components until it was at least
  /// partially resolved.
  ///
  /// Creating an address only containing a region_code and address_lines, and
  /// then geocoding is the recommended way to handle completely unstructured
  /// addresses (as opposed to guessing which parts of the address should be
  /// localities or administrative areas).
  public var addressLines: [String] = []

  /// Optional. The recipient at the address.
  /// This field may, under certain circumstances, contain multiline information.
  /// For example, it might contain "care of" information.
  public var recipients: [String] = []

  /// Optional. The name of the organization at the address.
  public var organization: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "google.type"

extension Google_Type_PostalAddress: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PostalAddress"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "revision"),
    2: .standard(proto: "region_code"),
    3: .standard(proto: "language_code"),
    4: .standard(proto: "postal_code"),
    5: .standard(proto: "sorting_code"),
    6: .standard(proto: "administrative_area"),
    7: .same(proto: "locality"),
    8: .same(proto: "sublocality"),
    9: .standard(proto: "address_lines"),
    10: .same(proto: "recipients"),
    11: .same(proto: "organization"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.revision)
      case 2: try decoder.decodeSingularStringField(value: &self.regionCode)
      case 3: try decoder.decodeSingularStringField(value: &self.languageCode)
      case 4: try decoder.decodeSingularStringField(value: &self.postalCode)
      case 5: try decoder.decodeSingularStringField(value: &self.sortingCode)
      case 6: try decoder.decodeSingularStringField(value: &self.administrativeArea)
      case 7: try decoder.decodeSingularStringField(value: &self.locality)
      case 8: try decoder.decodeSingularStringField(value: &self.sublocality)
      case 9: try decoder.decodeRepeatedStringField(value: &self.addressLines)
      case 10: try decoder.decodeRepeatedStringField(value: &self.recipients)
      case 11: try decoder.decodeSingularStringField(value: &self.organization)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.revision != 0 {
      try visitor.visitSingularInt32Field(value: self.revision, fieldNumber: 1)
    }
    if !self.regionCode.isEmpty {
      try visitor.visitSingularStringField(value: self.regionCode, fieldNumber: 2)
    }
    if !self.languageCode.isEmpty {
      try visitor.visitSingularStringField(value: self.languageCode, fieldNumber: 3)
    }
    if !self.postalCode.isEmpty {
      try visitor.visitSingularStringField(value: self.postalCode, fieldNumber: 4)
    }
    if !self.sortingCode.isEmpty {
      try visitor.visitSingularStringField(value: self.sortingCode, fieldNumber: 5)
    }
    if !self.administrativeArea.isEmpty {
      try visitor.visitSingularStringField(value: self.administrativeArea, fieldNumber: 6)
    }
    if !self.locality.isEmpty {
      try visitor.visitSingularStringField(value: self.locality, fieldNumber: 7)
    }
    if !self.sublocality.isEmpty {
      try visitor.visitSingularStringField(value: self.sublocality, fieldNumber: 8)
    }
    if !self.addressLines.isEmpty {
      try visitor.visitRepeatedStringField(value: self.addressLines, fieldNumber: 9)
    }
    if !self.recipients.isEmpty {
      try visitor.visitRepeatedStringField(value: self.recipients, fieldNumber: 10)
    }
    if !self.organization.isEmpty {
      try visitor.visitSingularStringField(value: self.organization, fieldNumber: 11)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Type_PostalAddress, rhs: Google_Type_PostalAddress) -> Bool {
    if lhs.revision != rhs.revision {return false}
    if lhs.regionCode != rhs.regionCode {return false}
    if lhs.languageCode != rhs.languageCode {return false}
    if lhs.postalCode != rhs.postalCode {return false}
    if lhs.sortingCode != rhs.sortingCode {return false}
    if lhs.administrativeArea != rhs.administrativeArea {return false}
    if lhs.locality != rhs.locality {return false}
    if lhs.sublocality != rhs.sublocality {return false}
    if lhs.addressLines != rhs.addressLines {return false}
    if lhs.recipients != rhs.recipients {return false}
    if lhs.organization != rhs.organization {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
