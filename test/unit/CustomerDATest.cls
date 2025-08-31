 
 /*------------------------------------------------------------------------
    File        : CustomerDATest
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : cdcas
    Created     : Sat Aug 30 12:40:18 CDT 2025
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING OpenEdge.Core.Assert.
USING data.CustomerDA.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS test.unit.CustomerDATest INHERITS data.CustomerDA:
    
    {datasets/dsCustomer.i}

    @Test.
    method public void testGetByCustNum():
        GetByCustNum (3225, dataset dsCustomer by-reference).
        find first ttCustomer no-error.
        assert:Equals (ttCustomer.custNum, 3225).
    end method.
    
    @Test.
    method public void testTryGetByCustNum():        
        assert:IsTrue(TryGetByCustNum (3225)).
        assert:IsFalse(TryGetByCustNum (1)).
    end method.
    
     
END CLASS.