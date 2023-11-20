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
// current ast. ) Wondering if we use something like the "(id_use_get_attrs(stmt.idu)->type)"
// which was used in the gen_code_assign_stmt function below.
// In addition, "float_te" was deketed when it came up during lab, so I'm unsure as to whether the
// entire switch statement should be removed. 
extern code_seq gen_code_idents(idents_t idents)
{
    code_seq ret = code_seq_empty();
    ident_t *idp = idents.idents;
    while (idp != NULL) {
	code_seq alloc_and_init = code_seq_singleton(code_addi(SP, SP,- BYTES_PER_WORD));
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

// Generate code for stmt
// Uncertain on whether it's correct; uses the "float_te" , which we deleted in the lab.
extern code_seq gen_code_assign_stmt(assign_stmt_t stmt)
{
    code_seq ret;
    // put value of expression in $v0
    ret = gen_code_expr(*(stmt.expr));
    assert(stmt.idu != NULL);
    assert(id_use_get_attrs(stmt.idu) != NULL);
    type_exp_e typ = id_use_get_attrs(stmt.idu)->type;
    ret = code_seq_concat(ret, code_pop_stack_into_reg(V0, typ));
    // put frame pointer from the lexical address of the name
    // (using stmt.idu) into $t9
    ret = code_seq_concat(ret,code_compute_fp(T9, stmt.idu->levelsOutward));
    unsigned int offset_count = id_use_get_attrs(stmt.idu)->offset_count;
    assert(offset_count <= USHRT_MAX); 
    switch (id_use_get_attrs(stmt.idu)->type) {
    
	 	case float_te:
			ret = code_seq_add_to_end(ret,code_fsw(T9, V0, offset_count));
			break;
    	case bool_te:
			ret = code_seq_add_to_end(ret,code_sw(T9, V0, offset_count));
			break;
    	default:
			bail_with_error("Bad var_type (%d) for ident in assignment stmt!",
			id_use_get_attrs(stmt.idu)->type);
		break;
    	}
    return ret;
}

// Generate code for stmt
// Not sure if this one needs to be implemented; it wasn't part of the gen_code_stmt switch case. 
extern code_seq gen_code_call_stmt(call_stmt_t stmt);


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
// Generate code for stmt
extern code_seq gen_code_stmt(stmt_t stmt)
{
switch (stmt.stmt_kind) {
    case assign_stmt:
	return gen_code_assign_stmt(stmt.data.assign_stmt);
	break;
    case begin_stmt:
	return gen_code_begin_stmt(stmt.data.begin_stmt);
	break;
    case if_stmt:
	return gen_code_if_stmt(stmt.data.if_stmt);
	break;
    case read_stmt:
	return gen_code_read_stmt(stmt.data.read_stmt);
	break;
    case write_stmt:
	return gen_code_write_stmt(stmt.data.write_stmt);
	break;
    default:
		bail_with_error("Call to gen_code_stmt with an AST that is not a statement!");
		break;
    }
    // The following can never execute, but this quiets gcc's warning
    return code_seq_empty();
}

// Generate code for stmt
extern code_seq gen_code_begin_stmt(begin_stmt_t stmt);