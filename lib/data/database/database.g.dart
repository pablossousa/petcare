// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsuariosTable extends Usuarios with TableInfo<$UsuariosTable, Usuario> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsuariosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 60),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _celularMeta =
      const VerificationMeta('celular');
  @override
  late final GeneratedColumn<String> celular = GeneratedColumn<String>(
      'celular', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _fotoMeta = const VerificationMeta('foto');
  @override
  late final GeneratedColumn<String> foto = GeneratedColumn<String>(
      'foto', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _enderecoMeta =
      const VerificationMeta('endereco');
  @override
  late final GeneratedColumn<String> endereco = GeneratedColumn<String>(
      'endereco', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _senhaMeta = const VerificationMeta('senha');
  @override
  late final GeneratedColumn<String> senha = GeneratedColumn<String>(
      'senha', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 4, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, nome, email, celular, foto, endereco, senha];
  @override
  String get aliasedName => _alias ?? 'usuarios';
  @override
  String get actualTableName => 'usuarios';
  @override
  VerificationContext validateIntegrity(Insertable<Usuario> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('celular')) {
      context.handle(_celularMeta,
          celular.isAcceptableOrUnknown(data['celular']!, _celularMeta));
    }
    if (data.containsKey('foto')) {
      context.handle(
          _fotoMeta, foto.isAcceptableOrUnknown(data['foto']!, _fotoMeta));
    }
    if (data.containsKey('endereco')) {
      context.handle(_enderecoMeta,
          endereco.isAcceptableOrUnknown(data['endereco']!, _enderecoMeta));
    } else if (isInserting) {
      context.missing(_enderecoMeta);
    }
    if (data.containsKey('senha')) {
      context.handle(
          _senhaMeta, senha.isAcceptableOrUnknown(data['senha']!, _senhaMeta));
    } else if (isInserting) {
      context.missing(_senhaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Usuario map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Usuario(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      celular: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}celular']),
      foto: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}foto']),
      endereco: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}endereco'])!,
      senha: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}senha'])!,
    );
  }

  @override
  $UsuariosTable createAlias(String alias) {
    return $UsuariosTable(attachedDatabase, alias);
  }
}

class Usuario extends DataClass implements Insertable<Usuario> {
  final int id;
  final String nome;
  final String email;
  final String? celular;
  final String? foto;
  final String endereco;
  final String senha;
  const Usuario(
      {required this.id,
      required this.nome,
      required this.email,
      this.celular,
      this.foto,
      required this.endereco,
      required this.senha});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || celular != null) {
      map['celular'] = Variable<String>(celular);
    }
    if (!nullToAbsent || foto != null) {
      map['foto'] = Variable<String>(foto);
    }
    map['endereco'] = Variable<String>(endereco);
    map['senha'] = Variable<String>(senha);
    return map;
  }

  UsuariosCompanion toCompanion(bool nullToAbsent) {
    return UsuariosCompanion(
      id: Value(id),
      nome: Value(nome),
      email: Value(email),
      celular: celular == null && nullToAbsent
          ? const Value.absent()
          : Value(celular),
      foto: foto == null && nullToAbsent ? const Value.absent() : Value(foto),
      endereco: Value(endereco),
      senha: Value(senha),
    );
  }

  factory Usuario.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Usuario(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      email: serializer.fromJson<String>(json['email']),
      celular: serializer.fromJson<String?>(json['celular']),
      foto: serializer.fromJson<String?>(json['foto']),
      endereco: serializer.fromJson<String>(json['endereco']),
      senha: serializer.fromJson<String>(json['senha']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'email': serializer.toJson<String>(email),
      'celular': serializer.toJson<String?>(celular),
      'foto': serializer.toJson<String?>(foto),
      'endereco': serializer.toJson<String>(endereco),
      'senha': serializer.toJson<String>(senha),
    };
  }

  Usuario copyWith(
          {int? id,
          String? nome,
          String? email,
          Value<String?> celular = const Value.absent(),
          Value<String?> foto = const Value.absent(),
          String? endereco,
          String? senha}) =>
      Usuario(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        email: email ?? this.email,
        celular: celular.present ? celular.value : this.celular,
        foto: foto.present ? foto.value : this.foto,
        endereco: endereco ?? this.endereco,
        senha: senha ?? this.senha,
      );
  @override
  String toString() {
    return (StringBuffer('Usuario(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('email: $email, ')
          ..write('celular: $celular, ')
          ..write('foto: $foto, ')
          ..write('endereco: $endereco, ')
          ..write('senha: $senha')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, nome, email, celular, foto, endereco, senha);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Usuario &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.email == this.email &&
          other.celular == this.celular &&
          other.foto == this.foto &&
          other.endereco == this.endereco &&
          other.senha == this.senha);
}

class UsuariosCompanion extends UpdateCompanion<Usuario> {
  final Value<int> id;
  final Value<String> nome;
  final Value<String> email;
  final Value<String?> celular;
  final Value<String?> foto;
  final Value<String> endereco;
  final Value<String> senha;
  const UsuariosCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.email = const Value.absent(),
    this.celular = const Value.absent(),
    this.foto = const Value.absent(),
    this.endereco = const Value.absent(),
    this.senha = const Value.absent(),
  });
  UsuariosCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    required String email,
    this.celular = const Value.absent(),
    this.foto = const Value.absent(),
    required String endereco,
    required String senha,
  })  : nome = Value(nome),
        email = Value(email),
        endereco = Value(endereco),
        senha = Value(senha);
  static Insertable<Usuario> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<String>? email,
    Expression<String>? celular,
    Expression<String>? foto,
    Expression<String>? endereco,
    Expression<String>? senha,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (email != null) 'email': email,
      if (celular != null) 'celular': celular,
      if (foto != null) 'foto': foto,
      if (endereco != null) 'endereco': endereco,
      if (senha != null) 'senha': senha,
    });
  }

  UsuariosCompanion copyWith(
      {Value<int>? id,
      Value<String>? nome,
      Value<String>? email,
      Value<String?>? celular,
      Value<String?>? foto,
      Value<String>? endereco,
      Value<String>? senha}) {
    return UsuariosCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      celular: celular ?? this.celular,
      foto: foto ?? this.foto,
      endereco: endereco ?? this.endereco,
      senha: senha ?? this.senha,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (celular.present) {
      map['celular'] = Variable<String>(celular.value);
    }
    if (foto.present) {
      map['foto'] = Variable<String>(foto.value);
    }
    if (endereco.present) {
      map['endereco'] = Variable<String>(endereco.value);
    }
    if (senha.present) {
      map['senha'] = Variable<String>(senha.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsuariosCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('email: $email, ')
          ..write('celular: $celular, ')
          ..write('foto: $foto, ')
          ..write('endereco: $endereco, ')
          ..write('senha: $senha')
          ..write(')'))
        .toString();
  }
}

