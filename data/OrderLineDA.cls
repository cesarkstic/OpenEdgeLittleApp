 
 /*------------------------------------------------------------------------
    File        : OrderLineDA
    Purpose     : 
    Syntax      : 
    Description : Order Line Data Access
    Author(s)   : cdcas
    Created     : Thu Aug 28 10:41:37 CDT 2025
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS data.OrderLineDA: 

    {dataset/dsOrderLine.i}
    
    method public void getOrderLinesInfo (input orderNum as integer, dataset dsOrderLine):
        
        dataset dsOrderLine:EMPTY-DATASET ().
        
        for each orderLine no-lock where
            OrderLine.OrderNum = orderNum:
            
            create ttOrderLine.
            
            assign
                ttOrderLine.orderNum = OrderLine.OrderNum
                ttOrderLine.lineNum = OrderLine.LineNum
                ttOrderLine.itemNum = OrderLine.ItemNum
                ttOrderLine.price = OrderLine.Price
                ttOrderLine.qty = OrderLine.Qty
                ttOrderLine.discount = OrderLine.Discount
                ttOrderLine.extendedPrice = OrderLine.ExtendedPrice.
        end.
    end method.
    
    method public logical can-findByOrder (input orderNum as integer):
        
        return
            can-find (first orderLine where OrderLine.OrderNum = orderNum).
    end.
     
END CLASS.