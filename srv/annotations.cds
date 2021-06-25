namespace ZConfigurableProducts.db;

annotate ZCUSTOMERGROUP with @(UI : {
    SelectionFields : [CUSTGROUP],
    LineItem        : [
        {
            Label : 'Customer Group',
            Value : CUSTGROUP
        },
        {
            Label : 'Description',
            Value : CUSTDESC
        }
    ],
    HeaderInfo      : {
        Title          : {Value : CUSTGROUP},
        Description    : {Value : CUSTDESC},
        TypeName       : 'Customer Group',
        TypeNamePlural : 'Customer Groups',
    }
});
