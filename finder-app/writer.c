#include <stdio.h>
#include <syslog.h>


int main(int argc, char* argv[]){


	openlog(NULL,0,LOG_USER);

	if (argc != 3){
		syslog(LOG_ERR, "Error: parameter missing or too many parameters \nUsage: function [writefile] [writestr]");
		return 1;
	}

	//define our variables
        char* writefile = argv[1];
        char* writestr = argv[2];

	FILE *f = fopen(writefile, "w");

	if(f == NULL)
	{
		syslog(LOG_ERR, "Unable to open file for writing.");
		closelog();
		return 1;
	}

	syslog(LOG_DEBUG, "Writing %s to file %s", writestr, writefile);

	if(fprintf(f, "%s", writestr) < 0)
	{
		syslog(LOG_ERR, "Write failed.");
		fclose(f);
		closelog();
		return 1;
	}

	fclose(f);

	syslog(LOG_INFO, "File writed succesfully");

	closelog();

	return 0;

}
