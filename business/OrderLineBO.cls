 
 /*------------------------------------------------------------------------
    File        : OrderLineBO
    Purpose     : 
    Syntax      : 
    Description : Business entity for OrderLineLine
    Author(s)   : cdcas
    Created     : Thu Aug 28 11:27:04 CDT 2025
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS business.OrderLineBO: 

    {dataset/dsOrderLine.i &reference-only = {&reference-only}}
    
    define property oOrderLine as data.OrderLineDA no-undo get. set.
    
    constructor OrderLineBO ():
        oOrderLine = new data.OrderLineDA ().
    end constructor.
    
    destructor OrderLineBO ():
        delete object oOrderLine.
    end destructor.
        
    method public void getOrderLineInfo (input orderNum as integer, dataset dsOrderLine): 
        
        if not oOrderLine:can-findByOrder(OrderNum) then
            undo, throw new exceptions.NotFoundExc(substitute ("Order Line with ID &1 not found", OrderNum)).    
            
        oOrderLine:getOrderLinesInfo (OrderNum, dataset dsOrderLine by-reference). 
    end method.
    
    method public decimal getOrderTotal (input orderNum as integer, dataset dsOrderLine):
        
        for each ttOrderLine
            where ttOrderLine.orderNum = orderNum
            break by ttOrderLine.orderNum:
                
            accumulate ttOrderLine.extendedPrice (total).
        end.
        
        return  
            accum total ttOrderLine.extendedPrice. 
    end method.
    
END CLASS.