#include <stdlib.h>
#include "gen_code.h"

void gen_code_initialize()
{
    literal_table_initialize();
}

extern void gen_code_program(BOFFILE bf, block_t prog)
//void gen_code_program(BOFFILE bf, program_t prog)
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
    main_cs = code_seq_concat(main_cs,
			      code_deallocate_stack_space(vars_len_in_bytes));
    main_cs
	= code_seq_add_to_end(main_cs, code_exit());
    gen_code_output_program(bf, main_cs);
}