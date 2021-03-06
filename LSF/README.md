# LSF
## Directory Structure and Files
```
LSF
|	README.md
|_______DOC
|	|	input.in
|	|	phonons_SiVH3newDisp.dat
|_______src
	|_______linearTerms
	|	|	LSF_linear_Main.f90
	|	|	LSF_linear_Module_v1.f90
	|	|	Makefile
	|_______zerothOrder
		|	LSF_zeroth_Main.f90
		|	LSF_zeroth_Module_v35.f90
		|	Makefile
```

## How to Run
## Zeroth Order
* Ensure that the executables are up to date by going to the main folder and running `make LSF0`
* Make sure that you have already [`Export_QE-5.3.0.x`](../QE-dependent/QE-5.3.0/Export/README.md)
* Run the program and send the contents of the `input.in` file in as input (e.g., `./bin/LSF0.x < ExampleRun/LSF/input/input.in`)

## First Order
* Ensure that the executables are up to date by going to the main folder and running `make LSF1`
* Make sure that you have already run [`Export_QE-5.3.0.x`](../QE-dependent/QE-5.3.0/Export/README.md) and [`Mj`](../Mj/README.md)
* Run the program and send the contents of the `input.in` file in as input (e.g., `./bin/LSF1.x < ExampleRun/LSF/input/input.in`)

## Inputs
* `input.in`
	* `phononsInput` (string) -- directs the program to the phonons input file
	* `phononsInputFormat` (string) -- what format the phonons input file has (VASP or QE)
	* `continueLSFfromFile` (string) -- directs the program to continue from a given output file if it exists
	* `maximumNumberOfPhonons` (integer) -- the maximum number of phonons to use
	* `temperature` (real) -- the temperature of the system
	* `maxEnergy` (real) -- ??
	* `nMC`(integer) -- number of Monte Carlo steps for more than 4 phonones
	
_Note: Do not alter the `&lsfInput` or `/` lines at the beginning and end of the file. They represent a namelist and fortran will not recognize the group of variables without this specific format_

* [`phononsInput`](https://github.com/laurarnichols/carrierCrossSections/blob/master/LSF/DOC/phononsInput.md) file (e.g. phonons_SiVH3newDisp.dat)
	* `nOfqPoints` (integer) -- the number of q points
	* `nAtoms` (integer) -- the number of atoms in the system
	* `atomD` (real `3xnAtoms` array) -- atom displacements for defective versus pristine crystal
	* `atomM` (real vector of length `nAtoms`) -- atom masses
	* `phonQ` (real `3xnOfqPoints` array) -- ??
	* `freqInTHz` (real) -- the frequency of the mode in THz; this value gets automatically converted to Hartree and put in the `phonF` array
	* `phonD` (real `3xnAtomsxnModesxnOfqPoints` array) -- phonon displacements

## Outputs
Line shape function versus energy for each number of phonons you input
