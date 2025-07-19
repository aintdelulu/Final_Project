import 'package:flutter/material.dart';

class DashboardSummaryCards extends StatelessWidget {
  final int totalUsers;
  final int totalOrders;
  final double totalRevenue;

  const DashboardSummaryCards({
    super.key,
    required this.totalUsers,
    required this.totalOrders,
    required this.totalRevenue,
  });

  @override
  Widget build(BuildContext context) {
    const brown = Color(0xFF8B4513);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _DashboardCard(title: "Users", value: "$totalUsers", icon: Icons.people),
        _DashboardCard(title: "Orders", value: "$totalOrders", icon: Icons.shopping_cart),
        _DashboardCard(title: "Revenue", value: "\$$totalRevenue", icon: Icons.attach_money),
      ],
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _DashboardCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    const brown = Color(0xFF8B4513);
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: brown),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(title, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
