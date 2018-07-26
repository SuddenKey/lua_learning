--错误处理

-- 语法错误通常是由于对程序的组件（如运算符、表达式）使用不当引起的
-- a == 2
-- lua: test.lua:2: syntax error near '=='


-- 运行错误是程序可以正常执行，但是会输出报错信息。如下实例由于参数输入错误，程序执行时报错：
-- function add(a,b)
--    return a+b
-- end
-- add(10)

-- lua: test2.lua:2: attempt to perform arithmetic on local 'b' (a nil value)
-- stack traceback:
--  test2.lua:2: in function 'add'
--   test2.lua:5: in main chunk
--     [C]: ?

-- 错误处理
-- 我们可以使用两个函数：assert 和 error 来处理错误

-- local function add(a,b)
--    assert(type(a) == "number", "a 不是一个数字")
--    assert(type(b) == "number", "b 不是一个数字")
--    return a+b
-- end
-- add(10)


-- error函数
-- 语法格式
-- error (message, [, level])

-- 功能：终止正在执行的函数，并返回message的内容作为错误信息(error函数永远都不会返回)
-- 通常情况下，error会附加一些错误位置的信息到message头部。

-- Level参数指示获得错误的位置:

-- Level=1[默认]：为调用error位置(文件+行号)
-- Level=2：指出哪个调用error的函数的函数
-- Level=0:不添加错误位置信息


-- function myfunction ()
--    n = n/nil
-- end

-- function myerrorhandler( err )
--    print( "ERROR:", err )
-- end

-- status = xpcall( myfunction, myerrorhandler )
-- print( status)

-- Lua 调试(Debug)

-- 1.	debug():
-- 进入一个用户交互模式，运行用户输入的每个字符串。 使用简单的命令以及其它调试设置，用户可以检阅全局变量和局部变量， 改变变量的值，计算一些表达式，等等。 
-- 输入一行仅包含 cont 的字符串将结束这个函数， 这样调用者就可以继续向下运行。

-- 2.	getfenv(object):
-- 返回对象的环境变量。

-- 3.	gethook(optional thread):
-- 返回三个表示线程钩子设置的值： 当前钩子函数，当前钩子掩码，当前钩子计数

-- 4.	getinfo ([thread,] f [, what]):
-- 返回关于一个函数信息的表。 你可以直接提供该函数， 也可以用一个数字 f 表示该函数。 数字 f 表示运行在指定线程的调用栈对应层次上的函数： 0 层表示当前函数（getinfo 自身）； 1 层表示调用 getinfo 的函数 （除非是尾调用，这种情况不计入栈）；等等。 如果 f 是一个比活动函数数量还大的数字， getinfo 返回 nil。

-- 5.	debug.getlocal ([thread,] f, local):
-- 此函数返回在栈的 f 层处函数的索引为 local 的局部变量 的名字和值。 这个函数不仅用于访问显式定义的局部变量，也包括形参、临时变量等。

-- 6.	getmetatable(value):
-- 把给定索引指向的值的元表压入堆栈。如果索引无效，或是这个值没有元表，函数将返回 0 并且不会向栈上压任何东西。

-- 7.	getregistry():
-- 返回注册表表，这是一个预定义出来的表， 可以用来保存任何 C 代码想保存的 Lua 值。

-- 8.	getupvalue (f, up)
-- 此函数返回函数 f 的第 up 个上值的名字和值。 如果该函数没有那个上值，返回 nil 。 
-- 以 '(' （开括号）打头的变量名表示没有名字的变量 （去除了调试信息的代码块）。

-- 10.	将一个函数作为钩子函数设入。 字符串 mask 以及数字 count 决定了钩子将在何时调用。 掩码是由下列字符组合成的字符串，每个字符有其含义：
-- 'c': 每当 Lua 调用一个函数时，调用钩子；
-- 'r': 每当 Lua 从一个函数内返回时，调用钩子；
-- 'l': 每当 Lua 进入新的一行时，调用钩子。
-- 11.	setlocal ([thread,] level, local, value):
-- 这个函数将 value 赋给 栈上第 level 层函数的第 local 个局部变量。 如果没有那个变量，函数返回 nil 。 如果 level 越界，抛出一个错误。

-- 12.	setmetatable (value, table):
-- 将 value 的元表设为 table （可以是 nil）。 返回 value。

-- 13.	setupvalue (f, up, value):
-- 这个函数将 value 设为函数 f 的第 up 个上值。 如果函数没有那个上值，返回 nil 否则，返回该上值的名字。

-- 14.	traceback ([thread,] [message [, level]]):
-- 如果 message 有，且不是字符串或 nil， 函数不做任何处理直接返回 message。 否则，它返回调用栈的栈回溯信息。 字符串可选项 message 被添加在栈回溯信息的开头。 数字可选项 level 指明从栈的哪一层开始回溯 （默认为 1 ，即调用 traceback 的那里）。


-- function myfunction ()
-- print(debug.traceback("Stack trace"))
-- print(debug.getinfo(1))
-- print("Stack trace end")
--     return 10
-- end
-- myfunction ()
-- print(debug.getinfo(1))

-- function newCounter ()
--   local n = 0
--   local k = 0
--   return function ()
--     k = n
--     n = n + 1
--     return n
--     end
-- end

-- counter = newCounter()
-- print(counter())
-- print(counter())

-- local i = 1

-- repeat 
-- 	name, val = debug.getupvalue(counter, i)
-- 	if name then
--     print ("index", i, name, "=", val)
--     if(name == "n") then
--         debug.setupvalue (counter,2,10)
--    end
--     i = i + 1
--   end -- if
-- until not name
-- print(counter())


-- Lua 垃圾回收
-- Lua 提供了以下函数collectgarbage ([opt [, arg]])用来控制自动内存管理:
-- collectgarbage("collect"): 做一次完整的垃圾收集循环。通过参数 opt 它提供了一组不同的功能：
-- collectgarbage("count"): 以 K 字节数为单位返回 Lua 使用的总内存数。 这个值有小数部分，所以只需要乘上 1024 就能得到 Lua 使用的准确字节数（除非溢出）。
-- collectgarbage("restart"): 重启垃圾收集器的自动运行。
-- collectgarbage("setpause"): 将 arg 设为收集器的 间歇率 （参见 §2.5）。 返回 间歇率 的前一个值。
-- collectgarbage("setstepmul"): 返回 步进倍率 的前一个值。
-- collectgarbage("step"): 单步运行垃圾收集器。 步长"大小"由 arg 控制。 传入 0 时，收集器步进（不可分割的）一步。 传入非 0 值， 收集器收集相当于 Lua 分配这些多（K 字节）内存的工作。 如果收集器结束一个循环将返回 true 。
-- collectgarbage("stop"): 停止垃圾收集器的运行。 在调用重启前，收集器只会因显式的调用运行。

-- mytable = {"apple", "orange", "banana"}
-- print(collectgarbage("count"))
-- mytable = nil
-- print(collectgarbage("count"))
-- print(collectgarbage("collect"))
-- print(collectgarbage("count"))




-- lua 中面像对象























