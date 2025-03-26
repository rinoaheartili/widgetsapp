import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget 
{
  static const name = 'snackbar_screen'; 
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context)
  {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBack = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'ok', onPressed: (){}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBack);
  }
  
  void openDialog(BuildContext context)
  {
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estas Seguro?'),
        content: const Text('Nisi et sint laborum Lorem irure ex sit nisi ullamco non. Cillum fugiat ipsum exercitation sunt ex deserunt. Minim excepteur esse dolore dolor ex cillum sint consequat veniam aute reprehenderit velit incididunt.'),
        actions: [
          TextButton(
            onPressed: ()=>context.pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: ()=>context.pop(),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snackbars y Diálogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Ex amet pariatur velit nisi fugiat consequat incididunt nisi excepteur. Non irure qui aliqua exercitation ex duis ipsum eiusmod nisi ad cupidatat consequat. Nisi sunt laborum occaecat irure culpa voluptate minim dolor adipisicing in irure veniam velit.'),
                  ]
                );
              }, 
              child: const Text('Licencias usadas')
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Mostrar diálogo')
            ),
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snakbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}