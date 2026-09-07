// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetInspectionRecordCollection on Isar {
  IsarCollection<InspectionRecord> get inspectionRecords => this.collection();
}

const InspectionRecordSchema = CollectionSchema(
  name: r'InspectionRecord',
  id: -4021150949651418514,
  properties: {
    r'clientSignature': PropertySchema(
      id: 0,
      name: r'clientSignature',
      type: IsarType.longList,
    ),
    r'companyName': PropertySchema(
      id: 1,
      name: r'companyName',
      type: IsarType.string,
    ),
    r'equipmentData': PropertySchema(
      id: 2,
      name: r'equipmentData',
      type: IsarType.object,
      target: r'EquipmentDataEmbedded',
    ),
    r'nominalGpm': PropertySchema(
      id: 3,
      name: r'nominalGpm',
      type: IsarType.double,
    ),
    r'nominalPsi': PropertySchema(
      id: 4,
      name: r'nominalPsi',
      type: IsarType.double,
    ),
    r'nominalRpm': PropertySchema(
      id: 5,
      name: r'nominalRpm',
      type: IsarType.double,
    ),
    r'technicianSignature': PropertySchema(
      id: 6,
      name: r'technicianSignature',
      type: IsarType.longList,
    ),
    r'testPoints': PropertySchema(
      id: 7,
      name: r'testPoints',
      type: IsarType.objectList,
      target: r'PointRecord',
    ),
    r'timestamp': PropertySchema(
      id: 8,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
  },
  estimateSize: _inspectionRecordEstimateSize,
  serialize: _inspectionRecordSerialize,
  deserialize: _inspectionRecordDeserialize,
  deserializeProp: _inspectionRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'EquipmentDataEmbedded': EquipmentDataEmbeddedSchema,
    r'PointRecord': PointRecordSchema,
  },
  getId: _inspectionRecordGetId,
  getLinks: _inspectionRecordGetLinks,
  attach: _inspectionRecordAttach,
  version: '3.1.0+1',
);

