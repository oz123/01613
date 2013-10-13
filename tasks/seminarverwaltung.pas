{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}

program SeminarVerwaltung(input, output);
{ 
  A program to manage a seminar with 12 Students.
  - Read the type of student : active or passive. 
  - Print the Maticulation number of active Students
  - Print a list of active and passive Students. 
  Task 4.2.1.5 s. 101
}
  
const 
NSTUDENTS = 12;

type
tPosNatZahl = 1..maxint ;
tStudentIdx = 1..NSTUDENTS;
tStudentMatrikelNum = array [tStudentIdx] of tPosNatZahl;
tStatus = (active, passive);
tStudentStatus = array [tStudentIdx] of tStatus;

{
Type definition of enumarators is there to force certain
variables. Hence:
  
  var 
  astat : tStatus;

This variable will throw an error if we try something stupid like

  astat :=0;

Freepascal will complain:
 
  Error: Incompatible types: got "ShortInt" expected "tStatus"

}

var
  StudentNumbers : tStudentMatrikelNum;
  ArrayIDX : tStudentIdx;
  GivenStatus : char;
  StudentStatus : tStudentStatus;

begin
  writeln('Please enter list of Matriculation nubmers and status.' );
  for ArrayIDX := 1 to NSTUDENTS do
  begin
    write(ArrayIDX, '. Student number:');
    readln(StudentNumbers[ArrayIDX]); 
    write('Student status:');
    readln(GivenStatus);
    while ( GivenStatus <> 'a' ) and ( GivenStatus <> 'p' ) do
    begin
      write('Illegal status: ', GivenStatus, ' please give the status again: ');
      readln(GivenStatus)
    end;
    if GivenStatus = 'a' then
      StudentStatus[ArrayIDX] := active
    else
      StudentStatus[ArrayIDX] := passive;

  end;

  { Print the list of students eligble for a certificate }
  writeln('The following students have successuly finished the course: ');
  for ArrayIDX := 1 to NSTUDENTS do
  begin
    if StudentStatus[ArrayIDX] = active then
      writeln(StudentNumbers[ArrayIDX])
  end;
  { Print the list of all active students }
  writeln('The following students participated actively in the course: ');
  for ArrayIDX := 1 to NSTUDENTS do
  begin
    if StudentStatus[ArrayIDX] = active then
      writeln(StudentNumbers[ArrayIDX])
  end;
  { Print the list of all passive students }
  writeln('The following students participated passively in the course: ');
  for ArrayIDX := 1 to NSTUDENTS do
  begin
    if StudentStatus[ArrayIDX] = passive then
      writeln(StudentNumbers[ArrayIDX])
  end;
end. { SeminarVerwaltung }
