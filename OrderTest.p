
/*------------------------------------------------------------------------
    File        : OrderTest.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : cdcas
    Created     : Wed Aug 27 18:24:55 CDT 2025
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

CONNECT -db VALUE("db/sports2020.db") -1 NO-ERROR.

{dataset/dsOrder.i &reference-only = {&reference-only}}

define variable oOrder as business.OrderBO no-undo.

oOrder = new business.OrderBO ().

oOrder:getOrderInfo(10000, dataset dsOrder by-reference).

for each ttOrder:
    disp ttOrder with 1 column.
end.

oOrder:getOrderInfo (1, dataset dsOrder by-reference).

CATCH e AS Exceptions.NotFoundExc :
   message e:GetMessage(1).     
END CATCH.

finally:
    delete object oOrder.
end finally.


     





