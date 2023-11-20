import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class AppTheme {
  //private constructor
  const AppTheme._();

  static final light = FlexThemeData.light(
    scheme: FlexScheme.indigo, //esquema de cores
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
    blendLevel:
        40, //nível de mistura das cores, ajustando a intensidade das cores em relação às outras no tema
    appBarStyle: FlexAppBarStyle.primary, //estilo da barra de aplicativos
    appBarOpacity:
        0.95, //opacidade da barra de aplicativos como 0.95, tornando-a um pouco transparente.
    appBarElevation: 0,
    transparentStatusBar:
        true, //Torna a barra de status do dispositivo transparente.
    tabBarStyle: FlexTabBarStyle
        .forBackground, //Define o estilo da barra de guias com base no fundo.
    tooltipsMatchBackground:
        true, //Faz com que as dicas de ferramentas (tooltips) tenham a mesma cor de fundo que o restante do aplicativo.
    swapColors:
        true, //Permite a troca automática de cores para melhorar a visibilidade, se necessário.
    lightIsWhite: true, //Indica que o tema claro possui um fundo branco.
    visualDensity: FlexColorScheme
        .comfortablePlatformDensity, // Define a densidade visual do tema para se adequar à plataforma em uso
    fontFamily: GoogleFonts.dekko().fontFamily,
    //subThemesData: Define várias configurações adicionais relacionadas a subtemas, como o uso de temas de texto,
    //formas para o botão de ação flutuante (FAB),
    //efeitos de interação, configurações de bordas para elementos de entrada,
    //opacidade de menus de contexto, entre outras.
    // tertiary: Colors.white,
    subThemesData: const FlexSubThemesData(
      useTextTheme: true,
      fabUseShape: true,
      interactionEffects: true,
      bottomNavigationBarElevation: 0,
      bottomNavigationBarOpacity: 1,
      navigationBarOpacity: 1,
      navigationBarMutedUnselectedIcon: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorUnfocusedHasBorder: true,
      blendOnColors: true,
      blendTextTheme: true,
      popupMenuOpacity: 0.95,
    ),
  );

  static final dark = FlexThemeData.dark(
    scheme: FlexScheme.indigo, //esquema de cores
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
    blendLevel:
        13, //nível de mistura das cores, ajustando a intensidade das cores em relação às outras no tema
    appBarStyle: FlexAppBarStyle.primary, //estilo da barra de aplicativos
    appBarOpacity:
        0.95, //opacidade da barra de aplicativos como 0.95, tornando-a um pouco transparente.
    appBarElevation: 0,
    transparentStatusBar:
        true, //Torna a barra de status do dispositivo transparente.
    /*tabBarStyle: FlexTabBarStyle
        .forBackground, */ //Define o estilo da barra de guias com base no fundo.
    tooltipsMatchBackground:
        true, //Faz com que as dicas de ferramentas (tooltips) tenham a mesma cor de fundo que o restante do aplicativo.
    swapColors:
        true, //Permite a troca automática de cores para melhorar a visibilidade, se necessário.
    // lightIsWhite: true, //Indica que o tema claro possui um fundo branco.
    visualDensity: FlexColorScheme
        .comfortablePlatformDensity, // Define a densidade visual do tema para se adequar à plataforma em uso

    fontFamily: GoogleFonts.dekko().fontFamily,
    //subThemesData: Define várias configurações adicionais relacionadas a subtemas, como o uso de temas de texto,
    //formas para o botão de ação flutuante (FAB),
    //efeitos de interação, configurações de bordas para elementos de entrada,
    //opacidade de menus de contexto, entre outras.

    subThemesData: const FlexSubThemesData(
      useTextTheme: true,
      fabUseShape: true,
      interactionEffects: true,
      bottomNavigationBarElevation: 0,
      bottomNavigationBarOpacity: 1,
      navigationBarOpacity: 1,
      navigationBarMutedUnselectedIcon: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorUnfocusedHasBorder: true,
      blendOnColors: true,
      blendTextTheme: true,
      popupMenuOpacity: 0.95,
    ),
  );
}
