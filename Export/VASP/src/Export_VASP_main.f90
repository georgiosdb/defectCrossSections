program wfcExportVASPMain
  !! Export scf output from VASP to form usable for TME
  !!
  !! input:  namelist "&inputParams", with variables
  !!   prefix       prefix of input files saved by program pwscf
  !!   outdir       temporary directory where files resides
  !!   exportDir    output directory. 
  !! A directory "exportDir" is created and
  !! output files are put there. All the data
  !! are accessible through the ""exportDir"/input" file.
  !!
  !! <h2>Walkthrough</h2>

  use wfcExportVASPMod
  
  implicit none

#ifdef __MPI
  CALL mp_startup ( )
#endif
  CALL environment_start ( 'PW_EXPORT' )

  IF ( ionode ) THEN

    call initialize()
      !! * Set default values for input variables
    
    READ(5, inputParams, IOSTAT=ios)
      !! * Read input variables
    
    IF (ios /= 0) call exitError ('export main', 'reading inputParams namelist', abs(ios) )
      !! * Exit calculation if there's an error
    
    ios = f_mkdir_safe( trim(exportDir) )
      !! * Make the export directory
    
    mainOutputFile = trim(exportDir)//"/input"
      !! * Set the name of the main output file for export
    
  ENDIF

  !> * Broadcast variables to other processes
  CALL mp_bcast( outdir, ionode_id, world_comm )
  CALL mp_bcast( exportDir, ionode_id, world_comm )
  CALL mp_bcast( prefix, ionode_id, world_comm )
  !
  !   Now allocate space for pwscf variables, read and check them.
  !
  CALL read_file
  CALL openfil_pp
  !

#if defined __MPI
  kunittmp = kunit
#else
  kunittmp = 1
#endif

  CALL write_export (mainOutputFile, exportDir, kunittmp )

  CALL stop_pp
 
END PROGRAM wfcExportVASPMain
