var array = [
    new Class1(),
    [ [0], [1], [2] ],
    { hmm : "hmm", huh : "huh", class : new Class2() }
];

var struct = new Class3(
    new Class2(),
    new Class4(
        new Class4(
            [0, 1, 2],
            { three : 3, four : 4, five : 5 }
        )
    )
);

var new_araay = deep_copy(array);
var new_struct = deep_copy(struct);

// Both have identival values
show_debug_message(array);
show_debug_message(struct);
show_debug_message(new_araay);
show_debug_message(new_struct);

// But not holding the same references
show_debug_message(array == new_araay);                                             // false
show_debug_message(array[0] == new_araay[0]);                                       // false
show_debug_message(array[1] == new_araay[1]);                                       // false
show_debug_message(array[2] == new_araay[2]);                                       // false
show_debug_message(struct == new_struct);                                           // false
show_debug_message(struct.thing == new_struct.thing);                               // false
show_debug_message(struct.stuff == new_struct.stuff);                               // false
show_debug_message(struct.stuff.thing == new_struct.stuff.thing);                   // false