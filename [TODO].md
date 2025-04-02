[TODO]
Combined Planned Order 


Tabella principale
+ Semafoto sulla base di PlndOrderCommittedQty/RequirementQuantityInBaseUnit
Selezione multipla + action per conversione 
  --> Aprire dialog ripresentare tutte le righe selezionata ed avere la quantità modificabile (creare colonna custom "quantità da lanciare" --> PlndOrderCommittedQty)
--> all'ok lancio il servizio

(1)
--> Components
  --> Action assegna pezze --> naviga verso una nuova pagina che mostra in testa una tabella con il fabbisogno (riga selezionata) e sotto la tabella con le pezze disponibili (stock - quantità disponibili) --> VEDERE TRANSAZIONE _FSH_PCW_ --> Action assegna pezze --> Aggiornare la TotalAllocQty nella tabella principale (components)
  --> Action disassegna pezze --> Lo stesso ma impostando la quantity a 0
  --> Action Where used




--> Capacity 
  --> Single select + tasto per modificare work center
    --> Selezionare il work center tramite annotazione

--> Components
  --> Semafoto sulla base --> AvailableQuantity/RequiredQuantity


cds import srv/external/ZZ1_COMBINEDPLNORDERSAPI_CDS.edmx --from edmx --as cds --force
cds import srv/external/ZZ1_MASTERPLANNEDORDERAPI_CDS.edmx --from edmx --as cds --force
cds import srv/external/ZZ1_PLANNEDORDERSAPI_CDS.edmx --from edmx --as cds --force