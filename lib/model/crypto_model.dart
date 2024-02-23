
import 'dart:convert';

CryptoModel cryptoModelFromJson(String str) => CryptoModel.fromJson(json.decode(str));

String cryptoModelToJson(CryptoModel data) => json.encode(data.toJson());

class CryptoModel {
  String cryptoModelE;
  int e;
  String s;
  int cryptoModelT;
  String p;
  String q;
  int b;
  int a;
  int t;
  bool cryptoModelM;
  bool m;

  CryptoModel({
    required this.cryptoModelE,
    required this.e,
    required this.s,
    required this.cryptoModelT,
    required this.p,
    required this.q,
    required this.b,
    required this.a,
    required this.t,
    required this.cryptoModelM,
    required this.m,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) => CryptoModel(
    cryptoModelE: json["e"],
    e: json["E"],
    s: json["s"],
    cryptoModelT: json["t"],
    p: json["p"],
    q: json["q"],
    b: json["b"],
    a: json["a"],
    t: json["T"],
    cryptoModelM: json["m"],
    m: json["M"],
  );

  Map<String, dynamic> toJson() => {
    "e": cryptoModelE,
    "E": e,
    "s": s,
    "t": cryptoModelT,
    "p": p,
    "q": q,
    "b": b,
    "a": a,
    "T": t,
    "m": cryptoModelM,
    "M": m,
  };
}
