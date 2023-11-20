#include <stdlib.h>
#include "gen_code.h"

// Initialize the code generator
void gen_code_initialize()
{
    literal_table_initialize();
}

// Generate code for prog into bf
extern void gen_code_program(BOFFILE bf, block_t prog)
{
    code_seq main_cs;
    // We want to make the main program's AR look like all blocks... so:
    // allocate space and initialize any variables
    main_cs = gen_code_var_decls(prog.var_decls);
    int vars_len_in_bytes = (code_seq_size(main_cs) / 2) * BYTES_PER_WORD;
    // there is no static link for the program as a whole,
    // so nothing to do for saving FP into A0 as would be done for a block
    main_cs = code_seq_concat(main_cs, code_save_registers_for_AR());
    main_cs= code_seq_concat(main_cs,gen_code_stmt(prog.stmt));
    main_cs = code_seq_concat(main_cs,code_restore_registers_from_AR());
    main_cs = code_seq_concat(main_cs,code_deallocate_stack_space(vars_len_in_bytes));
    main_cs= code_seq_add_to_end(main_cs, code_exit());
    gen_code_output_program(bf, main_cs);
}

//TODO:

// Generate code for the given AST
extern code_seq gen_code_block(block_t blk); 
// Generate code for the const-decls, cds
extern code_seq gen_code_const_decls(const_decls_t cds); 
// Generate code for the const-decl, cd
extern code_seq gen_code_const_decl(const_decl_t cd); 
// Generate code for the const-defs, cdfs
extern code_seq gen_code_const_defs(const_defs_t cdfs); 
// Generate code for the const-def, cdf
extern code_seq gen_code_const_def(const_def_t cdf); 

// Generate code for a single <var-decl>, vd,
// (var_decl_t does not have a "type" attribute.)
code_seq gen_code_var_decl(var_decl_t vd)
{
   // return gen_code_idents(vd.idents, vd.type);  
}

// Generate code for the identififers in idents
// (Function uses variable type (vt) in a switch statment, unsure how to implement this with
// current ast. )
extern code_seq gen_code_idents(idents_t idents)
{
    code_seq ret = code_seq_empty();
    ident_t *idp = idents.idents;
    while (idp != NULL) {
	code_seq alloc_and_init
	    = code_seq_singleton(code_addi(SP, SP,
					   - BYTES_PER_WORD));
	// switch (vt) {
	// case float_te:
	//     alloc_and_init
	// 	= code_seq_add_to_end(alloc_and_init,
	// 			      code_fsw(SP, 0, 0));
	//     break;
	// case bool_te:
	//     alloc_and_init
	// 	= code_seq_add_to_end(alloc_and_init,
	// 			      code_sw(SP, 0, 0));
	//     break;
	// default:
	//     bail_with_error("Bad type_exp_e (%d) passed to gen_code_idents!",
	// 		    vt);
	//     break;
	// }
	// Generate these in revese order,
	// so addressing works propertly
	ret = code_seq_concat(alloc_and_init, ret);
	idp = idp->next;
    }
    return ret;
}

// End of TODO

// Generate code for the var_decls_t vds to out
extern code_seq gen_code_var_decls(var_decls_t vds)
{
    code_seq ret = code_seq_empty();
    var_decl_t *vdp = vds.var_decls;
    while (vdp != NULL) {
	// generate these in reverse order,
	// so the addressing offsets work properly
	ret = code_seq_concat(gen_code_var_decl(*vdp), ret);
	vdp = vdp->next;
    }
    return ret;
}

extern code_seq gen_code_stmt(stmt_t stmt);







