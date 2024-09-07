package crowplexus.hscript.proxy;

import crowplexus.hscript.Tools.EnumValue as HEnumValue;

// TODO: for most of these, support hscript enums
// which don't quite work, but here we are
class ProxyType {
	/**
		Returns the class of `o`, if `o` is a class instance.

		If `o` is null or of a different type, null is returned.

		In general, type parameter information cannot be obtained at runtime.
	**/
	inline static function getClass<T>(o: T): Null<Class<T>> {
		return Type.getClass(o);
	}

	/**
		Returns the enum of enum instance `o`.

		An enum instance is the result of using an enum constructor. Given an
		`enum Color { Red; }`, `getEnum(Red)` returns `Enum<Color>`.

		If `o` is null, null is returned.

		In general, type parameter information cannot be obtained at runtime.
	**/
	inline static function getEnum(o: EnumValue): Enum<Dynamic> {
		// TODO: SUPPORT HSCRIPT ENUMS
		return Type.getEnum(o);
	}

	/**
		Returns the super-class of class `c`.

		If `c` has no super class, null is returned.

		If `c` is null, the result is unspecified.

		In general, type parameter information cannot be obtained at runtime.
	**/
	inline static function getSuperClass(c: Class<Dynamic>): Class<Dynamic> {
		return Type.getSuperClass(c);
	}

	/**
		Returns the name of class `c`, including its path.

		If `c` is inside a package, the package structure is returned dot-
		separated, with another dot separating the class name:
		`pack1.pack2.(...).packN.ClassName`
		If `c` is a sub-type of a Haxe module, that module is not part of the
		package structure.

		If `c` has no package, the class name is returned.

		If `c` is null, the result is unspecified.

		The class name does not include any type parameters.
	**/
	inline static function getClassName(c: Class<Dynamic>): String {
		return Type.getClassName(c);
	}

	/**
		Returns the name of enum `e`, including its path.

		If `e` is inside a package, the package structure is returned dot-
		separated, with another dot separating the enum name:
		`pack1.pack2.(...).packN.EnumName`
		If `e` is a sub-type of a Haxe module, that module is not part of the
		package structure.

		If `e` has no package, the enum name is returned.

		If `e` is null, the result is unspecified.

		The enum name does not include any type parameters.
	**/
	inline static function getEnumName(e: Enum<Dynamic>): String {
		var isScripted: Bool = Std.isOfType(e, HEnumValue);
		if (isScripted)
			return cast(e, HEnumValue).getEnumName();
		return Type.getEnumName(e);
	}

	/**
		Resolves a class by name.

		If `name` is the path of an existing class, that class is returned.

		Otherwise null is returned.

		If `name` is null or the path to a different type, the result is
		unspecified.

		The class name must not include any type parameters.
	**/
	inline static function resolveClass(name: String): Class<Dynamic> {
		return Type.resolveClass(name);
	}

	/**
		Resolves an enum by name.

		If `name` is the path of an existing enum, that enum is returned.

		Otherwise null is returned.

		If `name` is null the result is unspecified.

		If `name` is the path to a different type, null is returned.

		The enum name must not include any type parameters.
	**/
	inline static function resolveEnum(name: String): Enum<Dynamic> {
		return Type.resolveEnum(name);
	}

	/**
		Creates an instance of class `cl`, using `args` as arguments to the
		class constructor.

		This function guarantees that the class constructor is called.

		Default values of constructors arguments are not guaranteed to be
		taken into account.

		If `cl` or `args` are null, or if the number of elements in `args` does
		not match the expected number of constructor arguments, or if any
		argument has an invalid type,  or if `cl` has no own constructor, the
		result is unspecified.

		In particular, default values of constructor arguments are not
		guaranteed to be taken into account.
	**/
	inline static function createInstance<T>(cl: Class<T>, args: Array<Dynamic>): T {
		return Type.createInstance(cl, args);
	}

	/**
		Creates an instance of class `cl`.

		This function guarantees that the class constructor is not called.

		If `cl` is null, the result is unspecified.
	**/
	inline static function createEmptyInstance<T>(cl: Class<T>): T {
		return Type.createEmptyInstance(cl);
	}

	/**
		Creates an instance of enum `e` by calling its constructor `constr` with
		arguments `params`.

		If `e` or `constr` is null, or if enum `e` has no constructor named
		`constr`, or if the number of elements in `params` does not match the
		expected number of constructor arguments, or if any argument has an
		invalid type, the result is unspecified.
	**/
	inline static function createEnum<T>(e: Enum<T>, constr: String, ?params: Array<Dynamic>): T {
		// TODO: SUPPORT HSCRIPT ENUMS
		return Type.createEnum(e, constr, params);
	}

