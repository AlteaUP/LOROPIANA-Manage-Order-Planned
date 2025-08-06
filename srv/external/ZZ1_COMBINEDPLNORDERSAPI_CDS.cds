/* checksum : 11cae1d1843856daca577d76d9866489 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_COMBINEDPLNORDERSAPI_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Categoria capacità'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_CapacityCategory {
  @sap.display.format : 'UpperCase'
  @sap.text : 'CapacityCategoryCode_Text'
  @sap.label : 'Categoria capacità'
  key CapacityCategoryCode : String(3) not null;
  @sap.label : 'Desc. tipo capacità'
  @sap.quickinfo : 'Descrizione del tipo di capacità'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CapacityCategoryCode_Text : String(20);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Testata fabbisogno di capacità'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_CapacityRequirement {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Fabbisogno capacità'
  @sap.quickinfo : 'ID del record fabbisogno capacità'
  key CapacityRequirement : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Orig. fabb. capacità'
  @sap.quickinfo : 'Origine del fabbisogno di capacità'
  CapacityRequirementOrigin : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ordine pianificato'
  PlannedOrder : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ordine'
  @sap.quickinfo : 'Numero ordine'
  OrderID : String(12);
  @sap.display.format : 'NonNegative'
  @sap.label : 'ID interno ordine'
  @sap.quickinfo : 'ID interno dell''ordine'
  OrderInternalID : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ordine SOP'
  @sap.quickinfo : 'Ordine pianificazione operazioni commerciali'
  SalesOperationsPlanningOrder : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo ciclo'
  BillOfOperationsType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo'
  @sap.quickinfo : 'Chiave per gruppo di cicli'
  BillOfOperationsGroup : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cont. gruppi cicli'
  @sap.quickinfo : 'Contatore gruppi cicli'
  BillOfOperations : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo schedulazione'
  @sap.quickinfo : 'Tipo di schedulazione'
  SchedulingType : String(1);
  @sap.display.format : 'Date'
  @sap.label : 'Inizio schedulato'
  ScheduledBasicStartDate : Date;
  @sap.label : 'Ora inizio + presto'
  @sap.quickinfo : 'Inizio al più presto schedulato: esecuzione (ora)'
  ScheduledBasicStartTime : Time;
  @sap.display.format : 'Date'
  @sap.label : 'Fine schedulata'
  ScheduledBasicEndDate : Date;
  @sap.label : 'Fine al più presto'
  @sap.quickinfo : 'Fine al più presto operazione (ora)'
  ScheduledBasicEndTime : Time;
  @sap.display.format : 'Date'
  @sap.label : 'Schedul. il'
  @sap.quickinfo : 'Data dell''ultima schedulazione'
  LastScheduledDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Data esplosione'
  @sap.quickinfo : 'Data dell''esplosione ciclo'
  BOOExplosionDate : Date;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Posizione fabbisogno di capacità'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_CapacityRequirementItem {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Fabbisogno capacità'
  @sap.quickinfo : 'ID del record fabbisogno capacità'
  @sap.value.list : 'standard'
  key CapacityRequirement : String(12) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Contatore'
  @sap.quickinfo : 'Contatore interno'
  key CapacityRequirementItem : String(8) not null;
  to_CapacityRequirement : Association to ZZ1_COMBINEDPLNORDERSAPI_CDS.I_CapacityRequirement {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Testata fabbisogno di capacità'
@sap.value.list : 'true'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_CapacityRequirementStdVH {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Fabbisogno capacità'
  @sap.quickinfo : 'ID del record fabbisogno capacità'
  key CapacityRequirement : String(12) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Testata capacità'
@sap.value.list : 'true'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_CapacityStdVH {
  @sap.display.format : 'NonNegative'
  @sap.text : 'CapacityInternalID_Text'
  @sap.label : 'ID capacità'
  @sap.quickinfo : 'ID della capacità'
  key CapacityInternalID : String(8) not null;
  @sap.label : 'Testo per capacità'
  @sap.quickinfo : 'Testo breve capacità'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CapacityInternalID_Text : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Cliente'
@sap.value.list : 'true'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_Customer_VH {
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
@sap.label : 'Ordine pianificato'
@sap.value.list : 'true'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_PlannedOrderStdVH {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ordine pianificato'
  key PlannedOrder : String(10) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Divisione'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_Plant {
  @sap.display.format : 'UpperCase'
  @sap.text : 'PlantName'
  @sap.label : 'Divisione'
  key Plant : String(4) not null;
  @sap.label : 'Nome divisione'
  PlantName : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Area valorizzazione'
  ValuationArea : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cd. cliente div.'
  @sap.quickinfo : 'Cd.cliente della divisione'
  @sap.value.list : 'standard'
  PlantCustomer : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cd.forn.div.'
  @sap.quickinfo : 'Codice fornitore della divisione'
  @sap.value.list : 'standard'
  PlantSupplier : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Calendario fabbrica'
  @sap.quickinfo : 'Chiave calendario di fabbrica'
  FactoryCalendar : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Org. acquisti'
  @sap.quickinfo : 'Organizzazione acquisti'
  DefaultPurchasingOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Org.comm. fatt. int.'
  @sap.quickinfo : 'Organizzazione commerciale per fatturazione interna'
  SalesOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Indirizzo'
  AddressID : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cat. div.'
  PlantCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Canale distribuzione'
  @sap.quickinfo : 'Canale di distribuzione per fatturazione interna'
  DistributionChannel : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sett. fattur.interna'
  @sap.quickinfo : 'Settore per fatturazione interna'
  Division : String(2);
  @sap.label : 'Chiave lingua'
  Language : String(2);
  @sap.label : 'Ind. archiviazione'
  @sap.quickinfo : 'Marcatore archiviazione centrale per record anagrafico'
  IsMarkedForArchiving : Boolean;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Magazzino'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_StorageLocation {
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_Plant/PlantName'
  @sap.label : 'Divisione'
  @sap.value.list : 'standard'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.text : 'StorageLocationName'
  @sap.label : 'Magazzino'
  key StorageLocation : String(4) not null;
  @sap.label : 'Nome del magazzino'
  StorageLocationName : String(16);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Org. commerciale'
  @sap.quickinfo : 'Organizzazione commerciale'
  SalesOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Canale distribuzione'
  @sap.quickinfo : 'Canale di distribuzione'
  DistributionChannel : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Settore merceologico'
  Division : String(2);
  @sap.label : 'Controllo autorizz.'
  @sap.quickinfo : 'Autorizzazione mag. logico per movimenti merci attiva'
  IsStorLocAuthznCheckActive : Boolean;
  @sap.label : 'UdM obbl.'
  @sap.quickinfo : 'Handling Unit obbligatoria'
  HandlingUnitIsRequired : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Validità'
  @sap.quickinfo : 'Identificazione di inserimenti obsoleti'
  ConfigDeprecationCode : String(1);
  to_Plant : Association to ZZ1_COMBINEDPLNORDERSAPI_CDS.I_Plant {  };
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
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_Supplier_VH {
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
@sap.label : 'Centro di lavoro'
@sap.value.list : 'true'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_WorkCenterStdVH {
  @sap.display.format : 'NonNegative'
  @sap.text : 'WorkCenterInternalID_Text'
  @sap.label : 'ID oggetto'
  @sap.quickinfo : 'ID oggetto della risorsa'
  key WorkCenterInternalID : String(8) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo oggetto'
  @sap.quickinfo : 'CIM Resource Object Type'
  key WorkCenterTypeCode : String(2) not null;
  @sap.label : 'Testo centro lavoro'
  @sap.quickinfo : 'Testo centro di lavoro'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  WorkCenterInternalID_Text : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Combined Planned Orders API'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinedPlnOrdersAPI {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Combined Plnd. Order'
  @sap.quickinfo : 'Ordine pianificato combinato principale'
  key CplndOrd : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Cross-plant CP'
  @sap.quickinfo : 'Prodotto configurabile valido per tutte le divisioni'
  key CrossPlantConfigurableProduct : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Planned Order Type'
  @sap.quickinfo : 'Tipo di ordine pianificato'
  PlannedOrderType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Planned Order Category'
  @sap.quickinfo : 'Categoria ordine pianificato'
  PlannedOrderCategory : String(1);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'LastChangeDate'
  LastChangeDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Planning Plant'
  @sap.quickinfo : 'Divisione di pianificazione'
  @sap.value.list : 'standard'
  MRPPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'MRP Area'
  @sap.quickinfo : 'Area pian. MRP'
  MRPArea : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'MRP Controller'
  @sap.quickinfo : 'Responsabile MRP'
  MRPController : String(3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Procurement Category'
  @sap.quickinfo : 'Categoria approvvigionamento materiale'
  MaterialProcurementCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Procurement Type'
  @sap.quickinfo : 'Tipo di approvvigionamento materiale'
  MaterialProcurementType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Storage Location'
  @sap.quickinfo : 'Magazzino'
  StorageLocation : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOO Type'
  @sap.quickinfo : 'Tipo distinta delle operazioni'
  BillOfOperationsType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Bill of Operations'
  @sap.quickinfo : 'ID distinta delle operazioni'
  BillOfOperations : String(8);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOO Group'
  @sap.quickinfo : 'Gruppo distinte delle operazioni'
  BillOfOperationsGroup : String(8);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOO Variant'
  @sap.quickinfo : 'Variante distinta delle operazioni'
  BillOfOperationsVariant : String(2);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Alternative BOM'
  @sap.quickinfo : 'Distinta base alternativa'
  BillOfMaterialVariant : String(2);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOM Usage'
  @sap.quickinfo : 'Utilizzo della distinta base'
  BillOfMaterialVariantUsage : String(1);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOM Status'
  @sap.quickinfo : 'Stato della distinta base'
  BillOfMaterialStatus : String(2);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOM Version'
  @sap.quickinfo : 'Versione Db'
  BillOfMaterialVersion : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Production Plant'
  @sap.quickinfo : 'Divisione di produzione'
  ProductionPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Production Supervisor'
  @sap.quickinfo : 'Responsabile di produzione'
  ProductionSupervisor : String(3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Production Version'
  @sap.quickinfo : 'Versione di produzione'
  ProductionVersion : String(4);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'PlndOrderPlannedStartDate'
  PlndOrderPlannedStartDate : Date;
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'PlndOrderPlannedEndDate'
  PlndOrderPlannedEndDate : Date;
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'PlannedOrderOpeningDate'
  PlannedOrderOpeningDate : Date;
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'PlndOrderTotalCmtmtDate'
  PlndOrderTotalCmtmtDate : Date;
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'ProductionStartDate'
  ProductionStartDate : Date;
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'ProductionEndDate'
  ProductionEndDate : Date;
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'PlndOrderBaseToEntryQtyNmrtr'
  PlndOrderBaseToEntryQtyNmrtr : Integer;
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'PlndOrderBaseToEntryQtyDnmntr'
  PlndOrderBaseToEntryQtyDnmntr : Integer;
  @sap.required.in.filter : 'false'
  @sap.label : 'Base Unit of Measure'
  @sap.quickinfo : 'Unità di misura di base'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'PlannedTotalQtyInBaseUnit'
  PlannedTotalQtyInBaseUnit : Integer;
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'RequirementQuantityInBaseUnit'
  RequirementQuantityInBaseUnit : Integer;
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'QuantityWithdrawnInBaseUnit'
  QuantityWithdrawnInBaseUnit : Integer;
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'PlndOrderCommittedQty'
  PlndOrderCommittedQty : Integer;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Season'
  @sap.quickinfo : 'Stagione'
  ProductSeason : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Collection'
  @sap.quickinfo : 'Collezione fashion'
  ProductCollection : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Season Year'
  @sap.quickinfo : 'Esercizio stagionale'
  ProductSeasonYear : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Theme'
  @sap.quickinfo : 'Tema fashion'
  ProductTheme : String(10);
  @sap.required.in.filter : 'false'
  @sap.label : 'Product Description'
  @sap.quickinfo : 'Descrizione prodotto'
  ProductDescription : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Product'
  @sap.quickinfo : 'Codice prodotto'
  Product : String(40);
  @sap.required.in.filter : 'false'
  @sap.label : 'Order type'
  @sap.value.list : 'standard'
  ZZ1_MFI_CR_TYPE_PLA : String(3);
  @sap.required.in.filter : 'false'
  @sap.label : 'Order Personalization'
  ZZ1_MFI_CRORDER_PERSON_PLA : String(20);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Stock Segment'
  @sap.quickinfo : 'Segmento di stock'
  StockSegment : String(40);
  to_ZZ1_CombinPlannedOrdersCom : Association to many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinPlannedOrdersCom {  };
  to_ZZ1_I_PLANNEDORDER : Association to many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_I_PLANNEDORDER {  };
  to_ZZ1_MasterPlannedOrders : Association to many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_MasterPlannedOrders {  };
  to_ZZ1_MFI_CR_TYPE_PLA : Association to ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_MFI_CR_TYPE_V {  };
  to_ZZ1_PlannedOrdersCapacity : Association to many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PlannedOrdersCapacity {  };
  to_ZZ1_PlannedOrdersCompChar : Association to many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PlannedOrdersCompChar {  };
  to_ZZ1_Plant : Association to ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_Plant {  };
  to_ZZ1_PLOCAPACITYCORD : Association to many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PLOCAPACITYCORD {  };
  to_ZZ1_PLOCAPACITYCORD_TEXT : Association to ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PLOCAPACITYCORD {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Combined Planned Orders Com'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinPlannedOrdersCom {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Combined Plnd. Order'
  @sap.quickinfo : 'Ordine pianificato combinato principale'
  key CplndOrd : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Cross-plant CP'
  @sap.quickinfo : 'Prodotto configurabile valido per tutte le divisioni'
  key CrossPlantConfigurableProduct : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Material'
  @sap.quickinfo : 'Codice materiale'
  key Material : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Plant'
  @sap.quickinfo : 'Divisione'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'to_StorageLocation/StorageLocationName'
  @sap.label : 'Storage Location'
  @sap.quickinfo : 'Magazzino'
  @sap.value.list : 'standard'
  key StorageLocation : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Batch'
  @sap.quickinfo : 'Numero partita'
  key Batch : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Bill Of Material Item Number'
  @sap.quickinfo : 'Numero di posizione distinta base'
  key BillOfMaterialItemNumber_2 : String(4) not null;
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'MatlCompRequirementDate'
  MatlCompRequirementDate : Date;
  @sap.required.in.filter : 'false'
  @sap.label : 'Item Text'
  @sap.quickinfo : 'Testo posizione distinta base (riga 1)'
  BOMItemDescription : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOM Category'
  @sap.quickinfo : 'Codice categoria distinta base'
  BillOfMaterialCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'MRP Controller'
  @sap.quickinfo : 'Responsabile MRP'
  MRPController : String(3);
  @sap.required.in.filter : 'false'
  @sap.label : 'Plant Name'
  @sap.quickinfo : 'Nome divisione'
  PlantName : String(30);
  @sap.required.in.filter : 'false'
  @sap.label : 'MRP Controller Name'
  @sap.quickinfo : 'Nome responsabile MRP'
  MRPControllerName : String(18);
  @sap.required.in.filter : 'false'
  @sap.label : 'Color'
  @sap.quickinfo : 'Valore caratteristica per colori in caso di varianti'
  ProductCharacteristic1 : String(18);
  @sap.required.in.filter : 'false'
  @sap.label : 'Main Size'
  @sap.quickinfo : 'Valore caratteristica per la dimens. princ. nelle varianti'
  ProductCharacteristic2 : String(18);
  @sap.required.in.filter : 'false'
  @sap.label : 'Second Size'
  @sap.quickinfo : 'Valore caratt. per la seconda dimensione nelle varianti'
  ProductCharacteristic3 : String(18);
  @sap.required.in.filter : 'false'
  @sap.label : 'Base Unit of Measure'
  @sap.quickinfo : 'Unità di misura di base'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'AvailableQuantity'
  AvailableQuantity : Decimal(16, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'WithdrawnQuantity'
  WithdrawnQuantity : Decimal(14, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'RequiredQuantity'
  RequiredQuantity : Decimal(14, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'TotalAllocQty'
  TotalAllocQty : Decimal(14, 3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Stock Segment'
  @sap.quickinfo : 'Segmento di stock'
  StockSegment : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Requirement Segment'
  @sap.quickinfo : 'Segmento fabbisogno'
  RequirementSegment : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Seg. Strategy'
  @sap.quickinfo : 'Strategia di segmentazione'
  SegmentationStrategy : String(8);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Operazione o fase'
  @sap.quickinfo : 'Numero operazione o fase'
  Operation_2 : String(4);
  to_StorageLocation : Association to ZZ1_COMBINEDPLNORDERSAPI_CDS.I_StorageLocation {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'ZZ1_I_PLANNEDORDER'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_I_PLANNEDORDER {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ordine pianificato'
  key PlannedOrder : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ord. pian. princ.'
  @sap.quickinfo : 'Numero ordine pianificato principale'
  FshMplndOrd : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ord. pian. combinato'
  @sap.quickinfo : 'Ordine pianificato combinato principale'
  CplndOrd : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Creato da'
  @sap.quickinfo : 'Utente autore dell''oggetto'
  CreateUser : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Data creazione'
  @sap.quickinfo : 'Data di creazione dell''oggetto'
  Createdate : Date;
  @sap.label : 'Ora di creazione'
  @sap.quickinfo : 'Ora in cui è stato creato l''oggetto'
  Createtime : Time;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Autore modifica'
  @sap.quickinfo : 'Autore dell''ultima modifica dell''oggetto'
  Changeuser : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Data modifica'
  @sap.quickinfo : 'Data di ultima modifica dell''oggetto'
  Changedate : Date;
  @sap.label : 'Ora di modifica'
  @sap.quickinfo : 'Ora dell''ultima modifica dell''oggetto'
  Changetime : Time;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ordine pianificato'
  POId : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo ordine pian.'
  @sap.quickinfo : 'Tipo di ordine pianificato'
  PlannedOrderType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Categoria ordine pianificato'
  PlannedOrderCategory : String(1);
  @sap.display.format : 'Date'
  @sap.label : 'Data modifica'
  @sap.quickinfo : 'Data dell''ultima modifica'
  LastChangeDate : Date;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Mod. timestamp'
  @sap.quickinfo : 'Ultima modifica ordine pianificato: timestamp'
  LastChangeDateTime : DateTime;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Utente'
  @sap.quickinfo : 'Ultima modifica ordine pianificato: utente'
  LastChangedByUser : String(12);
  @sap.label : 'Testo ord. pian.'
  @sap.quickinfo : 'Testo ordine pianificato'
  PlannedOrderLongText : String(255);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Materiale'
  @sap.quickinfo : 'Materiale pianif.'
  Material : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Prodotto'
  @sap.quickinfo : 'Codice prodotto'
  Product : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Divisione pian.'
  @sap.quickinfo : 'Divisione di pianificazione'
  MRPPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Area pian. MRP'
  MRPArea : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Responsabile MRP'
  MRPController : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cat. approvv.'
  @sap.quickinfo : 'Categoria approvvigionamento materiale'
  MaterialProcurementCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo approvv.'
  @sap.quickinfo : 'Tipo di approvvigionamento materiale'
  MaterialProcurementType : String(1);
  @sap.label : 'Durata dell''entrata merci di materiale'
  @sap.quickinfo : 'Durata in giorni dell''entrata merci di materiale'
  MaterialGoodsReceiptDuration : Decimal(3, 0);
  @sap.label : 'Durata consegna'
  @sap.quickinfo : 'Durata consegna pianificata del materiale in giorni'
  MaterialPlannedDeliveryDurn : Decimal(3, 0);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Magazzino'
  StorageLocation : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tp. stock speciale'
  @sap.quickinfo : 'Tipo di stock inventario speciale'
  InventorySpecialStockType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Registr. consumo'
  @sap.quickinfo : 'Registrazione consumo'
  ConsumptionPosting : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Mat. costruttore'
  @sap.quickinfo : 'Numero componente costruttore del materiale'
  ManufacturerMaterial : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Mag. di provenienza'
  @sap.quickinfo : 'Magazzino di provenienza per ordine di trasf.'
  IssuingStorageLocation : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo DO'
  @sap.quickinfo : 'Tipo distinta delle operazioni'
  BillOfOperationsType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Distinta operazioni'
  @sap.quickinfo : 'ID distinta delle operazioni'
  BillOfOperations : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo dist. oper.'
  @sap.quickinfo : 'Gruppo distinte delle operazioni'
  BillOfOperationsGroup : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Variante DO'
  @sap.quickinfo : 'Variante distinta delle operazioni'
  BillOfOperationsVariant : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Distinta base alt.'
  @sap.quickinfo : 'Distinta base alternativa'
  BillOfMaterialVariant : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Util. distinta base'
  @sap.quickinfo : 'Utilizzo della distinta base'
  BillOfMaterialVariantUsage : String(1);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Stato dist. base'
  @sap.quickinfo : 'Stato della distinta base'
  BillOfMaterialStatus : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Versione Db'
  BillOfMaterialVersion : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'ID data esplosione'
  @sap.quickinfo : 'ID data esplosione per distinta base'
  BOMExplosionDateID : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Div. di produzione'
  @sap.quickinfo : 'Divisione di produzione'
  ProductionPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Responsabile di produzione'
  ProductionSupervisor : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Versione di prod.'
  @sap.quickinfo : 'Versione di produzione'
  ProductionVersion : String(4);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Scenario pian.'
  @sap.quickinfo : 'Scenario di pianificazione nella pian. a lungo termine'
  MRPPlanningScenario : String(3);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Impegno'
  @sap.quickinfo : 'Numero dell''impegno / del fabbisogno dipendente'
  Reservation : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Prenotazione di liquidazione'
  SettlementReservation : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Posizione impegno per liquidazione'
  SettlementReservationItem : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Org. acquisti'
  @sap.quickinfo : 'Organizzazione acquisti'
  PurchasingOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Accordo di acquisto'
  @sap.quickinfo : 'Schedulazione piano di consegna/contratto quadro'
  PurchasingDocument : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Pos. contratto'
  @sap.quickinfo : 'Schedulazione piano di consegna/posizione contratto quadro'
  PurchasingDocumentItem : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sudd. in quote'
  @sap.quickinfo : 'Suddivisione in quote'
  QuotaArrangement : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Pos. suddivisione'
  @sap.quickinfo : 'Posizione suddivisione in quote'
  QuotaArrangementItem : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fornitore fisso'
  FixedSupplier : String(10);
  @sap.label : 'Forn. lav. esterna'
  @sap.quickinfo : 'Fornitore lavorazione esterna'
  SupplierIsSubcontractor : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cliente'
  @sap.quickinfo : 'Codice cliente'
  Customer : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ordine di vendita'
  SalesOrder : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Pos. ordine vendita'
  @sap.quickinfo : 'Posizione ordine di vendita'
  SalesOrderItem : String(6);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Elemento WBS interno'
  @sap.quickinfo : 'ID interno dell''elemento WBS'
  WBSElementInternalID : String(24);
  @sap.display.format : 'NonNegative'
  @sap.label : 'ID interno WBS'
  @sap.quickinfo : 'Elemento WBS'
  WBSElementInternalID_2 : String(8);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Fabbisogno capacità'
  @sap.quickinfo : 'ID del record fabbisogno capacità'
  CapacityRequirement : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo schedulazione'
  @sap.quickinfo : 'Tipo di schedulazione'
  SchedulingType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Err. schedulazione'
  @sap.quickinfo : 'Errore di schedulazione'
  SchedulingError : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Numero di modifica'
  ChangeNumber : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Stato di revisione'
  MaterialRevisionLevel : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Stato di revisione'
  MaterialRevisionLevel_2 : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Categoria di contabilizzazione'
  AccountAssignmentCategory : String(1);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Tipo di elaborazione d''assemblaggio'
  AssemblyProcessingType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Chiave distribuzione'
  @sap.quickinfo : 'Chiave distribuzione per la quantità prodotta'
  QuantityDistributionKey : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valutazione std'
  @sap.quickinfo : 'Valutazione validità/valutazione standard'
  EffectivityParameterVariant : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Piano fabbisogni'
  RequirementPlan : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo di controllo disponibilità'
  ProductAvailabilityCheckType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Contratto centrale'
  CentralContract : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Pos. contr. centr.'
  @sap.quickinfo : 'Numero di posizione del contratto centrale'
  CentralContractItem : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Contr. attività'
  @sap.quickinfo : 'Controllo operazione: elaborazione ordine pianificato'
  PlannedOrderActionControl : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Azione elab. dell''ordine pianificato'
  @sap.quickinfo : 'Azione in elaborazione dell''ordine pianificato'
  PlannedOrderProcgAction : String(4);
  @sap.display.format : 'Date'
  @sap.label : 'Data dell''azione'
  @sap.quickinfo : 'Data dell''azione: ordine pianificato'
  PlannedOrderLastActionDate : Date;
  @sap.label : 'Ora azione'
  @sap.quickinfo : 'Ora dell''azione: elaborazione ordine pianificato'
  PlannedOrderLastActionTime : Time;
  @sap.label : 'Cd. fissazione'
  @sap.quickinfo : 'Codice di fissazione per dati ordine pianificato'
  PlannedOrderIsFirm : Boolean;
  @sap.label : 'Codice fiss.dist.bse'
  @sap.quickinfo : 'Codice di fissazione per esplosione distinta base'
  PlannedOrderBOMIsFixed : Boolean;
  @sap.label : 'Indic. conversione'
  @sap.quickinfo : 'Indicatore conversione dell''ordine pianificato'
  PlannedOrderIsConvertible : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Prod. ripet.'
  @sap.quickinfo : 'Codice: produzione ripetitiva'
  PlndOrderIsCreatedForRptvMfg : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Approvv. produzione'
  @sap.quickinfo : 'Tipo di approvvigionamento produzione'
  PlndOrderReplnmtElmntType : String(1);
  @sap.label : 'Indicatore di elaborazione assemblaggio'
  @sap.quickinfo : 'Indicatore: per elaborazione assemblaggio'
  PlndOrdIsCrtedForAssemblyProcg : Boolean;
  @sap.label : 'Capacità pianificata'
  @sap.quickinfo : 'Codice: capacità per ordine di pianificazione è pianificata'
  PlannedOrderCapacityIsDsptchd : Boolean;
  @sap.label : 'Schedulazione'
  @sap.quickinfo : 'Codice di schedulazione'
  OrderIsScheduled : Boolean;
  @sap.label : 'Pianificazione senza assemblaggio finale'
  @sap.quickinfo : 'Indicatore: pianificazione senza assemblaggio finale'
  IsPlannedWithoutFinalAssembly : Boolean;
  @sap.label : 'Network degli ordini'
  @sap.quickinfo : 'L''ordine fa parte del network di ordini'
  PlannedOrderIsPartOfCollvOrder : Boolean;
  @sap.display.format : 'Date'
  @sap.label : 'Data d''inizio ordine'
  @sap.quickinfo : 'Data d''inizio dell''ordine pianificato'
  PlndOrderPlannedStartDate : Date;
  @sap.label : 'Ora inizio ordine'
  @sap.quickinfo : 'Ora d''inizio dell''ordine pianificato'
  PlndOrderPlannedStartTime : Time;
  @sap.display.format : 'Date'
  @sap.label : 'Data fine ordine'
  @sap.quickinfo : 'Data di fine dell''ordine pianificato'
  PlndOrderPlannedEndDate : Date;
  @sap.label : 'Ora fine ordine'
  @sap.quickinfo : 'Ora di fine dell''ordine pianificato'
  PlndOrderPlannedEndTime : Time;
  @sap.display.format : 'Date'
  @sap.label : 'Data apertura ordine'
  @sap.quickinfo : 'Data apertura pianificata nell''ordine pianificato'
  PlannedOrderOpeningDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Data conferma'
  @sap.quickinfo : 'Data impegno totale ord. pianificato in base a controllo ATP'
  PlndOrderTotalCmtmtDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Data di inizio prod.'
  @sap.quickinfo : 'Data di inizio produzione'
  ProductionStartDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Data fine prod.'
  @sap.quickinfo : 'Data di fine produzione'
  ProductionEndDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Data esplosione'
  BOMExplosionDate : Date;
  @sap.label : 'Contatore'
  @sap.quickinfo : 'Contatore per la conversione in unità di mis. di base'
  PlndOrderBaseToEntryQtyNmrtr : Decimal(5, 0);
  @sap.label : 'Denominatore'
  @sap.quickinfo : 'Denom. per la conversione in unità di misura di base'
  PlndOrderBaseToEntryQtyDnmntr : Decimal(5, 0);
  @sap.label : 'Unità misura base'
  @sap.quickinfo : 'Unità di misura di base'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Master Planned Orders'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_MasterPlannedOrders {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Master Plnd Ord.'
  @sap.quickinfo : 'Numero ordine pianificato principale'
  key FshMplndOrd : String(12) not null;
  @sap.required.in.filter : 'false'
  @sap.label : 'Base Unit of Measure'
  @sap.quickinfo : 'Unità di misura di base'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'PlannedTotalQtyInBaseUnit'
  PlannedTotalQtyInBaseUnit : Decimal(13, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'RequirementQuantityInBaseUnit'
  RequirementQuantityInBaseUnit : Decimal(13, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'QuantityWithdrawnInBaseUnit'
  QuantityWithdrawnInBaseUnit : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Combined Plnd. Order'
  @sap.quickinfo : 'Ordine pianificato combinato principale'
  CplndOrd : String(12);
  @sap.required.in.filter : 'false'
  @sap.label : 'Product Description'
  @sap.quickinfo : 'Descrizione prodotto'
  ProductDescription : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'ZZ1_MFI_CR_TYPE'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_MFI_CR_TYPE_V {
  @sap.text : 'Code_Text'
  @sap.label : 'Order type'
  key Code : String(3) not null;
  @sap.label : 'Order type (Desc.)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Code_Text : String(60);
  @sap.label : 'È disattivato'
  @sap.quickinfo : 'Campo personalizzato: indicatore codice disattivato'
  IsDisabled : Boolean;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Planned Orders Capacity'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PlannedOrdersCapacity {
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity Requirement'
  @sap.quickinfo : 'ID del record fabbisogno capacità'
  @sap.value.list : 'standard'
  key CapacityRequirement : String(12) not null;
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity Requirement Item'
  @sap.quickinfo : 'Posizione fabbisogno di capacità'
  @sap.value.list : 'standard'
  key CapacityRequirementItem : String(8) not null;
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity Requirement Item Capacity'
  @sap.quickinfo : 'Capacità singola di una posizione del fabbisogno capacità'
  key CapacityRqmtItemCapacity : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Planned Order'
  @sap.quickinfo : 'Ordine pianificato'
  @sap.value.list : 'standard'
  PlannedOrder : String(10);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Work Center ID'
  @sap.quickinfo : 'ID centro di lavoro'
  @sap.value.list : 'standard'
  WorkCenterInternalID : String(8);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Work Center Type'
  @sap.quickinfo : 'Tipo di centro di lavoro'
  WorkCenterType : String(2);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity ID'
  @sap.quickinfo : 'ID della capacità'
  @sap.value.list : 'standard'
  CapacityInternalID : String(8);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'to_CapacityCategory/CapacityCategoryCode_Text'
  @sap.label : 'Capacity Category'
  @sap.quickinfo : 'Categoria capacità'
  @sap.value.list : 'standard'
  CapacityCategory : String(3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Sequence'
  @sap.quickinfo : 'Sequenza'
  Sequence : String(6);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'OperationText'
  @sap.label : 'Operation or Phase'
  @sap.quickinfo : 'Numero operazione o fase'
  Operation : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'OperationText'
  @sap.label : 'Suboperation or Secondary Resource'
  @sap.quickinfo : 'Numero sotto-operazione o risorsa secondaria'
  SubOperation : String(4);
  @sap.required.in.filter : 'false'
  @sap.label : 'Operation Short Text'
  @sap.quickinfo : 'Operazione testo breve'
  OperationText : String(40);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Latest Start Date'
  @sap.quickinfo : 'Ultima data d''inizio'
  OperationLatestStartDate : Date;
  @sap.required.in.filter : 'false'
  @sap.label : 'Scheduled Setup'
  @sap.quickinfo : 'Fabbisogni di capacità pianificati per attrezzaggio'
  ScheduledCapReqOpSegSetupDurn : Double;
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity Unit'
  @sap.quickinfo : 'Unità di misura per fabbisogni di capacità'
  @sap.semantics : 'unit-of-measure'
  CapacityRequirementUnit : String(3);
  @sap.required.in.filter : 'false'
  @sap.label : 'Remaining Setup'
  @sap.quickinfo : 'Fabbisogni di capacità residui per attrezzaggio'
  RemainingCapReqOpSegSetupDurn : Double;
  @sap.required.in.filter : 'false'
  @sap.label : 'Scheduled Processing'
  @sap.quickinfo : 'Fabbisogni di capacità pianificati per lavorazione'
  ScheduledCapReqOpSegProcgDurn : Double;
  @sap.required.in.filter : 'false'
  @sap.label : 'Remaining Processing'
  @sap.quickinfo : 'Fabbisogni di capacità residui per lavorazione'
  RemainingCapReqOpSegProcgDurn : Double;
  @sap.required.in.filter : 'false'
  @sap.label : 'Scheduled Teardown'
  @sap.quickinfo : 'Fabbisogni di capacità pianificati per disattrezzaggio'
  ScheduledCapReqOpSegTrdwnDurn : Double;
  @sap.required.in.filter : 'false'
  @sap.label : 'Remaining Teardown'
  @sap.quickinfo : 'Fabbisogni di capacità residui per disattrezzaggio'
  RemainingCapReqOpSegTrdwnDurn : Double;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Ord. pian. princ.'
  @sap.quickinfo : 'Numero ordine pianificato principale'
  FshMplndOrd : String(12);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Ord. pian. combinato'
  @sap.quickinfo : 'Ordine pianificato combinato principale'
  CplndOrd : String(12);
  to_CapacityCategory : Association to ZZ1_COMBINEDPLNORDERSAPI_CDS.I_CapacityCategory {  };
  to_CapacityRequirementItem : Association to ZZ1_COMBINEDPLNORDERSAPI_CDS.I_CapacityRequirementItem {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Planned Order Component Characteristic'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PlannedOrdersCompChar {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Stock Material'
  @sap.quickinfo : 'Materiale in riferimento al quale viene gestito lo stock'
  key Material : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Plant'
  @sap.quickinfo : 'Divisione'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Storage Location'
  @sap.quickinfo : 'Magazzino'
  key StorageLocation : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Batch SID'
  @sap.quickinfo : 'N. partita (identificatore stock)'
  key Batch : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Supplier SID'
  @sap.quickinfo : 'Fornitore per stock speciale'
  key Supplier : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Sales order'
  @sap.quickinfo : 'N. ordine cliente dello stock ordine cliente valorizzato'
  key SDDocument : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Sales order item'
  @sap.quickinfo : 'Pos. ordine cliente dello stock ordine cliente valorizzato'
  key SDDocumentItem : String(6) not null;
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'WBS Internal ID'
  @sap.quickinfo : 'Elemento WBS'
  key WBSElementInternalID : String(8) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Customer SID'
  @sap.quickinfo : 'Cliente per stock speciale'
  key Customer : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Add. Supplier for Special Stock'
  @sap.quickinfo : 'Altro fornitore per stock speciale'
  key SpecialStockIdfgStockOwner : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Stock Type'
  @sap.quickinfo : 'Tipo di stock del movimento merci (identificatore stock)'
  key InventoryStockType : String(2) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Special Stock Type'
  @sap.quickinfo : 'Tipo di stock speciale'
  key InventorySpecialStockType : String(1) not null;
  @sap.required.in.filter : 'false'
  @sap.label : 'Base Unit of Measure'
  @sap.quickinfo : 'Unità di misura di base'
  @sap.semantics : 'unit-of-measure'
  key MaterialBaseUnit : String(3) not null;
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'ProdCostEst.No.'
  @sap.quickinfo : 'Numero calcolo costi - calcolo costi del prodotto'
  key CostEstimate : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Resource Name'
  @sap.quickinfo : 'Nome della risorsa (identificatore stock)'
  key ResourceID : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Company Code'
  @sap.quickinfo : 'Società'
  CompanyCode : String(4);
  @sap.required.in.filter : 'false'
  @sap.unit : 'MaterialBaseUnit'
  @sap.label : 'MatlWrhsStkQtyInMatlBaseUnit'
  @sap.quickinfo : 'Quantità stock'
  MatlWrhsStkQtyInMatlBaseUnit : Decimal(31, 14);
  @sap.required.in.filter : 'false'
  @sap.unit : 'MaterialBaseUnit'
  @sap.label : 'MatlCnsmpnQtyInMatlBaseUnit'
  @sap.quickinfo : 'Quantità di consumo'
  MatlCnsmpnQtyInMatlBaseUnit : Decimal(31, 14);
  @sap.required.in.filter : 'false'
  @sap.unit : 'MaterialBaseUnit'
  @sap.label : 'MatlStkIncrQtyInMatlBaseUnit'
  @sap.quickinfo : 'Quantità aumento stock'
  MatlStkIncrQtyInMatlBaseUnit : Decimal(31, 14);
  @sap.required.in.filter : 'false'
  @sap.unit : 'MaterialBaseUnit'
  @sap.label : 'MatlStkDecrQtyInMatlBaseUnit'
  @sap.quickinfo : 'Quantità riduzione stock'
  MatlStkDecrQtyInMatlBaseUnit : Decimal(31, 14);
  @sap.required.in.filter : 'false'
  @sap.label : 'choice'
  choice : String(70);
  @sap.required.in.filter : 'false'
  @sap.label : 'dye_lot'
  dye_lot : String(70);
  @sap.required.in.filter : 'false'
  @sap.label : 'GROSS_LENGHT'
  GROSS_LENGHT : String(70);
  @sap.required.in.filter : 'false'
  @sap.label : 'NET_HEIGHT'
  NET_HEIGHT : String(70);
  @sap.required.in.filter : 'false'
  @sap.label : 'DEROGA'
  DEROGA : String(70);
  @sap.required.in.filter : 'false'
  @sap.label : 'PDF_RATING_ID'
  PDF_RATING_ID : String(70);
  @sap.required.in.filter : 'false'
  @sap.label : 'SERIALE_MATRICOLA'
  SERIALE_MATRICOLA : String(70);
  @sap.required.in.filter : 'false'
  @sap.label : 'ALTEZZA_STANDARD'
  ALTEZZA_STANDARD : String(70);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Plant'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_Plant {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'PlantName'
  @sap.label : 'Plant'
  @sap.quickinfo : 'Divisione'
  key Plant : String(4) not null;
  @sap.required.in.filter : 'false'
  @sap.label : 'Plant Name'
  @sap.quickinfo : 'Nome divisione'
  PlantName : String(30);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Valuation Area'
  @sap.quickinfo : 'Area valorizzazione'
  ValuationArea : String(4);
  @sap.required.in.filter : 'false'
  @sap.label : 'Archiving Flag'
  @sap.quickinfo : 'Marcatore archiviazione centrale per record anagrafico'
  IsMarkedForArchiving : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Customer No Plant'
  @sap.quickinfo : 'Cd.cliente della divisione'
  @sap.value.list : 'standard'
  PlantCustomer : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Sppl. No. Plnt'
  @sap.quickinfo : 'Codice fornitore della divisione'
  @sap.value.list : 'standard'
  PlantSupplier : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Factory Calendar'
  @sap.quickinfo : 'Chiave calendario di fabbrica'
  FactoryCalendar : String(2);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Purch. Organization'
  @sap.quickinfo : 'Organizzazione acquisti'
  DefaultPurchasingOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Sls Organization ICB'
  @sap.quickinfo : 'Organizzazione commerciale per fatturazione interna'
  SalesOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Address'
  @sap.quickinfo : 'Indirizzo'
  AddressID : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Plant Cat.'
  @sap.quickinfo : 'Cat. div.'
  PlantCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Distrib.Channel'
  @sap.quickinfo : 'Canale di distribuzione per fatturazione interna'
  DistributionChannel : String(2);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Interco. Billing Div'
  @sap.quickinfo : 'Settore per fatturazione interna'
  Division : String(2);
  @sap.required.in.filter : 'false'
  @sap.label : 'Language Key'
  @sap.quickinfo : 'Chiave lingua'
  Language : String(2);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Capacity Aggregation by Combined PLO'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PLOCAPACITYCORD {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Combined Plnd. Order'
  @sap.quickinfo : 'Ordine pianificato combinato principale'
  key CombinedMasterOrder : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Sequence'
  @sap.quickinfo : 'Sequenza'
  key Sequence : String(6) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Operation or Phase'
  @sap.quickinfo : 'Numero operazione o fase'
  key Operation : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Suboperation or Secondary Resource'
  @sap.quickinfo : 'Numero sotto-operazione o risorsa secondaria'
  key SubOperation : String(4) not null;
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Work Center ID'
  @sap.quickinfo : 'ID centro di lavoro'
  WorkCenterInternalID : String(8);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Work Center Type'
  @sap.quickinfo : 'Tipo di centro di lavoro'
  WorkCenterType : String(2);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity ID'
  @sap.quickinfo : 'ID della capacità'
  CapacityInternalID : String(8);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity Category'
  @sap.quickinfo : 'Categoria capacità'
  CapacityCategory : String(3);
  @sap.required.in.filter : 'false'
  @sap.label : 'Operation Short Text'
  @sap.quickinfo : 'Operazione testo breve'
  OperationText : String(40);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'OperationLatestStartDate'
  OperationLatestStartDate : Date;
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity Unit'
  @sap.quickinfo : 'Unità di misura per fabbisogni di capacità'
  @sap.semantics : 'unit-of-measure'
  CapacityRequirementUnit : String(3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'CapacityRequirementUnit'
  @sap.label : 'ScheduledCapReqOpSegSetupDurn'
  ScheduledCapReqOpSegSetupDurn : Double;
  @sap.required.in.filter : 'false'
  @sap.unit : 'CapacityRequirementUnit'
  @sap.label : 'RemainingCapReqOpSegSetupDurn'
  RemainingCapReqOpSegSetupDurn : Double;
  @sap.required.in.filter : 'false'
  @sap.unit : 'CapacityRequirementUnit'
  @sap.label : 'ScheduledCapReqOpSegProcgDurn'
  ScheduledCapReqOpSegProcgDurn : Double;
  @sap.required.in.filter : 'false'
  @sap.unit : 'CapacityRequirementUnit'
  @sap.label : 'RemainingCapReqOpSegProcgDurn'
  RemainingCapReqOpSegProcgDurn : Double;
  @sap.required.in.filter : 'false'
  @sap.unit : 'CapacityRequirementUnit'
  @sap.label : 'ScheduledCapReqOpSegTrdwnDurn'
  ScheduledCapReqOpSegTrdwnDurn : Double;
  @sap.required.in.filter : 'false'
  @sap.unit : 'CapacityRequirementUnit'
  @sap.label : 'RemainingCapReqOpSegTrdwnDurn'
  RemainingCapReqOpSegTrdwnDurn : Double;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOO Group'
  @sap.quickinfo : 'Chiave per gruppo di cicli'
  BillOfOperationsGroup : String(8);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOO Type'
  @sap.quickinfo : 'Tipo ciclo'
  BillOfOperationsType : String(1);
  @sap.required.in.filter : 'false'
  @sap.label : 'User field indicator'
  @sap.quickinfo : 'Campo utente: codici di valutazione'
  FreeDefinedIndicator1 : Boolean;
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Object ID'
  @sap.quickinfo : 'ID oggetto'
  BOOWorkCenterInternalID : String(8);
  @sap.required.in.filter : 'false'
  @sap.label : 'Work Center Text'
  @sap.quickinfo : 'Testo centro di lavoro'
  BOOWorkCenterText : String(40);
  @sap.required.in.filter : 'false'
  @sap.label : 'fornitore'
  fornitore : String(70);
};

