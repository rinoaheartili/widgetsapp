import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgetsapp/config/menu/menu_items.dart';
import 'package:widgetsapp/presentation/screen/cards/cards_screen.dart';

class HomeScreen extends StatelessWidget
{
  static const String name = 'home_screen';

  const HomeScreen({
    super.key
  });

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: _HomeView(),
    );
  }

}

class _HomeView extends StatelessWidget 
{
  const _HomeView();

  @override
  Widget build(BuildContext context) 
  {
    return ListView.builder(
      //physics: BouncingScrollPhysics(),
      itemCount: appMenuItem.length,
      itemBuilder: (context, index){
        final menuItem = appMenuItem[index];

        return CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class CustomListTile extends StatelessWidget 
{
  const CustomListTile({
    super.key,
    required this.menuItem,
  });

  final MenuItems menuItem;

  @override
  Widget build(BuildContext context) 
  {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary), 
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap:(){
        //Navigator.of(context).push(
        //  MaterialPageRoute(
        //    builder: (context) => const ButtonScreen(),
        //  )
        //);
        //Navigator.pushNamed(context, menuItem.link);
        //context.pushNamed(CardsScreen.name);
        context.push(menuItem.link);
      }
    
    );
  }
}