class $PetsTable extends Pets with TableInfo<$PetsTable, Pet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _usuarioIdMeta =
      const VerificationMeta('usuarioId');
  @override
  late final GeneratedColumn<int> usuarioId = GeneratedColumn<int>(
      'usuario_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES usuarios(id)');
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 60),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _pesoMeta = const VerificationMeta('peso');
  @override
  late final GeneratedColumn<double> peso = GeneratedColumn<double>(
      'peso', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _idadeMeta = const VerificationMeta('idade');
  @override
  late final GeneratedColumn<double> idade = GeneratedColumn<double>(
      'idade', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _racaMeta = const VerificationMeta('raca');
  @override
  late final GeneratedColumn<String> raca = GeneratedColumn<String>(
      'raca', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 60),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nascimentoMeta =
      const VerificationMeta('nascimento');
  @override
  late final GeneratedColumn<DateTime> nascimento = GeneratedColumn<DateTime>(
      'nascimento', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _especieMeta =
      const VerificationMeta('especie');
  @override
  late final GeneratedColumn<String> especie = GeneratedColumn<String>(
      'especie', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 60),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _sexoMeta = const VerificationMeta('sexo');
  @override
  late final GeneratedColumn<String> sexo = GeneratedColumn<String>(
      'sexo', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _naturalidadeMeta =
      const VerificationMeta('naturalidade');
  @override
  late final GeneratedColumn<String> naturalidade = GeneratedColumn<String>(
      'naturalidade', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _cadastroMeta =
      const VerificationMeta('cadastro');
  @override
  late final GeneratedColumn<DateTime> cadastro = GeneratedColumn<DateTime>(
      'cadastro', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        usuarioId,
        nome,
        peso,
        idade,
        raca,
        nascimento,
        especie,
        sexo,
        naturalidade,
        cadastro
      ];
  @override
  String get aliasedName => _alias ?? 'pets';
  @override
  String get actualTableName => 'pets';
  @override
  VerificationContext validateIntegrity(Insertable<Pet> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('usuario_id')) {
      context.handle(_usuarioIdMeta,
          usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _usuarioIdMeta));
    } else if (isInserting) {
      context.missing(_usuarioIdMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('peso')) {
      context.handle(
          _pesoMeta, peso.isAcceptableOrUnknown(data['peso']!, _pesoMeta));
    } else if (isInserting) {
      context.missing(_pesoMeta);
    }
    if (data.containsKey('idade')) {
      context.handle(
          _idadeMeta, idade.isAcceptableOrUnknown(data['idade']!, _idadeMeta));
    } else if (isInserting) {
      context.missing(_idadeMeta);
    }
    if (data.containsKey('raca')) {
      context.handle(
          _racaMeta, raca.isAcceptableOrUnknown(data['raca']!, _racaMeta));
    } else if (isInserting) {
      context.missing(_racaMeta);
    }
    if (data.containsKey('nascimento')) {
      context.handle(
          _nascimentoMeta,
          nascimento.isAcceptableOrUnknown(
              data['nascimento']!, _nascimentoMeta));
    } else if (isInserting) {
      context.missing(_nascimentoMeta);
    }
    if (data.containsKey('especie')) {
      context.handle(_especieMeta,
          especie.isAcceptableOrUnknown(data['especie']!, _especieMeta));
    } else if (isInserting) {
      context.missing(_especieMeta);
    }
    if (data.containsKey('sexo')) {
      context.handle(
          _sexoMeta, sexo.isAcceptableOrUnknown(data['sexo']!, _sexoMeta));
    } else if (isInserting) {
      context.missing(_sexoMeta);
    }
    if (data.containsKey('naturalidade')) {
      context.handle(
          _naturalidadeMeta,
          naturalidade.isAcceptableOrUnknown(
              data['naturalidade']!, _naturalidadeMeta));
    } else if (isInserting) {
      context.missing(_naturalidadeMeta);
    }
    if (data.containsKey('cadastro')) {
      context.handle(_cadastroMeta,
          cadastro.isAcceptableOrUnknown(data['cadastro']!, _cadastroMeta));
    } else if (isInserting) {
      context.missing(_cadastroMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pet(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      usuarioId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}usuario_id'])!,
      nome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome'])!,
      peso: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}peso'])!,
      idade: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}idade'])!,
      raca: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}raca'])!,
      nascimento: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}nascimento'])!,
      especie: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}especie'])!,
      sexo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sexo'])!,
      naturalidade: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}naturalidade'])!,
      cadastro: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cadastro'])!,
    );
  }

  @override
  $PetsTable createAlias(String alias) {
    return $PetsTable(attachedDatabase, alias);
  }
}

class Pet extends DataClass implements Insertable<Pet> {
  final int id;
  final int usuarioId;
  final String nome;
  final double peso;
  final double idade;
  final String raca;
  final DateTime nascimento;
  final String especie;
  final String sexo;
  final String naturalidade;
  final DateTime cadastro;
  const Pet(
      {required this.id,
      required this.usuarioId,
      required this.nome,
      required this.peso,
      required this.idade,
      required this.raca,
      required this.nascimento,
      required this.especie,
      required this.sexo,
      required this.naturalidade,
      required this.cadastro});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['usuario_id'] = Variable<int>(usuarioId);
    map['nome'] = Variable<String>(nome);
    map['peso'] = Variable<double>(peso);
    map['idade'] = Variable<double>(idade);
    map['raca'] = Variable<String>(raca);
    map['nascimento'] = Variable<DateTime>(nascimento);
    map['especie'] = Variable<String>(especie);
    map['sexo'] = Variable<String>(sexo);
    map['naturalidade'] = Variable<String>(naturalidade);
    map['cadastro'] = Variable<DateTime>(cadastro);
    return map;
  }

  PetsCompanion toCompanion(bool nullToAbsent) {
    return PetsCompanion(
      id: Value(id),
      usuarioId: Value(usuarioId),
      nome: Value(nome),
      peso: Value(peso),
      idade: Value(idade),
      raca: Value(raca),
      nascimento: Value(nascimento),
      especie: Value(especie),
      sexo: Value(sexo),
      naturalidade: Value(naturalidade),
      cadastro: Value(cadastro),
    );
  }

  factory Pet.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pet(
      id: serializer.fromJson<int>(json['id']),
      usuarioId: serializer.fromJson<int>(json['usuarioId']),
      nome: serializer.fromJson<String>(json['nome']),
      peso: serializer.fromJson<double>(json['peso']),
      idade: serializer.fromJson<double>(json['idade']),
      raca: serializer.fromJson<String>(json['raca']),
      nascimento: serializer.fromJson<DateTime>(json['nascimento']),
      especie: serializer.fromJson<String>(json['especie']),
      sexo: serializer.fromJson<String>(json['sexo']),
      naturalidade: serializer.fromJson<String>(json['naturalidade']),
      cadastro: serializer.fromJson<DateTime>(json['cadastro']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'usuarioId': serializer.toJson<int>(usuarioId),
      'nome': serializer.toJson<String>(nome),
      'peso': serializer.toJson<double>(peso),
      'idade': serializer.toJson<double>(idade),
      'raca': serializer.toJson<String>(raca),
      'nascimento': serializer.toJson<DateTime>(nascimento),
      'especie': serializer.toJson<String>(especie),
      'sexo': serializer.toJson<String>(sexo),
      'naturalidade': serializer.toJson<String>(naturalidade),
      'cadastro': serializer.toJson<DateTime>(cadastro),
    };
  }

  Pet copyWith(
          {int? id,
          int? usuarioId,
          String? nome,
          double? peso,
          double? idade,
          String? raca,
          DateTime? nascimento,
          String? especie,
          String? sexo,
          String? naturalidade,
          DateTime? cadastro}) =>
      Pet(
        id: id ?? this.id,
        usuarioId: usuarioId ?? this.usuarioId,
        nome: nome ?? this.nome,
        peso: peso ?? this.peso,
        idade: idade ?? this.idade,
        raca: raca ?? this.raca,
        nascimento: nascimento ?? this.nascimento,
        especie: especie ?? this.especie,
        sexo: sexo ?? this.sexo,
        naturalidade: naturalidade ?? this.naturalidade,
        cadastro: cadastro ?? this.cadastro,
      );
  @override
  String toString() {
    return (StringBuffer('Pet(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('nome: $nome, ')
          ..write('peso: $peso, ')
          ..write('idade: $idade, ')
          ..write('raca: $raca, ')
          ..write('nascimento: $nascimento, ')
          ..write('especie: $especie, ')
          ..write('sexo: $sexo, ')
          ..write('naturalidade: $naturalidade, ')
          ..write('cadastro: $cadastro')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, usuarioId, nome, peso, idade, raca,
      nascimento, especie, sexo, naturalidade, cadastro);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pet &&
          other.id == this.id &&
          other.usuarioId == this.usuarioId &&
          other.nome == this.nome &&
          other.peso == this.peso &&
          other.idade == this.idade &&
          other.raca == this.raca &&
          other.nascimento == this.nascimento &&
          other.especie == this.especie &&
          other.sexo == this.sexo &&
          other.naturalidade == this.naturalidade &&
          other.cadastro == this.cadastro);
}

