// Opening the Block A DataSet
use "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\blkA201718.dta"

// Finding duplicates using the a1 primary key
duplicates report a1



// Opening the Block B DataSet 
use "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\blkB201718.dta"

// Finding duplicates using the ab01 primary key
duplicates report ab01

// Renaming ab01 to a1
rename ab01 a1




// Opening the Block C DataSet
use "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\blkC201718.dta"

// Finding duplicates using the ac01 primary key
duplicates report ac01

// Reshaping entries in the Block C DataSet to wide to eliminate duplicates
reshape wide c_13 c_14 c_15 c_16 c_17 c_18 c_19 c_110 c_111 c_112 c_113, i( ac01) j( c_11)

// Confirming that there are no duplicates in the new Block C DataSet
duplicates report ac01

// Renaming ac01 to a1 
rename ac01 a1

// Merging Blocks A and C DataSets 
merge 1:1 a1 using "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\blkA201718"

// Saving the new file as AandC.dta
save "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\AandC.dta"



// Merging Blocks A, B and C DataSets and making the new merge variable "merge2"
merge 1:1 a1 using "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\AandC.dta", gen(merge2)




// Repeating the same operations for Block D DataSet

/* Opening the BlockD dataset
   Checking for duplicates
   Reshaping to eliminate duplicates 
   Confirming that all duplicates have been eliminated
   Changing "ad01" to "a1"
   Merging A,B,C and D blocks
   Saving the new merged file */
   
   
use "C:\Users\Alli Ajagbe\Eco Internship\Internship_material_2022\ASI201718Study\blkD201718.dta"
duplicates report ad01
reshape wide d13 d14 , i( ad01 ) j( d11 )
duplicates report ad01
rename ad01 a1
merge 1:1 a1 using "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\ABC.dta", gen(merge3)

// Saving the new merged file as ABCD

save "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\ABCD.dta"



// Same operations for Block E DataSet

use "C:\Users\Alli Ajagbe\Eco Internship\Internship_material_2022\ASI201718Study\blkE201718.dta"
duplicates report AE01
reshape wide E13 E14 E15 E16 E17 E18, i( AE01) j( E11)
duplicates report AE01
rename AE01 a1
describe a1

// Creating a new variable "a01" that serves as the reference key for merging for uniform storage type for all blocks

destring a1, generate(a01)

// Doing the same in the "using" dataset 

use "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\ABCD.dta"
destring a1, generate(a01)

// Merging blocks A,B,C,D and E datasets using the newly created variable "a01"

merge 1:1 a01 using "C:\Users\Alli Ajagbe\Eco Internship\Internship_material_2022\ASI201718Study\blkE201718.dta"

// Saving 

save "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\ABCDE.dta"

/* Repeating same steps for blocks
   F and G 
*/

use "C:\Users\Alli Ajagbe\Eco Internship\Internship_material_2022\ASI201718Study\blkF201718.dta"
duplicates report AF01
destring AF01, generate(a01)
save "C:\Users\Alli Ajagbe\Eco Internship\Internship_material_2022\ASI201718Study\blkF201718.dta", replace
merge 1:1 a01 using "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\ABCDE.dta", gen(merge5)
save "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\ABCDEF.dta"

// Block G

use "C:\Users\Alli Ajagbe\Eco Internship\Internship_material_2022\ASI201718Study\blkG201718.dta"
duplicates report AG01
destring AG01, generate(a01)
save "C:\Users\Alli Ajagbe\Eco Internship\Internship_material_2022\ASI201718Study\blkG201718.dta", replace
merge 1:1 a01 using "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\ABCDEF.dta", gen(merge6)
save "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\ABCDEFG.dta"

// Block H

use "C:\Users\Alli Ajagbe\Eco Internship\Internship_material_2022\ASI201718Study\blkH201718.dta"
duplicates report AH01
reshape wide H13 H14 H15 H16 H17, i( AH01 ) j( H11 )
duplicates report AH01
rename AH01 a1
destring a1, generate(a01)
save "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\blkH201718.dta", replace
merge 1:1 a01 using "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\ABCDEFG.dta", gen(merge7)
save "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\ABCDEFGH.dta"


// Block I 

use "C:\Users\Alli Ajagbe\Eco Internship\Internship_material_2022\ASI201718Study\blkI201718.dta"
duplicates report AI01
reshape wide I13 I14 I15 I16 I17, i( AI01 ) j( I11 )
duplicates report AI01
rename AI01 a01
merge 1:1 a01 using "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\ABCDEFGH.dta", gen(merge8)
save "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\ABCDEFGHI.dta"


// Block J

use "C:\Users\Alli Ajagbe\Eco Internship\Internship_material_2022\ASI201718Study\blkJ201718.dta"
duplicates report J01
reshape wide J13 J14 J15 J16 J17 J18 J19 J110 J111 J112 J113, i( J01 ) j( J11 )
duplicates report J01
rename J01 a1
destring a1, generate(a01)
save "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\blkJ201718.dta", replace
merge 1:1 a01 using "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\ABCDEFGHI.dta", gen(merge9)
save "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\ASI201718Study\ABCDEFGHIJ.dta"


