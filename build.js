var markdownpdf = require("markdown-pdf");

markdownpdf({ renderDelay: 3000 }).from("JP.md").to("JP.pdf", function () {
  console.log("Done")
})
