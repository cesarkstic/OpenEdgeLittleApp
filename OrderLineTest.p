
/*------------------------------------------------------------------------
    File        : OrderLineLineTest.p
    Purpose     : 

    Syntax      :

    Description : OrderLineLine Test

    Author(s)   : cdcas
    Created     : Thu Aug 28 11:37:27 CDT 2025
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

CONNECT -db VALUE("db/sports2020.db") -1 NO-ERROR.

{dataset/dsOrderLine.i &reference-only = {&reference-only}}

define variable oOrderLine as business.OrderLineBO no-undo.

oOrderLine = new business.OrderLineBO ().

oOrderLine:getOrderLineInfo (10000, dataset dsOrderLine by-reference).

for each ttOrderLine:
    disp ttOrderLine.
end.

display oOrderLine:getOrderTotal (10000, dataset dsOrderLine by-reference) label 'Order Total'.

oOrderLine:getOrderLineInfo (1, dataset dsOrderLine by-reference).

CATCH e AS Exceptions.NotFoundExc :
   message e:GetMessage(1).     
END CATCH.

finally:
    delete object oOrderLine.
end finally.
