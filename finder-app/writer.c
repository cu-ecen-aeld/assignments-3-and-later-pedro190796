#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <string.h>

int main(int argc, char *argv[])
{
	// Opens a connection to the system logger
	openlog("Writer", LOG_PID|LOG_CONS, LOG_USER);

	if(argc != 3)
	{
		syslog(LOG_ERR, "Error: Number of arguments invalid");
		closelog();
		return 1;
	}
	
	char *writefile = argv[1];
	char *writestr = argv[2];

	FILE *file = fopen(writefile, "w");
	if (file == NULL)
	{
		syslog(LOG_ERR, "Error opening file %s: ", writefile);
		closelog();
		return 1;
	}
	
	//Write data to file
	fputs(writestr, file);

	// Close file to save 
	fclose(file);
	
	syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);
	closelog();	

	return 0;
}
			
