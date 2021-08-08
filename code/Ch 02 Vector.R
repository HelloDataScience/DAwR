
a <- c(1, 2, 3)
print(x = a)
class(x = a)

b <- c(1L, 2L, 3L)
print(x = b)
class(x = b)

print(x = 101:150)

c <- c('hello', 'world')
print(x = c)
class(x = c)

d <- c(FALSE, TRUE)
print(x = d)
class(x = d)

nat <- c('한국', '일본', '중국', '미국', '중국', '한국', '미국', '일본')
print(x = nat)

fct <- as.factor(x = nat)
print(x = fct)
as.integer(x = fct)

fct <- factor(x = nat, levels = c('한국', '미국', '중국', '일본'))
print(x = fct)
as.integer(x = fct)

seq(from = 1, to = 3, by = 1)
1:3
seq(from = 3, to = 1, by = -1)
seq(from = 1, to = 10, by = 2.5)
seq(from = 1, to = 10, length = 19)

rep(x = 1, times = 3)
rep(x = 1:3, times = 3)
rep(x = 1:3, each = 3)
rep(x = 1:3, length = 10)

print(x = letters)
letters[1]

s <- letters[1:5]
print(x = s)

s[c(1, 3, 5)]
s[c(TRUE, FALSE, TRUE, FALSE, TRUE)]

s[6] <- 'f'
print(x = s)
s[10] <- 'j'
print(x = s)

s[-10]
print(x = s)
s <- s[-10]
print(x = s)

s[1] <- 'A'
print(x = s)
s[2] <- 'B'
print(x = s)
s[1:2] <- c('가', '나')
print(x = s)

nat[8] <- '대만'
print(x = nat)

fct[8] <- '대만'
print(x = fct)

levels(x = fct)
levels(x = fct)[5] <- '대만'
fct[8] <- '대만'
print(x = fct)

as.integer(x = 1.2)
as.integer(x = '1.2')
as.integer(x = FALSE)

as.numeric(x = 1L)
as.numeric(x = '1.2')
as.numeric(x = TRUE)

as.character(x = 1L)
as.character(x = 1.2)
as.character(x = TRUE)

as.logical(x = 0)
as.logical(x = 1.2)
as.logical(x = '1.2')

e <- as.factor(x = c)
print(x = e)
class(x = e)
as.integer(x = e)

f <- c(d, e)
print(x = f)
class(x = f)

f <- c(f, 3)
print(x = f)
class(x = f)

f <- c(f, '4')
print(x = f)
class(x = f)

a <- c(0, 2, 4)
b <- c(1, 2, 3)
a + b
a - b

c <- seq(from = 1, to = 11, by = 2)
d <- seq(from = 3, to = 12, by = 3)
a + c
a + d
a + 1

a * b
a / b
a %% 3
a %/% 2
a ^ 2

a > 2
a >= 2
a < 2
a <= 2
a == 2
a != 2

a >= 1
b <= 2
a >= 1 & b <= 2
a >= 1 | b <= 2
!(a >= 1 & b <= 2)

x <- 0
x == a[1]
x == a[2]
x == a[3]
x == a[1] | x == a[2] | x == a[3]
x %in% a

