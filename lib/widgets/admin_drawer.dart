import 'package:flutter/material.dart';
import '../models/auth_service.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const brown = Color(0xFF8B4513);
    const beige = Color(0xFFF5EBDD);

    return Drawer(
      child: Container(
        color: beige,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: brown),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/logo.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text("Admin Menu", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text("Dashboard"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text("Users"),
              onTap: () => Navigator.pushNamed(context, '/admin/users'),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text("Orders"),
              onTap: () => Navigator.pushNamed(context, '/admin/orders'),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                AuthService.logout();
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
