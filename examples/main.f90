program KVR_Example
use KeyValueReader
implicit none

integer :: kvrStatus
integer*8 :: kvr
character(len=100) :: method
integer :: nx
double precision :: dt
logical :: doExtraStuff

! Create the Key/Value reader and read in file
call KVR_create(kvr, kvrStatus)
call checkOutput(kvrStatus)
call KVR_readFile(kvr, "input.kv", kvrStatus)
call checkOutput(kvrStatus)

! Get parameters of different types
call KVR_getString(kvr, "method", method, kvrStatus)
call checkOutput(kvrStatus)
call KVR_getInt(kvr, "nx", nx, kvrStatus)
call checkOutput(kvrStatus)
call KVR_getDouble(kvr, "dt", dt, kvrStatus)
call checkOutput(kvrStatus)
call KVR_getBool(kvr, "doExtraStuff", doExtraStuff, kvrStatus)
call checkOutput(kvrStatus)

! Print the value that I got
print *, " "
print *, "Values for the Key/Value reader"
print *, "Method:", trim(method)
print *, "nx:", nx
print *, "dt:", dt
print *, "extra:", doExtraStuff

! Print the Key/Value pairs from the file
call KVR_print(kvr, kvrStatus)
call checkOutput(kvrStatus)

! Cleanup
call KVR_delete(kvr, kvrStatus)
call checkOutput(kvrStatus)

end program


!
!    checkOutput subroutine
!
subroutine checkOutput(kvrStatus)
use KeyValueReader
implicit none

integer :: kvrStatus

if (kvrStatus /= KVR_Success) then
    print *, "Error:", kvrStatus
end if

end subroutine checkOutput
