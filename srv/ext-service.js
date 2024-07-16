// const cds = require("@sap/cds");

// module.exports = cds.service.impl(async function () {
//   const test = await cds.connect.to("TEST");
//   const northwind = await cds.connect.to("Northwind");

//   this.on("getSome", async (req) => {
//     const result = await test.get("/stroka");
//     // const result = await test.send({
//     //   method: "GET",
//     //   path: "/stroka",
//     //   headers: {
//     //     "SAP-Connectivity-Authentication": "Bearer " + process.env.sapcontoken,
//     //   },
//     // });
//     console.log(result);
//     return result;
//   });

//   this.on("getNorthwind", async (req) => {
//     const result = await northwind.get("Products");
//     console.log(result);
//     return result;
//   });
// });
