import 'package:flutter/material.dart';
import 'package:shoes__app/constants/shoes_textstyle.dart';
import 'package:shoes__app/drawer/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> shoes = [
    {'name': 'Nike', 'price': '\$345', 'image': 'assets/Nike.png'},
    {'name': 'Puma', 'price': '\$415', 'image': 'assets/puma.png'},
    {'name': 'Under Armour', 'price': '\$1234', 'image': 'assets/underarmour.png'},
    {'name': 'Adidas', 'price': '\$111.99', 'image': 'assets/addidas.png'},
    {'name': 'Converse', 'price': '\$234.89', 'image': 'assets/converse.png'},
    {'name': 'Rebook', 'price': '\$233.09', 'image': 'assets/reebok.png'},
    {'name': 'New Balance', 'price': '\$322.11', 'image': 'assets/new_balance.png'},


  ];
  final List<String> categories = ['Nike', 'Puma', 'Under Armour', 'Adidas', 'Converse', 'Rebook', 'New Balance'];
  String selectCategory = 'Nike';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Shoes Home"),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SearchBox(),
              SizedBox(height: 20),
             builCategoryName(),
              // SizedBox(height: 20),
              // buildShoeCard(List<Map<String,>>shoes.sublist(0,4)),
              // buildHorizenalList('Shoes Collection',shoes.sublist(0,4)),
              buildSection('Shoes Collection', 
              buildHorizenalList(shoes.sublist(0,4)),),
              // buildverticalList(shoes.sublist(0,4)),
              buildSection('New Arival', Column(children: shoes.sublist(4,6).map(buildLAndScapWidget).toList(),)
              
              
              )

              
             
            ],
          ),
        ),
      ),
    );
  }
  Widget builCategoryName ()=> SingleChildScrollView(
    scrollDirection:  Axis.horizontal,
    child: Row(
      children: categories.map((label)=> Padding(padding: EdgeInsets.only(right: 12),
      child: ChoiceChip(label: Text(label), selected: selectCategory==label,
      onSelected: (_)=> setState(() {
        selectCategory=label;
        
      }),
      selectedColor: Colors.blue,
      labelStyle: TextStyle(color: selectCategory==label?Colors.white: Colors.black),
      ),
      )).toList(),
    ),
  );


Widget buildSection (String title, Widget child)=> Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Padding(padding: EdgeInsets.symmetric(vertical: 10),
    child: Text(title,style: ShoesTextstyle.subheading,),
    ),
    child
  ],
);

Widget buildHorizenalList(List<Map<String, String>>shoes)=> SizedBox(
  height: 260,
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: shoes.map((shoes)=>buildShoeCard(shoes)).toList(),
  ),
);

Widget buildverticalList(List<Map<String, String>>shoes)=> SizedBox(
  height: 260,
  child: ListView(
    scrollDirection: Axis.vertical,
    children: shoes.map((shoes)=>buildShoeCard(shoes)).toList(),
  ),
);


  Widget buildShoeCard(Map<String, String>shoes) => 
   Container(
                width: 180,
                margin: EdgeInsets.only(right: 12),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15)
        
      ),
      boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 8,spreadRadius: 3)]
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(shoes['image']!,height: 120,width: double.infinity,fit: BoxFit.cover,),
                    ),
              SizedBox(height: 10),
              Text(shoes['name']!,style: ShoesTextstyle.subheading,),
              SizedBox(height: 10),
              Text(shoes['price']!,style: ShoesTextstyle.subheading,),
              FloatingActionButton(onPressed: (){},
              mini: true,
              backgroundColor: Colors.blue,
               child: Icon(Icons.add,color: Colors.white,),),
                  ],
                ),
              );


///landscap widegt//

 Widget buildLAndScapWidget(Map<String, String>shoes) => 
   Container(

                
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15)
        
      ),
      boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 8,spreadRadius: 3)]
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(shoes['image']!,height: 100,width: 100,fit: BoxFit.cover,),
                    ),
                    SizedBox(width: 10,),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
              Text(shoes['name']!,style: ShoesTextstyle.subheading,),
              SizedBox(height: 10),
              Text(shoes['price']!,style: ShoesTextstyle.subheading,),
                ],
              )),
              FloatingActionButton(onPressed: (){},
              mini: true,
              backgroundColor: Colors.blue,
               child: Icon(Icons.add,color: Colors.white,),),
                  ],
                ),
              );
      


}