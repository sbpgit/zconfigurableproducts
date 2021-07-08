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
        var that, oGModel,prod;

        return BaseController.extend("com.prod.configproduct.controller.prodmaster", {
            onInit: function () {
                that = this;
                this.oListModel = new JSONModel();
                this.bus = sap.ui.getCore().getEventBus();
                this.bus.subscribe("data", "refreshMaster", this.refreshMaster, this);
                this.bus.publish("nav", "toBeginPage", { viewName: this.getView().getProperty("viewName") });
            },
            // Refreshing Master Data
            refreshMaster: function () {
                this.onAfterRendering();
            },
            /** 
                     * Called when something is entered into the search field
                     * @param {object} oEvent -the event information
                     */
            onSearch: function (oEvent) {
            },
            /** 
             * Called when a spool item is pressed
             * @param {object} oEvent - the event info
             */
            handlePress: function (oEvent) {
                // Condition to get the Project details
                if (oEvent) {
                    var prod = oEvent.getSource().getSelectedItem().getTitle();
                    var proddesc = oEvent.getSource().getSelectedItem().getDescription();
                    oGModel.setProperty("/PRODUCTID", prod);
                    oGModel.setProperty("/PRODDESC", proddesc);

                } else {
                    var num = oGModel.getProperty("/PRODUCTID");
                    oGModel.setProperty("/PRODUCTID", num);
                    var desc = oGModel.getProperty("/PRODDESC");
                    oGModel.setProperty("/PRODDESC", desc);
                }
                // Calling Item Detail page	
                that.getOwnerComponent().runAsOwner(function () {
                    if (!that.oDetailView) {
                        try {
                            that.oDetailView = sap.ui.view({
                                viewName: "com.prod.configproduct.view.proddetail",
                                type: "XML"
                            });
                            that.bus.publish("flexible", "addDetailPage", that.oDetailView);
                            that.bus.publish("nav", "toDetailPage", {
                                viewName: that.oDetailView.getViewName()
                            });
                            that.oDetailView.onAfterRendering();

                        } catch (e) {
                            that.oDetailView.onAfterRendering();
                        }
                    } else {
                        that.bus.publish("nav", "toDetailPage", {
                            viewName: that.oDetailView.getViewName()
                        });

                        that.oDetailView.onAfterRendering();

                    }
                });
            },
            /** 
             * Function to refresh the data based on some activity
             * from the detail level
             */
            refreshMaster: function () {
                this.onAfterRendering();
            },

            /**
             * Called when the View has been rendered (so its HTML is part of the document). Post-rendering manipulations of the HTML could be done here.
             * This hook is the same one that SAPUI5 controls get after being rendered.
             * @memberOf com.enerpipe.shopfloor.sf_ep_shop_status.view.ItemMaster
             */
            onAfterRendering: function () {
                that = this;
                oGModel = this.getModel("oGModel");
                this.i18n = this.getResourceBundle();
                this.oList = this.byId("idList");
                this.oList.setModel(that.oListModel);
                this.oList.removeSelections();
                //this.byId("searchBar").setValue();
                if (this.oList.getBinding("items")) {
                    this.oList.getBinding("items").filter([]);
                }

                that.getData();

                // Update the count everytime the list updates
                // Update the count everytime the list updates
                this.oList.attachEvent("updateFinished", function () {
                    that.byId("masterTitle").setText(that.i18n.getText("masterTitle", [that.oList.getBinding("items").getLength()]));

                }.bind(that));
            },
            getData: function () {
                that = this;
                // this.oList.setModel(that.oListModel);
                prod = this.getModel("prod");
                this.getModel("prod").read("/ET_PRODUCTS", {
                    success: function (oData) {
                        that.oListModel.setData({
                            results: oData.results
                        });
                        //that.oList.setModel(that.oListModel);
                        // Calling the item page when Application loaded				
                        oGModel.setProperty("/PRODUCTID", oData.results[0].PRODUCTID);
                        oGModel.setProperty("/PRODDESC", oData.results[0].PRODDESC);
                        oGModel.setProperty("/PRODFAMILY", oData.results[0].PRODFAMILY);
                        oGModel.setProperty("/LOCID", oData.results[0].LOCID);
                        // Setting firstProduct as selected 
                        that.getView().byId("idList").setSelectedItem(that.getView().byId("idList").getItems()[0], true);
                        that.handlePress();
                    },
                    error: function (oRes) {
                        MessageToast.show(that.i18n.getText("getListErr"));
                    }
                });
                this.oList.setModel(prod);
                this.oList.bindItems({
                    path: "/ET_PRODUCTS",
                    template: new sap.m.StandardListItem({
                        title: "{PRODUCTID}",
                        description: "{PRODDESC}"
                    })
                });
            },
            onUpdateFinished:function(oEvent){
                that.byId("masterTitle").setText(that.i18n.getText("masterTitle", [that.oList.getBinding("items").getLength()]));
            }
        });
    });