class PetsCompanion extends UpdateCompanion<Pet> {
  final Value<int> id;
  final Value<int> usuarioId;
  final Value<String> nome;
  final Value<double> peso;
  final Value<double> idade;
  final Value<String> raca;
  final Value<DateTime> nascimento;
  final Value<String> especie;
  final Value<String> sexo;
  final Value<String> naturalidade;
  final Value<DateTime> cadastro;
  const PetsCompanion({
    this.id = const Value.absent(),
    this.usuarioId = const Value.absent(),
    this.nome = const Value.absent(),
    this.peso = const Value.absent(),
    this.idade = const Value.absent(),
    this.raca = const Value.absent(),
    this.nascimento = const Value.absent(),
    this.especie = const Value.absent(),
    this.sexo = const Value.absent(),
    this.naturalidade = const Value.absent(),
    this.cadastro = const Value.absent(),
  });
  PetsCompanion.insert({
    this.id = const Value.absent(),
    required int usuarioId,
    required String nome,
    required double peso,
    required double idade,
    required String raca,
    required DateTime nascimento,
    required String especie,
    required String sexo,
    required String naturalidade,
    required DateTime cadastro,
  })  : usuarioId = Value(usuarioId),
        nome = Value(nome),
        peso = Value(peso),
        idade = Value(idade),
        raca = Value(raca),
        nascimento = Value(nascimento),
        especie = Value(especie),
        sexo = Value(sexo),
        naturalidade = Value(naturalidade),
        cadastro = Value(cadastro);
  static Insertable<Pet> custom({
    Expression<int>? id,
    Expression<int>? usuarioId,
    Expression<String>? nome,
    Expression<double>? peso,
    Expression<double>? idade,
    Expression<String>? raca,
    Expression<DateTime>? nascimento,
    Expression<String>? especie,
    Expression<String>? sexo,
    Expression<String>? naturalidade,
    Expression<DateTime>? cadastro,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (nome != null) 'nome': nome,
      if (peso != null) 'peso': peso,
      if (idade != null) 'idade': idade,
      if (raca != null) 'raca': raca,
      if (nascimento != null) 'nascimento': nascimento,
      if (especie != null) 'especie': especie,
      if (sexo != null) 'sexo': sexo,
      if (naturalidade != null) 'naturalidade': naturalidade,
      if (cadastro != null) 'cadastro': cadastro,
    });
  }

  PetsCompanion copyWith(
      {Value<int>? id,
      Value<int>? usuarioId,
      Value<String>? nome,
      Value<double>? peso,
      Value<double>? idade,
      Value<String>? raca,
      Value<DateTime>? nascimento,
      Value<String>? especie,
      Value<String>? sexo,
      Value<String>? naturalidade,
      Value<DateTime>? cadastro}) {
    return PetsCompanion(
      id: id ?? this.id,
      usuarioId: usuarioId ?? this.usuarioId,
      nome: nome ?? this.nome,
      peso: peso ?? this.peso,
      idade: idade ?? this.idade,
      raca: raca ?? this.raca,
      nascimento: nascimento ?? this.nascimento,
      especie: especie ?? this.especie,
      sexo: sexo ?? this.sexo,
      naturalidade: naturalidade ?? this.naturalidade,
      cadastro: cadastro ?? this.cadastro,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (usuarioId.present) {
      map['usuario_id'] = Variable<int>(usuarioId.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (peso.present) {
      map['peso'] = Variable<double>(peso.value);
    }
    if (idade.present) {
      map['idade'] = Variable<double>(idade.value);
    }
    if (raca.present) {
      map['raca'] = Variable<String>(raca.value);
    }
    if (nascimento.present) {
      map['nascimento'] = Variable<DateTime>(nascimento.value);
    }
    if (especie.present) {
      map['especie'] = Variable<String>(especie.value);
    }
    if (sexo.present) {
      map['sexo'] = Variable<String>(sexo.value);
    }
    if (naturalidade.present) {
      map['naturalidade'] = Variable<String>(naturalidade.value);
    }
    if (cadastro.present) {
      map['cadastro'] = Variable<DateTime>(cadastro.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PetsCompanion(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('nome: $nome, ')
          ..write('peso: $peso, ')
          ..write('idade: $idade, ')
          ..write('raca: $raca, ')
          ..write('nascimento: $nascimento, ')
          ..write('especie: $especie, ')
          ..write('sexo: $sexo, ')
          ..write('naturalidade: $naturalidade, ')
          ..write('cadastro: $cadastro')
          ..write(')'))
        .toString();
  }
}

class $AnamnesesTable extends Anamneses
    with TableInfo<$AnamnesesTable, Anamnese> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnamnesesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<int> petId = GeneratedColumn<int>(
      'pet_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES pets(id)');
  static const VerificationMeta _queixaPrincipalMeta =
      const VerificationMeta('queixaPrincipal');
  @override
  late final GeneratedColumn<String> queixaPrincipal = GeneratedColumn<String>(
      'queixa_principal', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 300),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _alimentacaoMeta =
      const VerificationMeta('alimentacao');
  @override
  late final GeneratedColumn<String> alimentacao = GeneratedColumn<String>(
      'alimentacao', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _doencasAnterioresMeta =
      const VerificationMeta('doencasAnteriores');
  @override
  late final GeneratedColumn<String> doencasAnteriores =
      GeneratedColumn<String>('doencas_anteriores', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 200),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _alergiasMeta =
      const VerificationMeta('alergias');
  @override
  late final GeneratedColumn<String> alergias = GeneratedColumn<String>(
      'alergias', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _tempoEvolucaoMeta =
      const VerificationMeta('tempoEvolucao');
  @override
  late final GeneratedColumn<String> tempoEvolucao = GeneratedColumn<String>(
      'tempo_evolucao', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _tipoEvolucaoMeta =
      const VerificationMeta('tipoEvolucao');
  @override
  late final GeneratedColumn<String> tipoEvolucao = GeneratedColumn<String>(
      'tipo_evolucao', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _ambienteMeta =
      const VerificationMeta('ambiente');
  @override
  late final GeneratedColumn<String> ambiente = GeneratedColumn<String>(
      'ambiente', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _fugiuRecentementeMeta =
      const VerificationMeta('fugiuRecentemente');
  @override
  late final GeneratedColumn<bool> fugiuRecentemente =
      GeneratedColumn<bool>('fugiu_recentemente', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("fugiu_recentemente" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _pulgasMeta = const VerificationMeta('pulgas');
  @override
  late final GeneratedColumn<bool> pulgas =
      GeneratedColumn<bool>('pulgas', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("pulgas" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _carrapatosMeta =
      const VerificationMeta('carrapatos');
  @override
  late final GeneratedColumn<bool> carrapatos =
      GeneratedColumn<bool>('carrapatos', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("carrapatos" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _vacinaMeta = const VerificationMeta('vacina');
  @override
  late final GeneratedColumn<String> vacina = GeneratedColumn<String>(
      'vacina', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _vermifugacoMeta =
      const VerificationMeta('vermifugaco');
  @override
  late final GeneratedColumn<String> vermifugaco = GeneratedColumn<String>(
      'vermifugaco', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _cadastroMeta =
      const VerificationMeta('cadastro');
  @override
  late final GeneratedColumn<DateTime> cadastro = GeneratedColumn<DateTime>(
      'cadastro', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        petId,
        queixaPrincipal,
        alimentacao,
        doencasAnteriores,
        alergias,
        tempoEvolucao,
        tipoEvolucao,
        ambiente,
        fugiuRecentemente,
        pulgas,
        carrapatos,
        vacina,
        vermifugaco,
        cadastro
      ];
  @override
  String get aliasedName => _alias ?? 'anamneses';
  @override
  String get actualTableName => 'anamneses';
  @override
  VerificationContext validateIntegrity(Insertable<Anamnese> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pet_id')) {
      context.handle(
          _petIdMeta, petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta));
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('queixa_principal')) {
      context.handle(
          _queixaPrincipalMeta,
          queixaPrincipal.isAcceptableOrUnknown(
              data['queixa_principal']!, _queixaPrincipalMeta));
    } else if (isInserting) {
      context.missing(_queixaPrincipalMeta);
    }
    if (data.containsKey('alimentacao')) {
      context.handle(
          _alimentacaoMeta,
          alimentacao.isAcceptableOrUnknown(
              data['alimentacao']!, _alimentacaoMeta));
    } else if (isInserting) {
      context.missing(_alimentacaoMeta);
    }
    if (data.containsKey('doencas_anteriores')) {
      context.handle(
          _doencasAnterioresMeta,
          doencasAnteriores.isAcceptableOrUnknown(
              data['doencas_anteriores']!, _doencasAnterioresMeta));
    } else if (isInserting) {
      context.missing(_doencasAnterioresMeta);
    }
    if (data.containsKey('alergias')) {
      context.handle(_alergiasMeta,
          alergias.isAcceptableOrUnknown(data['alergias']!, _alergiasMeta));
    } else if (isInserting) {
      context.missing(_alergiasMeta);
    }
    if (data.containsKey('tempo_evolucao')) {
      context.handle(
          _tempoEvolucaoMeta,
          tempoEvolucao.isAcceptableOrUnknown(
              data['tempo_evolucao']!, _tempoEvolucaoMeta));
    } else if (isInserting) {
      context.missing(_tempoEvolucaoMeta);
    }
    if (data.containsKey('tipo_evolucao')) {
      context.handle(
          _tipoEvolucaoMeta,
          tipoEvolucao.isAcceptableOrUnknown(
              data['tipo_evolucao']!, _tipoEvolucaoMeta));
    } else if (isInserting) {
      context.missing(_tipoEvolucaoMeta);
    }
    if (data.containsKey('ambiente')) {
      context.handle(_ambienteMeta,
          ambiente.isAcceptableOrUnknown(data['ambiente']!, _ambienteMeta));
    } else if (isInserting) {
      context.missing(_ambienteMeta);
    }
    if (data.containsKey('fugiu_recentemente')) {
      context.handle(
          _fugiuRecentementeMeta,
          fugiuRecentemente.isAcceptableOrUnknown(
              data['fugiu_recentemente']!, _fugiuRecentementeMeta));
    } else if (isInserting) {
      context.missing(_fugiuRecentementeMeta);
    }
    if (data.containsKey('pulgas')) {
      context.handle(_pulgasMeta,
          pulgas.isAcceptableOrUnknown(data['pulgas']!, _pulgasMeta));
    } else if (isInserting) {
      context.missing(_pulgasMeta);
    }
    if (data.containsKey('carrapatos')) {
      context.handle(
          _carrapatosMeta,
          carrapatos.isAcceptableOrUnknown(
              data['carrapatos']!, _carrapatosMeta));
    } else if (isInserting) {
      context.missing(_carrapatosMeta);
    }
    if (data.containsKey('vacina')) {
      context.handle(_vacinaMeta,
          vacina.isAcceptableOrUnknown(data['vacina']!, _vacinaMeta));
    } else if (isInserting) {
      context.missing(_vacinaMeta);
    }
    if (data.containsKey('vermifugaco')) {
      context.handle(
          _vermifugacoMeta,
          vermifugaco.isAcceptableOrUnknown(
              data['vermifugaco']!, _vermifugacoMeta));
    } else if (isInserting) {
      context.missing(_vermifugacoMeta);
    }
    if (data.containsKey('cadastro')) {
      context.handle(_cadastroMeta,
          cadastro.isAcceptableOrUnknown(data['cadastro']!, _cadastroMeta));
    } else if (isInserting) {
      context.missing(_cadastroMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Anamnese map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Anamnese(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      petId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pet_id'])!,
      queixaPrincipal: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}queixa_principal'])!,
      alimentacao: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}alimentacao'])!,
      doencasAnteriores: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}doencas_anteriores'])!,
      alergias: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}alergias'])!,
      tempoEvolucao: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tempo_evolucao'])!,
      tipoEvolucao: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tipo_evolucao'])!,
      ambiente: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ambiente'])!,
      fugiuRecentemente: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}fugiu_recentemente'])!,
      pulgas: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}pulgas'])!,
      carrapatos: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}carrapatos'])!,
      vacina: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vacina'])!,
      vermifugaco: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vermifugaco'])!,
      cadastro: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cadastro'])!,
    );
  }

  @override
  $AnamnesesTable createAlias(String alias) {
    return $AnamnesesTable(attachedDatabase, alias);
  }
}

class Anamnese extends DataClass implements Insertable<Anamnese> {
  final int id;
  final int petId;
  final String queixaPrincipal;
  final String alimentacao;
  final String doencasAnteriores;
  final String alergias;
  final String tempoEvolucao;
  final String tipoEvolucao;
  final String ambiente;
  final bool fugiuRecentemente;
  final bool pulgas;
  final bool carrapatos;
  final String vacina;
  final String vermifugaco;
  final DateTime cadastro;
  const Anamnese(
      {required this.id,
      required this.petId,
      required this.queixaPrincipal,
      required this.alimentacao,
      required this.doencasAnteriores,
      required this.alergias,
      required this.tempoEvolucao,
      required this.tipoEvolucao,
      required this.ambiente,
      required this.fugiuRecentemente,
      required this.pulgas,
      required this.carrapatos,
      required this.vacina,
      required this.vermifugaco,
      required this.cadastro});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pet_id'] = Variable<int>(petId);
    map['queixa_principal'] = Variable<String>(queixaPrincipal);
    map['alimentacao'] = Variable<String>(alimentacao);
    map['doencas_anteriores'] = Variable<String>(doencasAnteriores);
    map['alergias'] = Variable<String>(alergias);
    map['tempo_evolucao'] = Variable<String>(tempoEvolucao);
    map['tipo_evolucao'] = Variable<String>(tipoEvolucao);
    map['ambiente'] = Variable<String>(ambiente);
    map['fugiu_recentemente'] = Variable<bool>(fugiuRecentemente);
    map['pulgas'] = Variable<bool>(pulgas);
    map['carrapatos'] = Variable<bool>(carrapatos);
    map['vacina'] = Variable<String>(vacina);
    map['vermifugaco'] = Variable<String>(vermifugaco);
    map['cadastro'] = Variable<DateTime>(cadastro);
    return map;
  }

  AnamnesesCompanion toCompanion(bool nullToAbsent) {
    return AnamnesesCompanion(
      id: Value(id),
      petId: Value(petId),
      queixaPrincipal: Value(queixaPrincipal),
      alimentacao: Value(alimentacao),
      doencasAnteriores: Value(doencasAnteriores),
      alergias: Value(alergias),
      tempoEvolucao: Value(tempoEvolucao),
      tipoEvolucao: Value(tipoEvolucao),
      ambiente: Value(ambiente),
      fugiuRecentemente: Value(fugiuRecentemente),
      pulgas: Value(pulgas),
      carrapatos: Value(carrapatos),
      vacina: Value(vacina),
      vermifugaco: Value(vermifugaco),
      cadastro: Value(cadastro),
    );
  }

  factory Anamnese.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Anamnese(
      id: serializer.fromJson<int>(json['id']),
      petId: serializer.fromJson<int>(json['petId']),
      queixaPrincipal: serializer.fromJson<String>(json['queixaPrincipal']),
      alimentacao: serializer.fromJson<String>(json['alimentacao']),
      doencasAnteriores: serializer.fromJson<String>(json['doencasAnteriores']),
      alergias: serializer.fromJson<String>(json['alergias']),
      tempoEvolucao: serializer.fromJson<String>(json['tempoEvolucao']),
      tipoEvolucao: serializer.fromJson<String>(json['tipoEvolucao']),
      ambiente: serializer.fromJson<String>(json['ambiente']),
      fugiuRecentemente: serializer.fromJson<bool>(json['fugiuRecentemente']),
      pulgas: serializer.fromJson<bool>(json['pulgas']),
      carrapatos: serializer.fromJson<bool>(json['carrapatos']),
      vacina: serializer.fromJson<String>(json['vacina']),
      vermifugaco: serializer.fromJson<String>(json['vermifugaco']),
      cadastro: serializer.fromJson<DateTime>(json['cadastro']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'petId': serializer.toJson<int>(petId),
      'queixaPrincipal': serializer.toJson<String>(queixaPrincipal),
      'alimentacao': serializer.toJson<String>(alimentacao),
      'doencasAnteriores': serializer.toJson<String>(doencasAnteriores),
      'alergias': serializer.toJson<String>(alergias),
      'tempoEvolucao': serializer.toJson<String>(tempoEvolucao),
      'tipoEvolucao': serializer.toJson<String>(tipoEvolucao),
      'ambiente': serializer.toJson<String>(ambiente),
      'fugiuRecentemente': serializer.toJson<bool>(fugiuRecentemente),
      'pulgas': serializer.toJson<bool>(pulgas),
      'carrapatos': serializer.toJson<bool>(carrapatos),
      'vacina': serializer.toJson<String>(vacina),
      'vermifugaco': serializer.toJson<String>(vermifugaco),
      'cadastro': serializer.toJson<DateTime>(cadastro),
    };
  }

  Anamnese copyWith(
          {int? id,
          int? petId,
          String? queixaPrincipal,
          String? alimentacao,
          String? doencasAnteriores,
          String? alergias,
          String? tempoEvolucao,
          String? tipoEvolucao,
          String? ambiente,
          bool? fugiuRecentemente,
          bool? pulgas,
          bool? carrapatos,
          String? vacina,
          String? vermifugaco,
          DateTime? cadastro}) =>
      Anamnese(
        id: id ?? this.id,
        petId: petId ?? this.petId,
        queixaPrincipal: queixaPrincipal ?? this.queixaPrincipal,
        alimentacao: alimentacao ?? this.alimentacao,
        doencasAnteriores: doencasAnteriores ?? this.doencasAnteriores,
        alergias: alergias ?? this.alergias,
        tempoEvolucao: tempoEvolucao ?? this.tempoEvolucao,
        tipoEvolucao: tipoEvolucao ?? this.tipoEvolucao,
        ambiente: ambiente ?? this.ambiente,
        fugiuRecentemente: fugiuRecentemente ?? this.fugiuRecentemente,
        pulgas: pulgas ?? this.pulgas,
        carrapatos: carrapatos ?? this.carrapatos,
        vacina: vacina ?? this.vacina,
        vermifugaco: vermifugaco ?? this.vermifugaco,
        cadastro: cadastro ?? this.cadastro,
      );
  @override
  String toString() {
    return (StringBuffer('Anamnese(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('queixaPrincipal: $queixaPrincipal, ')
          ..write('alimentacao: $alimentacao, ')
          ..write('doencasAnteriores: $doencasAnteriores, ')
          ..write('alergias: $alergias, ')
          ..write('tempoEvolucao: $tempoEvolucao, ')
          ..write('tipoEvolucao: $tipoEvolucao, ')
          ..write('ambiente: $ambiente, ')
          ..write('fugiuRecentemente: $fugiuRecentemente, ')
          ..write('pulgas: $pulgas, ')
          ..write('carrapatos: $carrapatos, ')
          ..write('vacina: $vacina, ')
          ..write('vermifugaco: $vermifugaco, ')
          ..write('cadastro: $cadastro')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      petId,
      queixaPrincipal,
      alimentacao,
      doencasAnteriores,
      alergias,
      tempoEvolucao,
      tipoEvolucao,
      ambiente,
      fugiuRecentemente,
      pulgas,
      carrapatos,
      vacina,
      vermifugaco,
      cadastro);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Anamnese &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.queixaPrincipal == this.queixaPrincipal &&
          other.alimentacao == this.alimentacao &&
          other.doencasAnteriores == this.doencasAnteriores &&
          other.alergias == this.alergias &&
          other.tempoEvolucao == this.tempoEvolucao &&
          other.tipoEvolucao == this.tipoEvolucao &&
          other.ambiente == this.ambiente &&
          other.fugiuRecentemente == this.fugiuRecentemente &&
          other.pulgas == this.pulgas &&
          other.carrapatos == this.carrapatos &&
          other.vacina == this.vacina &&
          other.vermifugaco == this.vermifugaco &&
          other.cadastro == this.cadastro);
}

class AnamnesesCompanion extends UpdateCompanion<Anamnese> {
  final Value<int> id;
  final Value<int> petId;
  final Value<String> queixaPrincipal;
  final Value<String> alimentacao;
  final Value<String> doencasAnteriores;
  final Value<String> alergias;
  final Value<String> tempoEvolucao;
  final Value<String> tipoEvolucao;
  final Value<String> ambiente;
  final Value<bool> fugiuRecentemente;
  final Value<bool> pulgas;
  final Value<bool> carrapatos;
  final Value<String> vacina;
  final Value<String> vermifugaco;
  final Value<DateTime> cadastro;
  const AnamnesesCompanion({
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.queixaPrincipal = const Value.absent(),
    this.alimentacao = const Value.absent(),
    this.doencasAnteriores = const Value.absent(),
    this.alergias = const Value.absent(),
    this.tempoEvolucao = const Value.absent(),
    this.tipoEvolucao = const Value.absent(),
    this.ambiente = const Value.absent(),
    this.fugiuRecentemente = const Value.absent(),
    this.pulgas = const Value.absent(),
    this.carrapatos = const Value.absent(),
    this.vacina = const Value.absent(),
    this.vermifugaco = const Value.absent(),
    this.cadastro = const Value.absent(),
  });
  AnamnesesCompanion.insert({
    this.id = const Value.absent(),
    required int petId,
    required String queixaPrincipal,
    required String alimentacao,
    required String doencasAnteriores,
    required String alergias,
    required String tempoEvolucao,
    required String tipoEvolucao,
    required String ambiente,
    required bool fugiuRecentemente,
    required bool pulgas,
    required bool carrapatos,
    required String vacina,
    required String vermifugaco,
    required DateTime cadastro,
  })  : petId = Value(petId),
        queixaPrincipal = Value(queixaPrincipal),
        alimentacao = Value(alimentacao),
        doencasAnteriores = Value(doencasAnteriores),
        alergias = Value(alergias),
        tempoEvolucao = Value(tempoEvolucao),
        tipoEvolucao = Value(tipoEvolucao),
        ambiente = Value(ambiente),
        fugiuRecentemente = Value(fugiuRecentemente),
        pulgas = Value(pulgas),
        carrapatos = Value(carrapatos),
        vacina = Value(vacina),
        vermifugaco = Value(vermifugaco),
        cadastro = Value(cadastro);
  static Insertable<Anamnese> custom({
    Expression<int>? id,
    Expression<int>? petId,
    Expression<String>? queixaPrincipal,
    Expression<String>? alimentacao,
    Expression<String>? doencasAnteriores,
    Expression<String>? alergias,
    Expression<String>? tempoEvolucao,
    Expression<String>? tipoEvolucao,
    Expression<String>? ambiente,
    Expression<bool>? fugiuRecentemente,
    Expression<bool>? pulgas,
    Expression<bool>? carrapatos,
    Expression<String>? vacina,
    Expression<String>? vermifugaco,
    Expression<DateTime>? cadastro,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (queixaPrincipal != null) 'queixa_principal': queixaPrincipal,
      if (alimentacao != null) 'alimentacao': alimentacao,
      if (doencasAnteriores != null) 'doencas_anteriores': doencasAnteriores,
      if (alergias != null) 'alergias': alergias,
      if (tempoEvolucao != null) 'tempo_evolucao': tempoEvolucao,
      if (tipoEvolucao != null) 'tipo_evolucao': tipoEvolucao,
      if (ambiente != null) 'ambiente': ambiente,
      if (fugiuRecentemente != null) 'fugiu_recentemente': fugiuRecentemente,
      if (pulgas != null) 'pulgas': pulgas,
      if (carrapatos != null) 'carrapatos': carrapatos,
      if (vacina != null) 'vacina': vacina,
      if (vermifugaco != null) 'vermifugaco': vermifugaco,
      if (cadastro != null) 'cadastro': cadastro,
    });
  }

  AnamnesesCompanion copyWith(
      {Value<int>? id,
      Value<int>? petId,
      Value<String>? queixaPrincipal,
      Value<String>? alimentacao,
      Value<String>? doencasAnteriores,
      Value<String>? alergias,
      Value<String>? tempoEvolucao,
      Value<String>? tipoEvolucao,
      Value<String>? ambiente,
      Value<bool>? fugiuRecentemente,
      Value<bool>? pulgas,
      Value<bool>? carrapatos,
      Value<String>? vacina,
      Value<String>? vermifugaco,
      Value<DateTime>? cadastro}) {
    return AnamnesesCompanion(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      queixaPrincipal: queixaPrincipal ?? this.queixaPrincipal,
      alimentacao: alimentacao ?? this.alimentacao,
      doencasAnteriores: doencasAnteriores ?? this.doencasAnteriores,
      alergias: alergias ?? this.alergias,
      tempoEvolucao: tempoEvolucao ?? this.tempoEvolucao,
      tipoEvolucao: tipoEvolucao ?? this.tipoEvolucao,
      ambiente: ambiente ?? this.ambiente,
      fugiuRecentemente: fugiuRecentemente ?? this.fugiuRecentemente,
      pulgas: pulgas ?? this.pulgas,
      carrapatos: carrapatos ?? this.carrapatos,
      vacina: vacina ?? this.vacina,
      vermifugaco: vermifugaco ?? this.vermifugaco,
      cadastro: cadastro ?? this.cadastro,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<int>(petId.value);
    }
    if (queixaPrincipal.present) {
      map['queixa_principal'] = Variable<String>(queixaPrincipal.value);
    }
    if (alimentacao.present) {
      map['alimentacao'] = Variable<String>(alimentacao.value);
    }
    if (doencasAnteriores.present) {
      map['doencas_anteriores'] = Variable<String>(doencasAnteriores.value);
    }
    if (alergias.present) {
      map['alergias'] = Variable<String>(alergias.value);
    }
    if (tempoEvolucao.present) {
      map['tempo_evolucao'] = Variable<String>(tempoEvolucao.value);
    }
    if (tipoEvolucao.present) {
      map['tipo_evolucao'] = Variable<String>(tipoEvolucao.value);
    }
    if (ambiente.present) {
      map['ambiente'] = Variable<String>(ambiente.value);
    }
    if (fugiuRecentemente.present) {
      map['fugiu_recentemente'] = Variable<bool>(fugiuRecentemente.value);
    }
    if (pulgas.present) {
      map['pulgas'] = Variable<bool>(pulgas.value);
    }
    if (carrapatos.present) {
      map['carrapatos'] = Variable<bool>(carrapatos.value);
    }
    if (vacina.present) {
      map['vacina'] = Variable<String>(vacina.value);
    }
    if (vermifugaco.present) {
      map['vermifugaco'] = Variable<String>(vermifugaco.value);
    }
    if (cadastro.present) {
      map['cadastro'] = Variable<DateTime>(cadastro.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnamnesesCompanion(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('queixaPrincipal: $queixaPrincipal, ')
          ..write('alimentacao: $alimentacao, ')
          ..write('doencasAnteriores: $doencasAnteriores, ')
          ..write('alergias: $alergias, ')
          ..write('tempoEvolucao: $tempoEvolucao, ')
          ..write('tipoEvolucao: $tipoEvolucao, ')
          ..write('ambiente: $ambiente, ')
          ..write('fugiuRecentemente: $fugiuRecentemente, ')
          ..write('pulgas: $pulgas, ')
          ..write('carrapatos: $carrapatos, ')
          ..write('vacina: $vacina, ')
          ..write('vermifugaco: $vermifugaco, ')
          ..write('cadastro: $cadastro')
          ..write(')'))
        .toString();
  }
}

class $VacinasTable extends Vacinas with TableInfo<$VacinasTable, Vacina> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VacinasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 60),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _descricaoMeta =
      const VerificationMeta('descricao');
  @override
  late final GeneratedColumn<String> descricao = GeneratedColumn<String>(
      'descricao', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 300),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _periodoDosesMeta =
      const VerificationMeta('periodoDoses');
  @override
  late final GeneratedColumn<String> periodoDoses = GeneratedColumn<String>(
      'periodo_doses', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 300),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, nome, descricao, periodoDoses];
  @override
  String get aliasedName => _alias ?? 'vacinas';
  @override
  String get actualTableName => 'vacinas';
  @override
  VerificationContext validateIntegrity(Insertable<Vacina> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('descricao')) {
      context.handle(_descricaoMeta,
          descricao.isAcceptableOrUnknown(data['descricao']!, _descricaoMeta));
    } else if (isInserting) {
      context.missing(_descricaoMeta);
    }
    if (data.containsKey('periodo_doses')) {
      context.handle(
          _periodoDosesMeta,
          periodoDoses.isAcceptableOrUnknown(
              data['periodo_doses']!, _periodoDosesMeta));
    } else if (isInserting) {
      context.missing(_periodoDosesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Vacina map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Vacina(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome'])!,
      descricao: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}descricao'])!,
      periodoDoses: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}periodo_doses'])!,
    );
  }

  @override
  $VacinasTable createAlias(String alias) {
    return $VacinasTable(attachedDatabase, alias);
  }
}

class Vacina extends DataClass implements Insertable<Vacina> {
  final int id;
  final String nome;
  final String descricao;
  final String periodoDoses;
  const Vacina(
      {required this.id,
      required this.nome,
      required this.descricao,
      required this.periodoDoses});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    map['descricao'] = Variable<String>(descricao);
    map['periodo_doses'] = Variable<String>(periodoDoses);
    return map;
  }

  VacinasCompanion toCompanion(bool nullToAbsent) {
    return VacinasCompanion(
      id: Value(id),
      nome: Value(nome),
      descricao: Value(descricao),
      periodoDoses: Value(periodoDoses),
    );
  }

  factory Vacina.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Vacina(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      descricao: serializer.fromJson<String>(json['descricao']),
      periodoDoses: serializer.fromJson<String>(json['periodoDoses']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'descricao': serializer.toJson<String>(descricao),
      'periodoDoses': serializer.toJson<String>(periodoDoses),
    };
  }

  Vacina copyWith(
          {int? id, String? nome, String? descricao, String? periodoDoses}) =>
      Vacina(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        descricao: descricao ?? this.descricao,
        periodoDoses: periodoDoses ?? this.periodoDoses,
      );
  @override
  String toString() {
    return (StringBuffer('Vacina(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('descricao: $descricao, ')
          ..write('periodoDoses: $periodoDoses')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, descricao, periodoDoses);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Vacina &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.descricao == this.descricao &&
          other.periodoDoses == this.periodoDoses);
}

class VacinasCompanion extends UpdateCompanion<Vacina> {
  final Value<int> id;
  final Value<String> nome;
  final Value<String> descricao;
  final Value<String> periodoDoses;
  const VacinasCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.descricao = const Value.absent(),
    this.periodoDoses = const Value.absent(),
  });
  VacinasCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    required String descricao,
    required String periodoDoses,
  })  : nome = Value(nome),
        descricao = Value(descricao),
        periodoDoses = Value(periodoDoses);
  static Insertable<Vacina> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<String>? descricao,
    Expression<String>? periodoDoses,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (descricao != null) 'descricao': descricao,
      if (periodoDoses != null) 'periodo_doses': periodoDoses,
    });
  }

  VacinasCompanion copyWith(
      {Value<int>? id,
      Value<String>? nome,
      Value<String>? descricao,
      Value<String>? periodoDoses}) {
    return VacinasCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      periodoDoses: periodoDoses ?? this.periodoDoses,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (descricao.present) {
      map['descricao'] = Variable<String>(descricao.value);
    }
    if (periodoDoses.present) {
      map['periodo_doses'] = Variable<String>(periodoDoses.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VacinasCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('descricao: $descricao, ')
          ..write('periodoDoses: $periodoDoses')
          ..write(')'))
        .toString();
  }
}

