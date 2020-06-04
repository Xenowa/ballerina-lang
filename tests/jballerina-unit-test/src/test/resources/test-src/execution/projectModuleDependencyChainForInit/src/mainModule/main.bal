// Copyright (c) 2020 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

import basicModule;
import firstDependentModule;
import secondDependentModule;

import ballerina/io;

int initCount = 0;

function __init() {
    initCount += 1;
	io:println("Initializing module 'mainModule'");
}

public function main() {
    io:println("main function invoked for main module");

    string errorMsg = "Assertion Failed for service - ";
    assertEquals(initCount, 1, errorMsg + "main" );
    assertEquals(firstDependentModule:getInitCount(), 1, errorMsg + "first dependent");
    assertEquals(secondDependentModule:getInitCount(), 1, errorMsg + "second dependent");
    assertEquals(basicModule:getInitCount(), 1, errorMsg + "basic");

}

public function assertEquals(int actual, int expected, string msg) {
    boolean isEqual = actual == expected;
    if (!isEqual) {
        string expectedStr = io:sprintf("%s", expected);
        string actualStr = io:sprintf("%s", actual);
        string errorMsg = string `${msg}: expected '${expectedStr}' but found '${actualStr}'`;
        panic error(errorMsg);
    }
}

listener basicModule:TestListener ep = new basicModule:TestListener("main");
