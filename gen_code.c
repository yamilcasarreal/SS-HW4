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
    id_attrs typ = id_use_get_attrs(stmt.idu)->type;
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
extern code_seq gen_code_call_stmt(call_stmt_t stmt);
// Generate code for the if-statment given by stmt
extern code_seq gen_code_while_stmt(while_stmt_t stmt);
// Generate code for the skip statment, stmt
extern code_seq gen_code_skip_stmt(skip_stmt_t stmt);
// Generate code for the skip statment, stmt
extern code_seq gen_code_skip_stmt(skip_stmt_t stmt);

// Generate code for stmt
// the "begin_stmt_t" struct. doesn't have a "var_decls" attribute.
extern code_seq gen_code_begin_stmt(begin_stmt_t stmt)
{
    code_seq ret;
    // allocate space and initialize any variables in block
    ret = gen_code_var_decls(stmt.var_decls);
    int vars_len_in_bytes = (code_seq_size(ret) / 2) * BYTES_PER_WORD;
    // in FLOAT, surrounding scope's base is FP, so that is the static link
    ret = code_seq_add_to_end(ret, code_add(0, FP, A0));
    ret = code_seq_concat(ret, code_save_registers_for_AR());
    ret = code_seq_concat(ret, gen_code_stmts(stmt.stmts));
    ret = code_seq_concat(ret, code_restore_registers_from_AR());
    ret = code_seq_concat(ret, code_deallocate_stack_space(vars_len_in_bytes));
    return ret;
}

// Generate code for cond, putting its truth value
extern code_seq gen_code_condition(condition_t cond);
// Generate code for cond, putting its truth value
extern code_seq gen_code_odd_condition(odd_condition_t cond);
// Generate code for cond, putting its truth value
extern code_seq gen_code_rel_op_condition(rel_op_condition_t cond);

