/*global QUnit*/

sap.ui.define([
	"comprod./configproduct/controller/Initialview.controller"
], function (Controller) {
	"use strict";

	QUnit.module("Initialview Controller");

	QUnit.test("I should test the Initialview controller", function (assert) {
		var oAppController = new Controller();
		oAppController.onInit();
		assert.ok(oAppController);
	});

});
