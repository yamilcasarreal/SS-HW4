# Here is what was added

## Folders
    proc_tests - This is the directory where all the new tests are

## Make Commands
    make check-decl-outputs - Runs only the compiler and not the vm. Needed to be added as the declaration tests wouldn't require the vm to be run.

## Test Cases (Part 1)
    The following 10 test cases were designed to cover the declaration checking of PL/0 procedures, run these using make check-decl-outputs.
        hw4-procdecltest0.pl0 - hw4-procdecltest9.pl0

    The following 10 test cases check for code_generation, run these using make check-outputs as normal
        hw4-proctest0.pl0 - hw4-proctest9.pl0

## Code Modification (Part 2)
    The following functions for handling code generation for procedures and procedure calls were added or modified in gen_code.c:

    - Function/Procedure: gen_code_program
    - Description: Modified to include gen_code_proc_decls to take in the procedure declarations

    - Function/Procedure: gen_code_proc_decls
    - Description: Takes in and calls gen_code_proc_decl for each procedure declaration

    - Function/Procedure: gen_code_proc_decl
    - Description: Takes in and calls gen_code_block to initialize each procedure

    - Function/Procedure: gen_code_block
    - Description: Creates a new scope

    - Function/Procedure: gen_code_call_stmt
    - Description: Looks for a procedure in the program's memory and puts it at the top of the program stack

