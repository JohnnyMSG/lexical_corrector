import 'package:flutter/material.dart';

class ColorsDefault {
  Color teste = ColorsD.black.withAlpha(0);
}

class ColorsD {
  ///Transparente
  static const Color transparent = Color(0x00000000);

  ///Verde bem escuro
  static const Color black_green = Color(0xff004628);

  ///Verde escuro
  static const Color dark_green = Color(0xff007344);

  ///Verde escuro
  static const Color dark_green2 = Color(0xff00AD63);

  ///Verde escuro
  static const Color dark_green3 = Color(0xff76B222);

  ///Verde light
  static const Color dark_green_light = Color(0xff79b49b);

  ///Verde light
  static const Color dark_green_more_light = Color(0xffD0E2B2);

  ///Verde médio
  static const Color medium_green = Color(0xffAFD46C);

  ///Verde claro
  static const Color light_green = Color(0xffDBEAB7);

  ///Verde bem claro
  static const Color white_green = Color(0xfffbfff8);

  ///Amarelo
  static const Color yellow = Color(0xffFADD00);

  ///Laranja
  static const Color orange = Color(0xffff9d00);

  ///Laranja
  static const Color orangeLight = Color(0xffffD392);

  ///Laranja
  static const Color orangeDark = Color(0xffffb23e);

  ///Laranja
  static const Color orangeDark2 = Color(0xffE99D2C);

  ///Vermelho
  static const Color red = Color(0xffBF0000);

  ///Vermelho
  static const Color red2 = Color(0xffff3636);

  ///Vermelho
  static const Color red_light1 = Color(0xffff4646);

  ///Vermelho
  static const Color red_light2 = Color(0xffffb0b0);

  ///Rosa
  static const Color pink = Color(0xffb900bf);

  ///Roxo
  static const Color purple = Color(0xff6414a4);

  ///Azul escuro
  static const Color dark_blue = Color(0xff00129b);

  ///Azul médio
  static const Color medium_blue = Color(0xff0060ce);

  ///Azul claro
  static const Color light_blue = Color(0xff00c4ff);

  ///Azul light
  static const Color light_blue2 = Color(0xff81b7f5);

  ///Preto
  static const Color black = Color(0xff000000);

  ///Cinza bem escuro
  static const Color black_grey = Color(0xff282828);

  ///Cinza escuro
  static const Color dark_grey = Color(0xff484848);

  ///Cinza meio escuro
  static const Color dark_medium_grey = Color(0xff6c6c6c);

  ///Cinza médio
  static const Color medium_grey = Color(0xff8a8a8a);

  ///Cinza meio claro
  static const Color light_medium_grey = Color(0xffb0b0b0);

  ///Cinza claro
  static const Color light_grey = Color(0xffd7d7d7);

  ///Cinza bem claro
  static const Color white_grey = Color(0xffececec);

  ///Branco
  static const Color white = Color(0xffffffff);

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  /*String colorToHex(Color color) {
    return color..toString().substring(4);
  }*/

  String colorToHex(Color color) {

    List<String> colorsParams = [
      color.red.toRadixString(16).padLeft(2, '0'),
      color.green.toRadixString(16).padLeft(2, '0'),
      color.blue.toRadixString(16).padLeft(2, '0'),
    ];
    return "#${colorsParams.join("").toUpperCase()}";
  }
}