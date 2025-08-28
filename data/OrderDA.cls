 
 /*------------------------------------------------------------------------
    File        : OrderDA
    Purpose     : 
    Syntax      : 
    Description : Data Access class for Order
    Author(s)   : cdcas
    Created     : Thu Aug 28 09:58:29 CDT 2025
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS data.OrderDA:
    
    {dataset/dsOrder.i}
    
    method public void getOrderInfo (input orderNum as integer, dataset dsOrder):
        
        dataset dsOrder:EMPTY-DATASET ().
        
        for order no-lock where
            Order.OrderNum = orderNum:
            
            create ttOrder.
            
            assign
                ttOrder.orderNum = Order.OrderNum
                ttOrder.custNum = Order.CustNum
                ttOrder.orderDate = Order.OrderDate
                ttOrder.promiseDate = Order.PromiseDate
                ttOrder.shipDate = Order.ShipDate.
        end.
    end method.
    
    method public logical can-findByOrder (input orderNum as integer):
        
        return
            can-find (order where Order.OrderNum = orderNum).
    end.
     

END CLASS.