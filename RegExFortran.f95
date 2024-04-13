program Hello
implicit none 

!interfaces 
interface
        logical function check_s(v)
            character(21), intent(in) :: v
        end function check_s
        logical function check_p(v)
            character(21), intent(in) :: v
        end function check_p
    end interface
    
!Declare Variables
character(21) :: s
character(21) :: p
character :: test
character(1) :: first 
integer :: length
integer :: i
integer :: j
logical :: a
logical :: result 
   
!Check if s is between 20 and 1
10 continue
        WRITE(*,'(A)') TRIM(ADJUSTL("Type in a string between 1 to 20 characters (s)"))
         read(*,*) s
         a = check_s(s)
      if (((len(trim(s)).gt.20).or.(len(trim(s)).lt.1)).or.(a.eqv..false.)) goto 10 !why does the function not work?
      
!Check if p is between 20 and 1
15 continue
        WRITE(*,'(A)') TRIM(ADJUSTL("Type in a string between 1 to 20 characters (p)"))
         read(*,*) p
         a = check_p(p)
      if (((len(trim(p)).gt.20).or.(len(trim(p)).lt.1)).or.(a.eqv..false.)) goto 15
      
!Assign length of first string 
length = len(trim(s))
j = 0

if (s(1:1).eq.p(1:1)) then   !So this if statement works
!Loop for other letters 
    j = j + 1
    do i = 2, length !Issue with loop or if statements 
    if ((p(i:i).eq.s(i:i).or.(p(i:i) == "."))) then 
        j = j + 1
    else if (p(i:i).eq."*") then 
        if (p((i-1):(i-1)).ne.s(i:i)) then
            result = .false.
        else 
            j = j + 1
        end if 
    end if 
    end do 
else
result = .false.
end if 
if (j.eq.length) then 
result = .true.

end if 

WRITE(*,'(A)') (ADJUSTL(result))
end Program Hello

!check for s
logical function check_s(v)
    character(21), intent(in) :: v 
    logical :: check 
    integer :: i
    
    check = .true.
    do i = 1, len(trim(v))
        if ((((ichar(v(i:i)).le.122).and.(ichar(v(i:i)).ge.97)))) then
            check = .true.
        else 
            check = .false.
            exit
        end if 
    end do 
end function check_s

!check for p
logical function check_p(v)
    character(21), intent(in) :: v 
    logical :: check 
    integer :: i
    
    check = .true.
    do i = 1, len(trim(v))
        if ((((ichar(v(i:i)).le.122).and.(ichar(v(i:i)).ge.97)).or.(ichar(v(i:i)).eq.42).or.(ichar(v(i:i)).eq.46))) then
            check = .true.
        else 
            check = .false.
            exit
        end if 
    end do 
end function check_p





