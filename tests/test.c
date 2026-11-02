#include <stdio.h>
#include <stdlib.h>

extern int		ft_strlen(const char *s);
extern int		ft_strcpy(char *dst, const char *src);
extern int		ft_strcmp(const char *s1, const char *s2);

#define assert(cond, msg)	{assertion_count++; if (!(cond)) { fprintf(stderr, "\033[31mERROR\033[0m: %s at assertion %i\n", msg, assertion_count); exit(1);} else { printf("\033[32mSUCCESS\033[0m: Assert %i\n", assertion_count); }}

int		my_strcmp(char *s1, char *s2)
{
	int	i;

	i = 0;
	while (s1[i] || s2[i])
	{
		if (s1[i] != s2[i])
			return (s1[i] - s2[i]);
		i++;
	}
	return (0);
}

void	main(void)
{
	int assertion_count = 0;
	char test[64];

	// strlen
	printf("ft_strlen:\n");
	assert(ft_strlen("Hello World!") == 12, "Hello World! != 12")
	assert(ft_strlen("") == 0, "empty != 0")
	assert(ft_strlen("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") == 67, "very big string != 67")

	// strcpy
	printf("ft_strcpy:\n");
	assert((ft_strcpy(test, "Hello World!") == 12 && !my_strcmp("Hello World!", test)), "Could not copy 'Hello World!'")
	assert((ft_strcpy(test, "") == 0 && !my_strcmp("", test)), "Could not copy ''")

	// strcmp
	printf("ft_strcmp:\n");
	assert((ft_strcmp("hello world!", "Hello World!") == ('a' - 'A')), "Invalid character substraction")
}