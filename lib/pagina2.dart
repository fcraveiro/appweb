import 'dart:developer';
import 'package:appweb/conectar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '/model_stream.dart';
import '/config.dart';
import 'package:supabase/supabase.dart';

class Stream extends StatefulWidget {
  const Stream({Key? key}) : super(key: key);

  @override
  _FormTesteState createState() => _FormTesteState();
}

final client = SupabaseClient(supabaseUrl, supabaseKey);
int indexa2 = 0;
bool valor = true;

class _FormTesteState extends State<Stream> {
  Conecta conectar = Conecta();

  List<ClassStream> challengeModelList = [];

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'DashBoard Orçamentos',
          style: GoogleFonts.montserratAlternates(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.0,
          ),
        ),
        actions: [
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () => {
//                  conectar.ouvir(),
                },
                child: const FaIcon(
                  Icons.subscriptions,
                  size: 16,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () => {
                  marca(),
//                  valor = !valor,
//                  conectar.updateTeste(valor),
                },
                child: const FaIcon(
                  FontAwesomeIcons.plus,
                  size: 16,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          )
        ],
        centerTitle: true,
        backgroundColor: const Color(0xFF48426D),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 0,
              ),
              Expanded(
                child: StreamBuilder<List<Map<String, dynamic>>>(
                    stream: client
                        .from('teste')
                        .stream(['streamUuId'])
                        .order('streamData', ascending: false)
                        .execute(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return const Text('Erro');
                      } else {
                        log('Retorno ${snapshot.data.toString()}');
                        indexa2++;
                        log(indexa2.toString());
                        challengeModelList = [];
                        for (var data in snapshot.data!) {
                          challengeModelList.add(ClassStream.fromJson(data));
                          log(data.toString());
                        }
                        return ListView.builder(
                          itemCount: challengeModelList.length,
                          itemBuilder: (BuildContext context, index) {
                            var teste =
                                challengeModelList[index].streamNome.toString();
                            return ListTile(
                              leading: CircleAvatar(
                                child: Text(
                                  teste.substring(0, 1).toUpperCase(),
                                ),
                              ),
                              title: Text(
                                challengeModelList[index].streamNome.toString(),
                                style: GoogleFonts.nunito(
                                  fontSize: 16,
                                ),
                              ),
                              trailing: GestureDetector(
                                onTap: () => {
                                  showDialogFunc(
                                    context,
                                    challengeModelList[index].streamThumb,
                                    challengeModelList[index]
                                        .streamNome
                                        .toString(),
                                    challengeModelList[index]
                                        .streamNome
                                        .toString(),
                                  ),
                                },
                                child: Image.network(
                                    challengeModelList[index].streamThumb),
                              ),
                            );
                          },
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  marca() {
    final campos = ClassStream(
      streamUuId: '',
      streamNome: 'João e José',
      streamFoto: 'http e tal',
      streamThumb:
          'https://xrhyhsbetlnzksauwrvi.supabase.in/storage/v1/object/public/fotos/2022-02-17-06-11-37-thumb.jpg',
      streamInt: 1,
      streamBool: true,
    );
    conectar.addTeste(campos);
  }
}

// This is a block of Model Dialog
showDialogFunc(context, img, title, desc) {
  var xheight = MediaQuery.of(context).size.height;
  var xwidth = MediaQuery.of(context).size.width;

  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(25),
            width: xwidth * 0.3,
            height: xheight * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        img,
                        width: xwidth * .35,
                        height: xheight * .60,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: xwidth * .24,
                  height: 45,
//                  color: Colors.amber,
                  alignment: Alignment.topCenter,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 44, 8, 58),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    desc,
                    maxLines: 3,
                    style: const TextStyle(
                        fontSize: 15, color: Color.fromARGB(255, 58, 4, 109)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
