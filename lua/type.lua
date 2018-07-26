function print_name(data)
	print("", data)
end

--lua语法的数据类型
-- print(type("Hello world"))      --> string
-- print(type(10.4*3))             --> number
-- print(type(print))              --> function
-- print(type(type))               --> function
-- print(type(true))               --> boolean
-- print(type(nil))                --> nil
-- print(type(type(X)))            --> string
-- html = [[
-- <html>
-- <head></head>
-- <body>
--     <a href="//www.w3cschool.cn/">w3cschoolW3Cschool教程</a>
-- </body>
-- </html>
-- ]]
-- print(html)
-- print('2' + 6)
-- stringLength = 'qwerty'
-- print(#stringLength)
--在 Lua 里，table 的创建是通过"构造表达式"来完成，
--最简单构造表达式是{}，用来创建一个空表。也可以在表里添加一些数据，直接初始化表:
-- local tb11 = {}
-- local tb22 = {"111", "222", "333"}

--Lua 中的表（table）其实是一个"关联数组"（associative arrays），
--数组的索引可以是数字或者是字符串。
-- a = {}
-- a["key"] = "value"
-- key = 10
-- a[key] = 22
-- a[key] = a[key] + 11
-- for k, v in pairs(a) do
-- 	print(k .. ":"..v)
-- end

--lua 语法默认表的出事索引一般以1开始
-- local table1 = {"a", "b", "c", "d"}
-- for k,v in pairs(table1) do
-- 	print("k", k);
-- end

--table 不会固定长度大小，有新数据添加时 table 长度会自动增长，
--没初始的 table 都是 nil。
-- a3 = {};
-- for i=1,10 do
-- 	a3[i] = i
-- end
-- a3["key"] = "val"
-- print(a3["key"])
-- print(a3["none"])

--function (函数)
-- function factoriiall(n)
-- 	if n == 0 then
-- 		return 1
-- 	else
-- 		return n * factoriiall(n - 1)
-- 	end
-- 	-- body
-- end

-- print(factoriiall(5))
-- factoriiall2 = factoriiall
-- print(factoriiall2(6))

--function匿名函数（anonymous function）的方式通过参数传递
-- function anonymous( tab, fun )
-- 	for k,v in pairs(tab) do
-- 		print(fun(k,v))
-- 	end
-- end
-- tab2 = {key1 = "val1", key2 = "val2"}

-- anonymous(tab2, function (key , val)
-- 	return key .. "=" .. val
-- 	-- body
-- end)

-- thread（线程）
-- 在 Lua 里，最主要的线程是协同程序（coroutine）。它跟线程（thread）差不多，拥有自己独立的栈、局部变量和指令指针，可以跟其他协同程序共享全局变量和其他大部分东西。
-- 线程跟协程的区别：线程可以同时多个运行，而协程任意时刻只能运行一个，并且处于运行状态的协程只有被挂起（suspend）时才会暂停。

-- userdata（自定义类型）
-- userdata 是一种用户自定义数据，用于表示一种由应用程序或 C/C++ 语言库所创建的类型，可以将任意 C/C++ 的任意数据类型的数据（通常是 struct 和 指针）存储到 Lua 变量中调用。


-- Lua 变量
-- 变量在使用前，必须在代码中进行声明，即创建该变量。编译程序执行代码之前编译器需要知道如何给语句变量开辟存储区，用于存储变量的值。
-- Lua 变量有三种类型：全局变量、局部变量、表中的域。
-- 函数外的变量默认为全局变量，除非用 local 显示声明。函数内变量与函数的参数默认为局部变量。
-- 局部变量的作用域为从声明位置开始到所在语句块结束（或者是直到下一个同名局部变量的声明）。
-- 变量的默认值均为 nil。
-- a = 5               --全局变量
-- local b = 5         --局部变量
-- function joke()
-- 	c = 5           --全局变量
-- 	local  d = 6    --局部变量
-- end

-- joke()
-- print(c, d)
-- do
--  local a = 6
--  b = 6             --全局变量
--  print(a, b)
-- end

-- print(a,b)

--赋值语句
-- a = "hello" .. "world"
-- print(a)
--可以同时进行多个赋值,用逗号分开，位置一一对应
-- a , b = 10 , "bbbb"
-- print(a , b)

--遇到赋值语句Lua会先计算右边所有的值然后再执行赋值操作，所以我们可以这样进行交换变量的值：
--个数不一致的时候以最低为标准
-- x , y = 10 , 12
-- x, y = y , x 
-- print(x, y)

-- function f()
-- 	a , b = 10 , 11
-- 	return a, b
-- end

-- a, b = f()
-- print(a, b)

-- 应该尽可能的使用局部变量，有两个好处：

-- 1. 避免命名冲突。
-- 2. 访问局部变量的速度比全局变量更快。

-- 对 table 的索引使用方括号 []。Lua 也提供了 . 操作。
-- tabb = {"1", "2", "3"}
-- print(tabb[1])

--循环类型
--while  在条件为 true 时，让程序重复地执行某些语句。执行语句前会先检查条件是否为 true。
--for     重复执行指定语句，重复次数可在 for 语句中控制。
--Lua repeat...until   重复执行循环，直到 指定的条件为真时为止

--循环控制语句
--break   退出当前循环或语句，并开始脚本执行紧接着的语句


--无线循环(执行会卡死，可以加 break )
-- while( true )
-- do
--    print("循环将永远执行下去")
-- end


-- 函数
-- function max ( num1, num2 )
--   if (num1 > num2) then
-- 	return num1;
--   else
-- 	return num2;
--   end
--   return result;
-- 	-- body
-- end

-- print("", max(4 , 5))
-- print("", max(1000, 1))

-- myprint = function (parm)
-- print("这是打印函数-   ###",parm,"###")
-- end

-- function add (num1, num2 , funcionPrint)
-- 	result = num1 + num2
-- 	funcionPrint(result);
-- 	-- body
-- end
-- myprint(10);
-- add(1 , 3 , myprint)

--可变参数
-- function average( ... )
-- 	result = 0
-- 	local  arage = {...}
-- 	for i,v in ipairs(arage) do
-- 		result = result + v
-- 		-- print(i,v)
-- 	end
-- 	return result/#arage
-- 	-- body
-- end

-- print("平均值", average(10, 11, 12, 13))

-- a = "111"
-- b = "2222"
-- print("", a..b)

--运算符优先级
-- ^
-- not    - (unary)
-- *      /
-- +      -
-- ..
-- <      >      <=     >=     ~=     ==
-- and
-- or


--逻辑运算符
-- a = true
-- b = true
-- if (a == b)
-- 	then
-- 	print("a and b -条件为true")
-- end

-- if (a or b)
-- 	then
-- 	print("a or b -条件为true")
-- end

-- --一元运算符
-- print("长度是", #"哈哈哈哈哈哈11111");

--运算符优先级
-- ^
-- not    - (unary)
-- *      /
-- +      -
-- ..
-- <      >      <=     >=     ~=     ==
-- and
-- or

--字符串
-- string1 = "111"
-- string2 = 'w3c666'
-- string3 = [["lua教程"]]
-- print("", string1, string2, string3)

--字符串转大写
-- argument = "qwertyy"
-- add = string.upper(argument)
-- print("", add);
-- --字符串转小写
-- string.lower(argument)
--字符串替换(在字符串中替换，mainString为要替换的字符串， findString为
---被替换的字符， replaceString要替换的字符， num替换的次数)，
-- string.gsub(mainString,findString,replaceString,num);
-- replaceString = string.gsub("wwwwww", "w", "a", 2);
-- print("", replaceString);

--搜索字符串(在一个指定的目标字符串中搜索指定的内容（第三个参数为索引），返回其具体位置
--。不存在则返回nil)
-- string.find("Hello lua user", "lua", 1)
-- print("", string.find("Hello lua user", "lua", 1))

--字符串反转
-- print("", string.reverse("hello lua"))

--字符串格式化
-- print("",  string.format("the value is :%d", 4))

--整型数字转成字符并连接
-- print_name(string.char(97, 98, 99, 100))
--byte转换字符为整数值
-- print_name(string.byte("ABCD", 4))
-- print_name(string.byte("ABCD"))

--计算字符串的长度
-- print_name(string.len("111111"))

--返回字符串的n个拷贝
-- print_name(string.rep("abcd",  5))

--连接两个字符串
-- print_name("111111" .."3333")

--数组
--一维数组
-- array = {"lua", "Tutorial"}

-- for i = -1, 2 do
-- 	print(array[i])
-- end

--多维数组
-- array = {}

-- for i=1,3 do
-- 	array[i] = {}
-- 	for j=1,3 do
-- 		array[i][j] = i*j;
-- 	end
-- end

-- -- 访问数组
-- for i=1,3 do
--    for j=1,3 do
--       print(array[i][j])
--    end
-- end


--泛型for迭代器
-- array = {"lua" , "Tutorial"}
-- for k,v in pairs(array) do
-- 	print(k,v)
-- end

--无状态的迭代器
-- function square(interatorMaxcount, currentNumber)
-- 	if currentNumber < interatorMaxcount
-- 		then
-- 		currentNumber = currentNumber + 1
-- 		return currentNumber, currentNumber * currentNumber
-- 	end
-- end

-- for i,v in square, 3, 0 do
-- 	print(i,v)
-- end

--多状态的迭代器
-- array = {"lua", "Tutorial"}

-- function element(collection)
-- 	local  index = 0
-- 	local  count = #collection
-- 	--闭包函数
-- 	return function ()
-- 		index = index + 1
-- 		if index <= count
-- 			then
-- 			--返回迭代器的当前元素
-- 			return collection[index]
-- 			end
-- 	end
-- end

-- for element in element(array)
-- 	do
-- 	print(element)
-- 	end

--lua table(表)
--初始化表
-- mytable = {}
-- --指定值
-- mytable[1] = "lua"
-- --移除引用
-- mytable = nil
-- --lua垃圾回收会释放内存


--简单的 table
-- mytable = {}
-- print("mytable 的类型是 ", type(mytable))

-- mytable[1] = "lua"
-- mytable["wow"] = "修改前"
-- print("mytable 索引为1的元素", mytable[1])
-- print("mytable 索引为wow的元素", mytable["wow"])

-- --alertTable和myTable指向同一个table
-- alertTable = mytable
-- print("alertTable = ", alertTable[1], alertTable["wow"])
-- alertTable["wow"] = "修改后"
-- print("alertTable = ", alertTable[1], alertTable["wow"])

-- --释放变量
-- alertTable = nil
-- print("alertTable = ", alertTable)
-- print("mytable 索引为wow的元素", mytable["wow"])

-- table.concat (table [, step [, start [, end]]]):
-- concat是concatenate(连锁, 连接)的缩写. table.concat()函数列出参数中指定table的数组部分从start位置到end位置的所有元素, 元素间以指定的分隔符(sep)隔开。

-- table.insert (table, [pos,] value):
-- 在table的数组部分指定位置(pos)插入值为value的一个元素. pos参数可选, 默认为数组部分末尾.

-- table.maxn (table)
-- 指定table中所有正数key值中最大的key值. 如果不存在key值为正数的元素, 则返回0。(Lua5.2之后该方法已经不存在了,本文使用了自定义函数实现)

-- table.move (table [, pos])
-- 返回table数组部分位于pos位置的元素. 其后的元素会被前移. pos参数可选, 默认为table长度, 即从最后一个元素删起。

-- table.sort (table [, comp])
-- 对给定的table进行升序排序。

-- fruite = {"banan", "orange", "apple"}
-- print("连接后的字符串", table.concat(fruite))

-- --自定连接字符串
-- print("连接后的字符串", table.concat(fruite, ","))

-- --指定索引来连接 table
-- print("连接后的字符串", table.concat(fruite, ",", 2 ,3))

-- --插入和删除
-- -- 在末尾插入
-- table.insert(fruite, "mango")
-- print("末尾插入的元素", fruite[4])

-- --在索引为 2 的键处插入
-- table.insert(fruite, 2, "grape")
-- print("索引为 2 的地方", fruite[2])

--移除元素
-- print("最后一个元素为", fruite[5])
-- table.remove(fruite)
-- print("最后一个元素为", fruite[5])

-- table.sort(fruite);
-- for k,v in pairs(fruite) do
-- 	print(k,v)
-- end



-- test_module.php 文件
-- module 模块为上文提到到 module.lua
-- require("module")
 
-- print(module.constant)
 
-- module.fun3()

-- test_module2.php 文件
-- module 模块为上文提到到 module.lua
-- 别名变量 m



-- local m = require("module")
-- print(m.constant)
 
-- m.fun3()

-- mytable = setmetatable({},{})
-- print_name(getmetatable(mytable))

-- mytable = setmetatable({key1 = "value1"}, {
-- 	__index = function ( mytable, key )
-- 	if key == "key2" then
-- 		return "metatatble"
-- 	else
-- 		return nil
-- 	end
-- 		-- body
-- 	end
-- })

-- print(mytable.key1, mytable.key2)

-- mymetatable = {}
-- mytable = setmetatable({key1 = "valye1"}, {_newindex = mymetatable})
-- print(mytable.key1)

-- mytable.newkey = "新值2"
-- print(mytable.newkey, mymetatable.newkey)

-- mytable.key1 = "新值1"
-- print(mytable.key1, mymetatable.newkey1)


-- mytable = setmetatable({key = "value"}, {
-- 	__newindex = function (mytable, key, value)
-- 	    rawset(mytable, key, "\" "..value.."\"")
-- 	end
-- 	})
-- mytable.key1 = "new value"
-- mytable.key2 = 4
-- print(mytable.key1, mytable.key2)

-- 计算表中最大值，table.maxn在Lua5.2以上版本中已无法使用
-- 自定义计算表中最大值函数 table_maxn
-- function table_maxn(t)
--     local mn = 0
--     for k, v in pairs(t) do
--         if mn < k then
--             mn = k
--         end
--     end
--     return mn
-- end

-- 两表相加操作
-- mytable = setmetatable({ 1, 2, 3 }, {
--   __add = function(mytable, newtable)
--     for i = 1, table_maxn(newtable) do
--       table.insert(mytable, table_maxn(mytable)+1,newtable[i])
--     end
--     return mytable
--   end
-- })

-- secondtable = {4,5,6}

-- mytable = mytable + secondtable
-- for k,v in ipairs(mytable) do
-- print(k,v)
-- end


-- __add	对应的运算符 '+'.
-- __sub	对应的运算符 '-'.
-- __mul	对应的运算符 '*'.
-- __div	对应的运算符 '/'.
-- __mod	对应的运算符 '%'.
-- __unm	对应的运算符 '-'.
-- __concat	对应的运算符 '..'.
-- __eq	对应的运算符 '=='.
-- __lt	对应的运算符 '<'.
-- __le	对应的运算符 '<='.

-- function table_maxn(t)
-- 	local mn = 1
-- 	for k,v in pairs(t) do
-- 		if mn < k then
-- 			mn = k
-- 		end
-- 	end
-- 	return mn
-- 	-- body
-- end

--定义元方法 __call
-- mytable = setmetatable({10}, {
-- 	__call = function (mytable, newtable)
-- 	    sum = 0
-- 	    for i=1,table_maxn(mytable) do
-- 		     sum = sum + mytable[i]
-- 		-- print(i)
-- 	    end

-- 	    for i=1,table_maxn(newtable) do
-- 		    sum = sum + newtable[i]
-- 		-- print(i)
-- 	    end
-- 	    return sum
-- 		-- body
-- 	end
-- 	})
-- newtable = {10, 20, 30}
-- print(mytable(newtable))

--协同程序


-- coroutine_test.lua 文件
-- co = coroutine.create(
--     function(i)
--         print(i);
--     end
-- )
 
-- coroutine.resume(co, 1)   -- 1

-- print(coroutine.status(co))  -- dead
-- print("----------")
-- co = coroutine.wrap(
--     function(i)
--         print(i);
--     end
-- )
-- co(1)
-- print("----------")
-- co2 = coroutine.create(
--     function()
--         for i=1,10 do
--             print(i)
--             if i == 3 then
--                 print(coroutine.status(co2))  --running
--                 print(coroutine.running()) --thread:XXXXXX
--             end
--             coroutine.yield()
--         end
--     end
-- )
-- coroutine.resume(co2) --1
-- coroutine.resume(co2) --2
-- coroutine.resume(co2) --3
-- print(coroutine.status(co2))   -- suspended
-- print(coroutine.running())   --nil
-- print("----------")


-- function foo(a)
-- 	print("foo 函数输出", a)
-- 	return coroutine.yield(2*a) --返回 2*a 的值
-- end

-- co = coroutine.create(function (a , b)
-- 	print("第一次协同程序输出", a, b) -- co-body 1 10

-- 	local r = foo(a + 1)
-- 	print("第二次协同程序输出", r)

-- 	local  r, s = coroutine.yield(a + b, a - b) --a,b的值为第一次输出
-- 	print("第三次协同程序输出", r, s)
-- 	return b, "结束协同程序"   -- b的值为第二次调用协同程序时传入
-- 	-- body
-- end)

-- print("main", coroutine.resume(co, 1, 10))

-- print("main", coroutine.resume(co, "r")) -- true 11 -9

-- print("main", coroutine.resume(co, "x", "y")) -- true 10 end

-- print("main", coroutine.resume(co, "x", "y")) -- cannot resume dead coroutine


--生产者-消费者
-- local newProductor

-- function productor()
--      local i = 0
--      while true do
--           i = i + 1
--           send(i)     -- 将生产的物品发送给消费者
--      end
-- end

-- function consumer()
--      while true do
--           local i = receive()     -- 从生产者那里得到物品
--           print(i)
--      end
-- end

-- function receive()
--      local status, value = coroutine.resume(newProductor)
--      return value
-- end

-- function send(x)
--      coroutine.yield(x)     -- x表示需要发送的值，值返回以后，就挂起该协同程序
-- end

-- -- 启动程序
-- newProductor = coroutine.create(productor)
-- consumer()


arrTable = {8, 2 , 1, 0 , 3} 
indexTable = {2, 0, 3, 2, 4, 0, 1, 3, 2, 3, 3}
a = #indexTable
 for i=1,a do 
 	print(arrTable[indexTable[i] + 1])
 end