class $VacinacaosTable extends Vacinacaos
    with TableInfo<$VacinacaosTable, Vacinacao> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VacinacaosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<int> petId = GeneratedColumn<int>(
      'pet_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES pets(id)');
  static const VerificationMeta _vacinaIdMeta =
      const VerificationMeta('vacinaId');
  @override
  late final GeneratedColumn<int> vacinaId = GeneratedColumn<int>(
      'vacina_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES vacinas(id)');
  static const VerificationMeta _vaterinarioMeta =
      const VerificationMeta('vaterinario');
  @override
  late final GeneratedColumn<String> vaterinario = GeneratedColumn<String>(
      'vaterinario', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 60),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _dataHoraMeta =
      const VerificationMeta('dataHora');
  @override
  late final GeneratedColumn<DateTime> dataHora = GeneratedColumn<DateTime>(
      'data_hora', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _retornoMeta =
      const VerificationMeta('retorno');
  @override
  late final GeneratedColumn<DateTime> retorno = GeneratedColumn<DateTime>(
      'retorno', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _doseMeta = const VerificationMeta('dose');
  @override
  late final GeneratedColumn<int> dose = GeneratedColumn<int>(
      'dose', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _loteMeta = const VerificationMeta('lote');
  @override
  late final GeneratedColumn<int> lote = GeneratedColumn<int>(
      'lote', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [petId, vacinaId, vaterinario, dataHora, retorno, dose, lote];
  @override
  String get aliasedName => _alias ?? 'vacinacaos';
  @override
  String get actualTableName => 'vacinacaos';
  @override
  VerificationContext validateIntegrity(Insertable<Vacinacao> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pet_id')) {
      context.handle(
          _petIdMeta, petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta));
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('vacina_id')) {
      context.handle(_vacinaIdMeta,
          vacinaId.isAcceptableOrUnknown(data['vacina_id']!, _vacinaIdMeta));
    } else if (isInserting) {
      context.missing(_vacinaIdMeta);
    }
    if (data.containsKey('vaterinario')) {
      context.handle(
          _vaterinarioMeta,
          vaterinario.isAcceptableOrUnknown(
              data['vaterinario']!, _vaterinarioMeta));
    } else if (isInserting) {
      context.missing(_vaterinarioMeta);
    }
    if (data.containsKey('data_hora')) {
      context.handle(_dataHoraMeta,
          dataHora.isAcceptableOrUnknown(data['data_hora']!, _dataHoraMeta));
    } else if (isInserting) {
      context.missing(_dataHoraMeta);
    }
    if (data.containsKey('retorno')) {
      context.handle(_retornoMeta,
          retorno.isAcceptableOrUnknown(data['retorno']!, _retornoMeta));
    } else if (isInserting) {
      context.missing(_retornoMeta);
    }
    if (data.containsKey('dose')) {
      context.handle(
          _doseMeta, dose.isAcceptableOrUnknown(data['dose']!, _doseMeta));
    } else if (isInserting) {
      context.missing(_doseMeta);
    }
    if (data.containsKey('lote')) {
      context.handle(
          _loteMeta, lote.isAcceptableOrUnknown(data['lote']!, _loteMeta));
    } else if (isInserting) {
      context.missing(_loteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Vacinacao map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Vacinacao(
      petId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pet_id'])!,
      vacinaId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vacina_id'])!,
      vaterinario: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vaterinario'])!,
      dataHora: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}data_hora'])!,
      retorno: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}retorno'])!,
      dose: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dose'])!,
      lote: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}lote'])!,
    );
  }

  @override
  $VacinacaosTable createAlias(String alias) {
    return $VacinacaosTable(attachedDatabase, alias);
  }
}

