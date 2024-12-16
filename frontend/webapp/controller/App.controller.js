sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/m/MessageBox"
], (Controller, MessageBox) => {
    "use strict";

    return Controller.extend("carriermgmt.controller.App", {
        onInit() {
            console.log('App controller')
        },

        onCreateButtonPress: async function (oEvent) {
            console.log('Create is pressed');
            if (!this._dialogRegister) {
                this._dialogRegister = await this.loadFragment({
                    name: "carriermgmt.view.fragment.Create"
                });
            }
            this._dialogRegister.open();

            // oModel.read("/Carrier", {       //CRUD       
            //     success: function (data) {
            //         console.log(data)
            //     },
            //     error: function (oError) {
            //         console.error(oError);
            //     }
            // })
        },
        onCloseDialogR() {
            if (this._dialogRegister) {
                this._dialogRegister.close();
            }
        },
        onCreateSubmit() {
            let oModel = this.getOwnerComponent().getModel();
            let oEntry = {
                "CarrierId": this.getView().byId("ICarrierID").getValue(),
                "Name": this.getView().byId("ICarrierName").getValue(),
                "CurrencyCode": this.getView().byId("ICountryCode").getValue()
            };


            oModel.create('/Carrier', oEntry, null, function () {
                MessageBox.show("Success")
            },
                function () {
                    MessageBox.show("Error!");
                }
            );
        }
    });
});