using configproductservice as service from '../../srv/configproductservice';
annotate service.ET_PRODUCTS with @(UI : {
    SelectionFields : [PRODUCTID,PRODSERIES],
    LineItem        : [
        {
            $Type : 'UI.DataField',//Label : 'Product ID',
            Value : PRODUCTID
        },
        {
            $Type : 'UI.DataField',//Label : 'Description',
            Value : PRODDESC
        },
        {
            $Type : 'UI.DataField',//Label : 'Product Family',
            Value : PRODFAMILY
        },
       {
           $Type : 'UI.DataField',//Label : 'Product Series',
          Value : PRODSERIES
        }
    ],
    HeaderInfo      : {
        Title          : {Value : PRODUCTID},
        Description    : {Value : PRODDESC},
        TypeName       : 'Product',
        TypeNamePlural : 'Products',
    }
}); 
