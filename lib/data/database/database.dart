import 'package:drift/drift.dart';

import 'dart:io';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Usuarios extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text().withLength(min: 1, max: 60)();
  TextColumn get email => text().withLength(min: 3, max: 100).unique()();
  TextColumn get celular => text().withLength(max: 20).nullable()();
  TextColumn get foto => text().withLength(max: 100).nullable()();
  TextColumn get endereco => text().withLength(min: 1, max: 50)();
  TextColumn get senha => text().withLength(max: 100)();
}

class Pets extends Table {
  IntColumn get id  => integer().autoIncrement()();
  IntColumn get usuarioId => integer().customConstraint('NOT NULL REFERENCES usuarios(id)')();
  TextColumn get nome => text().withLength(min: 1, max: 60)();
  RealColumn get peso => real()();
  RealColumn get idade => real()();
  TextColumn get raca => text().withLength(min: 1, max: 60)();
  DateTimeColumn get nascimento => dateTime()();
  TextColumn get especie => text().withLength(min: 1, max: 60)();
  TextColumn get sexo => text().withLength(min: 1, max: 20)();
  TextColumn get naturalidade => text().withLength(min: 1, max: 30)();
  DateTimeColumn get cadastro => dateTime()();
}

class Anamneses extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get petId => integer().customConstraint('NOT NULL REFERENCES pets(id)')();
  TextColumn get queixaPrincipal => text().withLength(min: 1, max: 300)();
  TextColumn get alimentacao => text().withLength(min: 1, max: 100)();
  TextColumn get doencasAnteriores => text().withLength(min: 1, max: 200)();
  TextColumn get alergias => text().withLength(min: 1, max: 100)();
  TextColumn get tempoEvolucao => text().withLength(min: 1, max: 50)();
  TextColumn get tipoEvolucao => text().withLength(min: 1, max: 20)();
  TextColumn get ambiente => text().withLength(min: 1, max: 100)();
  BoolColumn get fugiuRecentemente => boolean()();
  BoolColumn get pulgas => boolean()();
  BoolColumn get carrapatos => boolean()();
  TextColumn get vacina => text().withLength(min: 1, max: 100)();
  TextColumn get vermifugaco => text().withLength(min: 1, max: 100)();
  DateTimeColumn get cadastro => dateTime()();
}

class Vacinas extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text().withLength(min: 1, max: 60).unique()();
  TextColumn get descricao => text().withLength(min: 1, max: 500)();
  TextColumn get periodoDoses => text().withLength(min: 1, max: 500)();
}

class Vacinacaos extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get petId => integer().customConstraint('NOT NULL REFERENCES pets(id)')();
  IntColumn get vacinaId => integer().customConstraint('NOT NULL REFERENCES vacinas(id)')();
  TextColumn get vaterinario => text().withLength(min: 1, max: 60)();
  DateTimeColumn get dataHora => dateTime()();
  DateTimeColumn get retorno => dateTime()();
  IntColumn get dose => integer()();
  IntColumn get lote => integer()();
}

