import 'dart:developer';

import 'package:supabase/supabase.dart';
import 'config.dart';
import 'model_stream.dart';

class Conecta {
  final client = SupabaseClient(supabaseUrl, supabaseKey);

  // Pacientes
/*
  Future<List<ClassPaciente>> getAll() async {
    log('Leu Pacientes 1');
    final response = await client
        .from('pacientes')
        .select()
        .order('pacNome', ascending: true)
        .execute();
    if (response.error == null) {
      final dataList = response.data as List;
      return (dataList.map((map) => ClassPaciente.fromJson(map)).toList());
    }
    log('Error fetching notes: ${response.error!.message}');
    return [];
  }

  Future addPaciente(campos) async {
    ClassPaciente pacientes = campos;
    Map<String, dynamic> pacienteJson = pacientes.toJson();
    log(pacienteJson.toString());
    await client
        .from('pacientes')
        .insert(pacienteJson)
        .execute()
        .then((value) => log(value.error.toString()));
  }

  Future updatePaciente(int idPaciente, String cidade) async {
    await client
        .from('pacientes')
        .update({'cidade': cidade})
        .eq('id', idPaciente)
        .execute();
  }

  favoritoPaciente(String pacUuId, bool favorito) async {
//    log(favorito.toString());
    await client
        .from('pacientes')
        .update({'pacFavorito': favorito})
        .eq('pacUuId', pacUuId)
        .execute()
        .then((value) => log('Favorito ok'));
  }

  Future deletePaciente(int idPaciente) async {
    await client.from('pacientes').delete().eq('id', idPaciente).execute();
  }

  Future<List<ClassPaciente>> getAll2() async {
    log('Leu Pacientes 3');
    final response = await client
        .from('pacientes')
        .select()
        .order('pacNome', ascending: true)
        .execute();
    if (response.error == null) {
      log('tem dados');
      final dataList = response.data as List;
      return (dataList.map((map) => ClassPaciente.fromJson(map)).toList());
    }
    log('Error fetching notes: ${response.error!.message}');
    return [];
  }

  Future<List<ClassUser>> getUsers() async {
    log('Leu Usuarios');
    final response = await client
        .from('usuarios')
        .select()
        .order('userNome', ascending: true)
        .execute();
    if (response.error == null) {
//      log(response.data.toString());
      final dataList = response.data as List;
      return (dataList.map((map) => ClassUser.fromJson(map)).toList());
    }
    log('Error fetching notes: ${response.error!.message}');
    return [];
  }

  Future<List> getAgenda() async {
    log('Leu Agenda 4');
    final response = await client.from('agenda').select().execute();
    if (response.error == null) {
      final dataList = response.data as List;
      return (dataList);
    }
    log('Error fetching notes: ${response.error!.message}');
    return [];
  }

  Future cancelAgenda(String agendaUuId, bool situacao) async {
    await client
        .from('agenda')
        .update({'agendaExcluido': true, 'agendaCancelado': situacao})
        .eq('agendaUuId', agendaUuId)
        .execute()
        .then((value) => log('ok'));
  }

  Future voltaAgenda() async {
    await client
        .from('agenda')
        .update({'agendaExcluido': false, 'agendaCancelado': false})
        .filter('agendaExcluido', 'eq', true)
        .execute()
        .then((value) => log('Volta OK'));
  }

  ouvir() {
    // ignore: unused_local_variable
    log('Inscrito');
    final mySubscription =
        client.from('teste').on(SupabaseEventTypes.all, (payload) {
      log('Dados foram Alterados');
      // Handle realtime payload
    }).subscribe();
    log(mySubscription.toString());
    log(mySubscription.params.toString());

    log('Inscri????o ${mySubscription.subscribe().toString()}');
  }

  sair() {
    log('Inscrito Sair');
    final nova = client.getSubscriptions();
    log(nova.toString());
    log(nova.length.toString());
//    log(nova.first.toString());
//    client.removeSubscription(nova.first);
  }

  lerTeste() {
    log('Leu Usuarios');
    final response = client.from('teste').select().execute();
    return (response);
  }

  updateTeste(valor) {
    log('Valor = $valor');
    client
        .from('teste')
        .update({'tesBool3': valor})
        .filter('tesInt3', 'eq', '111111')
        .execute();
  }
*/
  Future addTeste(campos) async {
    ClassStream teste = campos;
    Map<String, dynamic> testeJson = teste.toJson();
    log(testeJson.toString());
    await client
        .from('teste')
        .insert(testeJson)
        .execute()
        .then((value) => log(value.error.toString()));
  }
/*
  Future<List<ClassVotos>> getVotos() async {
    final response = await client
        .from('votos')
        .select()
        .order('votosNome', ascending: true)
        .execute();
    if (response.error == null) {
      final dataList = response.data as List;
      return (dataList.map((map) => ClassVotos.fromJson(map)).toList());
    }
    return [];
  }

  rpc6(String nome) async {
    final response =
        await client.rpc('votos', params: {'nome': nome}).execute();
    log(response.data.toString());
    return response.data;
  }

  Future<List<ClassEncrypt>> getEncrypt() async {
    final response = await client
        .from('encrypt')
        .select()
        .order('encNome', ascending: true)
        .execute();
    if (response.error == null) {
      final dataList = response.data as List;
      return (dataList.map((map) => ClassEncrypt.fromJson(map)).toList());
    }
    return [];
  }

  rpc7(String nome) async {
    final response =
        await client.rpc('registros', params: {'nome': 'teste'}).execute();
    if (response.data == null) {
      return 0;
    }
    return response.data;
  }

  rpc8(String nome) async {
    final response =
        await client.rpc('temregistro2', params: {'nome': nome}).execute();
    return response.data;
  }

//    log('Retorno Count: ${response.count.toString()}');
//    log('Retorno Error: ${response.error.toString()}');
//    log('Retorno Status: ${response.status.toString()}');
//    log('Retorno Data: ${response.data.toString()}');
//    log('Retorno Response: ${response.toString()}');
//    log(response.data.toString());
//    log(response.error.toString());
//    log(response.status.toString());
//    log(response.data.toString());
//    log(response.error.toString());
//    log(response.status.toString());
*/
}
