import 'dart:io';

void main() {
  final menu = <String, double>{
    'Pasta': 30.0,
    'Pizza': 50.0,
    'Ensalada': 25.0,
    'Sopa': 20.0,
    'Tacos': 15.0,
    'Hamburguesa': 40.0,
    'Sushi': 60.0,
    'Chilaquiles': 35.0,
    'Pozole': 45.0,
    'Sandwich': 20.0,
  };

  bool continuar = true;

  while (continuar) {
    printMenuPrincipal();
    final opcion = leerEntradaEntero();

    switch (opcion) {
      case 1:
        imprimirMenu(menu);
        break;
      case 2:
        buscarEnMenu(menu);
        break;
      case 3:
        modificarPrecio(menu);
        break;
      case 4:
        continuar = false;
        break;
      default:
        print('Por favor, selecciona una opción válida.');
    }
  }

  print('¡Gracias por usar el sistema! Hasta luego.');
}

void printMenuPrincipal() {
  print('\n=== Menú Principal ===');
  print('1) Ver menú completo');
  print('2) Buscar un platillo');
  print('3) Modificar precio de un platillo');
  print('4) Salir');
  stdout.write('Elige una opción: ');
}

int leerEntradaEntero() {
  try {
    return int.parse(stdin.readLineSync() ?? '0');
  } catch (_) {
    return 0;
  }
}

void imprimirMenu(Map<String, double> menu) {
  print('\n=== Lista de Platillos ===');
  menu.entries.forEach((entry) {
    print(' - ${entry.key}: \$${entry.value.toStringAsFixed(2)}');
  });
}

void buscarEnMenu(Map<String, double> menu) {
  stdout.write('\nIngresa el nombre del platillo a buscar: ');
  final platillo = stdin.readLineSync()?.trim();
  if (platillo != null && menu.containsKey(platillo)) {
    print(
        'El platillo "$platillo" cuesta \$${menu[platillo]!.toStringAsFixed(2)}.');
  } else {
    print('El platillo "$platillo" no está en el menú.');
  }
}

void modificarPrecio(Map<String, double> menu) {
  stdout.write('\nNombre del platillo a actualizar: ');
  final platillo = stdin.readLineSync()?.trim();

  if (platillo != null && menu.containsKey(platillo)) {
    stdout.write('Nuevo precio para "$platillo": ');
    final nuevoPrecio = double.tryParse(stdin.readLineSync() ?? '');
    if (nuevoPrecio != null) {
      menu[platillo] = nuevoPrecio;
      print('El precio de "$platillo" ha sido actualizado a \$${nuevoPrecio.toStringAsFixed(2)}.');
    } else {
      print('Entrada no válida. El precio no se actualizó.');
    }
  } else {
    print('El platillo "$platillo" no está en el menú.');
  }
}
