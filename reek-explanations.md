# Reek Explanations

## Attribute: @instance_variable is a writable attribute
[https://github.com/troessner/reek/blob/v6.0.1/docs/Attribute.md]
  My explanation -> Make @instance_variable an attr_reader only. Create a method inside that Class that receives a message to update the @instance_variable. (class encapsulation)

## ControlParameter: Class#method_name is controlled by (argument)
[https://github.com/troessner/reek/blob/v6.0.1/docs/Control-Parameter.md]
  My explanation -> Do not make conditionals in methods controls by the argument
  Documentation -> A typical easy solution is to remove the method altogether and to move the conditionals to the method that called this one.

## DuplicateMethodCall: Class#method_name calls 'something' 2 times
[https://github.com/troessner/reek/blob/v6.0.1/docs/Duplicate-Method-Call.md]
  My explanation -> Refactor code to not need to call same thing multiple times.

## UncommunicativeParameterName: Class#method_name has the parameter name 'name1'
[https://github.com/troessner/reek/blob/v6.0.1/docs/Uncommunicative-Parameter-Name.md]
  My explanation -> Do not use 1 or 2 in variable names, or use a single-letter.

## InstanceVariableAssumption: Class assumes too much for '@instance_variable'
[https://github.com/troessner/reek/blob/v6.0.1/docs/Instance-Variable-Assumption.md]
  My explanation -> Put @instance_variables in initialize method

## TooManyStatements: Class#method_name has approx + statements
[https://github.com/troessner/reek/blob/v6.0.1/docs/Too-Many-Statements.md]
  My explanation -> Method needs to be simplified/shortened. Create helper method?

## UtilityFunction: Class#method_name doesn't depend on instance state (maybe move it to another class?)
[https://github.com/troessner/reek/blob/v6.0.1/docs/Utility-Function.md]
  My explanation -> If method is important to the app & should stay public to be tested create another class.
  If method can be private & does not need to be tested, look at changing reek settings to ignore private methods.

# FeatureEnvy: Class#method_name refers to 'something' more than self (maybe move it to another class?)
[https://github.com/troessner/reek/blob/v6.0.1/docs/Feature-Envy.md]
  My explanation -> There must be something which 'knows' about the contents or purposes of the arguments.
  (Tended to ignore this one based on various research)
