import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_connection_test/pages/see_recods.dart';
import 'package:firebase_connection_test/pages/show_records.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController proname = TextEditingController();
  TextEditingController proprice = TextEditingController();

  void adddata() async{
    await FirebaseFirestore.instance.collection("Product_List").add(
      {'product_name': proname.text, 'product_price': proprice.text});
  }

  void validation(){
    if(formkey.currentState!.validate()){

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                const Text('মায়ের দোয়া ফল বিতান',style: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0),),
                  
                const Text('Product List',style: TextStyle(
                  color: Color.fromARGB(255, 10, 233, 21),
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0),),
          
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Product Name is required";
                    }
                    else{
                      return null;
                    }
                  },

                  controller: proname,
                  decoration: InputDecoration(
                  labelText: "Product Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0)
                  )
                ),),

                const SizedBox(height: 15.0,),

                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Product Price is required";
                    }
                    final price = double.tryParse(value);
                    if (price == null || price <= 0) {
                      return "Enter a valid positive price";
                    }
                    return null;
                  },
                  
                  controller: proprice,
                  decoration: InputDecoration(
                  labelText: "Product Price in Tk",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0)
                  )
                ),),
                const SizedBox(height: 15.0,),
                
                SizedBox(
                  height: 50.0,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    validation();
                    if(proname.text .isNotEmpty && proprice.text .isNotEmpty){
                      adddata();
                    }
                    proname.clear();
                    proprice.clear();
                  },
                  style:  ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent), 
                  child: Text("Submit",style: TextStyle(
                    color: const Color.fromARGB(255, 236, 243, 242),fontSize: 25.0,fontWeight: FontWeight.bold),),)),

                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SeeRecords()));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.teal), child: Text("View All Records",style: TextStyle(color: Colors.white,fontSize: 20.0),),),
                    
                  )

              ],
            ),
          ),
        ),
      ),
    );
  }
}