import 'package:flutter/material.dart';
import 'payment_screen.dart';

class SelectDurationScreen extends StatelessWidget {
  const SelectDurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Pilih Tiket Sewa",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNotification(),
            const SizedBox(height: 32),
            const Text(
              "Pilih Durasi Sewa",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _buildDurationOptions(context),
            const SizedBox(height: 40),
            _buildTicketButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildNotification() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color.fromRGBO(255, 171, 64, 1), width: 1),
      ),
      child: const Row(
        children: [
          Icon(Icons.info_outline, color: Colors.orange, size: 28),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "Keterlambatan pengembalian akan dikenakan biaya tambahan sebesar 200 won setiap 5 menit. Tidak ada batasan jumlah penyewaan selama 24 jam setelah transaksi pertama.",
              style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDurationOptions(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          _buildDurationCard(context, "1 Jam", "Rp.10.000", Icons.timer),
          const SizedBox(width: 12),
          _buildDurationCard(context, "2 Jam", "Rp.15.000", Icons.timelapse),
          const SizedBox(width: 12),
          _buildDurationCard(context, "4 Jam", "Rp.30.000", Icons.hourglass_top),
          const SizedBox(width: 12),
          _buildDurationCard(context, "8 Jam", "Rp.40.000", Icons.av_timer),
          const SizedBox(width: 12),
          _buildDurationCard(context, "24 Jam", "Rp.50.000", Icons.alarm),
        ],
      ),
    );
  }

  Widget _buildDurationCard(
      BuildContext context, String duration, String price, IconData icon) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentScreen(duration: duration, price: price),
          ),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(16),
        width: 140,
        decoration: BoxDecoration(
          color: Colors.orange.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.orangeAccent, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: Colors.orange),
            const SizedBox(height: 8),
            Text(
              duration,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.orangeAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketButton(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
          elevation: 6,
          shadowColor: Colors.orangeAccent.withOpacity(0.4),
        ),
        icon: const Icon(Icons.check_circle, color: Colors.white),
        label: const Text(
          "Saya sudah memiliki tiket",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
