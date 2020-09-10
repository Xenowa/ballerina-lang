// Copyright (c) 2018 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/java;

const string assertFailureErrorCategory = "assert-failure";
const string arraysNotEqualMessage = "Arrays are not equal";
const string arrayLengthsMismatchMessage = " (Array lengths are not the same)";

# The error struct for assertion errors.
#
# + message - The assertion error message
# + cause - The error which caused the assertion error
# + category - The assert error category
type AssertError record {
    string message = "";
    error? cause = ();
    string category = "";
};

# Creates an AssertError with custom message and category.
#
# + errorMessage - Custom message for the ballerina error
# + category - error category
#
# + return - an AssertError with custom message and category
public function createBallerinaError(string errorMessage, string category) returns error {
    error e = error(errorMessage);
    return e;
}

# Asserts whether the given condition is true. If it is not, a AssertError is thrown with the given errorMessage.
#
# + condition - Boolean condition to evaluate
# + msg - Assertion error message
public function assertTrue(boolean condition, string msg = "Assertion Failed!") {
    if (!condition) {
        panic createBallerinaError(msg, assertFailureErrorCategory);
    }
}

# Asserts whether the given condition is false. If it is not, a AssertError is thrown with the given errorMessage.
#
# + condition - Boolean condition to evaluate
# + msg - Assertion error message
public function assertFalse(boolean condition, string msg = "Assertion Failed!") {
    if (condition) {
        panic createBallerinaError(msg, assertFailureErrorCategory);
    }
}

# Asserts whether the given values are equal. If it is not, an AssertError is thrown with the given errorMessage.
#
# + actual - Actual value
# + expected - Expected value
# + msg - Assertion error message
public function assertEquals(anydata|error actual, anydata|error expected, string msg = "Assertion Failed!") {
    boolean isEqual = (actual == expected);
    if (!isEqual) {
        string expectedStr = sprintf("%s", expected);
        string expectedType = getBallerinaType(expected);
        string actualStr = sprintf("%s", actual);
        string actualType = getBallerinaType(actual);
        string errorMsg = "";
        if (expectedType != actualType) {
            errorMsg = string `${msg}: expected '<${expectedType}>${expectedStr}' but found '<${actualType}>${actualStr}'`;
        } else {
            errorMsg = string `${msg}: expected '${expectedStr}' but found '${actualStr}'`;
        }
        panic createBallerinaError(errorMsg, assertFailureErrorCategory);
    }
}

# Asserts whether the given values are not equal. If it is equal, an AssertError is thrown with the given errorMessage.
#
# + actual - Actual value
# + expected - Expected value
# + msg - Assertion error message
public function assertNotEquals(anydata|error actual, anydata|error expected, string msg = "Assertion Failed!") {
    boolean isEqual = (actual == expected);
    if (isEqual) {
        string expectedStr = sprintf("%s", expected);
        string actualStr = sprintf("%s", actual);
        string errorMsg = string `${msg}: expected the actual value not to be '${expectedStr}'`;
        panic createBallerinaError(errorMsg, assertFailureErrorCategory);
    }
}

# Asserts whether the given values are exactly equal. If it is not, an AssertError is thrown with the given errorMessage.
#
# + actual - Actual value
# + expected - Expected value
# + msg - Assertion error message
public function assertExactEquals(any|error actual, any|error expected, string msg = "Assertion Failed!") {
    boolean isEqual = (actual === expected);
    if (!isEqual) {
        string expectedStr = sprintf("%s", expected);
        string expectedType = getBallerinaType(expected);
        string actualStr = sprintf("%s", actual);
        string actualType = getBallerinaType(actual);
        string errorMsg = "";
        if (expectedType != actualType) {
            errorMsg = string `${msg}: expected '<${expectedType}>${expectedStr}' but found '<${actualType}>${actualStr}'`;
        } else {
            errorMsg = string `${msg}: expected '${expectedStr}' but found '${actualStr}'`;
        }
        panic createBallerinaError(errorMsg, assertFailureErrorCategory);
    }
}

# Asserts whether the given values are not exactly equal. If it is equal, an AssertError is thrown with the given errorMessage.
#
# + actual - Actual value
# + expected - Expected value
# + msg - Assertion error message
public function assertNotExactEquals(any|error actual, any|error expected, string msg = "Assertion Failed!") {
    boolean isEqual = (actual === expected);
    if (isEqual) {
        string expectedStr = sprintf("%s", expected);
        string actualStr = sprintf("%s", actual);
        string errorMsg = string `${msg}: expected '${expectedStr}' but found '${actualStr}'`;
        panic createBallerinaError(errorMsg, assertFailureErrorCategory);
    }
}

# Assert failure is triggered based on user discretion. AssertError is thrown with the given errorMessage.
#
# + msg - Assertion error message
public function assertFail(string msg = "Test Failed!") {
    panic createBallerinaError(msg, assertFailureErrorCategory);
}

function sprintf(string format, (any|error)... args) returns string = @java:Method {
    name : "sprintf",
    class : "org.ballerinalang.testerina.natives.io.Sprintf"
} external;

function getBallerinaType((any|error) value) returns string = @java:Method {
    name : "getBallerinaType",
    class : "org.ballerinalang.testerina.core.BallerinaTypeCheck"
} external;
