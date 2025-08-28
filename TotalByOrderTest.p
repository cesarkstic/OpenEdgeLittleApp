
/*------------------------------------------------------------------------
    File        : TotalByOrderTest.p
    Purpose     : 

    Syntax      :

    Description : Total by Order

    Author(s)   : cdcas
    Created     : Thu Aug 28 12:02:03 CDT 2025
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */

/* ***************************  Main Block  *************************** */

CONNECT -db VALUE("db/sports2020.db") -1 NO-ERROR.

define variable oTotalByOrder as entities.TotalByOrder no-undo.

oTotalByOrder = new entities.TotalByOrder (3225, 10000).
oTotalByOrder:getTotalByOrder().

disp
    oTotalByOrder:custNum label "Customer Number"
    oTotalByOrder:custName label "Customer Name" format 'x(40)'
    oTotalByOrder:orderNum label "Order Number"
    oTotalByOrder:orderDate label "Order Date"
    oTotalByOrder:orderTotal label "Total"
    with 1 column.
    
CATCH e AS Exceptions.NotFoundExc :
   message e:GetMessage(1).     
END CATCH.

finally:
    delete object oTotalByOrder.
end finally.