class Vacinacao extends DataClass implements Insertable<Vacinacao> {
  final int petId;
  final int vacinaId;
  final String vaterinario;
  final DateTime dataHora;
  final DateTime retorno;
  final int dose;
  final int lote;
  const Vacinacao(
      {required this.petId,
      required this.vacinaId,
      required this.vaterinario,
      required this.dataHora,
      required this.retorno,
      required this.dose,
      required this.lote});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pet_id'] = Variable<int>(petId);
    map['vacina_id'] = Variable<int>(vacinaId);
    map['vaterinario'] = Variable<String>(vaterinario);
    map['data_hora'] = Variable<DateTime>(dataHora);
    map['retorno'] = Variable<DateTime>(retorno);
    map['dose'] = Variable<int>(dose);
    map['lote'] = Variable<int>(lote);
    return map;
  }

  VacinacaosCompanion toCompanion(bool nullToAbsent) {
    return VacinacaosCompanion(
      petId: Value(petId),
      vacinaId: Value(vacinaId),
      vaterinario: Value(vaterinario),
      dataHora: Value(dataHora),
      retorno: Value(retorno),
      dose: Value(dose),
      lote: Value(lote),
    );
  }

  factory Vacinacao.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Vacinacao(
      petId: serializer.fromJson<int>(json['petId']),
      vacinaId: serializer.fromJson<int>(json['vacinaId']),
      vaterinario: serializer.fromJson<String>(json['vaterinario']),
      dataHora: serializer.fromJson<DateTime>(json['dataHora']),
      retorno: serializer.fromJson<DateTime>(json['retorno']),
      dose: serializer.fromJson<int>(json['dose']),
      lote: serializer.fromJson<int>(json['lote']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'petId': serializer.toJson<int>(petId),
      'vacinaId': serializer.toJson<int>(vacinaId),
      'vaterinario': serializer.toJson<String>(vaterinario),
      'dataHora': serializer.toJson<DateTime>(dataHora),
      'retorno': serializer.toJson<DateTime>(retorno),
      'dose': serializer.toJson<int>(dose),
      'lote': serializer.toJson<int>(lote),
    };
  }

  Vacinacao copyWith(
          {int? petId,
          int? vacinaId,
          String? vaterinario,
          DateTime? dataHora,
          DateTime? retorno,
          int? dose,
          int? lote}) =>
      Vacinacao(
        petId: petId ?? this.petId,
        vacinaId: vacinaId ?? this.vacinaId,
        vaterinario: vaterinario ?? this.vaterinario,
        dataHora: dataHora ?? this.dataHora,
        retorno: retorno ?? this.retorno,
        dose: dose ?? this.dose,
        lote: lote ?? this.lote,
      );
  @override
  String toString() {
    return (StringBuffer('Vacinacao(')
          ..write('petId: $petId, ')
          ..write('vacinaId: $vacinaId, ')
          ..write('vaterinario: $vaterinario, ')
          ..write('dataHora: $dataHora, ')
          ..write('retorno: $retorno, ')
          ..write('dose: $dose, ')
          ..write('lote: $lote')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(petId, vacinaId, vaterinario, dataHora, retorno, dose, lote);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Vacinacao &&
          other.petId == this.petId &&
          other.vacinaId == this.vacinaId &&
          other.vaterinario == this.vaterinario &&
          other.dataHora == this.dataHora &&
          other.retorno == this.retorno &&
          other.dose == this.dose &&
          other.lote == this.lote);
}

