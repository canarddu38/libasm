#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>

extern int		ft_strlen(const char *s);
extern int		ft_strcpy(char *dst, const char *src);
extern int		ft_strcmp(const char *s1, const char *s2);
extern int		ft_write(unsigned int fd, const char *buf, size_t count);
extern int		ft_read(unsigned int fd, char *buf, size_t count);

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
	printf("\nft_strcpy:\n");
	assert((ft_strcpy(test, "Hello World!") == 12 && !my_strcmp("Hello World!", test)), "Could not copy 'Hello World!'")
	assert((ft_strcpy(test, "") == 0 && !my_strcmp("", test)), "Could not copy ''")

	// strcmp
	printf("\nft_strcmp:\n");
	assert((ft_strcmp("hello world!", "Hello World!") == ('a' - 'A')), "Invalid character substraction")
	assert((ft_strcmp("aaa", "aaa") == 0), "Invalid character substraction")
	assert((ft_strcmp("", "") == 0), "Invalid character substraction")

	// write
	printf("\nft_write:\n");
	assert((ft_write(1, "Hello World!\n", 13) == 13), "Could not write stdout")
	int fd = open("test.txt", O_CREAT | O_WRONLY, 0777);
	if (fd < 0)
		fprintf(stderr, "Could not open test file\n");
	else
		assert((ft_write(fd, "Hello World! This is a test\n", 12) == 12 && !close(fd)), "Could not write file")
	assert((ft_write(321, "Hello World! This is a test\n", 12) == -1 && errno == EBADF), "Write error failed")

	// read
	printf("\nft_read:\n");
	char buf[4096] = {0};
	int s = ft_read(0, buf, 4096);
	assert((s == ft_strlen(buf)), "Could not read stdin")
	assert((ft_read(423, buf, 12) == -1 && errno == EBADF), "Invalid errno")
}