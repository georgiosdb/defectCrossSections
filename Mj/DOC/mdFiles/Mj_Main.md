# Mj_Main.f90

* Pull in MjModule
* Start a timer
* [`call readInputs()`](readInputs.md)
* [`call computeGeneralizedDisplacements()`](computeGeneralizedDisplacements.md)
* [`call computeVariables()`](computeVariables.md)
* [`call displaceAtoms()`](displaceAtoms.md)
* `if ( readQEInput?? ) then`
	* [`  call exportQEInput()`](exportQEInput.md)
* `else`
	* [`  call writeNewAtomicPositions()`](writeNewAtomicPositions.md)
* `endif`
