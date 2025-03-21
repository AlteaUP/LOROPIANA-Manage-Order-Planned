const cds = require("@sap/cds");
module.exports = class TestService extends cds.ApplicationService {
  async init() {
    const test = await cds.connect.to("test");
    /**
     * Handles all incoming requests for any event and any entity.
     * (This has to be last!!!)
     *
     * @param {string} event - The event name.
     * @param {string} entity - The entity name.
     * @param {Function} handler - The handler function to process the request.
     * @param {Object} handler.req - The request object.
     * @param {Object} handler.req.query - The query object from the request.
     * @returns {Promise<Object>} The result of executing the query.
     */
    this.on("*", "*", async (req) => {
      return test.run(req.query);
    });
  }
};
