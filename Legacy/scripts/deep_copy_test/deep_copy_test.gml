function Class1() constructor {
    static val = "hello!";
    
    static func = function() {
        show_debug_message(val);
    }
}

function Class2() : Class1() constructor {
    a = 0;
    b = 1;
    c = 2;
}

function Class3(_thing, _stuff)constructor  {
    thing = _thing;
    stuff = _stuff;
}

function Class4(_thing) constructor {
    thing = argument[0];
    
    if (argument_count > 1) {
        stuff = argument[1];
    }
}