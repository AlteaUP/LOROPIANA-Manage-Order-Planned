/* checksum : 92c8a6bd274d66e12fb811cd492d6248 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_PLANNEDORDERSAPI_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Cliente'
@sap.value.list : 'true'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_Customer_VH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'BPCustomerName'
  @sap.label : 'Cliente'
  @sap.quickinfo : 'Codice cliente'
  key Customer : String(10) not null;
  @sap.label : 'Nome cliente 1'
  @sap.quickinfo : 'Nome 1'
  OrganizationBPName1 : String(35);
  @sap.label : 'Nome business partner 1'
  @sap.quickinfo : 'Nome 1'
  BusinessPartnerName1 : String(40);
  @sap.label : 'Nome cliente 2'
  @sap.quickinfo : 'Nome 2'
  OrganizationBPName2 : String(35);
  @sap.label : 'Nome business partner 2'
  @sap.quickinfo : 'Nome 2'
  BusinessPartnerName2 : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Paese/Regione'
  @sap.quickinfo : 'Chiave paese/regione'
  Country : String(3);
  @sap.label : 'Città'
  CityName : String(35);
  @sap.label : 'Indirizzo business partner - città'
  @sap.quickinfo : 'Località'
  BPAddrCityName : String(40);
  @sap.label : 'Via'
  @sap.quickinfo : 'Via e numero civico'
  StreetName : String(35);
  @sap.label : 'Indirizzo business partner - via'
  @sap.quickinfo : 'Via'
  BPAddrStreetName : String(60);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice di avviamento postale'
  PostalCode : String(10);
  @sap.label : 'Nome del cliente'
  CustomerName : String(80);
  @sap.label : 'Nome del cliente business partner'
  @sap.quickinfo : 'Nome del cliente'
  BPCustomerName : String(81);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo conti'
  @sap.quickinfo : 'Gruppo conti cliente'
  CustomerAccountGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Autorizzazione'
  @sap.quickinfo : 'Gruppo di autorizzazione'
  AuthorizationGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Indicatore scopo raggiunto'
  @sap.quickinfo : 'Indicatore per obiettivo commerciale raggiunto'
  IsBusinessPurposeCompleted : String(1);
  @sap.label : 'Concorrente'
  @sap.quickinfo : 'Codice: concorrente'
  IsCompetitor : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Business partner'
  @sap.quickinfo : 'Numero business partner'
  BusinessPartner : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo di business partner'
  @sap.quickinfo : 'Tipo business partner'
  BusinessPartnerType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Imp. TitTrattDt'
  @sap.quickinfo : 'BP: indicatore per impostare i titolari del trattamento dati'
  DataControllerSet : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController1 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController2 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController3 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController4 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController5 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController6 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController7 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController8 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController9 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController10 : String(30);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Settore merceologico'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_Division {
  @sap.display.format : 'UpperCase'
  @sap.text : 'Division_Text'
  @sap.label : 'Settore merceologico'
  key Division : String(2) not null;
  @sap.label : 'Descrizione settore merceologico'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Division_Text : String(20);
  @sap.label : 'ID ogg. sett. merc.'
  @sap.quickinfo : 'ID oggetto settore merceologico'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DivisionOID : String(128);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Raggruppamento categorie posizione'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ItemCategoryGroup {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ItemCategoryGroup_Text'
  @sap.label : 'Gruppo cat. pos.'
  @sap.quickinfo : 'Raggruppamento categorie pos. da anagrafica del materiale'
  key ItemCategoryGroup : String(4) not null;
  @sap.label : 'Descrizione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ItemCategoryGroup_Text : String(20);
  @sap.label : 'ID ogg. gr. CatPos'
  @sap.quickinfo : 'ID oggetto per gruppo categoria di posizione'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ItemCategoryGroupOID : String(128);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Responsabile MRP'
@sap.value.list : 'true'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_MRPControllerVH {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Divisione'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.text : 'MRPControllerName'
  @sap.label : 'Responsabile MRP'
  key MRPController : String(3) not null;
  @sap.label : 'Nome resp. MRP'
  @sap.quickinfo : 'Nome responsabile MRP'
  MRPControllerName : String(18);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Divisione'
@sap.value.list : 'true'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_PlantStdVH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'PlantName'
  @sap.label : 'Divisione'
  key Plant : String(4) not null;
  @sap.label : 'Nome divisione'
  PlantName : String(30);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Gruppo di prodotti'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ProductGroup_2 {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductGroup_Text'
  @sap.label : 'Gruppo di prodotti'
  key ProductGroup : String(9) not null;
  @sap.label : 'Descrizione gruppo di prodotti'
  @sap.quickinfo : 'Descrizione gruppo prodotti'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductGroup_Text : String(20);
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_ProductValuationClass/ValuationClass_Text'
  @sap.label : 'Classe di valor.'
  @sap.value.list : 'standard'
  ValuationClass : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ch. valori acquisto'
  @sap.quickinfo : 'Chiave valori d''acquisto'
  @sap.value.list : 'standard'
  PurchasingAcknProfile : String(4);
  to_ProductValuationClass : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_Prodvaluationclass {  };
  to_PurgAcknowledgmentProfile : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_PurgAcknowledgmentProfile {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Stato prodotto valido per tutte le divisioni'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ProductStatus {
  @sap.display.format : 'UpperCase'
  @sap.text : 'Status_Text'
  @sap.label : 'Stato prodotto'
  @sap.quickinfo : 'Stato del prodotto spec. della divisione'
  key Status : String(2) not null;
  @sap.label : 'Tst st. val. tutte div.'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Status_Text : String(25);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Help valori per prodotto'
@sap.value.list : 'true'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ProductStdVH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'Product_Text'
  @sap.label : 'Prodotto'
  @sap.quickinfo : 'Codice prodotto'
  key Product : String(40) not null;
  @sap.label : 'Descrizione prodotto'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Product_Text : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'ID prodotto esterno'
  @sap.quickinfo : 'Rappresentazione esterna del codice materiale'
  ProductExternalID : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Tipo di prodotto'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_Producttype {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductType_Text'
  @sap.label : 'Tipo di prodotto'
  key ProductType : String(4) not null;
  @sap.label : 'Descrizione tipo di prodotto'
  @sap.quickinfo : 'Descrizione del tipo di prodotto'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductType_Text : String(25);
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_ProductTypeCode/ProductTypeCode_Text'
  @sap.label : 'Gruppo tipi prodotto'
  @sap.value.list : 'standard'
  ProductTypeCode : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Grp. autorizzazione'
  @sap.quickinfo : 'Gruppo autorizzazione nell''anagrafica materiale'
  AuthorizationGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Stato aggiornamento'
  MaintenanceStatus : String(15);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo mater. modello'
  @sap.quickinfo : 'Tipo materiale modello'
  ReferenceProductType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Rif. classi conto'
  @sap.quickinfo : 'Riferimento classi conto'
  AcctCategoryRef : String(4);
  to_ProductTypeCode : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_ProductTypeCode {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Codice tipo di prodotto'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ProductTypeCode {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductTypeCode_Text'
  @sap.label : 'Gruppo tipi prodotto'
  key ProductTypeCode : String(2) not null;
  @sap.label : 'Descrizione'
  @sap.quickinfo : 'Descrizione gruppo tipi prodotto'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductTypeCode_Text : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Classe di valorizzazione'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_Prodvaluationclass {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ValuationClass_Text'
  @sap.label : 'Classe di valor.'
  key ValuationClass : String(4) not null;
  @sap.label : 'Descrizione'
  @sap.quickinfo : 'Definizione della classe di valorizzazione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ValuationClass_Text : String(25);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Rif. classi conto'
  @sap.quickinfo : 'Riferimento classi conto'
  AcctCategoryRef : String(4);
  @sap.label : 'Data Element for Product Valuation Class OID'
  @sap.heading : ''
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ProductValuationClassOID : String(128);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Profilo di riconoscimento acquisti'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_PurgAcknowledgmentProfile {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ch. valori acquisto'
  @sap.quickinfo : 'Chiave valori d''acquisto'
  key PurchasingAcknProfile : String(4) not null;
  @sap.label : 'Elemento dati per OID profilo conferma acquisto'
  @sap.heading : ''
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  PurgAcknowledgmentProfileOID : String(128);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Fornitore'
@sap.value.list : 'true'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_Supplier_VH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'BPSupplierName'
  @sap.label : 'Fornitore'
  @sap.quickinfo : 'Numero conto del fornitore'
  key Supplier : String(10) not null;
  @sap.label : 'Nome del fornitore 1'
  @sap.quickinfo : 'Nome del fornitore'
  SupplierName : String(35);
  @sap.label : 'Nome business partner 1'
  BusinessPartnerName1 : String(40);
  @sap.label : 'Nome del fornitore business partner'
  @sap.quickinfo : 'Nome del fornitore'
  BPSupplierName : String(81);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Autorizzazione'
  @sap.quickinfo : 'Gruppo di autorizzazione'
  AuthorizationGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo conti'
  @sap.quickinfo : 'Gruppo conti fornitori'
  SupplierAccountGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Obiettivo raggiunto'
  @sap.quickinfo : 'Indicatore per obiettivo commerciale raggiunto'
  IsBusinessPurposeCompleted : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Business partner'
  @sap.quickinfo : 'Numero business partner'
  BusinessPartner : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo di business partner'
  @sap.quickinfo : 'Tipo business partner'
  BusinessPartnerType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Imp. TitTrattDt'
  @sap.quickinfo : 'BP: indicatore per impostare i titolari del trattamento dati'
  DataControllerSet : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController1 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController2 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController3 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController4 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController5 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController6 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController7 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController8 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController9 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController10 : String(30);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Unità di misura'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_UnitOfMeasure {
  @sap.text : 'UnitOfMeasure_Text'
  @sap.label : 'Unità di misura'
  @sap.semantics : 'unit-of-measure'
  key UnitOfMeasure : String(3) not null;
  @sap.label : 'Testo UM'
  @sap.quickinfo : 'Testo unità di misura (massimo 30 posizioni)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  UnitOfMeasure_Text : String(30);
  @sap.label : 'Codice SAP interno'
  @sap.quickinfo : 'Unità di misura, codice SAP interno (senza conversione)'
  UnitOfMeasureSAPCode : String(3);
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_ISOCode/UnitOfMeasureISOCode_Text'
  @sap.label : 'Cd. ISO'
  @sap.quickinfo : 'Codice ISO unità di misura'
  @sap.value.list : 'standard'
  UnitOfMeasureISOCode : String(3);
  @sap.label : 'Cd. primario'
  @sap.quickinfo : 'Campo di marcatura per conversione cd. ISO in cd. int.'
  IsPrimaryUnitForISOCode : Boolean;
  @sap.label : 'Arrotond. decimali'
  @sap.quickinfo : 'Numero di decimali da arrotondare'
  UnitOfMeasureNumberOfDecimals : Integer;
  @sap.label : 'Utà commerciale'
  @sap.quickinfo : 'Codice unità di misura commerciale'
  UnitOfMeasureIsCommercial : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_Dimension/UnitOfMeasureDimension_Text'
  @sap.label : 'Dimensione'
  @sap.quickinfo : 'Chiave dimensione'
  @sap.value.list : 'standard'
  UnitOfMeasureDimension : String(6);
  @sap.label : 'Contatore'
  @sap.quickinfo : 'Numeratore per la conversione in unità SI'
  SIUnitCnvrsnRateNumerator : Integer;
  @sap.label : 'Denominatore'
  @sap.quickinfo : 'Denominatore per la conversione in unità SI'
  SIUnitCnvrsnRateDenominator : Integer;
  @sap.label : 'Esponente'
  @sap.quickinfo : 'Esponente alla decima per la conversione in unità SI'
  SIUnitCnvrsnRateExponent : Integer;
  @sap.label : 'Costante aggiuntiva'
  @sap.quickinfo : 'Costante aggiuntiva per conversione in unità SI'
  SIUnitCnvrsnAdditiveValue : Decimal(9, 6);
  @sap.label : 'Esp. virgola mobile'
  @sap.quickinfo : 'Esponente alla 10a per rappresentazione virgola mobile'
  UnitOfMeasureDspExponent : Integer;
  @sap.label : 'Decimali'
  @sap.quickinfo : 'Numero di decimali nella rappresentazione numerica'
  UnitOfMeasureDspNmbrOfDcmls : Integer;
  @sap.unit : 'UnitOfMeasureTemperatureUnit'
  @sap.label : 'Val. temper.'
  @sap.quickinfo : 'Valore temperatura'
  UnitOfMeasureTemperature : Double;
  @sap.label : 'Unità temperatura'
  @sap.semantics : 'unit-of-measure'
  UnitOfMeasureTemperatureUnit : String(3);
  @sap.unit : 'UnitOfMeasurePressureUnit'
  @sap.label : 'Valore pressione'
  UnitOfMeasurePressure : Double;
  @sap.label : 'Unità pressione'
  @sap.semantics : 'unit-of-measure'
  UnitOfMeasurePressureUnit : String(3);
  to_Dimension : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_UnitOfMeasureDimension {  };
  to_ISOCode : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_UnitOfMeasureISOCode {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Dimensione dell''unità di misura'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_UnitOfMeasureDimension {
  @sap.display.format : 'UpperCase'
  @sap.text : 'UnitOfMeasureDimension_Text'
  @sap.label : 'Dimensione'
  @sap.quickinfo : 'Chiave dimensione'
  key UnitOfMeasureDimension : String(6) not null;
  @sap.label : 'Testo dimensione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  UnitOfMeasureDimension_Text : String(20);
  @sap.label : 'Lunghezza'
  @sap.quickinfo : 'Esponente lunghezza'
  LengthExponent : Integer;
  @sap.label : 'Massa'
  @sap.quickinfo : 'Esponente massa'
  MassExponent : Integer;
  @sap.label : 'Ora'
  @sap.quickinfo : 'Esponente temporale'
  TimeExponent : Integer;
  @sap.label : 'Amp. elettrico'
  @sap.quickinfo : 'Esponente per l''amperaggio elettrico'
  ElectricCurrentExponent : Integer;
  @sap.label : 'Temperatura'
  @sap.quickinfo : 'Esponente temperatura'
  TemperatureExponent : Integer;
  @sap.label : 'Quantità molecolare'
  @sap.quickinfo : 'Esponente per la quantità molecolare'
  MoleQuantityExponent : Integer;
  @sap.label : 'Intensità luminosa'
  @sap.quickinfo : 'Esponente intensità luminosa'
  LuminosityExponent : Integer;
  @sap.label : 'Unità SI'
  @sap.semantics : 'unit-of-measure'
  UnitOFMeasureSiUnit : String(3);
  @sap.label : 'Dip. da temperatura'
  @sap.quickinfo : 'Ind. ''esistono anche unità con indic. temp. per dimensione'''
  HasUnitsWithTemperatureSpec : Boolean;
  @sap.label : 'Dipendente da press.'
  @sap.quickinfo : 'Ind. ''per la dimensione esistono unità con valori pressione'''
  HasUnitsWithPressureSpec : Boolean;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Unità di misura - codice ISO'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_UnitOfMeasureISOCode {
  @sap.display.format : 'UpperCase'
  @sap.text : 'UnitOfMeasureISOCode_Text'
  @sap.label : 'Cd. ISO'
  @sap.quickinfo : 'Codice ISO unità di misura'
  key UnitOfMeasureISOCode : String(3) not null;
  @sap.label : 'Cd. ISO'
  @sap.quickinfo : 'Codici ISO definizione unità di misura'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  UnitOfMeasureISOCode_Text : String(25);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.semantics : 'aggregate'
@sap.label : 'PlannedOrdersAPI'
entity ZZ1_PLANNEDORDERSAPI_CDS.ZZ1_PlannedOrdersAPI {
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key ID : LargeString not null;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Planned Order'
  @sap.quickinfo : 'Ordine pianificato'
  PlannedOrder : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Combined Plnd. Order'
  @sap.quickinfo : 'Ordine pianificato combinato principale'
  CplndOrd : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Master Plnd Ord.'
  @sap.quickinfo : 'Numero ordine pianificato principale'
  MasterPlannedOrder : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Material'
  @sap.quickinfo : 'Materiale pianif.'
  Material : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Product'
  @sap.quickinfo : 'Codice prodotto'
  Product : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Planning Plant'
  @sap.quickinfo : 'Divisione di pianificazione'
  MRPPlant : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'MRP Controller'
  @sap.quickinfo : 'Responsabile MRP'
  MRPController : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'MRP Area'
  @sap.quickinfo : 'Area pian. MRP'
  MRPArea : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Storage Location'
  @sap.quickinfo : 'Magazzino'
  StorageLocation : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Reservation'
  @sap.quickinfo : 'Numero dell''impegno / del fabbisogno dipendente'
  Reservation : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Production Plant'
  @sap.quickinfo : 'Divisione di produzione'
  ProductionPlant : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Production Version'
  @sap.quickinfo : 'Versione di produzione'
  ProductionVersion : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Order End Date'
  @sap.quickinfo : 'Data di fine dell''ordine pianificato'
  PlndOrderPlannedEndDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Order Start Date'
  @sap.quickinfo : 'Data d''inizio dell''ordine pianificato'
  PlndOrderPlannedStartDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Base Unit of Measure'
  @sap.quickinfo : 'Unità di misura di base'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.aggregation.role : 'measure'
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'Requirement Quantity'
  @sap.quickinfo : 'Quantità fabbisogno'
  @sap.filterable : 'false'
  RequirementQuantityInBaseUnit : Decimal(13, 3);
  @sap.aggregation.role : 'measure'
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'Total Order Quantity'
  @sap.quickinfo : 'Quantità totale ordine pianificato'
  @sap.filterable : 'false'
  PlannedTotalQtyInBaseUnit : Decimal(13, 3);
  @sap.aggregation.role : 'measure'
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'Committed Quantity'
  @sap.quickinfo : 'Ordine pian.: quantità confermata'
  @sap.filterable : 'false'
  PlndOrderCommittedQty : Decimal(13, 3);
  @sap.aggregation.role : 'measure'
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'Issued Quantity'
  @sap.quickinfo : 'Quantità uscita'
  @sap.filterable : 'false'
  QuantityWithdrawnInBaseUnit : Decimal(13, 3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Season Year'
  @sap.quickinfo : 'Esercizio stagionale'
  ProductSeasonYear : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Season'
  @sap.quickinfo : 'Stagione'
  ProductSeason : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Collection'
  @sap.quickinfo : 'Collezione fashion'
  ProductCollection : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity Requirement'
  @sap.quickinfo : 'ID del record fabbisogno capacità'
  CapacityRequirement_1 : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Theme'
  @sap.quickinfo : 'Tema fashion'
  ProductTheme : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity Requirement'
  @sap.quickinfo : 'ID del record fabbisogno capacità'
  CapacityRequirement : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity Requirement Origin'
  @sap.quickinfo : 'Origine del fabbisogno di capacità'
  CapacityRequirementOrigin : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Planned Order'
  @sap.quickinfo : 'Ordine pianificato'
  PlannedOrder_1 : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Order'
  @sap.quickinfo : 'Numero ordine'
  OrderID : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Order Internal ID'
  @sap.quickinfo : 'ID interno dell''ordine'
  OrderInternalID : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'SOP Order'
  @sap.quickinfo : 'Ordine pianificazione operazioni commerciali'
  SalesOperationsPlanningOrder : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Task List Type'
  @sap.quickinfo : 'Tipo ciclo'
  BillOfOperationsType : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Group'
  @sap.quickinfo : 'Chiave per gruppo di cicli'
  BillOfOperationsGroup : String(8);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Group Counter'
  @sap.quickinfo : 'Contatore gruppi cicli'
  BillOfOperations : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Scheduling Type'
  @sap.quickinfo : 'Tipo di schedulazione'
  SchedulingType : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Scheduled start'
  @sap.quickinfo : 'Inizio schedulato'
  ScheduledBasicStartDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Earliest start time'
  @sap.quickinfo : 'Inizio al più presto schedulato: esecuzione (ora)'
  ScheduledBasicStartTime : Time;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Scheduled finish'
  @sap.quickinfo : 'Fine schedulata'
  ScheduledBasicEndDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Earliest finish'
  @sap.quickinfo : 'Fine al più presto operazione (ora)'
  ScheduledBasicEndTime : Time;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Scheduled on'
  @sap.quickinfo : 'Data dell''ultima schedulazione'
  LastScheduledDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Explosion Date'
  @sap.quickinfo : 'Data dell''esplosione ciclo'
  BOOExplosionDate : Date;
  to_ZZ1_PlannedOrders_Prod : Association to many ZZ1_PLANNEDORDERSAPI_CDS.ZZ1_PlannedOrders_Prod {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'ZZ1_PlannedOrders_Product_TEST'
entity ZZ1_PLANNEDORDERSAPI_CDS.ZZ1_PlannedOrders_Prod {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Planned Order'
  @sap.quickinfo : 'Ordine pianificato'
  key PlannedOrder : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Product'
  @sap.quickinfo : 'Codice prodotto'
  @sap.value.list : 'standard'
  Product : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'Product_1_Text'
  @sap.label : 'Product'
  @sap.quickinfo : 'Codice prodotto'
  Product_1 : String(40);
  @sap.label : 'Descrizione prodotto'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Product_1_Text : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Material'
  @sap.quickinfo : 'Rappresentazione esterna del codice materiale'
  ProductExternalID : String(40);
  @sap.required.in.filter : 'false'
  @sap.label : 'Product OID'
  @sap.quickinfo : 'Elemento dati per OID di prodotto'
  ProductOID : String(128);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'ProductType_Text'
  @sap.label : 'Product Type'
  @sap.quickinfo : 'Tipo di prodotto'
  @sap.value.list : 'standard'
  ProductType : String(4);
  @sap.label : 'Descrizione tipo di prodotto'
  @sap.quickinfo : 'Descrizione del tipo di prodotto'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductType_Text : String(25);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Created On'
  @sap.quickinfo : 'Data creazione'
  CreationDate : Date;
  @sap.required.in.filter : 'false'
  @sap.label : 'Created At Time'
  @sap.quickinfo : 'Ora di creazione'
  CreationTime : Time;
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.required.in.filter : 'false'
  @sap.label : 'Created On'
  @sap.quickinfo : 'Data di creazione del prodotto'
  CreationDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Created By'
  @sap.quickinfo : 'Nome del responsabile che ha aggiunto l''oggetto'
  CreatedByUser : String(12);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Last Change'
  @sap.quickinfo : 'Data dell''ultima modifica'
  LastChangeDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Changed By'
  @sap.quickinfo : 'Nome dell''utente autore della modifica oggetto'
  LastChangedByUser : String(12);
  @sap.required.in.filter : 'false'
  @sap.label : 'Marked for Deletion'
  @sap.quickinfo : 'Indicatore di eliminazione'
  IsMarkedForDeletion : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'CrossPlantStatus_Text'
  @sap.label : 'CrossPlantProdStatus'
  @sap.quickinfo : 'Stato prodotto val. per tutte divisioni'
  @sap.value.list : 'standard'
  CrossPlantStatus : String(2);
  @sap.label : 'Tst st. val. tutte div.'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CrossPlantStatus_Text : String(25);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Valid from'
  @sap.quickinfo : 'Data inizio validità stato mat. valido per tutte le div.'
  CrossPlantStatusValidityDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Old Product Number'
  @sap.quickinfo : 'Codice prodotto precedente'
  ProductOldID : String(40);
  @sap.required.in.filter : 'false'
  @sap.unit : 'WeightUnit'
  @sap.label : 'Gross Weight'
  @sap.quickinfo : 'Peso lordo'
  GrossWeight : Decimal(13, 3);
  @sap.required.in.filter : 'false'
  @sap.label : 'Order Unit'
  @sap.quickinfo : 'UM dell''ordine d''acquisto'
  @sap.semantics : 'unit-of-measure'
  PurchaseOrderQuantityUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Source of supply'
  @sap.quickinfo : 'Fonte acquisto'
  SourceOfSupply : String(1);
  @sap.required.in.filter : 'false'
  @sap.text : 'WeightUnit_Text'
  @sap.label : 'Unit of Weight'
  @sap.quickinfo : 'Unità di peso'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  WeightUnit : String(3);
  @sap.label : 'Testo UM'
  @sap.quickinfo : 'Testo unità di misura (massimo 30 posizioni)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  WeightUnit_Text : String(30);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Cntry/Reg of Origin'
  @sap.quickinfo : 'Paese/Regione di origine del materiale (orig. non prefer.)'
  CountryOfOrigin : String(3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Competitor'
  @sap.quickinfo : 'Concorrente'
  CompetitorID : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'ProductGroup_Text'
  @sap.label : 'Product Group'
  @sap.quickinfo : 'Gruppo di prodotti'
  @sap.value.list : 'standard'
  ProductGroup : String(9);
  @sap.label : 'Descrizione gruppo di prodotti'
  @sap.quickinfo : 'Descrizione gruppo prodotti'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductGroup_Text : String(20);
  @sap.required.in.filter : 'false'
  @sap.text : 'BaseUnit_Text'
  @sap.label : 'Base Unit of Measure'
  @sap.quickinfo : 'Unità di misura di base'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.label : 'Testo UM'
  @sap.quickinfo : 'Testo unità di misura (massimo 30 posizioni)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  BaseUnit_Text : String(30);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'ItemCategoryGroup_Text'
  @sap.label : 'Gen. item cat. grp'
  @sap.quickinfo : 'Gruppo di tipi di posizione generale'
  @sap.value.list : 'standard'
  ItemCategoryGroup : String(4);
  @sap.label : 'Descrizione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ItemCategoryGroup_Text : String(20);
  @sap.required.in.filter : 'false'
  @sap.unit : 'WeightUnit'
  @sap.label : 'Net Weight'
  @sap.quickinfo : 'Peso netto'
  NetWeight : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Product Hierarchy'
  @sap.quickinfo : 'Gerarchia prodotti'
  ProductHierarchy : String(18);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'Division_Text'
  @sap.label : 'Division'
  @sap.quickinfo : 'Settore merceologico'
  @sap.value.list : 'standard'
  Division : String(2);
  @sap.label : 'Descrizione settore merceologico'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Division_Text : String(20);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Var. Order Unit'
  @sap.quickinfo : 'Unità di misura OdA variabile attiva'
  VarblPurOrdUnitIsActive : String(1);
  @sap.required.in.filter : 'false'
  @sap.text : 'VolumeUnit_Text'
  @sap.label : 'Volume Unit'
  @sap.quickinfo : 'Unità di volume'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  VolumeUnit : String(3);
  @sap.label : 'Testo UM'
  @sap.quickinfo : 'Testo unità di misura (massimo 30 posizioni)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  VolumeUnit_Text : String(30);
  @sap.required.in.filter : 'false'
  @sap.unit : 'VolumeUnit'
  @sap.label : 'Volume'
  MaterialVolume : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'X-distr.chain status'
  @sap.quickinfo : 'Stato materiale valido per tutta la catena di distr.'
  SalesStatus : String(2);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Valid from'
  @sap.quickinfo : 'Data inizio val. stato mat. valido per tutta la cat.distr.'
  SalesStatusValidityDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Transportation Group'
  @sap.quickinfo : 'Gruppo di trasporto'
  TransportationGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Authorization Group'
  @sap.quickinfo : 'Gruppo autorizzazioni'
  AuthorizationGroup : String(4);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'ANP Code'
  ANPCode : String(9);
  to_BaseUnitOfMeasure : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_UnitOfMeasure {  };
  to_Division : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_Division {  };
  to_ItemCategoryGroup : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_ItemCategoryGroup {  };
  to_ProductGroup_2 : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_ProductGroup_2 {  };
  to_ProductStatus : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_ProductStatus {  };
  to_ProductType : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_Producttype {  };
  to_QuantityUnitValueHelp : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_UnitOfMeasure {  };
  to_WeightUnitValueHelp : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_UnitOfMeasure {  };
};