int _inspectionRecordEstimateSize(
  InspectionRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.clientSignature;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  bytesCount += 3 + object.companyName.length * 3;
  bytesCount +=
      3 +
      EquipmentDataEmbeddedSchema.estimateSize(
        object.equipmentData,
        allOffsets[EquipmentDataEmbedded]!,
        allOffsets,
      );
  {
    final value = object.technicianSignature;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  bytesCount += 3 + object.testPoints.length * 3;
  {
    final offsets = allOffsets[PointRecord]!;
    for (var i = 0; i < object.testPoints.length; i++) {
      final value = object.testPoints[i];
      bytesCount += PointRecordSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _inspectionRecordSerialize(
  InspectionRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.clientSignature);
  writer.writeString(offsets[1], object.companyName);
  writer.writeObject<EquipmentDataEmbedded>(
    offsets[2],
    allOffsets,
    EquipmentDataEmbeddedSchema.serialize,
    object.equipmentData,
  );
  writer.writeDouble(offsets[3], object.nominalGpm);
  writer.writeDouble(offsets[4], object.nominalPsi);
  writer.writeDouble(offsets[5], object.nominalRpm);
  writer.writeLongList(offsets[6], object.technicianSignature);
  writer.writeObjectList<PointRecord>(
    offsets[7],
    allOffsets,
    PointRecordSchema.serialize,
    object.testPoints,
  );
  writer.writeDateTime(offsets[8], object.timestamp);
}

InspectionRecord _inspectionRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = InspectionRecord();
  object.clientSignature = reader.readLongList(offsets[0]);
  object.companyName = reader.readString(offsets[1]);
  object.equipmentData =
      reader.readObjectOrNull<EquipmentDataEmbedded>(
        offsets[2],
        EquipmentDataEmbeddedSchema.deserialize,
        allOffsets,
      ) ??
      EquipmentDataEmbedded();
  object.id = id;
  object.nominalGpm = reader.readDouble(offsets[3]);
  object.nominalPsi = reader.readDouble(offsets[4]);
  object.nominalRpm = reader.readDouble(offsets[5]);
  object.technicianSignature = reader.readLongList(offsets[6]);
  object.testPoints =
      reader.readObjectList<PointRecord>(
        offsets[7],
        PointRecordSchema.deserialize,
        allOffsets,
        PointRecord(),
      ) ??
      [];
  object.timestamp = reader.readDateTime(offsets[8]);
  return object;
}

P _inspectionRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongList(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<EquipmentDataEmbedded>(
                offset,
                EquipmentDataEmbeddedSchema.deserialize,
                allOffsets,
              ) ??
              EquipmentDataEmbedded())
          as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readLongList(offset)) as P;
    case 7:
      return (reader.readObjectList<PointRecord>(
                offset,
                PointRecordSchema.deserialize,
                allOffsets,
                PointRecord(),
              ) ??
              [])
          as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _inspectionRecordGetId(InspectionRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _inspectionRecordGetLinks(InspectionRecord object) {
  return [];
}

void _inspectionRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  InspectionRecord object,
) {
  object.id = id;
}

extension InspectionRecordQueryWhereSort
    on QueryBuilder<InspectionRecord, InspectionRecord, QWhere> {
  QueryBuilder<InspectionRecord, InspectionRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension InspectionRecordQueryWhere
    on QueryBuilder<InspectionRecord, InspectionRecord, QWhereClause> {
  QueryBuilder<InspectionRecord, InspectionRecord, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension InspectionRecordQueryFilter
    on QueryBuilder<InspectionRecord, InspectionRecord, QFilterCondition> {
  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  clientSignatureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'clientSignature'),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  clientSignatureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'clientSignature'),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  clientSignatureElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'clientSignature', value: value),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  clientSignatureElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clientSignature',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  clientSignatureElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clientSignature',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  clientSignatureElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clientSignature',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  clientSignatureLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'clientSignature', length, true, length, true);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  clientSignatureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'clientSignature', 0, true, 0, true);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  clientSignatureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'clientSignature', 0, false, 999999, true);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  clientSignatureLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'clientSignature', 0, true, length, include);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  clientSignatureLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'clientSignature',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  clientSignatureLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'clientSignature',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  companyNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'companyName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  companyNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'companyName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  companyNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'companyName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  companyNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'companyName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  companyNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'companyName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  companyNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'companyName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  companyNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'companyName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  companyNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'companyName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  companyNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'companyName', value: ''),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  companyNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'companyName', value: ''),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  nominalGpmEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'nominalGpm',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  nominalGpmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nominalGpm',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  nominalGpmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nominalGpm',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  nominalGpmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nominalGpm',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  nominalPsiEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'nominalPsi',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  nominalPsiGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nominalPsi',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  nominalPsiLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nominalPsi',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  nominalPsiBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nominalPsi',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  nominalRpmEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'nominalRpm',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  nominalRpmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nominalRpm',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  nominalRpmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nominalRpm',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  nominalRpmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nominalRpm',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  technicianSignatureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'technicianSignature'),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  technicianSignatureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'technicianSignature'),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  technicianSignatureElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'technicianSignature', value: value),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  technicianSignatureElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'technicianSignature',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  technicianSignatureElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'technicianSignature',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  technicianSignatureElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'technicianSignature',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  technicianSignatureLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'technicianSignature',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  technicianSignatureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'technicianSignature', 0, true, 0, true);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  technicianSignatureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'technicianSignature', 0, false, 999999, true);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  technicianSignatureLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'technicianSignature', 0, true, length, include);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  technicianSignatureLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'technicianSignature',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  technicianSignatureLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'technicianSignature',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  testPointsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'testPoints', length, true, length, true);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  testPointsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'testPoints', 0, true, 0, true);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  testPointsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'testPoints', 0, false, 999999, true);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  testPointsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'testPoints', 0, true, length, include);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  testPointsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'testPoints', length, include, 999999, true);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  testPointsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'testPoints',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timestamp', value: value),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  timestampGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timestamp',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  timestampLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timestamp',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timestamp',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension InspectionRecordQueryObject
    on QueryBuilder<InspectionRecord, InspectionRecord, QFilterCondition> {
  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  equipmentData(FilterQuery<EquipmentDataEmbedded> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'equipmentData');
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterFilterCondition>
  testPointsElement(FilterQuery<PointRecord> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'testPoints');
    });
  }
}

extension InspectionRecordQueryLinks
    on QueryBuilder<InspectionRecord, InspectionRecord, QFilterCondition> {}

extension InspectionRecordQuerySortBy
    on QueryBuilder<InspectionRecord, InspectionRecord, QSortBy> {
  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy>
  sortByCompanyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.asc);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy>
  sortByCompanyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.desc);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy>
  sortByNominalGpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nominalGpm', Sort.asc);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy>
  sortByNominalGpmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nominalGpm', Sort.desc);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy>
  sortByNominalPsi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nominalPsi', Sort.asc);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy>
  sortByNominalPsiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nominalPsi', Sort.desc);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy>
  sortByNominalRpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nominalRpm', Sort.asc);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy>
  sortByNominalRpmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nominalRpm', Sort.desc);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy>
  sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy>
  sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension InspectionRecordQuerySortThenBy
    on QueryBuilder<InspectionRecord, InspectionRecord, QSortThenBy> {
  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy>
  thenByCompanyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.asc);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy>
  thenByCompanyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.desc);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy>
  thenByNominalGpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nominalGpm', Sort.asc);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy>
  thenByNominalGpmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nominalGpm', Sort.desc);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy>
  thenByNominalPsi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nominalPsi', Sort.asc);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy>
  thenByNominalPsiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nominalPsi', Sort.desc);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy>
  thenByNominalRpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nominalRpm', Sort.asc);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy>
  thenByNominalRpmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nominalRpm', Sort.desc);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy>
  thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QAfterSortBy>
  thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension InspectionRecordQueryWhereDistinct
    on QueryBuilder<InspectionRecord, InspectionRecord, QDistinct> {
  QueryBuilder<InspectionRecord, InspectionRecord, QDistinct>
  distinctByClientSignature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clientSignature');
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QDistinct>
  distinctByCompanyName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QDistinct>
  distinctByNominalGpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nominalGpm');
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QDistinct>
  distinctByNominalPsi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nominalPsi');
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QDistinct>
  distinctByNominalRpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nominalRpm');
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QDistinct>
  distinctByTechnicianSignature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'technicianSignature');
    });
  }

  QueryBuilder<InspectionRecord, InspectionRecord, QDistinct>
  distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }
}

