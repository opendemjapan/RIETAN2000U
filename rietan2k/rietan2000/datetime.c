#include <time.h>
#include <stdlib.h>

void getntd_(char *ntdstr)    /* Get Now Time & Date */
{
    long nowtime;
    char *cptr;
    time(&nowtime);
    strcpy(ntdstr,ctime(&nowtime));
    cptr=(char *)strchr(ntdstr,'\n');*cptr=' ';
    cptr=(char *)strchr(ntdstr,'\0');*cptr=' ';
}
