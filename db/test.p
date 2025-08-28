
/*------------------------------------------------------------------------
    File        : test.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : cdcas
    Created     : Wed Aug 27 18:24:55 CDT 2025
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

{dataset/dsCustomer.i &reference-only = {&reference-only}}

define variable oCustomer as business.CustomerBO no-undo.

oCustomer = new business.CustomerBO ().

oCustomer:getCustomerInfo (1, dataset dsCustomer by-reference).

for each ttCustomer:
    disp ttCustomer with 1 column.
end.

CATCH e AS Progress.Lang.AppError:        
   message e:GetMessage(1) view-as alert-box.     
END CATCH.