extension InspectionRecordQueryProperty
    on QueryBuilder<InspectionRecord, InspectionRecord, QQueryProperty> {
  QueryBuilder<InspectionRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<InspectionRecord, List<int>?, QQueryOperations>
  clientSignatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clientSignature');
    });
  }

  QueryBuilder<InspectionRecord, String, QQueryOperations>
  companyNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyName');
    });
  }

  QueryBuilder<InspectionRecord, EquipmentDataEmbedded, QQueryOperations>
  equipmentDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equipmentData');
    });
  }

  QueryBuilder<InspectionRecord, double, QQueryOperations>
  nominalGpmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nominalGpm');
    });
  }

  QueryBuilder<InspectionRecord, double, QQueryOperations>
  nominalPsiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nominalPsi');
    });
  }

  QueryBuilder<InspectionRecord, double, QQueryOperations>
  nominalRpmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nominalRpm');
    });
  }

  QueryBuilder<InspectionRecord, List<int>?, QQueryOperations>
  technicianSignatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'technicianSignature');
    });
  }

  QueryBuilder<InspectionRecord, List<PointRecord>, QQueryOperations>
  testPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'testPoints');
    });
  }

  QueryBuilder<InspectionRecord, DateTime, QQueryOperations>
  timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PointRecordSchema = Schema(
  name: r'PointRecord',
  id: 733086018020266618,
  properties: {
    r'adjustedPressure': PropertySchema(
      id: 0,
      name: r'adjustedPressure',
      type: IsarType.double,
    ),
    r'dischargePressure': PropertySchema(
      id: 1,
      name: r'dischargePressure',
      type: IsarType.double,
    ),
    r'flowGpm': PropertySchema(id: 2, name: r'flowGpm', type: IsarType.double),
    r'flowPercentage': PropertySchema(
      id: 3,
      name: r'flowPercentage',
      type: IsarType.long,
    ),
    r'isPassed': PropertySchema(id: 4, name: r'isPassed', type: IsarType.bool),
    r'netPressure': PropertySchema(
      id: 5,
      name: r'netPressure',
      type: IsarType.double,
    ),
    r'speedRpm': PropertySchema(
      id: 6,
      name: r'speedRpm',
      type: IsarType.double,
    ),
    r'suctionPressure': PropertySchema(
      id: 7,
      name: r'suctionPressure',
      type: IsarType.double,
    ),
  },
  estimateSize: _pointRecordEstimateSize,
  serialize: _pointRecordSerialize,
  deserialize: _pointRecordDeserialize,
  deserializeProp: _pointRecordDeserializeProp,
);

int _pointRecordEstimateSize(
  PointRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _pointRecordSerialize(
  PointRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.adjustedPressure);
  writer.writeDouble(offsets[1], object.dischargePressure);
  writer.writeDouble(offsets[2], object.flowGpm);
  writer.writeLong(offsets[3], object.flowPercentage);
  writer.writeBool(offsets[4], object.isPassed);
  writer.writeDouble(offsets[5], object.netPressure);
  writer.writeDouble(offsets[6], object.speedRpm);
  writer.writeDouble(offsets[7], object.suctionPressure);
}

PointRecord _pointRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PointRecord();
  object.adjustedPressure = reader.readDouble(offsets[0]);
  object.dischargePressure = reader.readDouble(offsets[1]);
  object.flowGpm = reader.readDouble(offsets[2]);
  object.flowPercentage = reader.readLong(offsets[3]);
  object.isPassed = reader.readBool(offsets[4]);
  object.netPressure = reader.readDouble(offsets[5]);
  object.speedRpm = reader.readDouble(offsets[6]);
  object.suctionPressure = reader.readDouble(offsets[7]);
  return object;
}

P _pointRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PointRecordQueryFilter
    on QueryBuilder<PointRecord, PointRecord, QFilterCondition> {
  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  adjustedPressureEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'adjustedPressure',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  adjustedPressureGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'adjustedPressure',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  adjustedPressureLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'adjustedPressure',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  adjustedPressureBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'adjustedPressure',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  dischargePressureEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'dischargePressure',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  dischargePressureGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dischargePressure',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  dischargePressureLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dischargePressure',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  dischargePressureBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dischargePressure',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition> flowGpmEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'flowGpm',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  flowGpmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'flowGpm',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition> flowGpmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'flowGpm',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition> flowGpmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'flowGpm',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  flowPercentageEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'flowPercentage', value: value),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  flowPercentageGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'flowPercentage',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  flowPercentageLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'flowPercentage',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  flowPercentageBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'flowPercentage',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition> isPassedEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isPassed', value: value),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  netPressureEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'netPressure',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  netPressureGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'netPressure',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  netPressureLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'netPressure',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  netPressureBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'netPressure',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition> speedRpmEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'speedRpm',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  speedRpmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'speedRpm',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  speedRpmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'speedRpm',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition> speedRpmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'speedRpm',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  suctionPressureEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'suctionPressure',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  suctionPressureGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'suctionPressure',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  suctionPressureLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'suctionPressure',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PointRecord, PointRecord, QAfterFilterCondition>
  suctionPressureBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'suctionPressure',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }
}

