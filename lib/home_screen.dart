import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xD5EAAFA0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF795F7A),
        title: Text(selectedIndex == 0?"Home":"Cart"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: selectedIndex == 0?const HomePage():const CartPage(),
      ),
      floatingActionButton: SizedBox(
        width: 70,
          height: 70,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: (){},
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: CircleAvatar(
                radius: 40,
                child: ClipOval(child: Image.asset("assets/images/goku.jpg",)),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        elevation: 0,
        notchMargin: 8,
        height: 60,
        color: const Color(0xFFEA9078),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){
              setState(() {
                selectedIndex = 0;
              });
            }, icon: const Icon(
                Icons.home),
                color: selectedIndex == 0 ?Colors.white: const Color(0xC8FFBAAB),
                iconSize: selectedIndex == 0?40:20
            ),
            const SizedBox(width: 70,),
            IconButton(onPressed: (){
              setState(() {
                selectedIndex = 1;
              });
            }, icon: const Icon(
                Icons.shopping_cart),
                color: selectedIndex == 1 ?Colors.white :const Color(0xC8FFBAAB),
                iconSize: selectedIndex == 1?40:20
            ),
          ],
        ),
      ),
    );
  }
}



class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<PostImage> savedItems = [];
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: savedItems,
    );
  }
}

Future<List> getSavedItems() async{
  final items = await Hive.openBox('items');
  var result = [];
  int index = 0;
  while(true){
    try{
      if(items.getAt(index) == null)break;
      result.add(items.getAt(index++));
    } catch(e){
      break;
    }
  }
  return result;
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          color: Colors.transparent,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              PostImage(image: Image.asset(
                "assets/images/header1.png",
                fit: BoxFit.cover,
              ),
              ),
              const SizedBox(width: 12,),
              PostImage(image: Image.asset(
                "assets/images/hat.png",
                fit: BoxFit.cover,
              ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16,),
        SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              OutlinedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(
                        selectedCategory == 0? Colors.white: const Color(0xFF795F7A)
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                        selectedCategory == 0?const Color(0xFF795F7A):Colors.transparent
                    ),
                    fixedSize: const MaterialStatePropertyAll(
                      Size(95,40),
                    )
                ),
                onPressed: (){
                  setState(() {
                    selectedCategory = 0;
                  });
                },
                child: const Text("All"),
              ),
              const SizedBox(width: 12,),
              OutlinedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(
                        selectedCategory == 1? Colors.white: const Color(0xFF795F7A)
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                        selectedCategory == 1?const Color(0xFF795F7A):Colors.transparent
                    ),
                    fixedSize: const MaterialStatePropertyAll(
                      Size(95,40),
                    )
                ),
                onPressed: (){
                  setState(() {
                    selectedCategory = 1;
                  });
                },
                child: const Text("Kids"),
              ),
              const SizedBox(width: 12,),
              OutlinedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(
                        selectedCategory == 2? Colors.white: const Color(0xFF795F7A)
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                        selectedCategory == 2?const Color(0xFF795F7A):Colors.transparent
                    ),
                    fixedSize: const MaterialStatePropertyAll(
                      Size(95,40),
                    )
                ),
                onPressed: (){
                  setState(() {
                    selectedCategory = 2;
                  });
                },
                child: const Text("Hats"),
              ),
              const SizedBox(width: 12,),
              OutlinedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(
                        selectedCategory == 3? Colors.white: const Color(0xFF795F7A)
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                        selectedCategory == 3?const Color(0xFF795F7A):Colors.transparent
                    ),
                    fixedSize: const MaterialStatePropertyAll(
                      Size(95,40),
                    )
                ),
                onPressed: (){
                  setState(() {
                    selectedCategory = 3;
                  });
                },
                child: const Text("Coasters"),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24,),
        Container(
          height: 400,
          width: double.infinity,
          color: Colors.transparent,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              GestureDetector(
                onDoubleTap: ()=>saveItem(Image.asset(
                  "assets/images/hat.png",
                  fit: BoxFit.cover,
                )),
                child: PostImage(image: Image.asset(
                  "assets/images/hat.png",
                  fit: BoxFit.cover,
                ),
                ),
              ),
              const SizedBox(height: 24,),
              GestureDetector(
                onDoubleTap: ()=>saveItem(Image.asset(
                  "assets/images/header1.png",
                  fit: BoxFit.cover,
                )),
                child: PostImage(image: Image.asset(
                  "assets/images/header1.png",
                  fit: BoxFit.cover,
                ),
                ),
              ),
              const SizedBox(height: 24,),
              GestureDetector(
                onDoubleTap: ()=>saveItem(Image.asset(
                  "assets/images/hat.png",
                  fit: BoxFit.cover,
                )),
                child: PostImage(image: Image.asset(
                  "assets/images/hat.png",
                  fit: BoxFit.cover,
                ),
                ),
              ),
              const SizedBox(height: 24,),
              PostImage(image: Image.asset(
                "assets/images/header1.png",
                fit: BoxFit.cover,
              ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void saveItem(Image image) {


      Get.snackbar(
          "Saved item",
          "Item added to cart successfully",
          isDismissible: true,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1),
      );
  }
}




class PostImage extends StatelessWidget {

  final Image image;

  const PostImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      panEnabled: false,
      minScale: 0.5,
      maxScale: 2,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0,0,0,8.0),
        child: image,
      ),
    );
  }
}
