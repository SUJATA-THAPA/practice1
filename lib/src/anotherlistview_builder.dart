import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list_provider.dart';

class Ms extends StatefulWidget {
   
  const Ms({super.key, });

  @override
  State<Ms> createState() => _MsState();
}

class _MsState extends State<Ms> {
  
  @override
  Widget build(BuildContext context) {
    return  Consumer<NumbersListProvider>(builder: (context, value, child) => 
      Scaffold(
        
        floatingActionButton: FloatingActionButton(
          onPressed: () {
        
         value.add();
              // items.add(namecontroller.text);
              // namecontroller.clear();
         
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(numbers.toString()),
            //  SizedBox(
            //     height: 40,
            //     width: 180,
            //     child: TextField(
            //       // controller: namecontroller,
            //       decoration: InputDecoration(
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(10),),
            //           hintText: "Name",
                      
            //         ),
            //       ),
            //     ),
    
            
            SizedBox(
              height: 200,
              width: 30,
    
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const ScrollPhysics(parent: null),
                itemCount: value.numbers.length,
                // itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.orange,
                    child:   ListTile(
                      // title: Text(items[index]),
                       title: Text( value.numbers[index].toString() ),
              
                      trailing: const Icon(Icons.device_hub),
                    ),
                  );
                },
              ),
            ),
          
          ],
        ),
      ),
    );

  }
}