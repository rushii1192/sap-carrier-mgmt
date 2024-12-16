CLASS zrb_cl_demo_data_append DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS: lc_carr_name(30) TYPE c VALUE 'CARRIER'.
ENDCLASS.



CLASS zrb_cl_demo_data_append IMPLEMENTATION.
    METHOD if_oo_adt_classrun~main.
        DATA: lt_db_jp TYPE TABLE OF zjp_carrier_uuid.

        TRY.
            lt_db_jp = VALUE #( FOR lv_carrid = 1 THEN lv_carrid + 1 UNTIL lv_carrid > 10
                                ( carrier_id = lv_carrid name = |{ me->lc_carr_name }| & | { lv_carrid } | cuuid = cl_system_uuid=>create_uuid_x16_static(  ) )
                              ).

            INSERT zjp_carrier_uuid FROM TABLE @lt_db_jp.

            if sy-subrc = 0.
                out->write( 'Data insertion successfull' ).
            ENDIF.

          CATCH cx_uuid_error.
            "handle exception
            out->write( 'Error in generating uuid' ).
        ENDTRY.

    ENDMETHOD.
ENDCLASS.
