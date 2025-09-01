 
 /*------------------------------------------------------------------------
    File        : NotFoundExc
    Purpose     : 
    Syntax      : 
    Description : Record not found exception
    Author(s)   : cdcas
    Created     : Thu Aug 28 09:35:57 CDT 2025
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS exceptions.NotFoundExc INHERITS Progress.Lang.AppError:
    
    constructor NotFoundExc (input excMessage as character):
        super (excMessage, 1).
    end constructor.

END CLASS.