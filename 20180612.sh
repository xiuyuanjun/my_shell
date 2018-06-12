http://awk.readthedocs.io/en/latest/chapter-one.html

awk -F ',' '$3 > 10000 && $3 < 100000 {print $0}' huina_bak.csv

#除了数值测试，你还可以选择包含特定单词或短语的输入行。这个程序会打印所有第一个字段为 Susie 的行
awk '$1 == "Susie"  {print $1, $2 * $3}' emp.data

#操作符 == 用于测试相等性。你也可以使用称为 正则表达式 的模式查找包含任意字母组合，单词或短语的文本。这个程序打印任意位置包含 Susie 的行
awk '/Susie/  {print $1, $2 * $3}' emp.data
