 
 /*------------------------------------------------------------------------
    File        : CustomerDA
    Purpose     : 
    Syntax      : 
    Description : Customer table Data Accesss
    Author(s)   : cdcas
    Created     : Wed Aug 27 17:26:48 CDT 2025
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS data.CustomerDA: 
    
   {dataset/dsCustomer.i}
       
    method public void getCustomerInfo (input custNum as integer, dataset dsCustomer):
        
        dataset dsCustomer:EMPTY-DATASET ().
        
        for customer no-lock where
            Customer.CustNum = custNum:
                
            create ttCustomer.
            
            assign
                ttCustomer.custNum = Customer.CustNum
                ttCustomer.address = Customer.Address
                ttCustomer.city = Customer.City
                ttCustomer.name = Customer.Name
                ttCustomer.state = Customer.State.
        end.
    end method.
    
    
    method public logical can-findByCustomer (input custNum as integer):
        
        return
            can-find (customer where Customer.CustNum = custNum).
    end.
    
END CLASS.