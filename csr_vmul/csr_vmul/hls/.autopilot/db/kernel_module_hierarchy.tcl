set ModuleHierarchy {[{
"Name" : "csr_vmul","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_csr_vmul_Pipeline_load_vector_fu_1572","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "load_vector","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_csr_vmul_Pipeline_load_col_indices_fu_1581","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "load_col_indices","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "grp_csr_vmul_Pipeline_load_row_pointers_fu_1590","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "load_row_pointers","ID" : "6","Type" : "pipeline"},]},
	{"Name" : "grp_csr_vmul_Pipeline_load_matrix_values_fu_1599","ID" : "7","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "load_matrix_values","ID" : "8","Type" : "pipeline"},]},],
"SubLoops" : [
	{"Name" : "every_row","ID" : "9","Type" : "no",
	"SubLoops" : [
	{"Name" : "unroll_partial","ID" : "10","Type" : "no"},]},]
}]}