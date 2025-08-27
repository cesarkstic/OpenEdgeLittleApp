
/*------------------------------------------------------------------------
    File        : ttOrder
    Purpose     : 

    Syntax      :

    Description : TT for Order table

    Author(s)   : cdcas
    Created     : Wed Aug 27 12:41:26 CDT 2025
    Notes       :
  ----------------------------------------------------------------------*/

define temp-table ttOrder no-undo reference-only before-table ttOrderBT
    field orderNumber as integer
    field custNum as integer
    field orderDate as date
    field shipDate as date
    field promiseDate as date
    index iOrder is primary unique orderNumber custNum.

