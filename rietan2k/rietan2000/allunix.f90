      SUBROUTINE INITIAL
*     OPEN UNIT 5 AND PRINT DATE
*     Cf. Language Reference Manual of Compaq Fortran, E-16.
*     USE DFLIB
      CHARACTER FILE5*50,CYMD*8,HMS*10

      CALL GETARG(1,FILE5)
      OPEN(UNIT=5,FILE=FILE5,STATUS='OLD')

*     Example: 08:31:41, 16-FEB-1999
*     Get the date and time
*     Cf. Language Reference Manual of Compaq Fortran, 9-46.
*     CYMD: CCYYMMDD
*     HMS: hhmmss.sss
      CALL DATE_AND_TIME(CYMD,HMS)
*     Example: 08:31:41, 1999.02.18
      WRITE(6,'(//1H ,85X,11A)') HMS(1:2),':',HMS(3:4),':',HMS(5:6),
     &  ', ',CYMD(1:4),'.',CYMD(5:6),'.',CYMD(7:8)
      END

************************************************************************

      REAL FUNCTION ELAPTIME(TARRAY)
*     Cf. Language Reference Manual of Compaq Fortran, E-1.
*     USE DFPORT
      REAL TARRAY(2)

      ELAPTIME = ETIME(TARRAY)
      END

************************************************************************

      SUBROUTINE OPENSPGR(VOLUME,NFILE)
*     OPEN A SPACE GROUP FILE
*     Cf. Language Reference Manual of Compaq Fortran, E-1.
*     USE DFPORT
      CHARACTER VOLUME*1, EVALUE*50

      CALL GETENV('RIETAN',EVALUE)
*Rev 1.0n1 2001.01.15 Izumi {
      DO J = 50, 1, -1
	   IF (EVALUE(J:J) .NE. ' ') EXIT
      END DO
      IF (VOLUME .EQ. 'I') THEN
         NFILE=1
*        OPEN(UNIT=NFILE,FILE=EVALUE(1:INDEX(EVALUE,' ')-1)//'\spgri',
*    &   STATUS='OLD')
         OPEN(UNIT=NFILE,FILE=EVALUE(1:J)//'/spgri',STATUS='OLD')
      ELSE
         NFILE=11
*        OPEN(UNIT=NFILE,FILE=EVALUE(1:INDEX(EVALUE,' ')-1)//'\spgra',
*    &   STATUS='OLD')
         OPEN(UNIT=NFILE,FILE=EVALUE(1:J)//'/spgra',STATUS='OLD')
      END IF
* }
      END

************************************************************************

      SUBROUTINE OPENASFDC
*     OPEN FILE asfdc
*     Cf. Language Reference Manual of Compaq Fortran, E-1.
*     USE DFPORT
      CHARACTER EVALUE*50

      CALL GETENV('RIETAN',EVALUE)
*Rev 1.0n1 2001.01.15 Izumi {
      DO J = 50, 1, -1
         IF (EVALUE(J:J) .NE. ' ') EXIT
      END DO
*     OPEN(UNIT=2,FILE=EVALUE(1:INDEX(EVALUE,' ')-1)//'\asfdc',
*    &  STATUS='OLD')
      OPEN(UNIT=2,FILE=EVALUE(1:J)//'/asfdc',STATUS='OLD')
* }
      END

************************************************************************

      SUBROUTINE OPENFILE(NARG,FILENAME)
*     OPEN A FILE WHOSE ORDER IN THE ARGUMENT IS NARG
*     Cf. Language Reference Manual of Compaq Fortran, E-16.
*     USE DFLIB
      CHARACTER*50 FILENAME

*     NARG: ARGUMENT ORDER NUMBER
      CALL GETARG(NARG,FILENAME)

      SELECT CASE (NARG)
         CASE (1)
*           *.ins
*           FILE #5 NEED NOT BE REOPENED IN THE CASE OF Visual Fortran
*           DO NOTHING
            RETURN
         CASE (2)
*           *.int
            NUNIT = 3
         CASE (3)
*           *.bkg
            NUNIT = 8
         CASE (4)
*           *.pat
            NUNIT = 20
         CASE (5)
*           *.hkl
            NUNIT = 21
         CASE (6)
*           *.xyz
            NUNIT = 9
         CASE (7)
*           *.mem
            NUNIT = 30
         CASE (8)
*           *.ffe
            NUNIT = 10
         CASE (9)
*           *.fba
            NUNIT = 32
         CASE (10)
*           *.ffi
            NUNIT = 22
         CASE (11)
*           *.ffo
            NUNIT = 23
      END SELECT

      OPEN(UNIT=NUNIT,FILE=FILENAME,STATUS='UNKNOWN')
      END

************************************************************************

      SUBROUTINE UPDATE_LPP(A,SIGMAA)
*     A dummy subroutine (CrystalMaker cannot be used on Windows)
      REAL A(*),SIGMAA(*)

*     Do nothing in the Windows version
      RETURN
      END

************************************************************************

      SUBROUTINE XATT
*     A dummy subroutine to do nothing (called in SUBROUTINE OUT20)
      END

