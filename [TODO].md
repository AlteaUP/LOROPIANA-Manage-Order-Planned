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

____STOCK_____

// Quantities
@Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
@DefaultAggregation : #SUM
cast(sum(MatlStkChangeQtyInBaseUnit) as nsdm_stock_qty preserving type)                                                                         as MatlWrhsStkQtyInMatlBaseUnit,
@Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
@DefaultAggregation : #SUM
cast(sum(MatlCnsmpnQtyInMatlBaseUnit) as nsdm_consumption_qty preserving type)                                                                  as MatlCnsmpnQtyInMatlBaseUnit,
@Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
@DefaultAggregation : #SUM
cast(sum(case when  MatlStkChangeQtyInBaseUnit > 0 then MatlStkChangeQtyInBaseUnit else 0 end) as nsdm_stock_increase_qty preserving type)      as MatlStkIncrQtyInMatlBaseUnit,
@Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
@DefaultAggregation : #SUM
cast(sum(case when  MatlStkChangeQtyInBaseUnit < 0 then abs(MatlStkChangeQtyInBaseUnit) else 0 end) as nsdm_stock_decrease_qty preserving type) as MatlStkDecrQtyInMatlBaseUnit,



o	Assegnato produttivo totale usare la cds ZZ1_I_ARUN_BDBSSUMQTY_CDS facendo la somma qtà accedendo per plant materiale batch storage location

nsdm_stock_qty        --> Unrestricted      -- Stock
nsdm_consumption_qty  --> AssQuantityigned  -- Stock

nsdm_stock_increase_qty --> CAMPO CALCOLATO -- 
nsdm_stock_decrease_qty --> CAMPO CALCOLATO -- 





--> Capacity 
  --> Single select + tasto per modificare work center
    --> Selezionare il work center tramite annotazione

--> Components
  --> Semafoto sulla base --> AvailableQuantity/RequiredQuantity


cds import srv/external/ZZ1_COMBINEDPLNORDERSAPI_CDS.edmx --from edmx --as cds --force
cds import srv/external/ZZ1_MASTERPLANNEDORDERAPI_CDS.edmx --from edmx --as cds --force
cds import srv/external/ZZ1_PLANNEDORDERSAPI_CDS.edmx --from edmx --as cds --force
cds import srv/external/ZZ1_COMBPLNORDERSSTOCKAPI_CDS.edmx --from edmx --as cds --force