 
 /*------------------------------------------------------------------------
    File        : TotalByOrder
    Purpose     : 
    Syntax      : 
    Description : Gets total by customer and order
    Author(s)   : cdcas
    Created     : Thu Aug 28 11:48:56 CDT 2025
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS entities.TotalByOrder: 
    
    {dataset/dsCustomer.i &reference-only = {&reference-only}}
    {dataset/dsOrder.i &reference-only = {&reference-only}}
    {dataset/dsOrderLine.i &reference-only = {&reference-only}}
    
    define public property custNum as integer no-undo get. set.
    define public property custName as character no-undo get. set.
    
    define public property orderNum as integer no-undo get. set.
    define public property orderDate as date no-undo get. set.
    define public property orderTotal as decimal no-undo get. set.
    
    define private property oCustomer as business.CustomerBO no-undo get. set.
    define private property oOrder as business.OrderBO no-undo get. set.
    define private property oOrderLine as business.OrderLineBO no-undo get. set.
    
    constructor TotalByOrder (cuNum as integer, orNum as integer):        
        assign
            custNum = cuNum
            orderNum = orNum
            oCustomer = new business.CustomerBO ()
            oOrder= new business.OrderBO ()
            oOrderLine = new business.OrderLineBO ().           
    end constructor.
    
    destructor TotalByOrder ():
        delete object oCustomer.
        delete object oOrder.
        delete object oOrderLine.
    end destructor.
  
    method public void getTotalByOrder ():
        
        oCustomer:getCustomerInfo (custNum, dataset dsCustomer by-reference).
        oOrder:getOrderInfo (orderNum, dataset dsOrder by-reference).
        oOrderLine:getOrderLineInfo (orderNum, dataset dsOrderLine by-reference).        
        
        for first ttCustomer:    
            custName = ttCustomer.name.
        end.
        
        for first ttOrder:
            orderDate = ttOrder.orderDate.
        end.
        
        orderTotal = oOrderLine:getOrderTotal (orderNum, dataset dsOrderLine by-reference). 
    end method.
            

END CLASS.