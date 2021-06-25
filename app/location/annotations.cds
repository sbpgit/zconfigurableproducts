using configproductservice as service from '../../srv/configproductservice';
//using configproductservice as service from './configproductservice';
annotate service.ET_LOCATIONS with @(UI : {
    SelectionFields : [LOCID,LOCTYPE],
    LineItem        : [
        {
            $Type : 'UI.DataField',
            //Label : 'Location ID',
            Value : LOCID
        },
        {
            $Type : 'UI.DataField',
            //Label : 'Description',
            Value : LOCDESC
        },
        {
            $Type : 'UI.DataField',
            //Label : 'Location Type',
            Value : LOCTYPE
        }
    ],
    HeaderInfo      : {
        Title          : {Value : LOCID},
        Description    : {Value : LOCDESC},
        TypeName       : 'Location',
        TypeNamePlural : 'Location',
    }
});