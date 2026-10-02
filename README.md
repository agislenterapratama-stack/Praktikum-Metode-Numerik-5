# Penyelesaian Sistem Persamaan Linear (SPL) - Metode Numerik

Repositori ini berisi implementasi kode skrip GNU Octave / MATLAB untuk menyelesaikan Sistem Persamaan Linear (SPL) tiga variabel. Program ini mendemonstrasikan penyelesaian sebuah sistem matriks tunggal menggunakan tiga pendekatan metode numerik yang berbeda secara berurutan untuk memvalidasi konsistensi hasil komputasi aljabar linear.

## Metode Komputasi

1. **Eliminasi Gauss**
   Mengubah matriks *augmented* $[A\vert{}b]$ menjadi bentuk matriks segitiga atas melalui operasi *forward elimination*, kemudian mengekstraksi nilai akar variabel secara linier menggunakan *backward substitution* (substitusi mundur).
2. **Eliminasi Gauss-Jordan**
   Memperluas operasi baris elementer secara dua arah (menyerang elemen di atas dan di bawah pivot) disertai instruksi normalisasi pivot secara mandiri. Operasi ini mengubah area matriks koefisien murni menjadi Matriks Identitas, sehingga vektor solusi komputasi dapat dibaca secara absolut di kolom ujung matriks tanpa memerlukan substitusi turunan.
3. **Dekomposisi LU**
   Membongkar matriks koefisien $A$ menjadi dua buah sub-matriks fungsional. Algoritma menyuntikkan rasio pengali eliminasi ke dalam Matriks $L$ (*Lower* / Segitiga Bawah bernilai diagonal 1), sementara menyalin luaran eliminasi maju ke Matriks $U$ (*Upper* / Segitiga Atas). Penyelesaian akar matriks ditarik melalui dua lintasan substitusi vektor secara berurutan: substitusi maju $Ly = b$ dan substitusi mundur $Ux = y$.

## Persyaratan Sistem (Prerequisites)

Skrip ini tidak memerlukan *library* eksternal tambahan dan dapat dijalankan murni menggunakan:
* [GNU Octave](https://octave.org/)
* [MATLAB](https://www.mathworks.com/products/matlab.html)

## Cara Penggunaan (How to Run)

1. *Clone* repositori ini ke dalam direktori lokal komputermu:
   ```bash
   git clone (https://github.com/agislenterapratama-stack/Praktikum-Metode-Numerik-5)
