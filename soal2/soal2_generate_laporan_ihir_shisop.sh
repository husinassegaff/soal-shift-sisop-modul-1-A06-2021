#Transaksi terakhir dengan profit percentage terbesar yaitu *ID Transaksi* 
#dengan persentase *Profit Percentage*%.

#Daftar nama customer di Albuquerque pada tahun 2017 antara lain:
#*Nama Customer1*
#*Nama Customer2* dst

#Tipe segmen customer yang penjualannya paling sedikit adalah *Tipe Segment* 
#dengan *Total Transaksi* transaksi.

#Wilayah bagian (region) yang memiliki total keuntungan (profit) yang paling 
#sedikit adalah *Nama Region* dengan 
#total keuntungan *Total Keuntungan (Profit)*

#!/bin/bash
 
awk 'BEGIN {FS = "\t";} 
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

END {printf ("Transaksi terakhir dengan profit percentage terbesar yaitu " orderId " dengan persentase " maxProfitPercentage "%.\n");}' ~/Downloads/Laporan-TokoShiSop.tsv


