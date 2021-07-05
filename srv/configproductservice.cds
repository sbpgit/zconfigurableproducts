using ZConfigurableProducts.db from '../db/schema'  ;

service configproductservice {
@odata.draft.enabled
 entity ET_LOCATIONS
    as projection on db.ZLOCATION;

 @odata.draft.enabled
 entity ET_CUSTOMERGROUP
    as projection on db.ZCUSTOMERGROUP;

@odata.draft.enabled
 entity ET_PRODUCTS
    as projection on db.ZPRODUCT;
@readonly
entity ET_PRODCOND
   as projection on db.ZPRODUCTCOND;
entity ET_LOCPROD
    as projection on db.ZLOCATION_PRODUCT;
entity ET_CLASS
    as projection on db.ZCLASSES;
entity ET_CHARACTERISTICS
    as projection on db.ZCHARACTERISTICS;
entity ET_CHARACTER_VAL
    as projection on db.ZCHARACTER_VALUES;

entity ET_CLASSCHARVAL
    as projection on db.ZCLASSCHARVAL;

entity ET_BOMCONFIG
    as projection on db.ZBOMCONFIG;
entity ET_OBJECTDEPEND
    as projection on db.ZOBJECTDEPENDENCY;
entity ET_PRODPLAN
    as projection on db.ZPROD_PLANNING;
entity ET_PRODRESTR
    as projection on db.ZPROD_RESTRICT_ASSIGN;
entity ET_PRODBOM
    as projection on db.ZPROD_BOM;
entity ET_ZPRODBOM_OD
    as projection on db.ZPRODBOM_OD;
entity ET_PRODNEW
    as projection on db.ZPRODUCT_NEW;
entity ET_PRODCONFIG_NEW
    as projection on db.ZPROD_CONFIGNEW;
entity ET_USERROLES
    as projection on db.ZUSERROLES;
entity ET_USERFUNC
    as projection on db.ZUSER_FUNCTIONS;
}