// Generate code for the rel_op
// Float calc. version uses a "typ" argument of type "type_exp_e", in addition to the one in our version.  
// Previously we used "id_attrs typ = id_use_get_attrs(stmt.idu)->type;" to get the this variable,however I'm unsure what to do here.
extern code_seq gen_code_rel_op(token_t rel_op)
{
    // load top of the stack (the second operand) into AT
    code_seq ret = code_pop_stack_into_reg(AT, typ);
    // load next element of the stack into V0
    ret = code_seq_concat(ret, code_pop_stack_into_reg(V0, typ));

    // start out by doing the comparison
    // and skipping the next 2 instructions if it's true
    code_seq do_op = code_seq_empty();
    switch (rel_op.code) {
    case eqsym:
	if (typ == float_te) {
	    do_op = code_seq_singleton(code_bfeq(V0, AT, 2));
	} else {
	    do_op = code_seq_singleton(code_beq(V0, AT, 2));
	}
	break;
    case neqsym:
	if (typ == float_te) {
	    do_op = code_seq_singleton(code_bfne(V0, AT, 2));
	} else {
	    do_op = code_seq_singleton(code_bne(V0, AT, 2));
	}
	break;
    case ltsym:
	if (typ == float_te) {
	    do_op = code_seq_singleton(code_fsub(V0, AT, V0));
	    do_op = code_seq_add_to_end(do_op, code_bfltz(V0, 2));
	} else {
	    do_op = code_seq_singleton(code_sub(V0, AT, V0));
	    do_op = code_seq_add_to_end(do_op, code_bltz(V0, 2));
	}
	break;
    case leqsym:
	if (typ == float_te) {
	    do_op = code_seq_singleton(code_fsub(V0, AT, V0));
	    do_op = code_seq_add_to_end(do_op, code_bflez(V0, 2));
	} else {
	    do_op = code_seq_singleton(code_sub(V0, AT, V0));
	    do_op = code_seq_add_to_end(do_op, code_blez(V0, 2));
	}
	break;
    case gtsym:
	if (typ == float_te) {
	    do_op = code_seq_singleton(code_fsub(V0, AT, V0));
	    do_op = code_seq_add_to_end(do_op, code_bfgtz(V0, 2));
	} else {
	    do_op = code_seq_singleton(code_sub(V0, AT, V0));
	    do_op = code_seq_add_to_end(do_op, code_bgtz(V0, 2));
	}
	break;
    case geqsym:
	if (typ == float_te) {
	    do_op = code_seq_singleton(code_fsub(V0, AT, V0));
	    do_op = code_seq_add_to_end(do_op, code_bfgez(V0, 2));
	} else {
	    do_op = code_seq_singleton(code_sub(V0, AT, V0));
	    do_op = code_seq_add_to_end(do_op, code_bgez(V0, 2));
	}
	break;
    default:
	bail_with_error("Unknown token code (%d) in gen_code_rel_op",
			rel_op.code);
	break;
    }
    ret = code_seq_concat(ret, do_op);
    // rest of the code for the comparisons
    ret = code_seq_add_to_end(ret, code_add(0, 0, AT)); // put false in AT
    ret = code_seq_add_to_end(ret, code_beq(0, 0, 1)); // skip next instr
    ret = code_seq_add_to_end(ret, code_addi(0, AT, 1)); // put true in AT
    ret = code_seq_concat(ret, code_push_reg_on_stack(AT, bool_te));
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
// Generate code for stmt
extern code_seq gen_code_stmt(stmt_t stmt)
{
    switch (stmt.stmt_kind) {
        case assign_stmt:
            return gen_code_assign_stmt(stmt.data.assign_stmt);
            break;
        case call_stmt:
            return gen_code_call_stmt(stmt.data.call_stmt);
            break;
        case begin_stmt:
            return gen_code_begin_stmt(stmt.data.begin_stmt);
            break;
        case if_stmt:
            return gen_code_if_stmt(stmt.data.if_stmt);
            break;
        case while_stmt:
            return gen_code_if_stmt(stmt.data.while_stmt);
            break;
        case read_stmt:
            return gen_code_read_stmt(stmt.data.read_stmt);
            break;
        case write_stmt:
            return gen_code_write_stmt(stmt.data.write_stmt);
            break;
        case skip_stmt:
            return gen_code_write_stmt(stmt.data.skip_stmt);
            break;
        default:
            bail_with_error("Call to gen_code_stmt with an AST that is not a statement!");
            break;
        }
    // The following can never execute, but this quiets gcc's warning
    return code_seq_empty();
}

// Generate code for the list of statments given by stmts
extern code_seq gen_code_stmts(stmts_t stmts)
{
    code_seq ret = code_seq_empty();
    stmt_t *sp = stmts.stmts;
    while (sp != NULL) {
	ret = code_seq_concat(ret, gen_code_stmt(*sp));
	sp = sp->next;
    }
    return ret;
}

// Generate code for the if-statment given by stmt
extern code_seq gen_code_if_stmt(if_stmt_t stmt)
{
    // put truth value of stmt.expr in $v0
    code_seq ret = gen_code_expr(stmt.expr);
    ret = code_seq_concat(ret, code_pop_stack_into_reg(V0));
    code_seq cbody = gen_code_stmt(*(stmt.body));
    int cbody_len = code_seq_size(cbody);
    // skip over body if $v0 contains false
    ret = code_seq_add_to_end(ret,code_beq(V0, 0, cbody_len));
    return code_seq_concat(ret, cbody);
}


// Generate code for the read statment given by stmt
extern code_seq gen_code_read_stmt(read_stmt_t stmt)
{
    // put number read into $v0
    code_seq ret = code_seq_singleton(code_rch());
    // put frame pointer from the lexical address of the name
    // (using stmt.idu) into $t9
    assert(stmt.idu != NULL);
    ret = code_seq_concat(ret,code_compute_fp(T9, stmt.idu->levelsOutward));
    assert(id_use_get_attrs(stmt.idu) != NULL);
    unsigned int offset_count = id_use_get_attrs(stmt.idu)->offset_count;
    assert(offset_count <= USHRT_MAX);
    ret = code_seq_add_to_end(ret,code_seq_singleton(code_fsw(T9, V0, offset_count)));
    return ret;
}
code_seq gen_code_write_stmt(write_stmt_t stmt)
{
    // put the result into $a0 to get ready for PCH
    code_seq ret = gen_code_expr(stmt.expr);
    ret = code_seq_concat(ret, code_pop_stack_into_reg(A0));
    ret = code_seq_add_to_end(ret, code_pint());// change to code_pint()
    return ret;
}

// Generate code for the expression exp
extern code_seq gen_code_expr(expr_t exp);

