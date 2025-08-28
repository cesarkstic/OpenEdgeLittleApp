
/*------------------------------------------------------------------------
    File        : ttOrder
    Purpose     : 

    Syntax      :

    Description : TT for Order Line table

    Author(s)   : cdcas
    Created     : Wed Aug 27 12:41:26 CDT 2025
    Notes       :
  ----------------------------------------------------------------------*/

define temp-table ttOrderLine no-undo {&reference-only}
    field orderNum as integer
    field lineNum as integer
    field itemNum as integer
    field price as decimal
    field qty as integer
    field discount as integer
    field extendedPrice as decimal
    index iOrder is primary unique orderNum lineNum.

