Pouziti:

1. Inicializace -vytvoreni adresarove struktury:
        
        Pomoci init.sh:
        
        init.sh [ADRESAR] [POCET UKOLU] [SOUBOR SE JMENY, E-MAILY A GIT REPOZITARI STUDENTU]
       
        Vytvori nasledujici adresare v ADRESAR:
                kontrolovac (pokud uz existuje [ADRESAR]/kontrolovac, vypise se chybove hlaseni)
                kontrolovac/ukoly
                kontrolovac/ukoly_01, ..., kontrolovac/ukoly_[POCET UKOLU]
                kontrolovac/ukoly/tmp
                kontrolovac/studenti/gity
        Zkopiruje do "kontrolovac/ukoly/repozitare.txt" [SOUBOR SE JMENY, E-MAILY A GIT REPOZITARI STUDENTU].


2. Inicializace -ulozeni skriptu.

        Soubory z adresare "copy_to_ukoly" je potreba zkopirovat do "kontrolovac/ukoly".


3. Ukladani vstupnich a vystupnich souboru pro testovani spravnosti reseni ukolu.

        Soubory pro "podukol" z "ukol_N" je potreba ulozit jako
                "kontrolovac/ukoly/ukol_N/podukol.in",
                "kontrolovac/ukoly/ukol_N/podukol.in".


4. Spusteni kontroly ukolu:
        
        Pomoci "kontrolovac/ukoly/test_all.sh".
