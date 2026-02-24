# Getting Started

Welcome to your new project...

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
  `external/` | external services (edmx --> cds)
`package.json` | project metadata and configuration
`readme.md` | this getting started guide

## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.

## Run the project

- Open a terminal and run `npm install`

- Run `npm run start` to start the server

## Configure external cds

Navigate to the metadata from the external service and copy the edmx file to the external folder.

Then run `cds import srv/external/<METADATA>.edmx --from edmx --as cds` to generate the cds file.

> Note: The edmx file should be in the external folder. Replace <METADATA> with the name of the edmx file.

## CDS

| CDS Entity Name           | oData Project                 | Description                           | 
| ZZ1_CombinedPlnOrdersAPI  | [ZZ1_COMBINEDPLNORDERSAPI_CDS](http://lpappsvi.lp.corp:8000/sap/opu/odata/sap/ZZ1_COMBINEDPLNORDERSAPI_CDS/$metadata)  | Combined Planned Orders API           |
| ZZ1_MasterPlannedOrderAPI | [ZZ1_MASTERPLANNEDORDERAPI_CDS](http://lpappsvi.lp.corp:8000/sap/opu/odata/sap/ZZ1_MASTERPLANNEDORDERAPI_CDS/$metadata) | Master Planned Order    API           |
| ZZ1_PlannedOrdersAPI      | [ZZ1_PLANNEDORDERSAPI_CDS](http://lpappsvi.lp.corp:8000/sap/opu/odata/sap/ZZ1_PLANNEDORDERSAPI_CDS/$metadata)      | PlannedOrders           API           |
| ZZ1_PLOCAPACITYCORD       | [ZZ1_PLOCAPACITYCORD_CDS](http://lpappsvi.lp.corp:8000/sap/opu/odata/sap/ZZ1_PLOCAPACITYCORD_CDS/$metadata)       | Capacity Aggregation by Combined PLO  |
| ZZ1_PLOCAPACITYMORD       | [ZZ1_PLOCAPACITYMORD_CDS](http://lpappsvi.lp.corp:8000/sap/opu/odata/sap/ZZ1_PLOCAPACITYMORD_CDS/$metadata)      | Capacity Aggregated by Master PLO     |





https://sap.github.io/odata-vocabularies/vocabularies/HTML5.html#CssDefaultsType
