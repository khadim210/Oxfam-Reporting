

var chart1;
$(document).ready(function ($) {

    var items = [{
        "Date": "2012-01-21T23:45:10.280Z",
            "Value": 7,
            "UpperLimit": 8,
            "LowerLimit": 6
    }, {
        "Date": "2012-01-26T23:45:10.280Z",
            "Value": 8,
            "UpperLimit": 9,
            "LowerLimit": 7
    }, {
        "Date": "2012-02-10T23:45:10.280Z",
            "Value": 9,
            "UpperLimit": 10,
            "LowerLimit": 7
    }, {
        "Date": "2012-02-19T23:45:10.280Z",
            "Value": 10,
            "UpperLimit": 11,
            "LowerLimit": 8
    }, {
        "Date": "2012-03-21T23:45:10.280Z",
            "Value": 12,
            "UpperLimit": 13,
            "LowerLimit": 9
    }, {
        "Date": "2012-03-29T23:45:10.280Z",
            "Value": 13,
            "UpperLimit": 14,
            "LowerLimit": 10
    }, {
        "Date": "2012-04-10T23:45:10.280Z",
            "Value": 14,
            "UpperLimit": 15,
            "LowerLimit": 10
    }, {
        "Date": "2012-04-19T23:45:10.280Z",
            "Value": 14,
            "UpperLimit": 16,
            "LowerLimit": 11
    }, {
        "Date": "2012-05-10T23:45:10.280Z",
            "Value": 15,
            "UpperLimit": 17,
            "LowerLimit": 12
    }, {
        "Date": "2012-05-19T23:45:10.280Z",
            "Value": 16,
            "UpperLimit": 18,
            "LowerLimit": 13
    }];



    $("div", ".ChartDiv3").chart({
        gallery: cfx.Gallery.Area,
        data: {
            series: 2
        },
        series: [{
            color: "#801702D1",
            border: {
                width: 4
            }
        }, {
            gallery: cfx.Gallery.Lines
        }],
        allSeries: {
            pointLabels: {
                visible: false
            },
            MarkerShape: cfx.MarkerShape.None
        },
        LegendBox: {
            visible: true,
            dock: cfx.DockArea.Bottom
        },
        //----Assign data fields--------
        dataSourceSettings: {
            fields: [{
                name: "LowerLimit",
                usage: cfx.FieldUsage.FromValue
            }, {
                name: "UpperLimit",
                usage: cfx.FieldUsage.Value
            }, {
                name: "Value",
                usage: cfx.FieldUsage.Value
            }, {
                name: "Date",
                usage: cfx.FieldUsage.XValue
            }]
        },
        //----Set Sample Data------------
        dataValues: items,
                titles: [{
                                        text: "Evolution Perte / Gains Changes"
                                }]        
    });
});

