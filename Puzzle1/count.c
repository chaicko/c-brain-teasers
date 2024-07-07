#include <stdio.h>
#include <math.h>

// M_PI might not be defined. It might be defined if compiled with
// -D_USE_MATH_DEFINES or -D_POSIX_C_SOURCE=200112L but the constant is not
// actually defined in the C stdlib so might not be there.
#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

int main()
{
	int n;

	n = printf("%2.4f\n",M_PI);
	printf("(That's %d characters)\n",n);

	return(0);
}