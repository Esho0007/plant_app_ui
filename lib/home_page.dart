import 'package:flutter/material.dart';
import 'package:plants_ui/plant_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {

    tabController = TabController(length: 4, vsync: this);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                IconButton(
                    icon: const Icon(Icons.menu),
                  onPressed: () {  },
                ),
                FloatingActionButton(onPressed:(){},
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  elevation: 0.0,
                  mini: true,
                child: const Icon(Icons.shopping_cart,color: Colors.black,size: 17,),
                )
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.all(15),
            child: Text('Top Pick',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w400
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15),
            child: TabBar(
              controller: tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              isScrollable: true,
              tabs: const [
                Tab(
                  child: Text(
                    'Top',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Out Door',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'In Door',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Plants',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 200,
            child: TabBarView(
              controller: tabController,
              children: const [
                PlantList(),
                PlantList(),
                PlantList(),
                PlantList(),
              ],),
          )
        ],
      ),
    );
  }
}
