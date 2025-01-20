import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SeeRecords extends StatefulWidget {
  const SeeRecords({super.key});

  @override
  State<SeeRecords> createState() => _SeeRecordsState();
}

class _SeeRecordsState extends State<SeeRecords> {
  final showContent = FirebaseFirestore.instance.collection('Product_List');
  List<QueryDocumentSnapshot> docs = [];
  bool isSorted = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final snapshot = await showContent.get();
    setState(() {
      docs = snapshot.docs;
    });
  }

  void sortByPrice() {
    setState(() {
      docs.sort((a, b) {
        final priceA = double.tryParse(a['product_price'].toString()) ?? 0.0;
        final priceB = double.tryParse(b['product_price'].toString()) ?? 0.0;
        return priceA.compareTo(priceB);
      });
      isSorted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        actions: [
          TextButton(
            onPressed: sortByPrice,
            child: const Text(
              "Sort by Price",
              style: TextStyle(color: Colors.amber),
            ),
          ),
        ],
      ),
      body: docs.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                final doc = docs[index];
                final data = doc.data() as Map<String, dynamic>;
                final pn = data['product_name'];
                final pp = data['product_price'];
                final id = doc.id;

                return ListTile(
                  title: Text("Product Name: $pn"),
                  subtitle: Text("Product Price: $pp"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          editdata(context, id, pn, pp);
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () async {
                          await FirebaseFirestore.instance.collection("Product_List").doc(id).delete();
                          fetchData();
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  void editdata(BuildContext context, String id, String prevName, String prevPrice) {
    TextEditingController editNameController = TextEditingController(text: prevName);
    TextEditingController editPriceController = TextEditingController(text: prevPrice);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Product"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: editNameController,
                decoration: InputDecoration(
                  labelText: "Product Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: editPriceController,
                decoration: InputDecoration(
                  labelText: "Product Price",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection("Product_List")
                    .doc(id)
                    .update({
                  'product_name': editNameController.text,
                  'product_price': editPriceController.text,
                });
                fetchData();
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
