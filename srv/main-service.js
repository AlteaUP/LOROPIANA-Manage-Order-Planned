const cds = require("@sap/cds");

module.exports = class MainService extends cds.ApplicationService {
  async init() {
    console.log('*** init ZZ1_COMBINEDPLNORDERSAPI_CDS')
    const ZZ1_COMBINEDPLNORDERSAPI_CDS = await cds.connect.to("ZZ1_COMBINEDPLNORDERSAPI_CDS");
    const ZZ1_MASTERPLANNEDORDERAPI_CDS = await cds.connect.to("ZZ1_MASTERPLANNEDORDERAPI_CDS");
    const ZZ1_PLANNEDORDERSAPI_CDS = await cds.connect.to("ZZ1_PLANNEDORDERSAPI_CDS");

    this.on("*", "ZZ1_CombinedPlnOrdersAPI", async (req) => {
      return ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query);
    });

    this.on("*", "ZZ1_MasterPlannedOrderAPI", async (req) => {
      return ZZ1_MASTERPLANNEDORDERAPI_CDS.run(req.query);
    })

    this.on("*", "ZZ1_PlannedOrdersAPI", async (req) => {
      return ZZ1_PLANNEDORDERSAPI_CDS.run(req.query);
    })
  }
};