/* 
  Reordering the variables in the dataset alphabetically
  With the primary key at the starting position
  Checking for duplicates
  Saving 
*/

use "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\DataSets\ASI201718Study\ABCDEFGHIJ.dta"
order _all, first alphabetic

// changing the variables starting with lowercase to uppercase because not all variables are in the same case format 

rename ( a01 a1 a10 a11 a12 a2 a3 a4 a5 a7 a8 a9 b02 b03 b04 b05 b06f b06t b07 b08 b09 blk bonus c_1101 c_11010 c_1102 c_1103 c_1104 c_1105 c_1106 c_1107 c_1108 c_1109 c_1111 c_11110 c_1112 c_1113 c_1114 c_1115 c_1116 c_1117 c_1118 c_1119 c_1121 c_11210 c_1122 c_1123 c_1124 c_1125 c_1126 c_1127 c_1128 c_1129 c_1131 c_11310 c_1132 c_1133 c_1134 c_1135 c_1136 c_1137 c_1138 c_1139 c_131 c_1310 c_132 c_133 c_134 c_135 c_136 c_137 c_138 c_139 c_141 c_1410 c_142 c_143 c_144 c_145 c_146 c_147 c_148 c_149 c_151 c_1510 c_152 c_153 c_154 c_155 c_156 c_157 c_158 c_159 c_161 c_1610 c_162 c_163 c_164 c_165 c_166 c_167 c_168 c_169 c_171 c_1710 c_172 c_173 c_174 c_175 c_176 c_177 c_178 c_179 c_181 c_1810 c_182 c_183 c_184 c_185 c_186 c_187 c_188 c_189 c_191 c_1910 c_192 c_193 c_194 c_195 c_196 c_197 c_198 c_199 costop d131 d1310 d1311 d1312 d1313 d1314 d1315 d1316 d1317 d132 d133 d134 d135 d136 d137 d138 d139 d141 d1410 d1411 d1412 d1413 d1414 d1415 d1416 d1417 d142 d143 d144 d145 d146 d147 d148 d149 expshare mult mwdays nwdays pf wdays welfare yr ) (A01 A1 A10 A11 A12 A2 A3 A4 A5 A7 A8 A9 B02 B03 B04 B05 B06f B06t B07 B08 B09 Blk Bonus C_1101 C_11010 C_1102 C_1103 C_1104 C_1105 C_1106 C_1107 C_1108 C_1109 C_1111 C_11110 C_1112 C_1113 C_1114 C_1115 C_1116 C_1117 C_1118 C_1119 C_1121 C_11210 C_1122 C_1123 C_1124 C_1125 C_1126 C_1127 C_1128 C_1129 C_1131 C_11310 C_1132 C_1133 C_1134 C_1135 C_1136 C_1137 C_1138 C_1139 C_131 C_1310 C_132 C_133 C_134 C_135 C_136 C_137 C_138 C_139 C_141 C_1410 C_142 C_143 C_144 C_145 C_146 C_147 C_148 C_149 C_151 C_1510 C_152 C_153 C_154 C_155 C_156 C_157 C_158 C_159 C_161 C_1610 C_162 C_163 C_164 C_165 C_166 C_167 C_168 C_169 C_171 C_1710 C_172 C_173 C_174 C_175 C_176 C_177 C_178 C_179 C_181 C_1810 C_182 C_183 C_184 C_185 C_186 C_187 C_188 C_189 C_191 C_1910 C_192 C_193 C_194 C_195 C_196 C_197 C_198 C_199 Costop D131 D1310 D1311 D1312 D1313 D1314 D1315 D1316 D1317 D132 D133 D134 D135 D136 D137 D138 D139 D141 D1410 D1411 D1412 D1413 D1414 D1415 D1416 D1417 D142 D143 D144 D145 D146 D147 D148 D149 Expshare Mult Mwdays Nwdays Pf Wdays Welfare Yr )

order _all, first alphabetic
duplicates report A01
save "C:\Users\Alli Ajagbe\OneDrive - Plaksha University\Desktop\Eco Internship\Internship_material_2022\DataSets\ASI201718Study\ABCDEFGHIJ.dta", replace


/* 
  Variable Chosen for Capital: Fixed Capital (C_178)
  Variable Chosen for Output: Gross Output (J1712)
  Variable Chosen for Labour: Employees (E159 because the column was changed from long to wide)
*/

// generating the log of chosen variables
generate logLabour = log( E159 )
generate logCapital = log( C_178 )
generate logOutput = log( J1712 )

/* 
  Applying regression to determine the coefficients and taking:
  logOutput as the dependent variable
  logCapital and logLabour as the independent variables
*/

regress logOutput logCapital logLabour 

// Accounting for the control variables in our regression analysis 

// renaming F7 to Research and Development
rename F7 R_and_D

// generating the logarithms of the control values selected 
generate logRD = log(R_and_D)

// regressing now with control variables
regress logOutput logCapital logLabour logRD 

// End of File











