 
 /*------------------------------------------------------------------------
    File        : OrderBO
    Purpose     : 
    Syntax      : 
    Description : Business logic for Order
    Author(s)   : cdcas
    Created     : Thu Aug 28 10:21:56 CDT 2025
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS business.OrderBO: 

    {dataset/dsOrder.i &reference-only = {&reference-only}}
    
    define property oOrder as data.OrderDA no-undo get. set.
    
    constructor OrderBO ():
        oOrder = new data.OrderDA ().
    end constructor.
    
    destructor OrderBO ():
        delete object oOrder.
    end destructor.
        
    method public void getOrderInfo (input orderNum as integer, dataset dsOrder): 
        
        if not oOrder:can-findByOrder(orderNum) then
            undo, throw new exceptions.NotFoundExc(substitute ("Order with ID &1 not found", orderNum)).    
            
        oOrder:getOrderInfo(orderNum, dataset dsOrder by-reference). 
    end method.
END CLASS.