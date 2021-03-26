# soal-shift-sisop-modul-1-A06-2021
Jawaban soal praktikum Sistem Operasi modul 1

---
## Tabel Konten
- [Soal 1](#soal-1)
  - [Soal 1.a](#soal-1a)
  - [Soal 1.b](#soal-1b)
  - [Soal 1.c](#soal-1c)
  - [Soal 1.d](#soal-1d)

- [Soal 2](#soal-2)
  - [Soal 2.a](#soal-2a)
  - [Soal 2.b](#soal-2b)
  - [Soal 2.c](#soal-2c)
  - [Soal 2.d](#soal-2d)

- [Soal 3](#soal-3)
  - [Soal 3.a](#soal-3a)
  - [Soal 3.b](#soal-3b)
  - [Soal 3.c](#soal-3c)
  - [Soal 3.d](#soal-3d)

## Soal 1

### Soal 1.a
### Soal 1.b
### Soal 1.c
### Soal 1.d

---
## Soal 2 
**[Source Code Soal 2](https://github.com/husinassegaff/soal-shift-sisop-modul-1-A06-2021/blob/Rafki/soal2/soal2_generate_laporan_ihir_shisop.sh)**

**Deskripsi:**\
Membuat laporan untuk rapat tahunan sebuah startup bernama “TokoShiSop” berupa kesimpulan-kesimpulan, yakni:

### Soal 2.a
**Deskripsi:**\
Mengetahui ID karyawan dengan *Profit Percentage* terbesar.

**Note:**\
*Profit Percentage = (Profit ÷ Cost Price) × 100*

**Pembahasan:**

```
awk '
BEGIN {FS = "\t";} 
{
    if(NR != 1){
        profitPercentage = ($21 / ($18 - $21)) * 100;
        if(maxProfitPercentage <= profitPercentage){
            maxProfitPercentage = profitPercentage;
            orderId = $2;
            row = $1;
        }
    }
}
END {
    	printf ("Transaksi terakhir dengan profit percentage terbesar yaitu %s \ndengan persentase %.2f%%\n\n", orderId, maxProfitPercentage);
 }' Laporan-TokoShiSop.tsv >> hasil.txt
```
- Data dari `Laporan-TokoShiSop.tsv` berbentuk tabel yang dipisahkan oleh `TAB`.
- AWK akan dimulai dari *statement* **BEGIN**.
- Bagian `BEGIN {FS = "\t";}`, mengindikasi kan bahwa ekstraksi data menggunakan *filed separator (FS)* berupa `\t` alias `TAB`, sehingga tiap kolom ke-n akan menempati `$n`.
- Karna data memiliki *header* digunakan `if(NR != 1)` agar ekstraksi data sesuai dengan kolom tanpa mengambil nama kolom.
- Seluruh baris nantinya akan dicari *profit percentage*-nya dengan `profitPercentage = ($21 / ($18 - $21)) * 100;` dan di kembalikan ke variabel `profitPercentage`.
- Kemudian nanti setiap baris akan dilakukan pengecekan melalui *conditional* dibawah.  Variabel `maxProfitPercentage` berisi **NULL** sehingga otomatis **saat pertama kali** akan terganti kan oleh `profitPercentage`, hal ini berjalan terus hingga baris akhir data.

```
        profitPercentage = ($21 / ($18 - $21)) * 100;
        if(maxProfitPercentage <= profitPercentage){
            maxProfitPercentage = profitPercentage;
            orderId = $2;
            row = $1;
        }
```
- Kemudian akan terjadi pengoperan *operand* ke `maxProfitPercentage`, dan ID karyawana serta urutan barisnya akan disimpan ke `orderID` dan `row` secara berturut-turun.
- Setelah **BEGIN** selesai, awk akan mengeksekusi **END**, disini hasil `printf(...)` berupa *float* dua angka dibelakang koma akan di outputkan ke `hasil.txt` menghasilkan:

```
Transaksi terakhir dengan profit percentage terbesar yaitu CA-2017-121559 
dengan persentase 100.00%
```


### Soal 2.b

**Deskripsi:**\
Mencari daftar nama pelanggan yang berasal dari Albuquerque yang pernah bertransaksi pada tahun 2017.

**Pembahasan:**
```
(echo "Daftar nama customer di Alburquerque pada tahun 2017 antara lain:"
awk -F "\t" '/Albuquerque/&&/.....-17/ NR > 1  {print$7}' Laporan-TokoShiSop.tsv | uniq) >> hasil.txt
```
- Script `echo "..."` untuk memenuhi syarat format jawaban
- Standar opsi awk `-F "\t"` menyatakan *filed separator (FS)* berupa `\t` alias `TAB`, sehingga tiap kolom ke-n akan menempati `$n`.
- Bagian `/Albuquerque/&&/.....-17/` merupakan *regular expression* yang mensyaratkan bahwa dalam baris data harus terdapat nilai `Albuquerque` dan `.` berupa *wildcard* berupa karakter bebas, `.....-17` untuk memilih data dengan tahun transkasi 2017.
- Perintah `{print$7}` akan mencetak bagian kolom ke 7 dari file `Laporan-TokoShiSop.tsv` dan disaring dengan *script bash* `| uniq` lalu masuk ke `hasil.txt` menghasilkan:
- Tanda kurung di awal dan di akhiran agar dimasukan sekaligus ke `hasil.txt`

```
Daftar nama customer di Alburquerque pada tahun 2017 antara lain:
Michelle Lonsdale
Benjamin Farhat
David Wiener
Susan Vittorini
```

### Soal 2.c

**Deskripsi:**\
Mencari segment customer dan jumlah transaksinya yang paling sedikit.

**Pembahasan:**
- Menggunakan struktur `awk` yang sama dengan [soal 2.a](#soal-2a) dimulai dengan **BEGIN**.
- memasukan prasyarat berupa `Home Office`, `Consumer`, 'Corporate' ke sebuah array `kat`.
- Kemudian dengan *conditional if* setiap kali melewati baris yang memenuhi syarat akan dihitung per-array `tr`.
- Di akhiran akan dilakukan *looping* `for( value in array )` mencari indeks array dengan nilai minimum yakni indeks `ke`.
- Bagian **END** kemudian mencetak serta hasil indeks `ke` melalui `printf(...)` akan di outputkan ke `hasil.txt` menghasilkan:

```
Tipe segmen customer yang penjualannya paling sedikit adalah Home Office 
dengan total transaksi 1783.
```


### Soal 2.d

**Deskripsi:**\
Mencari wilayah bagian (region) yang memiliki total keuntungan (profit) paling sedikit dan total keuntungan wilayah tersebut.

**Pembahasan:**
- Menggunakan struktur `awk` yang sama dengan [soal 2.a](#soal-2a) dimulai dengan **BEGIN**.
- memasukan prasyarat berupa `Central`, `West`, `North` dan `South` ke sebuah array `ar`.
- Kemudian dengan *conditional if* setiap kali melewati baris yang memenuhi syarat akan dihitung per-array `par`.
- Di akhiran akan dilakukan *looping* `for( value in array )` mencari indeks array dengan nilai minimum yakni indeks `kep`.
- Bagian **END** kemudian mencetak serta hasil indeks `kep` melalui `printf(...)` akan di outputkan ke `hasil.txt` menghasilkan:

```
Wilayah bagain (region) yang memiliki total keuntungan (profit) yang 
paling sedikit adalah Central dengan total keuntungan 39706 (Profit).
```


**Komentar:**\
Cukup bingung apakah tiap sub soal menggunakan awk tersendiri apa harus *single* AWK. Terhambat saat ekstraksi nama yang unik.

---
## Soal 3 

### Soal 3.a
### Soal 3.b
### Soal 3.c
### Soal 3.d
