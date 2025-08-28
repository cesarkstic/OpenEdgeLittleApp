 
 /*------------------------------------------------------------------------
    File        : CustomerBO
    Purpose     : 
    Syntax      : 
    Description : Business Object for Customer table
    Author(s)   : cdcas
    Created     : Wed Aug 27 18:01:49 CDT 2025
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS business.CustomerBO: 

    {dataset/dsCustomer.i &reference-only = {&reference-only}}
    
    define property oCustomer as data.CustomerDa no-undo get. set.
    
    constructor CustomerBO ():
        oCustomer = new data.CustomerDA ().
    end constructor.
    
    destructor CustomerBO ():
        delete object oCustomer.
    end destructor.
        
    method public void getCustomerInfo (input custNum as integer, dataset dsCustomer): 
        
        if not oCustomer:can-findByCustomer(custNum) then
            undo, throw new exceptions.NotFoundExc(substitute ("Customer with ID &1 not found", custNum)).    
            
        oCustomer:getCustomerInfo(custNum, dataset dsCustomer by-reference). 
    end method.

END CLASS.