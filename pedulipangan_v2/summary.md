# Analisis Proyek: Peduli Pangan Mobile (v2)

## 1. Struktur Proyek & Manajemen State

- **Framework**: Flutter.
- **Manajemen State**: **Global Singleton + setState**.
  - Menggunakan variabel global `globalCart` di `lib/models/cart.dart` untuk membagikan state keranjang.
  - Menggunakan `setState` untuk pembaruan UI lokal.
  - **Model Data**: Telah diperbarui dengan model yang lebih terstruktur di `lib/models/` (`product.dart`, `restaurant.dart`, `category_model.dart`, `order_model.dart`, dll).

## 2. Struktur Direktori

- **`lib/`**:
  - **`main.dart`**: Entry point.
  - **`theme.dart`**: Palet warna (`AppColors`) dan tema.
  - **`models/`**: Model data lengkap (`product.dart`, `restaurant.dart`, `cart.dart`, dll).
  - **`pages/`**:
    - `main_wrapper.dart`: Navigasi Utama (Home, Catering, Cart, Profile). Menggunakan `HomePageV3` sebagai halaman utama.
    - `home_page_v3.dart`: Halaman Home modern dengan fitur Featured, Kategori, Paket Hemat, dan Rekomendasi.
    - `product_detail_page.dart`: Halaman detail produk yang menerima objek `Product`.
    - `catering_menu.dart`: Halaman menu katering.
    - `surplus.dart`: Halaman surplus food (Flash Sale).

## 3. Fitur & Modul

### A. Autentikasi (UI)

- **Login/Register**: `login_page.dart`, `register_page.dart`. Validasi dummy.

### B. Aplikasi Utama (Navigasi Bawah)

1.  **Home (`HomePageV3`)**:
    - **Featured Items**: Slider item unggulan dengan visual menarik.
    - **Kategori**: Grid kategori makanan.
    - **Paket Hemat**: List horizontal paket makanan murah.
    - **Rekomendasi**: List vertikal rekomendasi restoran.
    - **Interaksi**: Item dapat diklik untuk masuk ke `ProductDetailPage`.
2.  **Catering**: `CateringPage`.
3.  **Cart**: `CartPage`.
4.  **Profile**: `ProfilePage`.

### C. Alur Pemesanan

1.  **Jelajah**:
    - Dari **Home** (`HomePageV3`) -> Klik Item -> `ProductDetailPage`.
    - Dari **Catering Menu** (`CateringMenuPage`) -> Klik Item -> `ProductDetailPage`.
    - Dari **Surplus** (`SurplusPage`) -> Klik Item -> `ProductDetailPage`.
2.  **Detail**: `ProductDetailPage` menampilkan detail `Product` (Gambar, Harga, Sisa Stok, Restoran).
    - Data dikirim via konstruktor `Product`.
3.  **Checkout**: `OrderMenuPage` (Stepper UI).

## 4. Status Terkini (Perubahan Terbaru)

- [x] **Integrasi HomePageV3**: `HomePageV3` kini menjadi halaman utama di `MainWrapper`.
- [x] **Model Product**: `HomePageV3`, `CateringMenuPage`, `SurplusPage`, dan `ProductDetailPage` kini menggunakan model `Product` yang seragam.
- [x] **Navigasi**: Alur navigasi antar halaman telah terhubung dengan baik menggunakan model data yang baru.
- [x] **Perbaikan UI**: Syntax error di `HomePageV3` telah diperbaiki.
- [x] **Web Support**: Perbaikan scroll behavior untuk versi web.

## 5. Area Pengembangan Selanjutnya

- **Integrasi Backend**: Data saat ini masih hardcoded/dummy di dalam widget (misal di `HomePageV3` dan `CateringMenuPage`). Perlu dihubungkan ke API/Database.
- **Manajemen State**: Pertimbangkan migrasi ke Provider/Bloc/GetX untuk manajemen state yang lebih robust, terutama untuk Cart dan User Session.
- **Fitur Surplus**: Integrasi lebih lanjut fitur surplus food dengan logika bisnis yang real.
