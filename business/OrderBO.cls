 
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

    {datasets/dsOrder.i &reference-only = {&reference-only}}
    
    define property oOrder as data.OrderDA no-undo get. set.
    
    constructor OrderBO ():
        oOrder = new data.OrderDA ().
    end constructor.
    
    destructor OrderBO ():
        delete object oOrder.
    end destructor.
        
    method public void GetByOrderNum (input orderNum as integer, dataset dsOrder): 
        
        if not oOrder:TryGetByOrderNum (orderNum) then
            undo, throw new exceptions.NotFoundExc(substitute ("Order with ID &1 not found", orderNum)).    
            
        oOrder:GetByOrderNum (orderNum, dataset dsOrder by-reference). 
    end method.
END CLASS.