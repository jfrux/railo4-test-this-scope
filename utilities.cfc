component name="utilities" {
    public any function init() {
        return this;
    }

	public array function mapper(obj, iterator) {
	 		var result = [];

			if (isArray(arguments.obj)) {
				var index = 1;
				var resultIndex = 1;
				for (element in arguments.obj) {
					if (!arrayIsDefined(arguments.obj, index)) {
						index++;
						continue;
					}
					var local = {};
					local.tmp = iterator(element, index, arguments.obj);
					if (structKeyExists(local, "tmp")) {
						result[resultIndex] = local.tmp;
					}
					index++;
					resultIndex++;
				}
			}
			else if (isObject(arguments.obj) || isStruct(arguments.obj)) {
				var index = 1;
				for (key in arguments.obj) {
					var val = arguments.obj[key];
					var local = {};
					local.tmp = iterator(val, key, arguments.obj);
					if (structKeyExists(local, "tmp")) {
						result[index] = local.tmp;
					}
					index++;
				}
			}
			else {
				// query or something else? convert to array and recurse
				result = _.map(toArray(arguments.obj), iterator);
			}

			return result;
	 	}
}