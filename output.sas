begin_version
3
end_version
begin_metric
0
end_metric
17
begin_variable
var0
-1
2
Atom clear(a)
NegatedAtom clear(a)
end_variable
begin_variable
var1
-1
4
Atom on(d1, a)
Atom on(o1, a)
Atom on(s1, a)
<none of those>
end_variable
begin_variable
var2
-1
2
Atom clear(b)
NegatedAtom clear(b)
end_variable
begin_variable
var3
-1
4
Atom on(d1, b)
Atom on(o1, b)
Atom on(s1, b)
<none of those>
end_variable
begin_variable
var4
-1
2
Atom clear(c)
NegatedAtom clear(c)
end_variable
begin_variable
var5
-1
4
Atom on(d1, c)
Atom on(o1, c)
Atom on(s1, c)
<none of those>
end_variable
begin_variable
var6
-1
5
Atom handempty()
Atom holding(a)
Atom holding(b)
Atom holding(c)
Atom holding(d)
end_variable
begin_variable
var7
-1
2
Atom clear(d)
NegatedAtom clear(d)
end_variable
begin_variable
var8
-1
4
Atom on(d1, d)
Atom on(o1, d)
Atom on(s1, d)
<none of those>
end_variable
begin_variable
var9
-1
2
Atom is-clean(a)
Atom is-dirty(a)
end_variable
begin_variable
var10
-1
2
Atom is-cooked(a)
Atom is-raw(a)
end_variable
begin_variable
var11
-1
2
Atom is-clean(d)
Atom is-dirty(d)
end_variable
begin_variable
var12
-1
2
Atom is-cooked(d)
Atom is-raw(d)
end_variable
begin_variable
var13
-1
2
Atom is-clean(c)
Atom is-dirty(c)
end_variable
begin_variable
var14
-1
2
Atom is-cooked(c)
Atom is-raw(c)
end_variable
begin_variable
var15
-1
2
Atom is-clean(b)
Atom is-dirty(b)
end_variable
begin_variable
var16
-1
2
Atom is-cooked(b)
Atom is-raw(b)
end_variable
8
begin_mutex_group
2
0 0
6 1
end_mutex_group
begin_mutex_group
2
2 0
6 2
end_mutex_group
begin_mutex_group
2
4 0
6 3
end_mutex_group
begin_mutex_group
2
7 0
6 4
end_mutex_group
begin_mutex_group
4
6 1
1 0
1 1
1 2
end_mutex_group
begin_mutex_group
4
6 2
3 0
3 1
3 2
end_mutex_group
begin_mutex_group
4
6 3
5 0
5 1
5 2
end_mutex_group
begin_mutex_group
4
6 4
8 0
8 1
8 2
end_mutex_group
begin_state
0
0
0
0
0
0
0
0
0
1
1
1
1
1
1
1
1
end_state
begin_goal
4
10 0
12 0
14 0
16 0
end_goal
32
begin_operator
cook a o1
2
9 0
1 1
1
0 10 1 0
1
end_operator
begin_operator
cook b o1
2
15 0
3 1
1
0 16 1 0
1
end_operator
begin_operator
cook c o1
2
13 0
5 1
1
0 14 1 0
1
end_operator
begin_operator
cook d o1
2
11 0
8 1
1
0 12 1 0
1
end_operator
begin_operator
pick-up a d1
0
3
0 0 0 1
0 6 0 1
0 1 0 3
1
end_operator
begin_operator
pick-up a o1
0
3
0 0 0 1
0 6 0 1
0 1 1 3
1
end_operator
begin_operator
pick-up a s1
0
3
0 0 0 1
0 6 0 1
0 1 2 3
1
end_operator
begin_operator
pick-up b d1
0
3
0 2 0 1
0 6 0 2
0 3 0 3
1
end_operator
begin_operator
pick-up b o1
0
3
0 2 0 1
0 6 0 2
0 3 1 3
1
end_operator
begin_operator
pick-up b s1
0
3
0 2 0 1
0 6 0 2
0 3 2 3
1
end_operator
begin_operator
pick-up c d1
0
3
0 4 0 1
0 6 0 3
0 5 0 3
1
end_operator
begin_operator
pick-up c o1
0
3
0 4 0 1
0 6 0 3
0 5 1 3
1
end_operator
begin_operator
pick-up c s1
0
3
0 4 0 1
0 6 0 3
0 5 2 3
1
end_operator
begin_operator
pick-up d d1
0
3
0 7 0 1
0 6 0 4
0 8 0 3
1
end_operator
begin_operator
pick-up d o1
0
3
0 7 0 1
0 6 0 4
0 8 1 3
1
end_operator
begin_operator
pick-up d s1
0
3
0 7 0 1
0 6 0 4
0 8 2 3
1
end_operator
begin_operator
put-down a d1
0
3
0 0 -1 0
0 6 1 0
0 1 -1 0
1
end_operator
begin_operator
put-down a o1
0
3
0 0 -1 0
0 6 1 0
0 1 -1 1
1
end_operator
begin_operator
put-down a s1
0
3
0 0 -1 0
0 6 1 0
0 1 -1 2
1
end_operator
begin_operator
put-down b d1
0
3
0 2 -1 0
0 6 2 0
0 3 -1 0
1
end_operator
begin_operator
put-down b o1
0
3
0 2 -1 0
0 6 2 0
0 3 -1 1
1
end_operator
begin_operator
put-down b s1
0
3
0 2 -1 0
0 6 2 0
0 3 -1 2
1
end_operator
begin_operator
put-down c d1
0
3
0 4 -1 0
0 6 3 0
0 5 -1 0
1
end_operator
begin_operator
put-down c o1
0
3
0 4 -1 0
0 6 3 0
0 5 -1 1
1
end_operator
begin_operator
put-down c s1
0
3
0 4 -1 0
0 6 3 0
0 5 -1 2
1
end_operator
begin_operator
put-down d d1
0
3
0 7 -1 0
0 6 4 0
0 8 -1 0
1
end_operator
begin_operator
put-down d o1
0
3
0 7 -1 0
0 6 4 0
0 8 -1 1
1
end_operator
begin_operator
put-down d s1
0
3
0 7 -1 0
0 6 4 0
0 8 -1 2
1
end_operator
begin_operator
wash a s1
1
1 2
1
0 9 1 0
1
end_operator
begin_operator
wash b s1
1
3 2
1
0 15 1 0
1
end_operator
begin_operator
wash c s1
1
5 2
1
0 13 1 0
1
end_operator
begin_operator
wash d s1
1
8 2
1
0 11 1 0
1
end_operator
0
