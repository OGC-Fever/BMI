// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'main.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 6742598759972724658),
      name: 'Record',
      lastPropertyId: const IdUid(8, 2668771283279326999),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3585074498711184982),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(3, 2410833698300331369),
            name: 'note',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 463324417872712446),
            name: 'datetime',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8836328859495089543),
            name: 'height',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 7983482844272757491),
            name: 'weight',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 2838340879941898238),
            name: 'bmi',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 2668771283279326999),
            name: 'color',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 6742598759972724658),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [9033058554304056664],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Record: EntityDefinition<Record>(
        model: _entities[0],
        toOneRelations: (Record object) => [],
        toManyRelations: (Record object) => {},
        getId: (Record object) => object.id,
        setId: (Record object, int id) {
          object.id = id;
        },
        objectToFB: (Record object, fb.Builder fbb) {
          final noteOffset = fbb.writeString(object.note);
          fbb.startTable(9);
          fbb.addInt64(0, object.id);
          fbb.addOffset(2, noteOffset);
          fbb.addInt64(3, object.datetime.millisecondsSinceEpoch);
          fbb.addFloat64(4, object.height);
          fbb.addFloat64(5, object.weight);
          fbb.addFloat64(6, object.bmi);
          fbb.addInt64(7, object.color);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Record(
              height:
                  const fb.Float64Reader().vTableGet(buffer, rootOffset, 12, 0),
              weight:
                  const fb.Float64Reader().vTableGet(buffer, rootOffset, 14, 0),
              bmi:
                  const fb.Float64Reader().vTableGet(buffer, rootOffset, 16, 0),
              note:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 8, ''),
              datetime: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0)),
              color:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 18, 0))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Record] entity fields to define ObjectBox queries.
class Record_ {
  /// see [Record.id]
  static final id = QueryIntegerProperty<Record>(_entities[0].properties[0]);

  /// see [Record.note]
  static final note = QueryStringProperty<Record>(_entities[0].properties[1]);

  /// see [Record.datetime]
  static final datetime =
      QueryIntegerProperty<Record>(_entities[0].properties[2]);

  /// see [Record.height]
  static final height = QueryDoubleProperty<Record>(_entities[0].properties[3]);

  /// see [Record.weight]
  static final weight = QueryDoubleProperty<Record>(_entities[0].properties[4]);

  /// see [Record.bmi]
  static final bmi = QueryDoubleProperty<Record>(_entities[0].properties[5]);

  /// see [Record.color]
  static final color = QueryIntegerProperty<Record>(_entities[0].properties[6]);
}
