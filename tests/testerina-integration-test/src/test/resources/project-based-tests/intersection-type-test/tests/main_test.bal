// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

import ballerina/test;

type ImmutableRecordType readonly & RecordType;
type ImmutableObjectType readonly & ObjectType;
type ImmutableClassType readonly & ClassType;
type ImmutableObjectOrRecordType readonly & ObjectOrRecordType;

@test:Config {
}
function testIntersectionTypes() {
    Uuid uuid = {timeLow: 1, timeMid: 2, timeHiAndVersion: 3, clockSeqHiAndReserved: 4, clockSeqLo: 5, node: 6};
    Uuid returnVal = testIntersection();
    test:assertEquals(returnVal, uuid);
}
