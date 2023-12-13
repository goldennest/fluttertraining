import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  final List<String> images = [
    'assets/offer4.png',
    'assets/offer1.png',
    'assets/offer3.png',
    'assets/offer2.png',
  ];



  _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/multi-restaurant-delivery-software.png',
                  width: 250, // Adjust the width as needed
                  height: 250, // Adjust the height as needed
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Order Placed'),
                          content: const Text(
                              'Your order has been successfully placed.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); // Close the AlertDialog
                                Navigator.of(context)
                                    .pop(); // Close the BottomSheet
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text("Place Your Order"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 84, 146),
        title: const Text('Hello, Good morning!!'),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (BuildContext context, int itemIndex, int realIndex) {
              return Container(
                decoration: BoxDecoration(),
                child: Image.asset(
                  images[itemIndex],
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.8,
              initialPage: 0,
            ),
          ),
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Pizza'),
              Tab(text: 'Burger'),
              Tab(text: 'Other'),
            ],
            labelColor: Color.fromARGB(255, 30, 84, 146),
            unselectedLabelColor: Colors.black,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: ListTile(
                          title: const Text('Chicken Pizza'),
                          subtitle: const Text('₹148'),
                          leading: Image.asset(
                            'assets/CHICKENPIZZA.jpg',
                            width: 50, // Adjust the width as needed
                            height: 50, // Adjust the height as needed
                          ),
                          onTap: () => _showBottomSheet(),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Veg Pizza'),
                          subtitle: const Text('₹140'),
                          leading: Image.asset(
                            'assets/veg.png',
                            width: 50, // Adjust the width as needed
                            height: 50, // Adjust the height as needed
                          ),
                          onTap: () => _showBottomSheet(),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Smoked Barbecue Pizza'),
                          subtitle: const Text('₹175'),
                          leading: Image.asset(
                            'assets/buger2.jpg',
                            width: 50, // Adjust the width as needed
                            height: 50, // Adjust the height as needed
                          ),
                          onTap: () => _showBottomSheet(),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: ListTile(
                          title: const Text('Tower Burger Veg'),
                          subtitle: const Text('₹169'),
                          onTap: () => _showBottomSheet(),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Veg Burger'),
                          subtitle: const Text('₹122'),
                          onTap: () => _showBottomSheet(),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Chicken Burger'),
                          subtitle: const Text('₹154'),
                          onTap: () => _showBottomSheet(),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: ListTile(
                          title: const Text('Other Card 1'),
                          subtitle: const Text('₹Price'),
                          onTap: () => _showBottomSheet(),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Other Card 2'),
                          subtitle: const Text('₹Price'),
                          onTap: () => _showBottomSheet(),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Other Card 3'),
                          subtitle: const Text('₹Price'),
                          onTap: () => _showBottomSheet(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
