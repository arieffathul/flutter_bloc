import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/smart_building/elec.dart';

class Room extends StatelessWidget {
  const Room({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //untuk arrow back
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            SizedBox(
              width: 40.0,
              height: 40.0,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(width: 8.0),
            const Text(
              'Gedung 1',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 20.0,
        ),
        child: SingleChildScrollView(
          // Scroll untuk banyak lantai
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Menggunakan widget LantaiItem
              LantaiItem(
                lantaiTitle: "Lantai 1",
                rooms: [
                  RoomButton(
                    roomTitle: "Ruang 1",
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Elec()));
                      // Aksi untuk Ruang 1
                    },
                  ),
                  RoomButton(
                    roomTitle: "Ruang 2",
                    onPressed: () {
                      // Aksi untuk Ruang 2
                    },
                  ),
                ],
              ),
              LantaiItem(
                lantaiTitle: "Lantai 2",
                rooms: [
                  RoomButton(
                    roomTitle: "Ruang 1",
                    onPressed: () {
                      // Aksi untuk Ruang 1 di Lantai 2
                    },
                  ),
                  RoomButton(
                    roomTitle: "Ruang 2",
                    onPressed: () {
                      // Aksi untuk Ruang 2 di Lantai 2
                    },
                  ),
                  RoomButton(
                    roomTitle: "Ruang 2",
                    onPressed: () {
                      // Aksi untuk Ruang 2 di Lantai 2
                    },
                  ),
                  RoomButton(
                    roomTitle: "Ruang 2",
                    onPressed: () {
                      // Aksi untuk Ruang 2 di Lantai 2
                    },
                  ),
                  RoomButton(
                    roomTitle: "Ruang 2",
                    onPressed: () {
                      // Aksi untuk Ruang 2 di Lantai 2
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget untuk LantaiItem
class LantaiItem extends StatelessWidget {
  final String lantaiTitle;
  final List<Widget> rooms; // List tombol ruangan

  const LantaiItem({required this.lantaiTitle, required this.rooms, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lantaiTitle,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5.0),
        Container(
          padding: const EdgeInsets.all(15.0),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 10.0, // Jarak antar tombol ruangan
              runSpacing: 15.0, // Jarak antar baris
              children: rooms, // Menampilkan tombol-tombol ruangan
            ),
          ),
        ),
        const SizedBox(height: 20.0), // Jarak antar lantai
      ],
    );
  }
}

// Widget untuk tombol ruangan
class RoomButton extends StatelessWidget {
  final String roomTitle;
  final VoidCallback onPressed;

  const RoomButton(
      {required this.roomTitle, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(roomTitle),
    );
  }
}
