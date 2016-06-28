# TIP #1: do not use 'and', 'or' as logical composition
# Their behavior looks puzzled. For example, both of them have the same priority,
# which is lesser than in their twins '&&', '||'. Last ones also respect
# general order of logical operators: http://www.techotopia.com/index.php/Ruby_Operator_Precedence
#
# See more details here: https://habrahabr.ru/post/94566/

# TIP: bool operation
#
# logical AND (&&)
true && true # => true
true && false # => false
false && true # => false
false && false # => false
#
# logical OR (||)
true || true # => true
true || false # => true
false || true # => true
false || false # => false

# TIP #2: #{some_value_or_expression} - construction for interpolation in String by ""
insert_str = 'of course it will be true!' if true
s1 = "message: #{insert_str}"
s2 = "message: #{'of course it will be true!' if true}."
s1 == s2 # => true

# TIP #3: use #inspect for human-readable representation of object
1.to_s # => 1
'1'.to_s # => 1
1.inspect # => 1
'1'.inspect # => "1"

# TIP #4: notation about methods in comments
# .method_name  - it is a method for a class
# #method_name - it is a method for a instance of a class
