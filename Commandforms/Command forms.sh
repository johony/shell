cmd $         #Excute cmd in background
cmd1; cmd2    #Command sequence; excute multiple cmds on the same line
{cmd1;cmd2}   #Excute commands as a group in the current shell
(cmd1;cmd2)   #Excute commands as a group in a subshell
cmd1 | cmd2   #Pipe; use output from cmd1 as input to cmd2
cmd1 `cmd2`   #Command substitution; use cmd2 output as argument to cmd1
cmd1 $(cmd2)  #POSIX shell command substitution; nesting is allowed
cmd $((expression)) #POSIX shell arithmetic substitution. Use the result of expression as argument to cmd
cmd1 && cmd2  #AND; excute cmd1 and then(if cmd1 succeeds)cmd2. This is a "short circuit":cmd2 is never executed if cmd1 fails.
cmd1 || cmd2  #OR; execute either cmd1 or (if cmd1 fails)cmd2. This is a "short ciruit" operation; cmd2 is never executed if cmd1 succeeds.
! cmd         #NOT; execute cmd, and produce a zero exit status if cmd exits with a nonzero status. Oherwise, produce a nonzero statrus when cmd exits with a zero startus.