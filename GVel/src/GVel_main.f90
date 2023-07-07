program GVel

  use GVelMod

  implicit none

  integer :: ikLocal, ikGlobal
    !! Local and global k-point indices

  real(kind=dp) :: t0, t1, t2
    !! Timers


  call cpu_time(t0)

  call mpiInitialization()

  call getCommandLineArguments()
    !! * Get the number of pools from the command line

  call setUpPools()
    !! * Split up processors between pools and generate MPI
    !!   communicators for pools


  ! Get input parameters

  do ikLocal = 1, nkPerPool
  !   For each component:
  !     For each band:
  !       * Check for degeneracies until none found
  !         For each degeneracy:
  !           * Pick out the same number of bands on left and right as are degenerate
  !           * Start with assumption that lowest on left goes with highest on right, etc.
  !           * Do linear regression on points 
  !           * Lock in those with good enough fits
  !       * For bands not in a degeneracy, start with assumption that bands go straight across
  !       * Lock in those with good enough fits
  !     * Output degenerate bands info
  !     * Output bands not locked in after first round as potential crossings
  !     While there are bands not locked in or we've done < 5 loops
  !       For each band:
  !         * Check if locked in
  !         * If not locked in, check the fit of this point and the point above (not locked in) with the left or right points swapped 
  !         * Choose the one that makes both fits better
  !         * If the fits now meet the tolerance, lock them in
  enddo

end program GVel
