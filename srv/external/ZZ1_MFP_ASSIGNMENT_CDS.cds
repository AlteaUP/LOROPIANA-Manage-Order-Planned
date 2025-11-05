/* checksum : 32ebf8c8480d95dc75acfb89b567a2b5 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_MFP_ASSIGNMENT_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Language'
entity ZZ1_MFP_ASSIGNMENT_CDS.I_Language {
  @sap.text : 'Language_Text'
  @sap.label : 'Language Key'
  key Language : String(2) not null;
  @sap.label : 'Name'
  @sap.quickinfo : 'Name of Language'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Language_Text : String(16);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Language Code'
  @sap.quickinfo : '2-Character SAP Language Code'
  LanguageISOCode : String(2);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Unit of Measure'
entity ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasure {
  @sap.text : 'UnitOfMeasure_Text'
  @sap.label : 'Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  key UnitOfMeasure : String(3) not null;
  @sap.label : 'Meas. Unit Text'
  @sap.quickinfo : 'Unit of Measurement Text (Maximum 30 Characters)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  UnitOfMeasure_Text : String(30);
  @sap.label : 'Internal SAP Code'
  @sap.quickinfo : 'Unit of Measurement, Internal SAP Code (No Conversion)'
  UnitOfMeasureSAPCode : String(3);
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_ISOCode/UnitOfMeasureISOCode_Text'
  @sap.label : 'ISO Code'
  @sap.quickinfo : 'ISO Code for Unit of Measurement'
  @sap.value.list : 'standard'
  UnitOfMeasureISOCode : String(3);
  @sap.label : 'Primary code'
  @sap.quickinfo : 'Selection field for conversion from ISO code to int. code'
  IsPrimaryUnitForISOCode : Boolean;
  @sap.label : 'Decimal Rounding'
  @sap.quickinfo : 'No. of decimal places for rounding'
  UnitOfMeasureNumberOfDecimals : Integer;
  @sap.label : 'Commercial Unit'
  @sap.quickinfo : 'Commercial measurement unit ID'
  UnitOfMeasureIsCommercial : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_Dimension/UnitOfMeasureDimension_Text'
  @sap.label : 'Dimension'
  @sap.quickinfo : 'Dimension key'
  @sap.value.list : 'standard'
  UnitOfMeasureDimension : String(6);
  @sap.label : 'Numerator'
  @sap.quickinfo : 'Numerator for conversion to SI unit'
  SIUnitCnvrsnRateNumerator : Integer;
  @sap.label : 'Denominator'
  @sap.quickinfo : 'Denominator for conversion into SI unit'
  SIUnitCnvrsnRateDenominator : Integer;
  @sap.label : 'Exponent'
  @sap.quickinfo : 'base ten exponent for conversion to SI unit'
  SIUnitCnvrsnRateExponent : Integer;
  @sap.label : 'Additive constant'
  @sap.quickinfo : 'Additive constant for conversion to SI unit'
  SIUnitCnvrsnAdditiveValue : Decimal(9, 6);
  @sap.label : 'Exp. 10 Floating Pt'
  @sap.quickinfo : 'Exponent of 10 for Floating Point Format'
  UnitOfMeasureDspExponent : Integer;
  @sap.label : 'Decimal Places'
  @sap.quickinfo : 'Number of Decimal Places for Number Display'
  UnitOfMeasureDspNmbrOfDcmls : Integer;
  @sap.unit : 'UnitOfMeasureTemperatureUnit'
  @sap.label : 'Temperature'
  UnitOfMeasureTemperature : Double;
  @sap.label : 'Temperature unit'
  @sap.semantics : 'unit-of-measure'
  UnitOfMeasureTemperatureUnit : String(3);
  @sap.unit : 'UnitOfMeasurePressureUnit'
  @sap.label : 'Pressure Value'
  UnitOfMeasurePressure : Double;
  @sap.label : 'Unit of Pressure'
  @sap.semantics : 'unit-of-measure'
  UnitOfMeasurePressureUnit : String(3);
  to_Dimension : Association to ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasureDimension {  };
  to_ISOCode : Association to ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasureISOCode {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Unit of Measure Dimension'
entity ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasureDimension {
  @sap.display.format : 'UpperCase'
  @sap.text : 'UnitOfMeasureDimension_Text'
  @sap.label : 'Dimension'
  @sap.quickinfo : 'Dimension key'
  key UnitOfMeasureDimension : String(6) not null;
  @sap.label : 'Dimension Text'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  UnitOfMeasureDimension_Text : String(20);
  @sap.label : 'Length'
  @sap.quickinfo : 'Length exponent'
  LengthExponent : Integer;
  @sap.label : 'Mass'
  @sap.quickinfo : 'Mass exponent'
  MassExponent : Integer;
  @sap.label : 'Time'
  @sap.quickinfo : 'Current exponent'
  TimeExponent : Integer;
  @sap.label : 'elec. current'
  @sap.quickinfo : 'Electric current exponent'
  ElectricCurrentExponent : Integer;
  @sap.label : 'Temperature'
  @sap.quickinfo : 'Temperature exponent'
  TemperatureExponent : Integer;
  @sap.label : 'Mole quantity'
  @sap.quickinfo : 'Mole quantity exponent'
  MoleQuantityExponent : Integer;
  @sap.label : 'Luminous intensity'
  @sap.quickinfo : 'Luminosity exponent'
  LuminosityExponent : Integer;
  @sap.label : 'SI unit'
  @sap.semantics : 'unit-of-measure'
  UnitOFMeasureSiUnit : String(3);
  @sap.label : 'Temperature-Depend.'
  @sap.quickinfo : 'Indicator: Dimension has Unit with Temperature Specification'
  HasUnitsWithTemperatureSpec : Boolean;
  @sap.label : 'Pressure-Dependent'
  @sap.quickinfo : 'Indicator: Dimension has Units with Pressure Specification'
  HasUnitsWithPressureSpec : Boolean;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Unit of Measure ISO Code'
entity ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasureISOCode {
  @sap.display.format : 'UpperCase'
  @sap.text : 'UnitOfMeasureISOCode_Text'
  @sap.label : 'ISO Code'
  @sap.quickinfo : 'ISO Code for Unit of Measurement'
  key UnitOfMeasureISOCode : String(3) not null;
  @sap.label : 'ISO code'
  @sap.quickinfo : 'ISO codes for measurement unit names'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  UnitOfMeasureISOCode_Text : String(25);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Unit of Measure Text'
entity ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasureText {
  @sap.text : 'to_Language/Language_Text'
  @sap.label : 'Language Key'
  @sap.value.list : 'standard'
  key Language : String(2) not null;
  @sap.text : 'to_UnitOfMeasure/UnitOfMeasure_Text'
  @sap.label : 'Internal UoM'
  @sap.quickinfo : 'Unit of Measurement'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  key UnitOfMeasure : String(3) not null;
  @sap.label : 'Meas. Unit Text'
  @sap.quickinfo : 'Unit of Measurement Text (Maximum 30 Characters)'
  UnitOfMeasureLongName : String(30);
  @sap.label : 'Meas. Unit Text'
  @sap.quickinfo : 'Unit of Measurement Text (Maximum 10 Characters)'
  UnitOfMeasureName : String(10);
  @sap.label : 'Technical'
  @sap.quickinfo : 'External Unit of Measurement in Technical Format (6-Char.)'
  UnitOfMeasureTechnicalName : String(6);
  @sap.label : 'Commercial'
  @sap.quickinfo : 'External Unit of Measurement in Commercial Format (3-Char.)'
  UnitOfMeasure_E : String(3);
  @sap.label : 'Commercial'
  @sap.quickinfo : 'External Unit of Measurement in Commercial Format (3-Char.)'
  UnitOfMeasureCommercialName : String(3);
  to_Language : Association to ZZ1_MFP_ASSIGNMENT_CDS.I_Language {  };
  to_UnitOfMeasure : Association to ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasure {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
@sap.label : 'User'
entity ZZ1_MFP_ASSIGNMENT_CDS.P_Scbo_User {
  @sap.display.format : 'UpperCase'
  @sap.label : 'User'
  @sap.quickinfo : 'User Name in User Master Record'
  key name : String(12) not null;
  @sap.label : 'Description'
  @sap.quickinfo : 'Description of the Technical User Account'
  description : String(80);
};

@cds.external : true
@cds.persistence.skip : true
@sap.searchable : 'true'
@sap.content.version : '1'
entity ZZ1_MFP_ASSIGNMENT_CDS.ZZ1_MFP_ASSIGNMENT {
  @sap.label : 'UUID'
  @sap.quickinfo : '16 Byte UUID in 16 Bytes (Raw Format)'
  key SAP_UUID : UUID not null;
  @sap.label : 'Text of length 4'
  @sap.heading : ''
  @sap.quickinfo : ''
  WERKS : String(4);
  @sap.label : 'Text of length 20'
  @sap.heading : ''
  @sap.quickinfo : ''
  LGORT : String(20);
  @sap.label : 'Text of length 12'
  @sap.heading : ''
  @sap.quickinfo : ''
  FSH_MPLO_ORD : String(12);
  @sap.label : 'Text of length 45'
  @sap.heading : ''
  @sap.quickinfo : ''
  BAGNI : String(45);
  @sap.label : 'Text of length 40'
  @sap.heading : ''
  @sap.quickinfo : ''
  MATNR : String(40);
  @sap.label : 'Text of length 10'
  @sap.heading : ''
  @sap.quickinfo : ''
  CHARG : String(10);
  @sap.label : 'Text of length 45'
  @sap.heading : ''
  @sap.quickinfo : ''
  Bagno : String(45);
  @sap.unit : 'QTA_ASS_U'
  @sap.label : ''
  QTA_ASS_V : Decimal(15, 3);
  @sap.text : 'QTA_ASS_U_Text'
  @sap.label : ''
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  QTA_ASS_U : String(3);
  @sap.label : 'Meas. Unit Text'
  @sap.quickinfo : 'Unit of Measurement Text (Maximum 30 Characters)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  QTA_ASS_U_Text : String(30);
  @sap.unit : 'FABB_TOT_U'
  @sap.label : ''
  FABB_TOT_V : Decimal(15, 3);
  @sap.text : 'FABB_TOT_U_Text'
  @sap.label : ''
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  FABB_TOT_U : String(3);
  @sap.label : 'Meas. Unit Text'
  @sap.quickinfo : 'Unit of Measurement Text (Maximum 30 Characters)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  FABB_TOT_U_Text : String(30);
  @sap.label : ''
  COPERTURA : Decimal(10, 0);
  @sap.label : ''
  SORT : Decimal(10, 0);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Created On'
  @sap.heading : ''
  @sap.quickinfo : ''
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_CreatedDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.text : 'SAP_CreatedByUser_Text'
  @sap.label : 'Created By'
  @sap.heading : ''
  @sap.quickinfo : ''
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_CreatedByUser : String(12);
  @sap.label : 'Description'
  @sap.quickinfo : 'Description of the Technical User Account'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_CreatedByUser_Text : String(80);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Last Changed On'
  @sap.heading : ''
  @sap.quickinfo : ''
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_LastChangedDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.text : 'SAP_LastChangedByUser_Text'
  @sap.label : 'Last Changed By'
  @sap.heading : ''
  @sap.quickinfo : ''
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_LastChangedByUser : String(12);
  @sap.label : 'Description'
  @sap.quickinfo : 'Description of the Technical User Account'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_LastChangedByUser_Text : String(80);
  @sap.label : 'Text of length 1'
  @sap.heading : ''
  @sap.quickinfo : ''
  SpecialStock : String(1);
  @sap.label : 'Text of length 40'
  @sap.heading : ''
  @sap.quickinfo : ''
  StockSegment : String(40);
  @sap.label : 'TRUE'
  @sap.heading : ''
  @sap.quickinfo : ''
  SaldoScorta : Boolean;
  @sap.label : 'Text of length 20'
  @sap.heading : ''
  @sap.quickinfo : ''
  BatchBySupplier : String(20);
  @sap.label : 'Text of length 20'
  @sap.heading : ''
  @sap.quickinfo : ''
  Scorta : String(20);
  to_FABB_TOT : Association to ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasure {  };
  to_QTA_ASS : Association to ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasure {  };
  to_SAPSysAdminDataChangeUser : Association to ZZ1_MFP_ASSIGNMENT_CDS.P_Scbo_User {  };
  to_SAPSysAdminDataCreateUser : Association to ZZ1_MFP_ASSIGNMENT_CDS.P_Scbo_User {  };
  to__FABB_TOT : Association to many ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasureText {  };
  to__QTA_ASS : Association to many ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasureText {  };
};

@cds.external : true
action ZZ1_MFP_ASSIGNMENT_CDS.ZZ1_MFP_ASSIGNMENTSap_upsert(
  @sap.label : 'Text of length 4'
  WERKS : String(4),
  @sap.label : 'Text of length 20'
  LGORT : String(20),
  @sap.label : 'Text of length 12'
  FSH_MPLO_ORD : String(12),
  @sap.label : 'Text of length 45'
  BAGNI : String(45),
  @sap.label : 'Text of length 40'
  MATNR : String(40),
  @sap.label : 'Text of length 10'
  CHARG : String(10),
  @sap.label : 'Text of length 45'
  Bagno : String(45),
  @sap.label : 'Qtà ASSIGNMENT'
  QTA_ASS_V : Decimal(15, 3),
  @sap.label : 'Qtà ASSIGNMENT'
  QTA_ASS_U : String(3),
  @sap.label : 'Fabbisogno Tot.'
  FABB_TOT_V : Decimal(15, 3),
  @sap.label : 'Fabbisogno Tot.'
  FABB_TOT_U : String(3),
  @sap.label : '% Copertura'
  COPERTURA : Decimal(10, 0),
  @sap.label : 'SORT'
  SORT : Decimal(10, 0),
  @sap.label : 'Text of length 1'
  SpecialStock : String(1),
  @sap.label : 'Text of length 40'
  StockSegment : String(40),
  @sap.label : 'TRUE'
  SaldoScorta : Boolean,
  @sap.label : 'Text of length 20'
  BatchBySupplier : String(20),
  @sap.label : 'Text of length 20'
  Scorta : String(20)
) returns ZZ1_MFP_ASSIGNMENT_CDS.ZZ1_MFP_ASSIGNMENT;

