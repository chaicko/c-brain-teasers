#include <stdio.h>

int main()
{
	char ns[] = {
		'g', 'r', 'e', 'e', 't',
		'i', 'n', 'g', 's', ',',
		' ', 'h', 'u', 'm', 'a', 'n',
		0 // don't forget to terminate a string!
	};
	char data[] = { 127, 129, 255 };

	printf("%s\n",ns);

	return(0);
}