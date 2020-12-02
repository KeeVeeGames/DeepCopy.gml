# DeepCopy.gml

[![Donate](https://img.shields.io/badge/donate-%E2%9D%A4-blue.svg)](https://musnik.itch.io/donate-me) [![License](https://img.shields.io/github/license/KeeVeeGames/DeepCopy.gml)](#!)

This simple script lets you recursively deep copy nested arrays, structs and "class" instances. The syntax is pretty straightforward: `deep_copy(thing)` function will return a new instance of "thing" (new array, new anonymous struct or new "constructed" struct) with the same data and the respectful copies of all nested things.

The method behind this is coming from my [finding](https://twitter.com/KeeVeeGames/status/1294268813807099905) of preserving struct's type / constructor. I also realized that I may create my own [serialization protocol](https://twitter.com/KeeVeeGames/status/1294988076553510912), but that will be released in future.

**Note:**
* Copying ds'es won't deep copy them but pass them through as real numbers.<sup>✶</sup>
* Be mindful about circular references, they will make the algorithm stuck in an infinite loop.<sup>✶</sup>
* There is no way to mark a field to not be "copiable".<sup>✶</sup>
* Copying function references is also not working: it will shallow copy the reference to the original method, as I am not aware of any way to deep copy functions.

<sup>✶</sup> — you may consider using DeepCopy+ and Protoclasses as a part of GMProto framework, that are solving the problem of deep cloning ds'es, preventing circular references, adding the way to mark fields "unserializable" and having better type checking (not currently released, [stay tuned](https://twitter.com/KeeVeeGames)).

## Installation:
Get the latest asset package from the [releases page](../../releases). Import it into IDE.   
Alternatively copy the code from corresponding scripts into your project.

## Example:
```js
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

// Both have identical values
show_debug_message(array);
show_debug_message(new_araay);
show_debug_message(struct);
show_debug_message(new_struct);

// But aren't holding the same references
show_debug_message(array == new_araay);                                     // false
show_debug_message(array[0] == new_araay[0]);                               // false
show_debug_message(array[1] == new_araay[1]);                               // false
show_debug_message(array[2] == new_araay[2]);                               // false
show_debug_message(struct == new_struct);                                   // false
show_debug_message(struct.thing == new_struct.thing);                       // false
show_debug_message(struct.stuff == new_struct.stuff);                       // false
show_debug_message(struct.stuff.thing == new_struct.stuff.thing);           // false

// And structs are preserving its types so you can use static fields
new_araay[0].func();            // hello!
new_struct.thing.func();        // hello!
```

## Author:
Nikita Musatov - [MusNik / KeeVee Games](https://twitter.com/keeveegames)

License: [MIT](https://en.wikipedia.org/wiki/MIT_License)
