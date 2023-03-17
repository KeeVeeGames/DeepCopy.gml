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

var new_array = deep_copy(array);
var new_struct = deep_copy(struct);

// Both have identical values
show_debug_message(array);              // [ {  },[ [ 0 ],[ 1 ],[ 2 ] ],{ class : { a : 0, b : 1, c : 2 }, hmm : "hmm", huh : "huh" } ]
show_debug_message(new_array);          // [ {  },[ [ 0 ],[ 1 ],[ 2 ] ],{ class : { a : 0, b : 1, c : 2 }, hmm : "hmm", huh : "huh" } ]
show_debug_message(struct);             // { thing : { a : 0, b : 1, c : 2 }, stuff : { thing : { thing : [ 0,1,2 ], stuff : { three : 3, four : 4, five : 5 } } } }
show_debug_message(new_struct);         // { thing : { a : 0, b : 1, c : 2 }, stuff : { thing : { thing : [ 0,1,2 ], stuff : { three : 3, four : 4, five : 5 } } } }

// But aren't holding the same references
show_debug_message(array == new_array);                                     // false
show_debug_message(array[0] == new_array[0]);                               // false
show_debug_message(array[1] == new_array[1]);                               // false
show_debug_message(array[2] == new_array[2]);                               // false
show_debug_message(struct == new_struct);                                   // false
show_debug_message(struct.thing == new_struct.thing);                       // false
show_debug_message(struct.stuff == new_struct.stuff);                       // false
show_debug_message(struct.stuff.thing == new_struct.stuff.thing);           // false

// And structs are preserving its types so you can use static fields
new_array[0].func();            // hello!
new_struct.thing.func();        // hello!

// Structs have the same static chain, i.e. are instances of the same constructors
show_debug_message(is_instanceof(struct, Class3));                  // true
show_debug_message(is_instanceof(new_struct, Class3));              // true
show_debug_message(is_instanceof(struct.thing, Class2));            // true
show_debug_message(is_instanceof(new_struct.thing, Class2));        // true
show_debug_message(is_instanceof(struct.thing, Class1));            // true
show_debug_message(is_instanceof(new_struct.thing, Class1));        // true
show_debug_message(is_instanceof(struct.stuff, Class4));            // true
show_debug_message(is_instanceof(new_struct.stuff, Class4));        // true