	/**
		Creates an instance of enum `e` by calling its constructor number
		`index` with arguments `params`.

		The constructor indices are preserved from Haxe syntax, so the first
		declared is index 0, the next index 1 etc.

		If `e` or `constr` is null, or if enum `e` has no constructor named
		`constr`, or if the number of elements in `params` does not match the
		expected number of constructor arguments, or if any argument has an
		invalid type, the result is unspecified.
	**/
	inline static function createEnumIndex<T>(e: Enum<T>, index: Int, ?params: Array<Dynamic>): T {
		// TODO: SUPPORT HSCRIPT ENUMS
		return Type.createEnumIndex(e, index, params);
	}

	/**
		Returns a list of the instance fields of class `c`, including
		inherited fields.

		This only includes fields which are known at compile-time. In
		particular, using `getInstanceFields(getClass(obj))` will not include
		any fields which were added to `obj` at runtime.

		The order of the fields in the returned Array is unspecified.

		If `c` is null, the result is unspecified.
	**/
	inline static function getInstanceFields(c: Class<Dynamic>): Array<String> {
		return Type.getInstanceFields(c);
	}

	/**
		Returns a list of static fields of class `c`.

		This does not include static fields of parent classes.

		The order of the fields in the returned Array is unspecified.

		If `c` is null, the result is unspecified.
	**/
	inline static function getClassFields(c: Class<Dynamic>): Array<String> {
		return Type.getClassFields(c);
	}

	/**
		Returns a list of the names of all constructors of enum `e`.

		The order of the constructor names in the returned Array is preserved
		from the original syntax.

		If `e` is null, the result is unspecified.
	**/
	inline static function getEnumConstructs(e: Enum<Dynamic>): Array<String> {
		// TODO: SUPPORT HSCRIPT ENUMS
		return Type.getEnumConstructs(e);
	}

	/**
		Returns the runtime type of value `v`.

		The result corresponds to the type `v` has at runtime, which may vary
		per platform. Assumptions regarding this should be minimized to avoid
		surprises.
	**/
	inline static function typeof(v: Dynamic): Type.ValueType {
		return Type.typeof(v);
	}

	/**
		Recursively compares two enum instances `a` and `b` by value.

		Unlike `a == b`, this function performs a deep equality check on the
		arguments of the constructors, if exists.

		If `a` or `b` are null, the result is unspecified.
	**/
	inline static function enumEq(a: Dynamic, b: Dynamic): Bool {
		var isScripted: Bool = Std.isOfType(a, HEnumValue) && Std.isOfType(b, HEnumValue);
		if (isScripted)
			return cast(a, HEnumValue).compare(cast(b, HEnumValue));
		return Type.enumEq(a, b);
	}

	/**
		Returns the constructor name of enum instance `e`.

		The result String does not contain any constructor arguments.

		If `e` is null, the result is unspecified.
	**/
	inline static function enumConstructor(e: Dynamic): String {
		if (Std.isOfType(e, HEnumValue))
			return cast(e, HEnumValue).name;
		return Type.enumConstructor(e);
	}

	/**
		Returns a list of the constructor arguments of enum instance `e`.

		If `e` has no arguments, the result is [].

		Otherwise the result are the values that were used as arguments to `e`,
		in the order of their declaration.

		If `e` is null, the result is unspecified.
	**/
	inline static function enumParameters(e: Dynamic): Array<Dynamic> {
		if (Std.isOfType(e, HEnumValue))
			return cast(e, HEnumValue).args;
		return Type.enumParameters(e);
	}

	/**
		Returns the index of enum instance `e`.

		This corresponds to the original syntactic position of `e`. The index of
		the first declared constructor is 0, the next one is 1 etc.

		If `e` is null, the result is unspecified.
	**/
	inline static function enumIndex(e: Dynamic): Int {
		if (Std.isOfType(e, HEnumValue))
			return cast(e, HEnumValue).index;
		return Type.enumIndex(e);
	}

	/**
		Returns a list of all constructors of enum `e` that require no
		arguments.

		This may return the empty Array `[]` if all constructors of `e` require
		arguments.

		Otherwise an instance of `e` constructed through each of its non-
		argument constructors is returned, in the order of the constructor
		declaration.

		If `e` is null, the result is unspecified.
	**/
	inline static function allEnums<T>(e: Enum<T>): Array<T> {
		// TODO: SUPPORT HSCRIPT ENUMS
		return Type.allEnums(e);
	}
}