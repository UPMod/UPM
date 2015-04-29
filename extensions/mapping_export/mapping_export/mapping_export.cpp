/****************************************************************
					
				  MAPPING EXPORT v 0.0.1.20150429

Author(s):
	oscarmolinadev

Description:
	

****************************************************************/

#include "stdafx.h"
#include <string>
#include <fstream>


/*
	INIT
*/

extern "C"
{
	__declspec (dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function);
}

void __stdcall RVExtension(char *output, int outputSize, const char *function)
{
	char* input = _strdup(function);
	char* token = NULL;
	char* next_token = NULL;
	char* mode = strtok_s(input, ":", &next_token);

	if (!strcmp(mode, "city")) {


		return;
	}

}