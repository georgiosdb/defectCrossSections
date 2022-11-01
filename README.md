# Defect Cross Sections
## Installation
### Dependencies
#### HPC System
The code is compiled using GNU-based compilers mpif90 and gfortran. If your system uses wrappers for those compilers, you will need to designate that in the main Makefile.
You will also need to have a GNU environment and an OpenMPI module loaded.

#### Local machine 
Code dependencies and git (commands given for Unix environment):
```
sudo apt-get update 
sudo apt install gfortran
sudo apt install libmpich-dev
sudo apt install libopenmpi-dev
sudo apt-get install git
```

Documentation dependencies:
```
sudo apt-get install python-pip python-dev build-essential
sudo pip install ford
sudo apt-get install graphviz
```

### Set up Quantum Espresso
On your local system, you can use, `sudo wget https://github.com/QEF/q-e/archive/qe-5.3.tar.gz` to download QE 5.3. For other versions, you will need to change the link
acccordingly. On an HPC system, you will need to download the source directly and use some form of `scp` or a file-transfer client to get the source to the HPC system.

Once you have the code downloaded (example commands given for QE 5.3 only):
* Change to whatever directory you saved the QE tar file in on the CLI
* Decompress the tar file using `tar -xvzf q-e-qe-5.3.tar.gz`
* Confirm modules: `PrgEnv-gnu`, some version of OpenMPI, some version of fftw
* Change into the QE directory and run `./configure`
* Confirm that the last line of output is `configure: success`
* Edit the `make.sys` file:
  * `DFLAGS = -D__FFTW -D__MPI`
  * Make sure `MPIF90`, `F90`, and `CPP` match your system's wrappers for `mpif90`, `gfortran`, and `cc`
  * Add `-dynamic` (and `-fopenmp` if you want OpenMP enabled) to `FFLAGS` and `LDFLAGS`
  * Verify paths for `BLAS_LIBS` and `LAPACK_LIBS`
* Run `make pw pp ph` to build the PW, PP, and PHonon packages. You need `pw` and `pp` for the Export program dependencies, and LSF calculations require input from the 
  `ph` package.

### Download and Compile Source
* Make sure that you have the repo forked and your fork cloned (see [Quick Git Guide](quickGitGuide.md))
* Change into the `defectCrossSections` directory
* Open the `Makefile` and edit the path(s) to Quantum Espresso and the compilers to match your system 

_Note: Make sure that your path does not have a `/` at the end or there will be an error_
* You should now be able to make the target you want (e.g., to compile everything, use `make`)
* For a list of some possible targets, read through the `Makefile` or type `make help`

## Contributing
* First, make sure that you have the repo forked and cloned (see [Forking and Cloning the Repo and Compiling](#forking-and-cloning-the-repo-and-compiling))
* You will make changes on your local copy, push them to your origin, and submit a pull request to the main repo
* For more detailed instructions and tips for using git, see [Quick Git Guide](quickGitGuide.md)

## Documentation

For more information, see the documentation generated by [FORD](https://github.com/Fortran-FOSS-Programmers/ford) that is housed in the `DOC/documentation` folder. Open `index.html` in any browser to begin on the home page.
