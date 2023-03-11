import 'package:flutter/material.dart';

class PlantList extends StatefulWidget {
  const PlantList({Key? key}) : super(key: key);

  @override
  State<PlantList> createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {
  late ScrollController _scrollController;

  List allDescriptions = [
    'Aloe is a cactus-like plant that grows in hot, dry climates. It is cultivated in subtropical regions around the world, including the southern border areas of Texas, New Mexico, Arizona, and California. '
    'which as green leave'
  ];

  String? description;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(changedesc);
    setState(() {
      description = allDescriptions[0]??'';
    });
  }

  changedesc(){
    var value = _scrollController.offset.round();
    var descIndex = (value/150).round();
    setState(() {
      description = allDescriptions[descIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
             Container(
               height: 380,
               child: ListView(
                 padding: const EdgeInsets.only(left: 17),
                 scrollDirection: Axis.horizontal,
                 controller: _scrollController,
                 children: [
                    getPlantCard('assets/plant4.jpeg', '25', 'OUTDOOR', 'Aloe Vera'),
                   const SizedBox(width: 15,),
                   getPlantCard('assets/plant.png', '27', 'OUTDOOR', 'House Plant'),
                   const SizedBox(width: 15,),
                   getPlantCard('assets/plant2.jpeg', '20', 'OUTDOOR', 'Artificial Monstera'),
                 ],
               ),
             ),
        const Padding(
            padding: EdgeInsets.only(left: 20,top: 10),
          child: Text('Descriptions',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 17,

          ),
          ),
        ),
         Padding(
          padding: const EdgeInsets.only(left: 20,top: 10),
          child: Text(description??'',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,

            ),
          ),
        )
        ],
    );
  }
  getPlantCard(String imgPart, String price, String PlantType,String PlantName){
      return Stack(
        children: [
          Container(
            height: 355,
            width: 225,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF399D63),
              ),
              height: 250,
              width: 225,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:  [
                        Column(
                          children: [
                            const SizedBox(height: 10,),
                            const Text('From',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF8AC7A4)),),
                            Text('\$$price',style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Colors.white)),
                          ],
                        ),
                        const SizedBox(width: 10,),
                      ],
                    ),
                  ),
                  Image(
                      image: AssetImage(imgPart),
                    height: 165,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const [
                            SizedBox(height: 10,),
                            Text('OUTDOOR',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF8AC7A4)),),
                            Text('Aloe Vera',style: TextStyle(fontSize: 27,fontWeight: FontWeight.w600,color: Colors.white)),
                          ],
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(width: 10,),
                  Row(
                    children: [
                      Row(
                        children: [
                        const SizedBox(width: 25,),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              border:Border.all(
                                color: const Color(0xFF8AC7A4),
                                style: BorderStyle.solid,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFF399D63)
                            ),
                            child: Icon(Icons.wb_sunny_outlined,color: Colors.white.withOpacity(0.5),size: 20,),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 15,),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                border:Border.all(
                                  color: const Color(0xFF8AC7A4),
                                  style: BorderStyle.solid,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xFF399D63)
                            ),
                            child: Icon(Icons.thermostat_auto_outlined,color: Colors.white.withOpacity(0.5),size: 20,),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 15,),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                border:Border.all(
                                  color: const Color(0xFF8AC7A4),
                                  style: BorderStyle.solid,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xFF399D63)
                            ),
                            child: Icon(Icons.water_drop_outlined,color: Colors.white.withOpacity(0.5),size: 20,),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 15,),
                          InkWell(
                            onTap: (){},
                             child: Container(
                              height: 30,
                              width: 30,
                              child: Icon(Icons.question_mark,color: Colors.white.withOpacity(0.5),size: 20,),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 80,top: 343),
          child: Container(

            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.black
            ),
            child: const Center(child: Icon(Icons.shopping_cart,color: Colors.white,)),
          ),
          )
        ],
      );
  }
}
