 
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

    {datasets/dsCustomer.i}
    
    define property oCustomer as data.CustomerDA no-undo get. set.
    
    constructor CustomerBO ():
        oCustomer = new data.CustomerDA ().
    end constructor.
    
    destructor CustomerBO ():
        delete object oCustomer.
    end destructor.
        
    method public void GetByCustNum (input custNum as integer, dataset dsCustomer): 
        
        if not oCustomer:TryGetByCustNum (custNum) then
            undo, throw new exceptions.NotFoundExc(substitute ("Customer with ID &1 not found", custNum)).    
            
        oCustomer:GetByCustNum (custNum, dataset dsCustomer by-reference). 
    end method.

END CLASS.