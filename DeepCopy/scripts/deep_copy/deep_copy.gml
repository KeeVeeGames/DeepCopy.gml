/// @function                       deep_copy(ref)
/// @param {T} ref                  Thing to deep copy
/// @returns {T}                    New array, or new struct, or new instance of the class, anything else (real / string / etc.) will be returned as-is
/// @description                    Returns a deep recursive copy of the provided array / struct / constructed struct
function deep_copy(ref) {
    var ref_new;
    
    if (is_array(ref)) {
        ref_new = array_create(array_length(ref));
        
        var length = array_length(ref_new);
        
        for (var i = 0; i < length; i++) {
            ref_new[i] = deep_copy(ref[i]);
        }
        
        return ref_new;
    }
    else if (is_struct(ref)) {
        var base = instanceof(ref);
        
        switch (base) {
            case "struct":
            case "weakref":
                ref_new = {};
                break;
                
            default:
                var constr = method(undefined, asset_get_index(base));
                ref_new = new constr();
        }
        
        var names = variable_struct_get_names(ref);
        var length = variable_struct_names_count(ref);
        
        for (var i = 0; i < length; i++) {
            var name = names[i];
            
            variable_struct_set(ref_new, name, deep_copy(variable_struct_get(ref, name)));
        }
        
        return ref_new;
    } else {
        return ref;
    }
}

// GMEdit hint
/// @hint deep_copy(ref:T)->T Returns a deep recursive copy of the provided array / struct / constructed struct