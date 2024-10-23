import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/smart_building/room.dart';

class SmartBuilding extends StatelessWidget {
  const SmartBuilding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //untuk arrow back
        backgroundColor: Colors.blue,
        title: Row(
          children: const [
            Icon(
              Icons.apartment,
              size: 24.0,
              color: Colors.white,
            ),
            SizedBox(width: 8.0),
            Text(
              'Smart Building',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
              vertical: 30.0,
            ),
            child: Wrap(
              spacing: 16.0, // Jarak horizontal antara kartu
              runSpacing: 16.0, // Jarak vertikal antara kartu
              children: [
                buildCard(
                  context,
                  'https://asset.kompas.com/crops/N31jiAhjjYHf62e0gO4RwBKqtKA=/0x0:1000x667/750x500/data/photo/2018/07/30/2657891930.jpg',
                  'Bangunan 1',
                  const Room(),
                ),
                buildCard(
                  context,
                  'https://asset.kompas.com/crop/2x68:800x600/750x500/data/photo/2018/07/24/3572733199.jpg',
                  'Bangunan 2',
                  const Room(),
                ),
              ],
            ),
          )),
    );
  }

  Widget buildCard(
      BuildContext context, String imagePath, String title, Widget page) {
    return InkWell(
      onTap: () {
        // Navigasi ke halaman yang berbeda saat Card ditekan
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      borderRadius: BorderRadius.circular(15),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
                height: 150,
                width: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
