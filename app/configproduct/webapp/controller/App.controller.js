sap.ui.define([
	"sap/ui/core/mvc/Controller"
], function (Controller) {
	"use strict";

	return Controller.extend("com.prod.configproduct.controller.App", {
		onInit: function () {
			// apply content density mode to root view
			//this.getView().addStyleClass(!sap.ui.Device.support.touch ? "sapUiSizeCompact" : "sapUiSizeCozy");
			// If launchpad, the keep session alive forever by pinging the server every 2 minutes
			/*if (sap.hana) {
				setInterval(function () {
					sap.hana.uis.flp.SessionTimeoutHandler.pingServer();
				}, 120000);
			}*/
		}

	});

});