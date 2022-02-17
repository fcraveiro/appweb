import 'package:appweb/pagina1.dart';
import 'package:appweb/pagina2.dart';
import 'package:get/get.dart';
import 'menu.dart';

rotas() {
  return [
    GetPage(name: '/', page: () => const Menu()),
    GetPage(
        name: '/menu/', page: () => const Menu(), transition: Transition.zoom),
    GetPage(
        name: '/pagina1/',
        page: () => const Pagina1(),
        transition: Transition.zoom),
    GetPage(
        name: '/stream/',
        page: () => const Stream(),
        transition: Transition.zoom),
  ];
}