extension PointRecordQueryObject
    on QueryBuilder<PointRecord, PointRecord, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const EquipmentDataEmbeddedSchema = Schema(
  name: r'EquipmentDataEmbedded',
  id: 1704221909369178903,
  properties: {
    r'cityState': PropertySchema(
      id: 0,
      name: r'cityState',
      type: IsarType.string,
    ),
    r'contactName': PropertySchema(
      id: 1,
      name: r'contactName',
      type: IsarType.string,
    ),
    r'controllerApproved': PropertySchema(
      id: 2,
      name: r'controllerApproved',
      type: IsarType.bool,
    ),
    r'controllerBrand': PropertySchema(
      id: 3,
      name: r'controllerBrand',
      type: IsarType.string,
    ),
    r'controllerModel': PropertySchema(
      id: 4,
      name: r'controllerModel',
      type: IsarType.string,
    ),
    r'controllerSerialNumber': PropertySchema(
      id: 5,
      name: r'controllerSerialNumber',
      type: IsarType.string,
    ),
    r'controllerVoltage': PropertySchema(
      id: 6,
      name: r'controllerVoltage',
      type: IsarType.double,
    ),
    r'gearHeadBrand': PropertySchema(
      id: 7,
      name: r'gearHeadBrand',
      type: IsarType.string,
    ),
    r'gearHeadModel': PropertySchema(
      id: 8,
      name: r'gearHeadModel',
      type: IsarType.string,
    ),
    r'gearHeadRatio': PropertySchema(
      id: 9,
      name: r'gearHeadRatio',
      type: IsarType.string,
    ),
    r'gearHeadSerialNumber': PropertySchema(
      id: 10,
      name: r'gearHeadSerialNumber',
      type: IsarType.string,
    ),
    r'impellerDiameter': PropertySchema(
      id: 11,
      name: r'impellerDiameter',
      type: IsarType.double,
    ),
    r'maxDevelopedPressure': PropertySchema(
      id: 12,
      name: r'maxDevelopedPressure',
      type: IsarType.double,
    ),
    r'motorApproved': PropertySchema(
      id: 13,
      name: r'motorApproved',
      type: IsarType.bool,
    ),
    r'motorBrand': PropertySchema(
      id: 14,
      name: r'motorBrand',
      type: IsarType.string,
    ),
    r'motorFla': PropertySchema(
      id: 15,
      name: r'motorFla',
      type: IsarType.double,
    ),
    r'motorFuelType': PropertySchema(
      id: 16,
      name: r'motorFuelType',
      type: IsarType.string,
      enumMap: _EquipmentDataEmbeddedmotorFuelTypeEnumValueMap,
    ),
    r'motorHp': PropertySchema(id: 17, name: r'motorHp', type: IsarType.double),
    r'motorModel': PropertySchema(
      id: 18,
      name: r'motorModel',
      type: IsarType.string,
    ),
    r'motorRpm': PropertySchema(
      id: 19,
      name: r'motorRpm',
      type: IsarType.double,
    ),
    r'motorSerialNumber': PropertySchema(
      id: 20,
      name: r'motorSerialNumber',
      type: IsarType.string,
    ),
    r'motorServiceFactor': PropertySchema(
      id: 21,
      name: r'motorServiceFactor',
      type: IsarType.double,
    ),
    r'motorVolts': PropertySchema(
      id: 22,
      name: r'motorVolts',
      type: IsarType.double,
    ),
    r'operationMode': PropertySchema(
      id: 23,
      name: r'operationMode',
      type: IsarType.string,
      enumMap: _EquipmentDataEmbeddedoperationModeEnumValueMap,
    ),
    r'pressureAt150Percent': PropertySchema(
      id: 24,
      name: r'pressureAt150Percent',
      type: IsarType.double,
    ),
    r'pumpApproved': PropertySchema(
      id: 25,
      name: r'pumpApproved',
      type: IsarType.bool,
    ),
    r'pumpBrand': PropertySchema(
      id: 26,
      name: r'pumpBrand',
      type: IsarType.string,
    ),
    r'pumpModel': PropertySchema(
      id: 27,
      name: r'pumpModel',
      type: IsarType.string,
    ),
    r'pumpOrientation': PropertySchema(
      id: 28,
      name: r'pumpOrientation',
      type: IsarType.string,
      enumMap: _EquipmentDataEmbeddedpumpOrientationEnumValueMap,
    ),
    r'pumpSerialNumber': PropertySchema(
      id: 29,
      name: r'pumpSerialNumber',
      type: IsarType.string,
    ),
    r'startPressure': PropertySchema(
      id: 30,
      name: r'startPressure',
      type: IsarType.double,
    ),
    r'stopPressure': PropertySchema(
      id: 31,
      name: r'stopPressure',
      type: IsarType.double,
    ),
    r'storageCapacity': PropertySchema(
      id: 32,
      name: r'storageCapacity',
      type: IsarType.string,
    ),
    r'storageType': PropertySchema(
      id: 33,
      name: r'storageType',
      type: IsarType.string,
      enumMap: _EquipmentDataEmbeddedstorageTypeEnumValueMap,
    ),
    r'systemType': PropertySchema(
      id: 34,
      name: r'systemType',
      type: IsarType.string,
    ),
    r'waterColumnFeet': PropertySchema(
      id: 35,
      name: r'waterColumnFeet',
      type: IsarType.double,
    ),
  },
  estimateSize: _equipmentDataEmbeddedEstimateSize,
  serialize: _equipmentDataEmbeddedSerialize,
  deserialize: _equipmentDataEmbeddedDeserialize,
  deserializeProp: _equipmentDataEmbeddedDeserializeProp,
);

