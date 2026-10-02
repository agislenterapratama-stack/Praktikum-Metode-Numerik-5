% ==========================================
% PENYELESAIAN SPL DENGAN 3 METODE
% ==========================================
clear; clc;

% Inisialisasi Matriks A dan Vektor b berdasarkan soal
A = [ 2,  1, -1;
      4,  3,  1;
     -2,  1,  2];
b = [3; 9; 4];
n = length(b);

fprintf('==========================================\n');
fprintf('SISTEM PERSAMAAN LINEAR AWAL\n');
fprintf('==========================================\n');
fprintf('Matriks A:\n'); disp(A);
fprintf('Vektor b:\n'); disp(b);


%% a) ELIMINASI GAUSS (Forward Elimination & Backward Substitution)
fprintf('\n==========================================\n');
fprintf('a) METODE ELIMINASI GAUSS\n');
fprintf('==========================================\n');
Aug = [A b];

% 1. Forward Elimination (Membentuk segitiga atas)
for k = 1:n-1
    for i = k+1:n
        m = Aug(i,k) / Aug(k,k);
        Aug(i,:) = Aug(i,:) - m * Aug(k,:);
    end
end
fprintf('Matriks [A b] setelah Forward Elimination:\n');
disp(Aug);

% 2. Backward Substitution
x_gauss = zeros(n,1);
x_gauss(n) = Aug(n,n+1) / Aug(n,n);
for i = n-1:-1:1
    x_gauss(i) = (Aug(i,n+1) - Aug(i,i+1:n) * x_gauss(i+1:n)) / Aug(i,i);
end
fprintf('Solusi (X1, X2, X3) - Eliminasi Gauss:\n');
disp(x_gauss);


%% b) ELIMINASI GAUSS-JORDAN
fprintf('\n==========================================\n');
fprintf('b) METODE ELIMINASI GAUSS-JORDAN\n');
fprintf('==========================================\n');
% Kita mulai lagi dari Matriks awal A dan b agar prosesnya independen
Aug_GJ = [A b];

for k = 1:n
    % Normalisasi baris pivot agar elemen diagonal utama menjadi 1
    Aug_GJ(k,:) = Aug_GJ(k,:) / Aug_GJ(k,k);

    % Eliminasi elemen di atas dan di bawah diagonal utama
    for i = 1:n
        if i ~= k
            m = Aug_GJ(i,k);
            Aug_GJ(i,:) = Aug_GJ(i,:) - m * Aug_GJ(k,:);
        end
    end
end
fprintf('Matriks [A b] setelah Gauss-Jordan (Matriks Kiri = Identitas):\n');
disp(Aug_GJ);

% Hasilnya bisa langsung dibaca pada kolom terakhir
x_gj = Aug_GJ(:, n+1);
fprintf('Solusi (X1, X2, X3) - Eliminasi Gauss-Jordan:\n');
disp(x_gj);


%% c) DEKOMPOSISI LU
fprintf('\n==========================================\n');
fprintf('c) METODE DEKOMPOSISI LU\n');
fprintf('==========================================\n');
L = eye(n);  % Matriks identitas sebagai dasar L
U = A;       % Matriks A disalin untuk diubah menjadi U

% 1. Mencari Matriks L dan U dari proses forward elimination
for k = 1:n-1
    for i = k+1:n
        m = U(i,k) / U(k,k);
        L(i,k) = m;                 % Menyimpan nilai pengali ke matriks L
        U(i,:) = U(i,:) - m * U(k,:);
    end
end

fprintf('Matriks L (Segitiga Bawah, Diagonal = 1):\n'); disp(L);
fprintf('Matriks U (Segitiga Atas, Hasil Forward Elimination):\n'); disp(U);

% Pembuktian A = L * U
fprintf('Pembuktian L * U (Harus sama dengan Matriks A):\n');
disp(L*U);

% 2. Forward Substitution (L * y = b)
y = zeros(n,1);
y(1) = b(1) / L(1,1);
for i = 2:n
    y(i) = (b(i) - L(i,1:i-1) * y(1:i-1)) / L(i,i);
end
fprintf('Vektor y dari penyelesaian L * y = b:\n');
disp(y);

% 3. Backward Substitution (U * x = y)
x_lu = zeros(n,1);
x_lu(n) = y(n) / U(n,n);
for i = n-1:-1:1
    x_lu(i) = (y(i) - U(i,i+1:n) * x_lu(i+1:n)) / U(i,i);
end
fprintf('Solusi (X1, X2, X3) - Dekomposisi LU:\n');
disp(x_lu);
