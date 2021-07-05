sap.ui.define([
    "com/prod/configproduct/controller/BaseController",
    "sap/ui/model/json/JSONModel",
    "sap/m/MessageToast",
    "sap/m/MessageBox",
    "sap/ui/model/Filter",
    "sap/ui/model/FilterOperator",
    "sap/ui/Device"
],
	/**
	 * @param {typeof sap.ui.core.mvc.Controller} Controller
	 */
    function (BaseController, JSONModel, MessageToast, MessageBox, Filter, FilterOperator, Device) {
        "use strict";
        var that, oGModel, prod;

        return BaseController.extend("com.prod.configproduct.controller.proddetail", {
            onInit: function () {
                that = this;
                this.oDetailModel = new JSONModel();
                that.oModel = this.getModel("prod");
                this.bus = sap.ui.getCore().getEventBus();
                oGModel = that.getOwnerComponent().getModel("oGModel");
            },
            /** 
		 /** 
		 * Go back to master page
		 */
            onDetailNavBack: function () {
                this.bus.publish("nav", "backToBegin");
            },

            /**
             * Called when the View has been rendered (so its HTML is part of the document). Post-rendering manipulations of the HTML could be done here.
             * This hook is the same one that SAPUI5 controls get after being rendered.
             * @memberOf com.enerpipe.shopfloor.sf_ep_shop_status.view.ItemMaster
             */
            onAfterRendering: function () {
                oGModel = this.getModel("oGModel");
                prod = this.getModel("prod");
                /*var smarttab = this.byId("smartTable");
                smarttab.setEntitySet("/ET_PRODUCTS");
                smarttab.setTableBindingPath("/ET_PRODUCTS");
                //smarttab.setInitiallyVisibleFields("PRODUCTID");// can have one or many col
                smarttab.setModel(this.oModel);*/
                this.i18n = this.getResourceBundle();
                //this
               // this.byId("idObjHeader").setModel(oGModel);
                //this.DetailHome = DetailHome;
              
                var Controller = this.getView().getControllerName();
                if (Controller === "com.prod.configproduct.controller.ItemDetail") {
                    if (!Device.system.desktop) {
                        this.DetailHome.byId("leftMenu").setVisible(true);
                        this.DetailHome.getModel("appView").setProperty("/expanded", false);
                        this.byId("releSearch").setWidth("180px");
                    } else {
                        this.byId("releSearch").setWidth("500px");
                    }
                }
            }
        });
    });