int _equipmentDataEmbeddedEstimateSize(
  EquipmentDataEmbedded object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cityState.length * 3;
  bytesCount += 3 + object.contactName.length * 3;
  bytesCount += 3 + object.controllerBrand.length * 3;
  bytesCount += 3 + object.controllerModel.length * 3;
  bytesCount += 3 + object.controllerSerialNumber.length * 3;
  bytesCount += 3 + object.gearHeadBrand.length * 3;
  bytesCount += 3 + object.gearHeadModel.length * 3;
  bytesCount += 3 + object.gearHeadRatio.length * 3;
  bytesCount += 3 + object.gearHeadSerialNumber.length * 3;
  bytesCount += 3 + object.motorBrand.length * 3;
  bytesCount += 3 + object.motorFuelType.name.length * 3;
  bytesCount += 3 + object.motorModel.length * 3;
  bytesCount += 3 + object.motorSerialNumber.length * 3;
  bytesCount += 3 + object.operationMode.name.length * 3;
  bytesCount += 3 + object.pumpBrand.length * 3;
  bytesCount += 3 + object.pumpModel.length * 3;
  bytesCount += 3 + object.pumpOrientation.name.length * 3;
  bytesCount += 3 + object.pumpSerialNumber.length * 3;
  bytesCount += 3 + object.storageCapacity.length * 3;
  bytesCount += 3 + object.storageType.name.length * 3;
  bytesCount += 3 + object.systemType.length * 3;
  return bytesCount;
}

void _equipmentDataEmbeddedSerialize(
  EquipmentDataEmbedded object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cityState);
  writer.writeString(offsets[1], object.contactName);
  writer.writeBool(offsets[2], object.controllerApproved);
  writer.writeString(offsets[3], object.controllerBrand);
  writer.writeString(offsets[4], object.controllerModel);
  writer.writeString(offsets[5], object.controllerSerialNumber);
  writer.writeDouble(offsets[6], object.controllerVoltage);
  writer.writeString(offsets[7], object.gearHeadBrand);
  writer.writeString(offsets[8], object.gearHeadModel);
  writer.writeString(offsets[9], object.gearHeadRatio);
  writer.writeString(offsets[10], object.gearHeadSerialNumber);
  writer.writeDouble(offsets[11], object.impellerDiameter);
  writer.writeDouble(offsets[12], object.maxDevelopedPressure);
  writer.writeBool(offsets[13], object.motorApproved);
  writer.writeString(offsets[14], object.motorBrand);
  writer.writeDouble(offsets[15], object.motorFla);
  writer.writeString(offsets[16], object.motorFuelType.name);
  writer.writeDouble(offsets[17], object.motorHp);
  writer.writeString(offsets[18], object.motorModel);
  writer.writeDouble(offsets[19], object.motorRpm);
  writer.writeString(offsets[20], object.motorSerialNumber);
  writer.writeDouble(offsets[21], object.motorServiceFactor);
  writer.writeDouble(offsets[22], object.motorVolts);
  writer.writeString(offsets[23], object.operationMode.name);
  writer.writeDouble(offsets[24], object.pressureAt150Percent);
  writer.writeBool(offsets[25], object.pumpApproved);
  writer.writeString(offsets[26], object.pumpBrand);
  writer.writeString(offsets[27], object.pumpModel);
  writer.writeString(offsets[28], object.pumpOrientation.name);
  writer.writeString(offsets[29], object.pumpSerialNumber);
  writer.writeDouble(offsets[30], object.startPressure);
  writer.writeDouble(offsets[31], object.stopPressure);
  writer.writeString(offsets[32], object.storageCapacity);
  writer.writeString(offsets[33], object.storageType.name);
  writer.writeString(offsets[34], object.systemType);
  writer.writeDouble(offsets[35], object.waterColumnFeet);
}

