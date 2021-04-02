#!/bin/bash

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

(echo "Daftar nama customer di Alburquerque pada tahun 2017 antara lain:"
awk -F "\t" '/Albuquerque/&&/.....-17/&&$3 ~ /.....-17/ NR > 1  { print $7}' Laporan-TokoShiSop.tsv | uniq) >> hasil.txt

awk '

BEGIN {FS = "\t";} 
{
    if(NR != 1){

		kat[0] = "Home Office";
		kat[1]="Consumer";
		kat[2]="Corporate";

		if($8 == kat[0]){
			tr[0] += 1;
		}
		if($8 == kat[1]){
			tr[1] += 1;
		}
		if($8 == kat[2]){
			tr[2] += 1;
		}

		for (t in kat){
			if(tr[t] <= trmin){
				ke = t;
			}
		}

		ar[0]="Central";
			ar[1]="East";
			ar[2]="South";
		ar[3]="West";

		if($13 == ar[0]){
					par[0] += $21;
			}
			if($13 == ar[1]){
					par[1] += $21;
			}
			if($13 == ar[2]){
					par[2] += $21;
			}
		if($13 == ar[3]){
			par[3] += $21;
		}

		for(r in par){
			if(par[r] <= pmin){
							kep = r;
					}
		}
	}

}

END {
	printf("\nTipe segmen customer yang penjualannya paling sedikit adalah %s \ndengan total transaksi %d.\n\n",kat[ke], tr[ke]);

	printf("Wilayah bagain (region) yang memiliki total keuntungan (profit) yang \npaling sedikit adalah %s dengan total keuntungan %d (Profit).\n\n", ar[kep], par[kep]);
 }' Laporan-TokoShiSop.tsv >> hasil.txt
 
