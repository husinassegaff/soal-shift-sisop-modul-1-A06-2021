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


END {
    printf ("Transaksi terakhir dengan profit percentage terbesar yaitu %s dengan persentase %.2f%%\n\n", orderId, maxProfitPercentage);
    
    
    }' Laporan-TokoShiSop.tsv

