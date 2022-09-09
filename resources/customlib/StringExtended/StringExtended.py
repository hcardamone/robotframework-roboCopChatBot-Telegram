from unittest import result
from robot.libraries.String import *
from robot.libraries.BuiltIn import *

def split_list_custom(self, string_input, flag=0):
    chunks, chunk_size = len(string_input), len(string_input)//flag
    # noinspection PyUnusedLocal
    splitcustom = []
    for i in range(0, chunks, chunk_size):
        splitcustom.append(string_input[i:i + chunk_size])
    print(splitcustom[i])
    return  splitcustom

def catenate_custom(self, *items):
    #"""Self does absolutely nothing."""
        if not items:
            return ''
        items = [str(item) for item in items]
        if items[0].startswith('SEPARATOR='):
            sep = items[0][len('SEPARATOR='):]
            items = items[1:]
        else:
            sep = ' '
        return sep.join(items)

def get_line_count_custom(self, string):
    list = string
    result = [c for c in list[0]]
    return list

def remove_list_using_regexp(self, string_input, *patterns):
    list = string_input
    result = [c for c in list[0]]
    # noinspection PyUnusedLocal
    for pattern in patterns:
        string_input = self.remove_list_using_regexp(list, pattern, '')
    return result, string_input
