namespace ZConfigurableProducts.db;

using {    
  managed,
  cuid,
  sap.common
} from '@sap/cds/common';

// Table for Location
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

// Customer group
entity ZCUSTOMERGROUP: managed{
    key CUSTGROUP : String(2) @title: 'Customer Group';
    CUSTDESC : String(20)    @title: 'Customer Description';
    RESERVE_FIELD1 :String(20);
    RESERVE_FIELD2 : String(20);
    RESERVE_FIELD3 :String(20);
    RESERVE_FIELD4 :String(20);
    RESERVE_FIELD5 :String(20);
};

// Product
entity ZPRODUCT: managed{
    key PRODUCTID : String(40)    @title : 'Product';  
        PRODDESC   : String(40)   @title : 'Product Description';              
        PRODFAMILY :   String(30) @title : 'Product Family';
        PRODGROUP  :  String(30)  @title : 'Product Group';
        PRODMODEL  :  String(30)  @title : 'Product Model';
        PRODMRANGE :  String(30)  @title : 'Product Range';
        PRODSERIES :  String(30)  @title : 'Product Series';
        MATERIALTYPE : String(4)  @title : 'Product Type';
        UOM : String(3)           @title : 'Unit of Measure';
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
/*annotate ZPRODUCT with @(UI : {
    SelectionFields : [PRODUCTID,PRODSERIES],
    LineItem        : [
        {
            Label : 'Product ID',
            Value : PRODUCTID
        },
        {
            Label : 'Description',
            Value : PRODDESC
        },
        {
            Label : 'Product Family',
            Value : PRODFAMILY
        },
       {
           Label : 'Product Series',
          Value : PRODSERIES
        }
    ],
    HeaderInfo      : {
        Title          : {Value : PRODUCTID},
        Description    : {Value : PRODDESC},
        TypeName       : 'Product',
        TypeNamePlural : 'Products',
    }
}); */
entity ZPRODUCTCOND {
    key PRODUCTID : String(40)    @title : 'Product';  
    key PLANT:        String(4) @title : 'Plant';
    key BOMCOMPONENT: String(40) @title : 'BOM Component';
    key OBJECT_DEPENDENCY: String(30) @title:'Object Dependency';
    key CONSEQ:            String(10) @title:'Condition Sequence';
    key CHAR_PROPERTY:     String(50) @title:'Characteristic';
    key CHAR_VALUE:        String(50) @title:'Characteristic Value'; 
}

// Product and LOcation table
entity ZLOCATION_PRODUCT{
    key LOCID : Association to ZLOCATION;
    key PRODUCTID  : Association to ZPRODUCT;
        LOTSIZE    : String(2);
        PROCUREMENT_TYPE   : String(1);
        PLANNING_STRATEGY  : String(2);
}
// Classes
entity ZCLASSES:managed{	
    key INTRNO_CLASS: String(18);
	CLASS_NAME: String(20);
	CLASS_TYPE: String(3);
	CLASS_DESC: String(50);
	AUTHGROUP: String(4);
}
	
//Characteristitcs	
entity ZCHARACTERISTICS: managed{
    key INTRNO_CLASS: String(18);
	key INTRNO_CHAR : String(10);
	CHAR_NAME: String(30);
	CHAR_DESC: String(30);
	CHAR_GROUP: String(10);
	CHAR_TYPE: String(4);
	ENTRY_REQ: String(1);
	CHAR_CATGRY: String(40);
    }
// Characteristic Values	
entity ZCHARACTER_VALUES: managed{
    key INTRNO_CHAR: String(10); //Association to ZCHARACTERISTICS;
	key INTRNO_CHARVAL: String(10);
	CHAR_VALUE    : String(70);
	CHARVAL_DESC  : String(30);
	CATCH_ALL     : String(1); 
}

entity ZCLASSCHARVAL{
    key INTRNO_CLASS: String(18);
	key INTRNO_CHAR : String(10);
	key INTRNO_CHARVAL: String(10);
	CLASS_NAME: String(20);
	CHAR_NAME: String(30);
	CHAR_VALUE    : String(70);
	CHARVAL_DESC  : String(30);
    AVGPERCENT : String(10,3);
    AVGUSAGEPROB :  String(10,3);
}
entity ZBOMCONFIG{
    key PRODUCTID :String(40);
    key INTCOUNTER: String(10);
    ITEMNO: String(5);
    COMPONENT: String(40);
    COMP_QTY : Decimal(13,3);
    RULE : String(150);
    VALID_FROM : Date;
    VALID_TO : Date;
    INTRCOM1 : String(50);
    INTRCOM2 : String(50);
}
//Object dependency
entity ZOBJECTDEPENDENCY{
    key INTRNO_OD: String(10);
    OD_NAME  : String(30);
    OD_TYPE  : String(4);
    OD_DESC  : String(30);
    AUTHGROUP : String(3);
    OD_CONDITIONBLOB : LargeBinary;
    OD_DEPENDTYPE: String(1);
}

//Product planning
entity ZPROD_PLANNING{
    key LOCID: Association to ZLOCATION;
    key PRODUCTID :Association to ZPRODUCT;
    key INTRNO_OD : Association to ZOBJECTDEPENDENCY;
     
}
// Restriction Group
//entity ZRESTRICT_GROUP {

//}

//Product Restrictions Assigment
entity ZPROD_RESTRICT_ASSIGN{
    key LOCID: Association to ZLOCATION;
    key PRODUCTID :Association to ZPRODUCT;
// rESTRICTION NUMBER
}
//Product BOM
entity ZPROD_BOM{
    key LOCID: String(4) @title: 'Location ';//Association to ZLOCATION;//
    key PRODUCTID : String(40);//Association to ZPRODUCT;
    key INTCOUNTER: String(10);
    ITEMNO: String(5);
    COMPONENT: String(40);
    COMP_QTY : Decimal(13,3);
    VALID_FROM : Date;
    VALID_TO : Date;

}
// Product BOM - Object Dependency
entity ZPRODBOM_OD{    
    key LOCID: Association to ZLOCATION;
    key PRODUCTID   : Association to ZPRODUCT;
    key INTRNO_OD   : Association to ZOBJECTDEPENDENCY;
}
// New Product
entity ZPRODUCT_NEW: managed{
    key LOCID         : String(4);
    key PRODUCTID_NEW : String(40);
    key REF_PROD      : String(40);
    HISTR_VALID_FROM  : Date;
    HISTR_VALID_TO    : Date;
}
//Product Configuration
entity ZPROD_CONFIGNEW: managed{
    key PRODUCTID_NEW : String(40); 
    key REF_PROD      : String(40); 
    key CHAR_VALUENEW : String(70);
    REF_CHAR_VALUE    : String(70);
}
//Product Variant Tables
/*entity ZPROD_VAR{	
    key PRODUCTID :Association to ZPRODUCT;
	INTR_VARNO  : 
    VALID_FROM : Date;
    VALID_TO : Date;
    }*/
//User Roles
entity ZUSERROLES:managed{
    key USERROLE: String(20);
    ROLE_DESC : String(40);
}
//Authorization
entity ZUSER_FUNCTIONS: managed{
    key AUTHGROUP: String(20);
    AUTH_DESC : String(40);
}