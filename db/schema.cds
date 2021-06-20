namespace ZConfigurableProducts.db;

using {    
  managed,
  cuid,
  sap.common
} from '@sap/cds/common';
/*
type Url : String;

type TechnicalBooleanFlag : Boolean @(
    UI.Hidden,
    Core.Computed
);

type TechnicalFieldControlFlag : Integer @(
    UI.Hidden,
    Core.Computed
);

type Criticality : Integer @(
    UI.Hidden,
    Core.Computed
);

type Identifier : String(100)@(title : 'Identifier');
@cds.autoexpose
abstract entity identified : cuid {
    identifier : Identifier not null;
}

//Bolded display of first table column values can be achieved by defining annotations Common.SemanticKey and
//Common.TextArrangment for the entities key and referring to a 'human-readable' identifier to be displayed instead.

annotate identified with @(
    Common.SemanticKey : [identifier],
    UI.Identification  : [{Value : identifier}]
) {

    ID         @Common : {
        Text            : identifier,
        TextArrangement : #TextOnly
        
    };
}*/

entity ZLOCATION {
    key LOCID : String(4) @title: 'Location ';
    LOCDESC : String(30)  @title: 'Location Descritpion';
    LOCTYPE : String(1);
    LATITUDE: Decimal(10,8);
    LONGITUTE: Decimal(10,8);
    RESERVE_FIELD1 :String(20);
    RESERVE_FIELD2 : String(20);
    RESERVE_FIELD3 :String(20);
    RESERVE_FIELD4 :String(20);
    RESERVE_FIELD5 :String(20);
    CHANGED_DATE :Date;
    CHANGED_TIME : Time;
    CREATED_BY: String(12);
    CREATED_DATE :Date;
    CREATED_TIME : Time;
};
entity ZCUSTOMERGROUP{
    key CUSTGROUP : String(2) @title: 'Customer Group';
    CUSTDESC : String(20)    @title: 'Customer Description';
    RESERVE_FIELD1 :String(20);
    RESERVE_FIELD2 : String(20);
    RESERVE_FIELD3 :String(20);
    RESERVE_FIELD4 :String(20);
    RESERVE_FIELD5 :String(20);
    CHANGED_DATE :Date;
    CHANGED_TIME : Time;
    CREATED_BY: String(12);
    CREATED_DATE :Date;
    CREATED_TIME : Time;
};
entity ZPRODUCT {
    key PRODUCTID : String(40) @title : 'Material';  
        PRODDESC   : String(40) @title: 'Material Description';              
        PRODFAMILY :   String(30);
        PRODGROUP  :  String(30);
        PRODMODEL  :  String(30);
        PRODMRANGE :  String(30);
        PRODSERIES :  String(30);
        MATERIALTYPE : String(4); 
        UOM : String(3);
        AUTHGROUP : String(4);
        PLMSTATUS : String(10);
        CONFIGURABLE: String(1);
        PRODHIERARCHY1 :String(18);
        PRODHIERARCHY2 :String(18);
        PRODHIERARCHY3 :String(18);
        PRODHIERARCHY4 :String(18);
        PRODHIERARCHY5 :String(18);
        PRODHIERARCHY6 :String(18);
        CONFIGMATERIAL : String(40);
};
    

