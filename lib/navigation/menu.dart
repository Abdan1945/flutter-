import 'package:flutter/material.dart';
import 'package:flutter_abdan_rpl3/navigation/about_page.dart';

class MenuNav extends StatelessWidget {
  const MenuNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          "Menu Navigasi & Latihan",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1E293B),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: const Color(0xFFE2E8F0),
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- HEADER SECTION ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF4F46E5), Color(0xFF3B82F6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF3B82F6).withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Halo, Abdan! 👋",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Silakan pilih menu latihan navigasi dan layout Flutter di bawah ini.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- KATEGORI 1: PROFILE / ABOUT ---
            const Text(
              "Utama",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF64748B),
              ),
            ),
            const SizedBox(height: 12),
            _buildMenuCard(
              context: context,
              title: "Halaman About",
              subtitle: "Navigasi dengan passing parameter data",
              icon: Icons.person_rounded,
              iconColor: const Color(0xFF4F46E5),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AboutPage(
                        nama: "Ghoyatul Abdan",
                        kelas: "XII RPL 3",
                        umur: 17,
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
        
            _buildMenuCard(
              context: context,
              title: "Formulir Pendaftaran Ekskul",
              subtitle: "Latihan Form, Validation, & Passing Data",
              icon: Icons.assignment_rounded,
              iconColor: Colors.pink,
              onTap: () => Navigator.pushNamed(context, '/form_ekskul'),
            ),
            const SizedBox(height: 12),
            _buildMenuCard(
              context: context,
              title: "Formulir Pendaftaran PPDB",
              subtitle: "Pendaftaran siswa baru",
              icon: Icons.school_rounded,
              iconColor: Colors.blue,
              onTap: () => Navigator.pushNamed(context, '/formppdb'),
            ),
            const SizedBox(height: 24),

            // --- KATEGORI 2: GRID & LIST ---
            const Text(
              "List & Grid View",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF64748B),
              ),
            ),
            const SizedBox(height: 12),
            _buildMenuCard(
              context: context,
              title: "Halaman Latihan Grid",
              subtitle: "Eksplorasi GridView dasar",
              icon: Icons.grid_view_rounded,
              iconColor: Colors.orange,
              onTap: () => Navigator.pushNamed(context, '/grid'),
            ),
            const SizedBox(height: 10),
            _buildMenuCard(
              context: context,
              title: "Halaman Latihan List",
              subtitle: "Implementasi ListView standar",
              icon: Icons.list_alt_rounded,
              iconColor: Colors.green,
              onTap: () => Navigator.pushNamed(context, '/list'),
            ),
            const SizedBox(height: 10),
            _buildMenuCard(
              context: context,
              title: "Halaman Latihan Grid (Alternatif)",
              subtitle: "Variasi gridview tambahan",
              icon: Icons.dashboard_customize_rounded,
              iconColor: Colors.orange,
              onTap: () => Navigator.pushNamed(context, '/gridview'),
            ),
            const SizedBox(height: 24),

            // --- KATEGORI 3: LAYOUTING & STRUKTUR ---
            const Text(
              "Layout & Komponen",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF64748B),
              ),
            ),
            const SizedBox(height: 12),
            _buildMenuCard(
              context: context,
              title: "Halaman Latihan Container",
              subtitle: "Eksperimen styling dengan Container",
              icon: Icons.web_asset_rounded,
              iconColor: Colors.purple,
              onTap: () => Navigator.pushNamed(context, '/latihan_container'),
            ),
            const SizedBox(height: 10),
            _buildMenuCard(
              context: context,
              title: "Halaman Latihan Column",
              subtitle: "Eksperimen struktur Row dan Column",
              icon: Icons.web_rounded,
              iconColor: Colors.purple,
              onTap: () => Navigator.pushNamed(context, '/row_column'),
            ),
            const SizedBox(height: 10),
            _buildMenuCard(
              context: context,
              title: "Halaman Latihan Sized Box",
              subtitle: "Penggunaan SizedBox untuk mengatur jarak",
              icon: Icons.window_rounded,
              iconColor: Colors.purple,
              onTap: () => Navigator.pushNamed(context, '/sized_box'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Helper widget untuk membuat card menu yang konsisten dan rapi
  Widget _buildMenuCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: iconColor, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Color(0xFF94A3B8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}