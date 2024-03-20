import 'package:flutter/material.dart';
import '../Widget/multi_select_frop_down.dart';
import './product_descritipn_page.dart';

import '../Widget/drop_down.dart';
import '../Widget/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, String? token});

  @override
  Widget build(BuildContext context) {

    double width =  MediaQuery.of(context).size.width;
    double height =  MediaQuery.of(context).size.height;
   return Scaffold(
      appBar: AppBar(
        title: Text('Footware Store' ,
        style: TextStyle(fontWeight: FontWeight.bold,),),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.logout))
          ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: height*0.1 ,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context,index)
            {
              return Padding(
                  padding:  EdgeInsets.all(width*0.02 ),
                 child : Chip(
                  label: Text("categpry"),
              ));
            }),
          ),
          Row(
            children: [

             Flexible (
                child: DropDownBtn(items: ["Rs : Low to heigh " , "Rs :High to low" ],
                  selecteItemsText: 'Sort',
                  onSelected: (selected){},),
              ),
              Container(
                height: height*0.05,
                  width: width*0.5,
                  child: MultiSelectDropDown(items :['item 1 ' , 'items 2' ,'item 4', ' item 4 '], onSelectionChange: (selectedItems ) {


                  },))
            ],
          ),
          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8)
            , itemBuilder: (context, index) {
              return ProductCard(
                name: 'sandale',
                imageURL:
                "https://cdn-images.farfetch-contents.com/16/13/43/94/16134394_50014366_480.jpg",
                price: 200,
                offreTag: '20%',
                onTap: (){ 
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> const ProductDescription())
                  );
                },);

                }),
          )
        ],
      ),
    );
  }
}
