class ClassStream {
  String? streamUuId;
  String streamNome;
  String streamFoto;
  String streamThumb;
  int streamInt;
  bool streamBool;
  DateTime? streamData;

  ClassStream({
    required this.streamUuId,
    required this.streamNome,
    required this.streamFoto,
    required this.streamThumb,
    required this.streamInt,
    required this.streamBool,
    this.streamData,
  });

  factory ClassStream.fromJson(Map<String, dynamic> map) {
    return ClassStream(
      streamUuId: map['streamUuId'.toString()],
      streamNome: map['streamNome'.toString()],
      streamFoto: map['streamFoto'.toString()],
      streamThumb: map['streamThumb'.toString()],
      streamInt: map['streamInt'],
      streamBool: map['streamBool'],
//      tesHora: map[DateTime.fromMillisecondsSinceEpoch(map['tesHora'])],
//      tesHora: map['tesHora'],
    );
  }

  Map<String, dynamic> toJson() => {
        'streamNome': streamNome,
        'streamFoto': streamFoto,
        'streamThumb': streamThumb,
        'streamInt': streamInt,
        'streamBool': streamBool,
      };
}
