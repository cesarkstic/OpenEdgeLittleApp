
/*------------------------------------------------------------------------
    File        : ttCustomer.i
    Purpose     : 

    Syntax      :

    Description : Customer table TT

    Author(s)   : cdcas
    Created     : Wed Aug 27 12:29:16 CDT 2025
    Notes       :
  ----------------------------------------------------------------------*/

define temp-table ttCustomer no-undo {&reference-only}
    field custNum as integer
    field name as character
    field address as character
    field city as character
    field state as character
    index iCustNum is primary unique custNum.