EquipmentDataEmbedded _equipmentDataEmbeddedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EquipmentDataEmbedded();
  object.cityState = reader.readString(offsets[0]);
  object.contactName = reader.readString(offsets[1]);
  object.controllerApproved = reader.readBool(offsets[2]);
  object.controllerBrand = reader.readString(offsets[3]);
  object.controllerModel = reader.readString(offsets[4]);
  object.controllerSerialNumber = reader.readString(offsets[5]);
  object.controllerVoltage = reader.readDouble(offsets[6]);
  object.gearHeadBrand = reader.readString(offsets[7]);
  object.gearHeadModel = reader.readString(offsets[8]);
  object.gearHeadRatio = reader.readString(offsets[9]);
  object.gearHeadSerialNumber = reader.readString(offsets[10]);
  object.impellerDiameter = reader.readDouble(offsets[11]);
  object.maxDevelopedPressure = reader.readDouble(offsets[12]);
  object.motorApproved = reader.readBool(offsets[13]);
  object.motorBrand = reader.readString(offsets[14]);
  object.motorFla = reader.readDouble(offsets[15]);
  object.motorFuelType =
      _EquipmentDataEmbeddedmotorFuelTypeValueEnumMap[reader.readStringOrNull(
        offsets[16],
      )] ??
      MotorFuelType.diesel;
  object.motorHp = reader.readDouble(offsets[17]);
  object.motorModel = reader.readString(offsets[18]);
  object.motorRpm = reader.readDouble(offsets[19]);
  object.motorSerialNumber = reader.readString(offsets[20]);
  object.motorServiceFactor = reader.readDouble(offsets[21]);
  object.motorVolts = reader.readDouble(offsets[22]);
  object.operationMode =
      _EquipmentDataEmbeddedoperationModeValueEnumMap[reader.readStringOrNull(
        offsets[23],
      )] ??
      OperationMode.manual;
  object.pressureAt150Percent = reader.readDouble(offsets[24]);
  object.pumpApproved = reader.readBool(offsets[25]);
  object.pumpBrand = reader.readString(offsets[26]);
  object.pumpModel = reader.readString(offsets[27]);
  object.pumpOrientation =
      _EquipmentDataEmbeddedpumpOrientationValueEnumMap[reader.readStringOrNull(
        offsets[28],
      )] ??
      PumpOrientation.horizontal;
  object.pumpSerialNumber = reader.readString(offsets[29]);
  object.startPressure = reader.readDouble(offsets[30]);
  object.stopPressure = reader.readDouble(offsets[31]);
  object.storageCapacity = reader.readString(offsets[32]);
  object.storageType =
      _EquipmentDataEmbeddedstorageTypeValueEnumMap[reader.readStringOrNull(
        offsets[33],
      )] ??
      StorageType.tank;
  object.systemType = reader.readString(offsets[34]);
  object.waterColumnFeet = reader.readDouble(offsets[35]);
  return object;
}

P _equipmentDataEmbeddedDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (_EquipmentDataEmbeddedmotorFuelTypeValueEnumMap[reader
                  .readStringOrNull(offset)] ??
              MotorFuelType.diesel)
          as P;
    case 17:
      return (reader.readDouble(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readDouble(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readDouble(offset)) as P;
    case 22:
      return (reader.readDouble(offset)) as P;
    case 23:
      return (_EquipmentDataEmbeddedoperationModeValueEnumMap[reader
                  .readStringOrNull(offset)] ??
              OperationMode.manual)
          as P;
    case 24:
      return (reader.readDouble(offset)) as P;
    case 25:
      return (reader.readBool(offset)) as P;
    case 26:
      return (reader.readString(offset)) as P;
    case 27:
      return (reader.readString(offset)) as P;
    case 28:
      return (_EquipmentDataEmbeddedpumpOrientationValueEnumMap[reader
                  .readStringOrNull(offset)] ??
              PumpOrientation.horizontal)
          as P;
    case 29:
      return (reader.readString(offset)) as P;
    case 30:
      return (reader.readDouble(offset)) as P;
    case 31:
      return (reader.readDouble(offset)) as P;
    case 32:
      return (reader.readString(offset)) as P;
    case 33:
      return (_EquipmentDataEmbeddedstorageTypeValueEnumMap[reader
                  .readStringOrNull(offset)] ??
              StorageType.tank)
          as P;
    case 34:
      return (reader.readString(offset)) as P;
    case 35:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _EquipmentDataEmbeddedmotorFuelTypeEnumValueMap = {
  r'diesel': r'diesel',
  r'electric': r'electric',
};
const _EquipmentDataEmbeddedmotorFuelTypeValueEnumMap = {
  r'diesel': MotorFuelType.diesel,
  r'electric': MotorFuelType.electric,
};
const _EquipmentDataEmbeddedoperationModeEnumValueMap = {
  r'manual': r'manual',
  r'automatic': r'automatic',
};
const _EquipmentDataEmbeddedoperationModeValueEnumMap = {
  r'manual': OperationMode.manual,
  r'automatic': OperationMode.automatic,
};
const _EquipmentDataEmbeddedpumpOrientationEnumValueMap = {
  r'horizontal': r'horizontal',
  r'vertical': r'vertical',
};
const _EquipmentDataEmbeddedpumpOrientationValueEnumMap = {
  r'horizontal': PumpOrientation.horizontal,
  r'vertical': PumpOrientation.vertical,
};
const _EquipmentDataEmbeddedstorageTypeEnumValueMap = {
  r'tank': r'tank',
  r'cistern': r'cistern',
};
const _EquipmentDataEmbeddedstorageTypeValueEnumMap = {
  r'tank': StorageType.tank,
  r'cistern': StorageType.cistern,
};

extension EquipmentDataEmbeddedQueryFilter
    on
        QueryBuilder<
          EquipmentDataEmbedded,
          EquipmentDataEmbedded,
          QFilterCondition
        > {
  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  cityStateEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'cityState',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  cityStateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'cityState',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  cityStateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'cityState',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  cityStateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'cityState',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  cityStateStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'cityState',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  cityStateEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'cityState',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  cityStateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'cityState',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  cityStateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'cityState',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  cityStateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cityState', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  cityStateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'cityState', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  contactNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'contactName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  contactNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'contactName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  contactNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'contactName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  contactNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'contactName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  contactNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'contactName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  contactNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'contactName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  contactNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'contactName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  contactNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'contactName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  contactNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'contactName', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  contactNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'contactName', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerApprovedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'controllerApproved', value: value),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerBrandEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'controllerBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerBrandGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'controllerBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerBrandLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'controllerBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerBrandBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'controllerBrand',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerBrandStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'controllerBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerBrandEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'controllerBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerBrandContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'controllerBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerBrandMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'controllerBrand',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerBrandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'controllerBrand', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerBrandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'controllerBrand', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerModelEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'controllerModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerModelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'controllerModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerModelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'controllerModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerModelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'controllerModel',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerModelStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'controllerModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerModelEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'controllerModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerModelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'controllerModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerModelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'controllerModel',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'controllerModel', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'controllerModel', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerSerialNumberEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'controllerSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerSerialNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'controllerSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerSerialNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'controllerSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerSerialNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'controllerSerialNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerSerialNumberStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'controllerSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerSerialNumberEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'controllerSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerSerialNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'controllerSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerSerialNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'controllerSerialNumber',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerSerialNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'controllerSerialNumber', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerSerialNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'controllerSerialNumber',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerVoltageEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'controllerVoltage',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerVoltageGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'controllerVoltage',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerVoltageLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'controllerVoltage',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  controllerVoltageBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'controllerVoltage',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadBrandEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'gearHeadBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadBrandGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'gearHeadBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadBrandLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'gearHeadBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadBrandBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'gearHeadBrand',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadBrandStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'gearHeadBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadBrandEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'gearHeadBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadBrandContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'gearHeadBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadBrandMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'gearHeadBrand',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadBrandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'gearHeadBrand', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadBrandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'gearHeadBrand', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadModelEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'gearHeadModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadModelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'gearHeadModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadModelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'gearHeadModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadModelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'gearHeadModel',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadModelStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'gearHeadModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadModelEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'gearHeadModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadModelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'gearHeadModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadModelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'gearHeadModel',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'gearHeadModel', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'gearHeadModel', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadRatioEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'gearHeadRatio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadRatioGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'gearHeadRatio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadRatioLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'gearHeadRatio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadRatioBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'gearHeadRatio',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadRatioStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'gearHeadRatio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadRatioEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'gearHeadRatio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadRatioContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'gearHeadRatio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadRatioMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'gearHeadRatio',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadRatioIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'gearHeadRatio', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadRatioIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'gearHeadRatio', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadSerialNumberEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'gearHeadSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadSerialNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'gearHeadSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadSerialNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'gearHeadSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadSerialNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'gearHeadSerialNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadSerialNumberStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'gearHeadSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadSerialNumberEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'gearHeadSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadSerialNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'gearHeadSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadSerialNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'gearHeadSerialNumber',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadSerialNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'gearHeadSerialNumber', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  gearHeadSerialNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'gearHeadSerialNumber',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  impellerDiameterEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'impellerDiameter',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  impellerDiameterGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'impellerDiameter',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  impellerDiameterLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'impellerDiameter',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  impellerDiameterBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'impellerDiameter',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  maxDevelopedPressureEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'maxDevelopedPressure',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  maxDevelopedPressureGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'maxDevelopedPressure',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  maxDevelopedPressureLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'maxDevelopedPressure',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  maxDevelopedPressureBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'maxDevelopedPressure',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorApprovedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'motorApproved', value: value),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorBrandEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'motorBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorBrandGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'motorBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorBrandLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'motorBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorBrandBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'motorBrand',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorBrandStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'motorBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorBrandEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'motorBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorBrandContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'motorBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorBrandMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'motorBrand',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorBrandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'motorBrand', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorBrandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'motorBrand', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorFlaEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'motorFla',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorFlaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'motorFla',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorFlaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'motorFla',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorFlaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'motorFla',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorFuelTypeEqualTo(MotorFuelType value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'motorFuelType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorFuelTypeGreaterThan(
    MotorFuelType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'motorFuelType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorFuelTypeLessThan(
    MotorFuelType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'motorFuelType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorFuelTypeBetween(
    MotorFuelType lower,
    MotorFuelType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'motorFuelType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorFuelTypeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'motorFuelType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorFuelTypeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'motorFuelType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorFuelTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'motorFuelType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorFuelTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'motorFuelType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorFuelTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'motorFuelType', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorFuelTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'motorFuelType', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorHpEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'motorHp',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorHpGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'motorHp',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorHpLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'motorHp',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorHpBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'motorHp',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorModelEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'motorModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorModelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'motorModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorModelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'motorModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorModelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'motorModel',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorModelStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'motorModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorModelEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'motorModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorModelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'motorModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorModelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'motorModel',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'motorModel', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'motorModel', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorRpmEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'motorRpm',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorRpmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'motorRpm',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorRpmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'motorRpm',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorRpmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'motorRpm',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorSerialNumberEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'motorSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorSerialNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'motorSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorSerialNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'motorSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorSerialNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'motorSerialNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorSerialNumberStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'motorSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorSerialNumberEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'motorSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorSerialNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'motorSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorSerialNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'motorSerialNumber',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorSerialNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'motorSerialNumber', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorSerialNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'motorSerialNumber', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorServiceFactorEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'motorServiceFactor',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorServiceFactorGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'motorServiceFactor',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorServiceFactorLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'motorServiceFactor',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorServiceFactorBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'motorServiceFactor',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorVoltsEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'motorVolts',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorVoltsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'motorVolts',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorVoltsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'motorVolts',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  motorVoltsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'motorVolts',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  operationModeEqualTo(OperationMode value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'operationMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  operationModeGreaterThan(
    OperationMode value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'operationMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  operationModeLessThan(
    OperationMode value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'operationMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  operationModeBetween(
    OperationMode lower,
    OperationMode upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'operationMode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  operationModeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'operationMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  operationModeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'operationMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  operationModeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'operationMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  operationModeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'operationMode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  operationModeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'operationMode', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  operationModeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'operationMode', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pressureAt150PercentEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pressureAt150Percent',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pressureAt150PercentGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pressureAt150Percent',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pressureAt150PercentLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pressureAt150Percent',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pressureAt150PercentBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pressureAt150Percent',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpApprovedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pumpApproved', value: value),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpBrandEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pumpBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpBrandGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pumpBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpBrandLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pumpBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpBrandBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pumpBrand',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpBrandStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'pumpBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpBrandEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'pumpBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpBrandContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'pumpBrand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpBrandMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'pumpBrand',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpBrandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pumpBrand', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpBrandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'pumpBrand', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpModelEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pumpModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpModelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pumpModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpModelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pumpModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpModelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pumpModel',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpModelStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'pumpModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpModelEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'pumpModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpModelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'pumpModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpModelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'pumpModel',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pumpModel', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'pumpModel', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpOrientationEqualTo(PumpOrientation value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pumpOrientation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpOrientationGreaterThan(
    PumpOrientation value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pumpOrientation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpOrientationLessThan(
    PumpOrientation value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pumpOrientation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpOrientationBetween(
    PumpOrientation lower,
    PumpOrientation upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pumpOrientation',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpOrientationStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'pumpOrientation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpOrientationEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'pumpOrientation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpOrientationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'pumpOrientation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpOrientationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'pumpOrientation',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpOrientationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pumpOrientation', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpOrientationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'pumpOrientation', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpSerialNumberEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pumpSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpSerialNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pumpSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpSerialNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pumpSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpSerialNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pumpSerialNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpSerialNumberStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'pumpSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpSerialNumberEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'pumpSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpSerialNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'pumpSerialNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpSerialNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'pumpSerialNumber',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpSerialNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pumpSerialNumber', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  pumpSerialNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'pumpSerialNumber', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  startPressureEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'startPressure',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  startPressureGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'startPressure',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  startPressureLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'startPressure',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  startPressureBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'startPressure',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  stopPressureEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'stopPressure',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  stopPressureGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'stopPressure',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  stopPressureLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'stopPressure',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  stopPressureBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'stopPressure',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  storageCapacityEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'storageCapacity',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  storageCapacityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'storageCapacity',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  storageCapacityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'storageCapacity',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  storageCapacityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'storageCapacity',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  storageCapacityStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'storageCapacity',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  storageCapacityEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'storageCapacity',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  storageCapacityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'storageCapacity',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  storageCapacityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'storageCapacity',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  storageCapacityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'storageCapacity', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  storageCapacityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'storageCapacity', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  storageTypeEqualTo(StorageType value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'storageType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  storageTypeGreaterThan(
    StorageType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'storageType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  storageTypeLessThan(
    StorageType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'storageType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  storageTypeBetween(
    StorageType lower,
    StorageType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'storageType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  storageTypeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'storageType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  storageTypeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'storageType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  storageTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'storageType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  storageTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'storageType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  storageTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'storageType', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  storageTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'storageType', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  systemTypeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'systemType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  systemTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'systemType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  systemTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'systemType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  systemTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'systemType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  systemTypeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'systemType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  systemTypeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'systemType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  systemTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'systemType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  systemTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'systemType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  systemTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'systemType', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  systemTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'systemType', value: ''),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  waterColumnFeetEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'waterColumnFeet',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  waterColumnFeetGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'waterColumnFeet',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  waterColumnFeetLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'waterColumnFeet',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    EquipmentDataEmbedded,
    EquipmentDataEmbedded,
    QAfterFilterCondition
  >
  waterColumnFeetBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'waterColumnFeet',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }
}

extension EquipmentDataEmbeddedQueryObject
    on
        QueryBuilder<
          EquipmentDataEmbedded,
          EquipmentDataEmbedded,
          QFilterCondition
        > {}