@DriftDatabase(tables: [Usuarios, Pets, Anamneses, Vacinas, Vacinacaos], daos: [UsuariosDao, PetsDao, AnamnesesDao, VacinasDao, VacinacaosDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
        onUpgrade: (migrator, from, to) async {
          if (from == 1) {
            await migrator.createTable(pets);
            await migrator.createTable(anamneses);
            await migrator.createTable(vacinas);
            await migrator.createTable(vacinacaos);
          }
        },
      beforeOpen: (details) async {
        await customStatement("PRAGMA foreign_keys = ON");
      }
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

class Response<T> {
  final T? result;
  final String? message;
  Response({
    this.result,
    this.message
  });
}

@DriftAccessor(tables: [Usuarios])
class UsuariosDao extends DatabaseAccessor<AppDatabase> with _$UsuariosDaoMixin {
  UsuariosDao(AppDatabase db) : super(db);

  Future<int?> countUsuarios() async {
    final countExp = usuarios.id.count();
    final query = selectOnly(usuarios)..addColumns([countExp]);
    return await query.map((row) => row.read(countExp)).getSingle();
  }

  Future<Response<Usuario>> findUsuario(String email, String senha) async {
    Response<Usuario> resultado;

    try {
      final user = await (select(usuarios)
        ..where(
                (u) => u.email.equals(email) & u.senha.equals(senha)
        )).getSingleOrNull();
      if(user != null) {
        resultado = Response<Usuario>(result: user, message: null);
      } else {
        resultado = Response<Usuario>(result: null, message: "O email e/ou a senha estão errados");
      }

    } catch (exception) {
      resultado = Response<Usuario>(result: null, message: "Ocorreu um erro ao tentar fazer login, tente novamente");
    }
    return resultado;
  }

  Future<Response<Usuario>> cadastrarUsuario(Insertable<Usuario> usuario) async {
    Response<Usuario> resultado;

    try {
      final usuarioId = await into(usuarios).insert(usuario);
      final user = await (select(usuarios)
        ..where(
                (u) => u.id.equals(usuarioId)
        )
      ).getSingleOrNull();
      resultado = Response<Usuario>(result: user, message: null);
    } catch (exception) {
      if(exception is SqliteException) {
        resultado = Response<Usuario>(result: null, message: 'O email passado já foi cadastro para outro usuário, tente outro email');
      } else {
        resultado = Response<Usuario>(result: null, message: 'Ocorreu um erro ao cadastrar o usuário, tente novamente');
      }
    }
    
    return resultado;
  }

  Future<Response<bool>> updateUsuario(Insertable<Usuario> usuario) async {
    Response<bool> resultado;

    try {
      await update(usuarios).replace(usuario);
      resultado = Response<bool>(result: true, message: null);
    } catch (exception) {
      resultado = Response<bool>(result: false, message: 'Ocorreu um erro ao alterar sua conta, tente novamente');
    }

    return resultado;
  }

  Future<Response<bool>> deleteUsuario(Insertable<Usuario> usuario) async {
    Response<bool> resultado;

    try {
      await delete(usuarios).delete(usuario);
      resultado = Response<bool>(result: true, message: null);
    } catch (exception) {
      resultado = Response<bool>(result: false, message: 'Ocorreu um erro ao deletar sua conta, tente novamente');
    }

    return resultado;
  }
}

@DriftAccessor(tables: [Pets])
class PetsDao extends DatabaseAccessor<AppDatabase> with _$PetsDaoMixin {
  PetsDao(AppDatabase db) : super(db);

  Stream<List<Pet>> watchAllPetsUsuario(int usuarioId) {
    return (select(pets)
      ..where(
              (p) => p.usuarioId.equals(usuarioId)
      )
      ..orderBy([
              (p) => OrderingTerm(expression: p.nome)
      ])
    ).watch();
  }

  Future<Response<bool>> insertPet(Insertable<Pet> pet) async {
    Response<bool> resultado;

    try {
      await into(pets).insert(pet);
      resultado = Response<bool>(result: true, message: null);
    } catch (exception) {
      resultado = Response<bool>(result: false, message: "Ocorreu um erro ao cadastrar o pet, tente novamente");
    }

    return resultado;
  }

  Future<Response<bool>> updatePet(Insertable<Pet> pet) async {
    Response<bool> resultado;

    try {
      await update(pets).replace(pet);
      resultado = Response<bool>(result: true, message: null);
    } catch (exception) {
      resultado = Response<bool>(result: false, message: 'Ocorreu um erro ao alterar o pet, tente novamente');
    }

    return resultado;
  }

  Future<Response<bool>> deletePet(Insertable<Pet> pet) async {
    Response<bool> resultado;

    try {
      await delete(pets).delete(pet);
      resultado = Response<bool>(result: true, message: null);
    } catch (exception) {
      resultado = Response<bool>(result: false, message: 'Ocorreu um erro ao deletar o pet, tente novamente');
    }

    return resultado;
  }
}

@DriftAccessor(tables: [Anamneses])
class AnamnesesDao extends DatabaseAccessor<AppDatabase> with _$AnamnesesDaoMixin {
  AnamnesesDao(AppDatabase db) : super(db);

  Stream<List<Anamnese>> watchAllAnamnesesPet(int petId) {
    return (select(anamneses)
      ..where(
              (a) => a.petId.equals(petId)
      )
      ..orderBy([
              (a) => OrderingTerm(expression: a.cadastro, mode: OrderingMode.desc)
      ])
    ).watch();
  }

  Future<Response<bool>> insertAnamnese(Insertable<Anamnese> anamnese) async {
    Response<bool> resultado;

    try {
      await into(anamneses).insert(anamnese);
      resultado = Response<bool>(result: true, message: null);
    } catch (exception) {
      resultado = Response<bool>(result: false, message: "Ocorreu um erro ao cadastrar a anamnese, tente novamente");
    }

    return resultado;
  }

  Future<Response<bool>> deleteAnamnese(Insertable<Anamnese> anamnese) async {
    Response<bool> resultado;

    try {
      await delete(anamneses).delete(anamnese);
      resultado = Response<bool>(result: true, message: null);
    } catch (exception) {
      resultado = Response<bool>(result: false, message: 'Ocorreu um erro ao deletar a anamnese, tente novamente');
    }

    return resultado;
  }
}

@DriftAccessor(tables: [Vacinas])
class VacinasDao extends DatabaseAccessor<AppDatabase> with _$VacinasDaoMixin {
  VacinasDao(AppDatabase db) : super(db);

  Future<int?> countVacinas() async {
    final countExp = vacinas.id.count();
    final query = selectOnly(vacinas)..addColumns([countExp]);
    return await query.map((row) => row.read(countExp)).getSingle();
  }

  Stream<List<Vacina>> watchAllVacinas() {
    return (select(vacinas)
      ..orderBy([
              (v) => OrderingTerm(expression: v.nome)
      ])
    ).watch();
  }

  Future insertVacina(Insertable<Vacina> vacina) => into(vacinas).insert(vacina);
}

class VacinacaoWithVacina {
  final Vacinacao vacinacao;
  final Vacina vacina;

  VacinacaoWithVacina({
    required this.vacinacao,
    required this.vacina,
  });
}

@DriftAccessor(tables: [Vacinacaos, Vacinas])
class VacinacaosDao extends DatabaseAccessor<AppDatabase> with _$VacinacaosDaoMixin {
  VacinacaosDao(AppDatabase db) : super(db);

  Stream<List<VacinacaoWithVacina>> watchAllVacinacaoWithVacina(int idPet) {
    return (select(vacinacaos)
        ..where(
                (v) => v.petId.equals(idPet)
        )
        ..orderBy([
                (v) => OrderingTerm(expression: v.retorno, mode: OrderingMode.desc)
        ])
    ).join(
      [
        innerJoin(vacinas, vacinas.id.equalsExp(vacinacaos.vacinaId)),
      ],
    )
    .watch()
    .map(
        (rows) => rows.map(
            (row) {
              return VacinacaoWithVacina(
                vacinacao: row.readTable(vacinacaos),
                vacina:  row.readTable(vacinas)
              );
            },
        ).toList(),
    );
  }

  Future<Response<bool>> insertVacinacao(Insertable<Vacinacao> vacinacao) async {
    Response<bool> resultado;

    try {
      await into(vacinacaos).insert(vacinacao);
      resultado = Response<bool>(result: true, message: null);
    } catch (exception) {
      resultado = Response<bool>(result: false, message: "Ocorreu um erro ao cadastrar a vacinação, tente novamente");
    }

    return resultado;
  }

  Future<Response<bool>> deleteVacinacao(Insertable<Vacinacao> vacinacao) async {
    Response<bool> resultado;
    try {
      await delete(vacinacaos).delete(vacinacao);
      resultado = Response<bool>(result: true, message: null);
    } catch (exception) {
      resultado = Response<bool>(result: false,
          message: 'Ocorreu um erro ao deletar a vacinação, tente novamente');
    }

    return resultado;
  }
}