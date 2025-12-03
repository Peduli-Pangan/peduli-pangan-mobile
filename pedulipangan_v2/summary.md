# Analisis Proyek: Peduli Pangan Mobile (v2)

## 1. Struktur Proyek & Manajemen State

- **Framework**: Flutter.
- **Manajemen State**: **Global Singleton + setState**.
  - Menggunakan variabel global `globalCart` di `lib/models/cart.dart` untuk membagikan state keranjang.
  - Menggunakan `setState` untuk pembaruan UI lokal (status loading, stepper, perpindahan tab).
  - **Catatan**: Tidak ada library manajemen state tingkat lanjut (Provider, GetX, Bloc) yang terinstal saat ini.

## 2. Struktur Direktori

- **`lib/`**:
  - **`main.dart`**: Entry point. Mengatur `MaterialApp` dan tema.
  - **`theme.dart`**: Palet warna terpusat (`AppColors`) dan data tema.
  - **`models/`**: Model data (`menu.dart`, `cart.dart`, `order_history.dart`).
  - **`pages/`**: Berisi semua layar UI.
    - `main_wrapper.dart`: Menangani Navigasi Bawah (Home, Catering, Cart, Profile).

## 3. Fitur & Modul

### A. Autentikasi (Hanya UI)

- **Login**: `login_page.dart`. Memvalidasi email/password (cek dummy). Tautan ke Daftar dan Lupa Password. Google Sign-In hanya placeholder.
- **Register**: `register_page.dart`. Form standar dengan validasi.
- **Forgot Password**: `forgot_password_page.dart` (UI ada).

### B. Aplikasi Utama (Navigasi Bawah)

1.  **Home**: `home_page.dart`. Halaman landasan sederhana dengan tombol "Order Now" yang mengarah ke Catering.
    - _Catatan_: Ada `home_page_v3.dart` yang merupakan UI Home yang jauh lebih canggih/modern (Promo Surplus, Kategori, Rekomendasi) tetapi **TIDAK** digunakan saat ini di `main_wrapper.dart`.
2.  **Catering**: `catering_page.dart`.
    - Fitur: Penghitung waktu mundur (penutupan batch), Dropdown Lokasi (dummy), Input Voucher.
    - Alur: Mengarah ke `CateringMenuPage`.
3.  **Cart**: `cart_page.dart`.
    - Fitur: Menampilkan item dari `globalCart`, tambah/kurang kuantitas.
    - Alur: Mengarah ke Checkout (`OrderMenuPage`).
4.  **Profile**: `profile_page.dart`.
    - Fitur: Info pengguna (statis), "Lanjut Belanja", "Keluar", "Transaksi Terakhir".
    - Alur: "Lihat detail" -> Snackbar (Belum terhubung sepenuhnya ke halaman detail). "Lihat Semua Riwayat" -> `RiwayatPesananPage`.

### C. Alur Pemesanan

1.  **Jelajah**: `CateringMenuPage` menampilkan menu harian (Makan Siang/Malam).
2.  **Detail**: `ProductDetailPage` menampilkan detail makanan, harga, dan "Tambah ke Keranjang".
    - Tautan ke `RestaurantDetailPage`.
3.  **Checkout**: `OrderMenuPage`.
    - **UI Stepper**: Tinjauan Menu -> Pemilihan Hari -> Permintaan Khusus (Rasa) -> Alat Makan -> Konfirmasi.
    - **Logika**: Menggunakan `preSelectedItems` dari Keranjang atau default.
4.  **Riwayat**: `RiwayatPesananPage`. Menampilkan daftar pesanan masa lalu (dummy).

## 4. Alur yang Berjalan (Terhubung)

- [x] **Login -> Aplikasi Utama**: Berjalan (Validasi dummy `test@example.com` / `password123`).
- [x] **Navigasi**: Bar Bawah berjalan (`MainWrapper`).
- [x] **Alur Catering**: `CateringPage` -> `CateringMenuPage` -> `ProductDetailPage` -> `Tambah ke Keranjang`.
- [x] **Alur Keranjang**: Item muncul di Keranjang -> Tombol `Checkout` membuka `OrderMenuPage`.
- [x] **Alur Checkout**: Proses 5 langkah berjalan secara visual. Tombol "Finalisasi" menampilkan SnackBar.

## 5. Terputus / Tidak Digunakan / Masalah

- **`home_page_v3.dart`**: UI Home yang jauh lebih baik ada tetapi tidak digunakan (yatim piatu).
- **`surplus.dart`**: Kemungkinan terkait dengan fitur "Surplus" di v3, saat ini tidak digunakan di alur utama.
- **Integrasi Backend**: Semua data (Menu, Keranjang, Riwayat, Auth) bersifat lokal/dummy.
- **Google Sign-In**: Tombol ada tetapi tidak melakukan apa-apa (Placeholder).
- **Aksi Profil**: "Verifikasi Telepon/Email" dan "Keluar" hanya visual.
- **Persistensi State**: Data keranjang hilang saat aplikasi dimulai ulang (hanya disimpan di memori).

## 6. Rekomendasi

1.  **Adopsi GetX/Provider**: Sesuai permintaan, migrasi ke manajer state yang tepat akan membuat aplikasi lebih tangguh, terutama untuk Keranjang dan Sesi Pengguna.
2.  **Aktifkan `home_page_v3.dart`**: UI Home v3 jauh lebih terpoles. Pertimbangkan untuk mengganti `home_page.dart` dengannya.
3.  **Hubungkan Backend**: Ganti data dummy dengan panggilan API aktual.
