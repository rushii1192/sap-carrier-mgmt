@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection Entity for Carrier'
@ObjectModel.semanticKey: [ 'CarrierId' ]

@UI: {
    headerInfo: {
        typeName: 'Carrier',
        typeNamePlural: 'Carrier',
        title: {
            type: #STANDARD, value: 'Name'
        },
        description: {
            value: 'CarrierID'
        }
    }
}

define root view entity Z_C_CARRIER_UUID

  provider contract transactional_query
  as projection on Z_I_CARRIER_UUID

{

      @UI.facet:
        [ {
              label: 'Carrier Details',
              id: 'CarrierInfo',
              type: #COLLECTION,
              position: 10
           },
           {
              label: 'Carrier',
              id: 'Carrier',
              type: #IDENTIFICATION_REFERENCE,
              purpose: #STANDARD,
              parentId: 'CarrierInfo',
              position: 10
           } ]


      @UI.lineItem: [{ position: 05 }]
      @UI.identification: [{ position: 05 }]
  key cUUID,

      @UI.lineItem: [{ position: 10 }]
      @UI.identification: [{ position: 10 }]
      CarrierId,
      @UI.lineItem: [{ position: 20 }]
      @UI.identification: [{ position: 20 }]
      Name,
      @UI.lineItem: [{ position: 30 }]
      @UI.identification: [{ position: 30 }]
      CurrencyCode,
      @UI.lineItem: [{ position: 40 }]
      @UI.identification: [{ position: 40 }]
      LastChangedAt
}