class VacinacaosCompanion extends UpdateCompanion<Vacinacao> {
  final Value<int> petId;
  final Value<int> vacinaId;
  final Value<String> vaterinario;
  final Value<DateTime> dataHora;
  final Value<DateTime> retorno;
  final Value<int> dose;
  final Value<int> lote;
  final Value<int> rowid;
  const VacinacaosCompanion({
    this.petId = const Value.absent(),
    this.vacinaId = const Value.absent(),
    this.vaterinario = const Value.absent(),
    this.dataHora = const Value.absent(),
    this.retorno = const Value.absent(),
    this.dose = const Value.absent(),
    this.lote = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VacinacaosCompanion.insert({
    required int petId,
    required int vacinaId,
    required String vaterinario,
    required DateTime dataHora,
    required DateTime retorno,
    required int dose,
    required int lote,
    this.rowid = const Value.absent(),
  })  : petId = Value(petId),
        vacinaId = Value(vacinaId),
        vaterinario = Value(vaterinario),
        dataHora = Value(dataHora),
        retorno = Value(retorno),
        dose = Value(dose),
        lote = Value(lote);
  static Insertable<Vacinacao> custom({
    Expression<int>? petId,
    Expression<int>? vacinaId,
    Expression<String>? vaterinario,
    Expression<DateTime>? dataHora,
    Expression<DateTime>? retorno,
    Expression<int>? dose,
    Expression<int>? lote,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (petId != null) 'pet_id': petId,
      if (vacinaId != null) 'vacina_id': vacinaId,
      if (vaterinario != null) 'vaterinario': vaterinario,
      if (dataHora != null) 'data_hora': dataHora,
      if (retorno != null) 'retorno': retorno,
      if (dose != null) 'dose': dose,
      if (lote != null) 'lote': lote,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VacinacaosCompanion copyWith(
      {Value<int>? petId,
      Value<int>? vacinaId,
      Value<String>? vaterinario,
      Value<DateTime>? dataHora,
      Value<DateTime>? retorno,
      Value<int>? dose,
      Value<int>? lote,
      Value<int>? rowid}) {
    return VacinacaosCompanion(
      petId: petId ?? this.petId,
      vacinaId: vacinaId ?? this.vacinaId,
      vaterinario: vaterinario ?? this.vaterinario,
      dataHora: dataHora ?? this.dataHora,
      retorno: retorno ?? this.retorno,
      dose: dose ?? this.dose,
      lote: lote ?? this.lote,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (petId.present) {
      map['pet_id'] = Variable<int>(petId.value);
    }
    if (vacinaId.present) {
      map['vacina_id'] = Variable<int>(vacinaId.value);
    }
    if (vaterinario.present) {
      map['vaterinario'] = Variable<String>(vaterinario.value);
    }
    if (dataHora.present) {
      map['data_hora'] = Variable<DateTime>(dataHora.value);
    }
    if (retorno.present) {
      map['retorno'] = Variable<DateTime>(retorno.value);
    }
    if (dose.present) {
      map['dose'] = Variable<int>(dose.value);
    }
    if (lote.present) {
      map['lote'] = Variable<int>(lote.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VacinacaosCompanion(')
          ..write('petId: $petId, ')
          ..write('vacinaId: $vacinaId, ')
          ..write('vaterinario: $vaterinario, ')
          ..write('dataHora: $dataHora, ')
          ..write('retorno: $retorno, ')
          ..write('dose: $dose, ')
          ..write('lote: $lote, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $UsuariosTable usuarios = $UsuariosTable(this);
  late final $PetsTable pets = $PetsTable(this);
  late final $AnamnesesTable anamneses = $AnamnesesTable(this);
  late final $VacinasTable vacinas = $VacinasTable(this);
  late final $VacinacaosTable vacinacaos = $VacinacaosTable(this);
  late final UsuariosDao usuariosDao = UsuariosDao(this as AppDatabase);
  late final PetsDao petsDao = PetsDao(this as AppDatabase);
  late final AnamnesesDao anamnesesDao = AnamnesesDao(this as AppDatabase);
  late final VacinasDao vacinasDao = VacinasDao(this as AppDatabase);
  late final VacinacaosDao vacinacaosDao = VacinacaosDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [usuarios, pets, anamneses, vacinas, vacinacaos];
}

mixin _$UsuariosDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsuariosTable get usuarios => attachedDatabase.usuarios;
}
mixin _$PetsDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsuariosTable get usuarios => attachedDatabase.usuarios;
  $PetsTable get pets => attachedDatabase.pets;
}
mixin _$AnamnesesDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsuariosTable get usuarios => attachedDatabase.usuarios;
  $PetsTable get pets => attachedDatabase.pets;
  $AnamnesesTable get anamneses => attachedDatabase.anamneses;
}
mixin _$VacinasDaoMixin on DatabaseAccessor<AppDatabase> {
  $VacinasTable get vacinas => attachedDatabase.vacinas;
}
mixin _$VacinacaosDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsuariosTable get usuarios => attachedDatabase.usuarios;
  $PetsTable get pets => attachedDatabase.pets;
  $VacinasTable get vacinas => attachedDatabase.vacinas;
  $VacinacaosTable get vacinacaos => attachedDatabase.vacinacaos;
}
