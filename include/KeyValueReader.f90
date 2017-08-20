module KeyValueReader
implicit none

integer, parameter :: &
    KVR_Success                 = 0, &
    KVR_CannotReadSecondFile    = 1, &
    KVR_FileNotRead             = 2, &
    KVR_OpenFileError           = 3, &
    KVR_ParseFileError          = 4, &
    KVR_KeyNotFound             = 5, &
    KVR_ConversionError         = 6, &
    KVR_AllocationError         = 7

contains

subroutine KVR_readFile(kvr, filename, kvrStatus)
    implicit none
    
    integer*8 :: kvr
    character(len=*) :: filename
    integer :: kvrStatus

    call KVRi_readFile(kvr, filename, len(filename), kvrStatus)
end subroutine KVR_readFile

subroutine KVR_getString(kvr, key, val, kvrStatus)
    implicit none
    
    integer*8 :: kvr
    character(len=*) :: key
    character(len=*) :: val
    integer :: kvrStatus

    call KVRi_getString(kvr, key, len(key), val, len(val), kvrStatus)
end subroutine KVR_getString

subroutine KVR_getInt(kvr, key, val, kvrStatus)
    implicit none
    
    integer*8 :: kvr
    character(len=*) :: key
    integer :: val
    integer :: kvrStatus

    call KVRi_getInt(kvr, key, len(key), val, kvrStatus)
end subroutine KVR_getInt

subroutine KVR_getDouble(kvr, key, val, kvrStatus)
    implicit none
    
    integer*8 :: kvr
    character(len=*) :: key
    double precision :: val
    integer :: kvrStatus

    call KVRi_getDouble(kvr, key, len(key), val, kvrStatus)
end subroutine KVR_getDouble

subroutine KVR_getFloat(kvr, key, val, kvrStatus)
    implicit none
    
    integer*8 :: kvr
    character(len=*) :: key
    real :: val
    integer :: kvrStatus

    call KVRi_getFloat(kvr, key, len(key), val, kvrStatus)
end subroutine KVR_getFloat

subroutine KVR_getBool(kvr, key, val, kvrStatus)
    implicit none
    
    integer*8 :: kvr
    character(len=*) :: key
    logical :: val
    integer :: kvrStatus
    integer :: val_c

    call KVRi_getBool(kvr, key, len(key), val_c, kvrStatus)
    if (val_c == 0) then
        val = .false.
    else
        val = .true.
    end if
end subroutine KVR_getBool

end module KeyValueReader
