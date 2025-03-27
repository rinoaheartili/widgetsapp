import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetsapp/presentation/providers/counter_provider.dart';
import 'package:widgetsapp/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget 
{
  static const name = 'counter_screen'; 
  
  const CounterScreen({
    super.key
  });

  
  @override
  Widget build(BuildContext context, WidgetRef ref) 
  {
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkmode = ref.watch(themeNotifierProvider).isDarkmode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: Icon(isDarkmode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: (){
              //ref.read(isDarkmodeProvider.notifier).update((state) => !state);
              ref.read(themeNotifierProvider.notifier).toggleDarkmode();
            }, 
            
          ),
        ],
        
      ),
      body: Center(
        child: Text('Valor: $clickCounter', style: Theme.of(context).textTheme.titleLarge),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          //ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((state) => state +1);
        }
      ),
      
    );
  }
}

class CounterCustomButton extends StatelessWidget 
{
  final IconData icon;
  final VoidCallback? onPressed;

  const CounterCustomButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) 
  {
    return FloatingActionButton(
      enableFeedback: true,
      elevation: 5,
      backgroundColor: Colors.blue,
      shape: const StadiumBorder(),
      onPressed: onPressed, 
      child: Icon(icon),
    );
  }
}