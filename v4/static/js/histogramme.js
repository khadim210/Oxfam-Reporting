var chart1;
         $(document).ready(function ($) {
             var items = [
			
            { "Open": 24.2, "Date": "2013-03-01T23:45:10.280Z" },
            { "Open": 21.3, "Date": "2013-03-02T23:45:10.280Z" },
            { "Open": 22.4, "Date": "2013-03-03T23:45:10.280Z" },
            { "Open": 24.3, "Date": "2013-03-04T23:45:10.280Z" },
            { "Open": 22.6, "Date": "2013-03-05T23:45:10.280Z" }
        ];
             $("div", ".ChartDiv1").chart({
                 gallery: cfx.Gallery.Bar,
                 dataValues: items,
                 dataSourceSettings: {
                     fields: [{ name: "Open", usage: cfx.FieldUsage.Value }, 
			      { name: "Date", usage: cfx.FieldUsage.XValue}]
                 },
                 titles: [{ text: "Histogramme-Depenses"}],
                 axisY:{
                    min:0,
                    max:30
                }
             });
         });