// Copyright (c) 2023 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

type Foo decimal|2f;
type Foo2 decimal|3d|1|5d|3f|4d|2f|7d|6;
type Foo3 decimal|5d|3f|4d|2f|7d;
type Foo4 decimal|5d|4d|7d;
type Foo5 decimal|4d|2f|3.0|2.1|1;

function testNumericLiteralAssignmentNegative() {
    Foo _ = 3; //error: incompatible types: expected 'Foo', found 'float'
    Foo _ = 2;
    Foo _ = 2.0;
    Foo _ = 1.0; //error: incompatible types: expected 'Foo', found 'float'
    Foo _ = 1.2; //error: incompatible types: expected 'Foo', found 'float'
    Foo _ = 2f;
    Foo _ = 3f; //error: incompatible types: expected 'Foo', found 'float'
    Foo _ = 2d;
    Foo _ = 3d;
    Foo2 _ = 1;
    Foo2 _ = 2; // error: incompatible types: expected 'Foo2', found 'int'
    Foo2 _ = 3; // error: incompatible types: expected 'Foo2', found 'int'
    Foo2 _ = 4; // error: incompatible types: expected 'Foo2', found 'int'
    Foo2 _ = 5; // error: incompatible types: expected 'Foo2', found 'int'
    Foo2 _ = 6;
    Foo2 _ = 7; // error: incompatible types: expected 'Foo2', found 'int'
    Foo2 _ = 7.1; // error: incompatible types: expected 'Foo2', found 'float'
    Foo3 _ = 2;
    Foo3 _ = 3;
    Foo3 _ = 4; // error: incompatible types: expected 'Foo3', found 'float'
    Foo3 _ = 5; // error: incompatible types: expected 'Foo3', found 'float'
    Foo3 _ = 7; // error: incompatible types: expected 'Foo3', found 'float'
    Foo3 _ = 7.1; // error: incompatible types: expected 'Foo3', found 'float'
    Foo4 _ = 1;
    Foo4 _ = 2;
    Foo4 _ = 3;
    Foo4 _ = 4;
    Foo4 _ = 5;
    Foo4 _ = 7;
    Foo4 _ = 7.1;
    Foo5 _ = 4; //error: incompatible types: expected 'Foo5', found 'int'
    Foo5 _ = 4.0; //error: incompatible types: expected 'Foo5', found 'float'
    Foo5 _ = 5.0; //error: incompatible types: expected 'Foo5', found 'float'
    Foo5 _ = 5.2; //error: incompatible types: expected 'Foo5', found 'float'
    Foo5 _ = 4f; //error: incompatible types: expected 'Foo5', found 'float'
    Foo5 _ = 4d;
    Foo5 _ = 5f; //error: incompatible types: expected 'Foo5', found 'float'
    Foo5 _ = 5d;
    Foo5 _ = 2.0;
    Foo5 _ = 2; //error: incompatible types: expected 'Foo5', found 'int'
    Foo5 _ = 6.0; //error: incompatible types: expected 'Foo5', found 'float'
    Foo5 _ = 6.2; //error: incompatible types: expected 'Foo5', found 'float'
    Foo5 _ = 2f;
    Foo5 _ = 2d;
    Foo5 _ = 6f; //error: incompatible types: expected 'Foo5', found 'float'
    Foo5 _ = 6d;
    Foo5 _ = 3.0;
    Foo5 _ = 3; //error: incompatible types: expected 'Foo5', found 'int'
    Foo5 _ = 7.0; //error: incompatible types: expected 'Foo5', found 'float'
    Foo5 _ = 7.2; //error: incompatible types: expected 'Foo5', found 'float'
    Foo5 _ = 3f;
    Foo5 _ = 3d;
    Foo5 _ = 7f; //error: incompatible types: expected 'Foo5', found 'float'
    Foo5 _ = 7d;
    Foo5 _ = 1;
    Foo5 _ = 10; //error: incompatible types: expected 'Foo5', found 'int'
    Foo5 _ = 1.0; //error: incompatible types: expected 'Foo5', found 'float'
    Foo5 _ = 1.2; //error: incompatible types: expected 'Foo5', found 'float'
    Foo5 _ = 1f; //error: incompatible types: expected 'Foo5', found 'float'
    Foo5 _ = 1d;
    Foo5 _ = 10f; //error: incompatible types: expected 'Foo5', found 'float'
    Foo5 _ = 10d;
    Foo5 _ = 2.1;
    Foo5 _ = 2.1f;
    Foo5 _ = 2.1d;
    Foo5 _ = 8.0; //error: incompatible types: expected 'Foo5', found 'float'
    Foo5 _ = 8.2; //error: incompatible types: expected 'Foo5', found 'float'
    Foo5 _ = 8d;
    Foo5 _ = 8f; //error: incompatible types: expected 'Foo5', found 'float'
    Foo5 _ = 9.0; //error: incompatible types: expected 'Foo5', found 'float'
    Foo5 _ = 9.2; //error: incompatible types: expected 'Foo5', found 'float'
    Foo5 _ = 9d;
    Foo5 _ = 9f; //error: incompatible types: expected 'Foo5', found 'float'
    Foo5 _ = 24; //error: incompatible types: expected 'Foo5', found 'int'
}

function testNumericLiteralAssignmentNegative2() {
    decimal|4d _ = 8.0;
    decimal|4d _ = 8.2;
    decimal|4d _ = 8d;
    decimal|4d _ = 8f; //error: incompatible types: expected 'decimal|4d', found 'float'
    decimal|4d _ = 4;
    decimal|4d _ = 4.0;
    decimal|4d _ = 5.0;
    decimal|4d _ = 5.2;
    decimal|4d _ = 4f; //error: incompatible types: expected 'decimal|4d', found 'float'
    decimal|4d _ = 4d;
    decimal|4d _ = 5f; //error: incompatible types: expected 'decimal|4d', found 'float'
    decimal|4d _ = 5d;
    decimal|float _ = 8.0;
    decimal|float _ = 8.2;
    decimal|float _ = 8d;
    decimal|float _ = 8f;
    decimal|float _ = 9.0;
    decimal|float _ = 9.2;
    decimal|float _ = 9d;
    decimal|float _ = 9f;
    decimal|2f _ = 8.0; //error: incompatible types: expected 'decimal|2f', found 'float'
    decimal|2f _ = 8.2; //error: incompatible types: expected 'decimal|2f', found 'float'
    decimal|2f _ = 8d;
    decimal|2f _ = 8f; //error: incompatible types: expected 'decimal|2f', found 'float'
    decimal|2f _ = 2.0;
    decimal|2f _ = 2;
    decimal|2f _ = 6.0; //error: incompatible types: expected 'decimal|2f', found 'float'
    decimal|2f _ = 6.2; //error: incompatible types: expected 'decimal|2f', found 'float'
    decimal|2f _ = 2f;
    decimal|2f _ = 2d;
    decimal|2f _ = 6f; //error: incompatible types: expected 'decimal|2f', found 'float'
    decimal|2f _ = 6d;
    decimal|3.0 _ = 8.0; //error: incompatible types: expected 'decimal|3.0', found 'float'
    decimal|3.0 _ = 8.2; //error: incompatible types: expected 'decimal|3.0', found 'float'
    decimal|3.0 _ = 8d;
    decimal|3.0 _ = 8f; //error: incompatible types: expected 'decimal|3.0', found 'float'
    decimal|3.0 _ = 3.0;
    decimal|3.0 _ = 3;
    decimal|3.0 _ = 7.0; //error: incompatible types: expected 'decimal|3.0', found 'float'
    decimal|3.0 _ = 7.2; //error: incompatible types: expected 'decimal|3.0', found 'float'
    decimal|3.0 _ = 3f;
    decimal|3.0 _ = 3d;
    decimal|3.0 _ = 7f; //error: incompatible types: expected 'decimal|3.0', found 'float'
    decimal|3.0 _ = 7d;
    decimal|1 _ = 8.0;
    decimal|1 _ = 8.2;
    decimal|1 _ = 8d;
    decimal|1 _ = 8f; //error: incompatible types: expected 'decimal|1', found 'float'
    decimal|1 _ = 1;
    decimal|1 _ = 10; //error: incompatible types: expected 'decimal|1', found 'int'
    decimal|1 _ = 1.0;
    decimal|1 _ = 1.2;
    decimal|1 _ = 1f; //error: incompatible types: expected 'decimal|1', found 'float'
    decimal|1 _ = 1d;
    decimal|1 _ = 10f; //error: incompatible types: expected 'decimal|1', found 'float'
    decimal|1 _ = 10d;
    decimal|byte _ = 8.0;
    decimal|byte _ = 8.2;
    decimal|byte _ = 8d;
    decimal|byte _ = 8f; //error: incompatible types: expected 'decimal|byte', found 'float'
    decimal|byte _ = 24;
    decimal|2.1 _ = 8.0; //error: incompatible types: expected 'decimal|2.1', found 'float'
    decimal|2.1 _ = 8.2; //error: incompatible types: expected 'decimal|2.1', found 'float'
    decimal|2.1 _ = 8d;
    decimal|2.1 _ = 8f; //error: incompatible types: expected 'decimal|2.1', found 'float'
    decimal|2.1 _ = 2.1;
    decimal|2.1 _ = 2.1f;
    decimal|2.1 _ = 2.1d;
    4d|float _ = 4;
    4d|float _ = 4.0;
    4d|float _ = 5.0;
    4d|float _ = 5.2;
    4d|float _ = 4f;
    4d|float _ = 4d;
    4d|float _ = 5f;
    4d|float _ = 5d; //error: incompatible types: expected '4d|float', found 'decimal'
    4d|float _ = 9.0;
    4d|float _ = 9.2;
    4d|float _ = 9d; //error: incompatible types: expected '4d|float', found 'decimal'
    4d|float _ = 9f;
    4d|float _ = 5;
    4d|2f _ = 4; //error: incompatible types: expected '4d|2f', found 'float'
    4d|2f _ = 4.0; //error: incompatible types: expected '4d|2f', found 'float'
    4d|2f _ = 5.0; //error: incompatible types: expected '4d|2f', found 'float'
    4d|2f _ = 5.2; //error: incompatible types: expected '4d|2f', found 'float'
    4d|2f _ = 4f; //error: incompatible types: expected '4d|2f', found 'float'
    4d|2f _ = 4d;
    4d|2f _ = 5f; //error: incompatible types: expected '4d|2f', found 'float'
    4d|2f _ = 5d; //error: incompatible types: expected '4d|2f', found 'decimal'
    4d|2f _ = 2.0;
    4d|2f _ = 2;
    4d|2f _ = 6.0; //error: incompatible types: expected '4d|2f', found 'float'
    4d|2f _ = 6.2; //error: incompatible types: expected '4d|2f', found 'float'
    4d|2f _ = 2f;
    4d|2f _ = 2d; //error: incompatible types: expected '4d|2f', found 'decimal'
    4d|2f _ = 6f; //error: incompatible types: expected '4d|2f', found 'float'
    4d|2f _ = 6d; //error: incompatible types: expected '4d|2f', found 'decimal'
    4d|3.0 _ = 4; //error: incompatible types: expected '4d|3.0', found 'float'
    4d|3.0 _ = 4.0; //error: incompatible types: expected '4d|3.0', found 'float'
    4d|3.0 _ = 5.0; //error: incompatible types: expected '4d|3.0', found 'float'
    4d|3.0 _ = 5.2; //error: incompatible types: expected '4d|3.0', found 'float'
    4d|3.0 _ = 4f; //error: incompatible types: expected '4d|3.0', found 'float'
    4d|3.0 _ = 4d;
    4d|3.0 _ = 5f; //error: incompatible types: expected '4d|3.0', found 'float'
    4d|3.0 _ = 5d; //error: incompatible types: expected '4d|3.0', found 'decimal'
    4d|3.0 _ = 3.0;
    4d|3.0 _ = 3;
    4d|3.0 _ = 7.0; //error: incompatible types: expected '4d|3.0', found 'float'
    4d|3.0 _ = 7.2; //error: incompatible types: expected '4d|3.0', found 'float'
    4d|3.0 _ = 3f;
    4d|3.0 _ = 3d; //error: incompatible types: expected '4d|3.0', found 'decimal'
    4d|3.0 _ = 7f; //error: incompatible types: expected '4d|3.0', found 'float'
    4d|3.0 _ = 7d; //error: incompatible types: expected '4d|3.0', found 'decimal'
    4d|1 _ = 4; //error: incompatible types: expected '4d|1', found 'int'
    4d|1 _ = 4.0;
    4d|1 _ = 5.0; //error: incompatible types: expected '4d|1', found 'decimal'
    4d|1 _ = 5.2; //error: incompatible types: expected '4d|1', found 'decimal'
    4d|1 _ = 4f; //error: incompatible types: expected '4d|1', found 'float'
    4d|1 _ = 4d;
    4d|1 _ = 5f; //error: incompatible types: expected '4d|1', found 'float'
    4d|1 _ = 5d; //error: incompatible types: expected '4d|1', found 'decimal'
    4d|1 _ = 1;
    4d|1 _ = 10; //error: incompatible types: expected '4d|1', found 'int'
    4d|1 _ = 1.0; //error: incompatible types: expected '4d|1', found 'decimal'
    4d|1 _ = 1.2; //error: incompatible types: expected '4d|1', found 'decimal'
    4d|1 _ = 1f; //error: incompatible types: expected '4d|1', found 'float'
    4d|1 _ = 1d; //error: incompatible types: expected '4d|1', found 'decimal'
    4d|1 _ = 10f; //error: incompatible types: expected '4d|1', found 'float'
    4d|1 _ = 10d; //error: incompatible types: expected '4d|1', found 'decimal'
    4d|byte _ = 4;
    4d|byte _ = 5;
    4d|byte _ = 4.0;
    4d|byte _ = 5.0; //error: incompatible types: expected '4d|byte', found 'decimal'
    4d|byte _ = 5.2; //error: incompatible types: expected '4d|byte', found 'decimal'
    4d|byte _ = 4f; //error: incompatible types: expected '4d|byte', found 'float'
    4d|byte _ = 4d;
    4d|byte _ = 5f; //error: incompatible types: expected '4d|byte', found 'float'
    4d|byte _ = 5d; //error: incompatible types: expected '4d|byte', found 'decimal'
    4d|byte _ = 24;
    4d|2.1 _ = 4; //error: incompatible types: expected '4d|2.1', found 'float'
    4d|2.1 _ = 4.0; //error: incompatible types: expected '4d|2.1', found 'float'
    4d|2.1 _ = 5.0; //error: incompatible types: expected '4d|2.1', found 'float'
    4d|2.1 _ = 5.2; //error: incompatible types: expected '4d|2.1', found 'float'
    4d|2.1 _ = 4f; //error: incompatible types: expected '4d|2.1', found 'float'
    4d|2.1 _ = 4d;
    4d|2.1 _ = 5f; //error: incompatible types: expected '4d|2.1', found 'float'
    4d|2.1 _ = 5d; //error: incompatible types: expected '4d|2.1', found 'decimal'
    4d|2.1 _ = 2.1;
    4d|2.1 _ = 2.1f;
    4d|2.1 _ = 2.1d; //error: incompatible types: expected '4d|2.1', found 'decimal'
    float|2f _ = 9.0;
    float|2f _ = 9.2;
    float|2f _ = 9d; //error: incompatible types: expected 'float|2f', found 'decimal'
    float|2f _ = 9f;
    float|2f _ = 2.0;
    float|2f _ = 2;
    float|2f _ = 6.0;
    float|2f _ = 6.2;
    float|2f _ = 2f;
    float|2f _ = 2d; //error: incompatible types: expected 'float|2f', found 'decimal'
    float|2f _ = 6f;
    float|2f _ = 6d; //error: incompatible types: expected 'float|2f', found 'decimal'
    float|3.0 _ = 9.0;
    float|3.0 _ = 9.2;
    float|3.0 _ = 9d; //error: incompatible types: expected 'float|3.0', found 'decimal'
    float|3.0 _ = 9f;
    float|3.0 _ = 3.0;
    float|3.0 _ = 3;
    float|3.0 _ = 7.0;
    float|3.0 _ = 7.2;
    float|3.0 _ = 3f;
    float|3.0 _ = 3d; //error: incompatible types: expected 'float|3.0', found 'decimal'
    float|3.0 _ = 7f;
    float|3.0 _ = 7d; //error: incompatible types: expected 'float|3.0', found 'decimal'
    float|1 _ = 9.0;
    float|1 _ = 9.2;
    float|1 _ = 9d; //error: incompatible types: expected 'float|1', found 'decimal'
    float|1 _ = 9f;
    float|1 _ = 1;
    float|1 _ = 10; //error: incompatible types: expected 'float|1', found 'int'
    float|1 _ = 1.0;
    float|1 _ = 1.2;
    float|1 _ = 1f;
    float|1 _ = 1d; //error: incompatible types: expected 'float|1', found 'decimal'
    float|1 _ = 10f;
    float|1 _ = 10d; //error: incompatible types: expected 'float|1', found 'decimal'
    float|byte _ = 9.0;
    float|byte _ = 9.2;
    float|byte _ = 9d; //error: incompatible types: expected 'float|byte', found 'decimal'
    float|byte _ = 9f;
    float|byte _ = 24;
    float|2.1 _ = 9.0;
    float|2.1 _ = 9.2;
    float|2.1 _ = 9d; //error: incompatible types: expected 'float|2.1', found 'decimal'
    float|2.1 _ = 9f;
    float|2.1 _ = 2.1;
    float|2.1 _ = 2.1f;
    float|2.1 _ = 2.1d; //error: incompatible types: expected 'float|2.1', found 'decimal'
    2f|3.0 _ = 2.0;
    2f|3.0 _ = 2;
    2f|3.0 _ = 6.0; //error: incompatible types: expected '2f|3.0', found 'float'
    2f|3.0 _ = 6.2; //error: incompatible types: expected '2f|3.0', found 'float'
    2f|3.0 _ = 2f;
    2f|3.0 _ = 2d; //error: incompatible types: expected '2f|3.0', found 'decimal'
    2f|3.0 _ = 6f; //error: incompatible types: expected '2f|3.0', found 'float'
    2f|3.0 _ = 6d; //error: incompatible types: expected '2f|3.0', found 'decimal'
    2f|3.0 _ = 3.0;
    2f|3.0 _ = 3;
    2f|3.0 _ = 7.0; //error: incompatible types: expected '2f|3.0', found 'float'
    2f|3.0 _ = 7.2; //error: incompatible types: expected '2f|3.0', found 'float'
    2f|3.0 _ = 3f;
    2f|3.0 _ = 3d; //error: incompatible types: expected '2f|3.0', found 'decimal'
    2f|3.0 _ = 7f; //error: incompatible types: expected '2f|3.0', found 'float'
    2f|3.0 _ = 7d; //error: incompatible types: expected '2f|3.0', found 'decimal'
    2f|1 _ = 2.0;
    2f|1 _ = 2; //error: incompatible types: expected '2f|1', found 'int'
    2f|1 _ = 6.0; //error: incompatible types: expected '2f|1', found 'float'
    2f|1 _ = 6.2; //error: incompatible types: expected '2f|1', found 'float'
    2f|1 _ = 2f;
    2f|1 _ = 2d; //error: incompatible types: expected '2f|1', found 'decimal'
    2f|1 _ = 6f; //error: incompatible types: expected '2f|1', found 'float'
    2f|1 _ = 6d; //error: incompatible types: expected '2f|1', found 'decimal'
    2f|1 _ = 1;
    2f|1 _ = 10; //error: incompatible types: expected '2f|1', found 'int'
    2f|1 _ = 1.0; //error: incompatible types: expected '2f|1', found 'float'
    2f|1 _ = 1.2; //error: incompatible types: expected '2f|1', found 'float'
    2f|1 _ = 1f; //error: incompatible types: expected '2f|1', found 'float'
    2f|1 _ = 1d; //error: incompatible types: expected '2f|1', found 'decimal'
    2f|1 _ = 10f; //error: incompatible types: expected '2f|1', found 'float'
    2f|1 _ = 10d; //error: incompatible types: expected '2f|1', found 'decimal'
    2f|byte _ = 2.0;
    2f|byte _ = 3;
    2f|byte _ = 6.0; //error: incompatible types: expected '2f|byte', found 'float'
    2f|byte _ = 6.2; //error: incompatible types: expected '2f|byte', found 'float'
    2f|byte _ = 2f;
    2f|byte _ = 2d; //error: incompatible types: expected '2f|byte', found 'decimal'
    2f|byte _ = 6f; //error: incompatible types: expected '2f|byte', found 'float'
    2f|byte _ = 6d; //error: incompatible types: expected '2f|byte', found 'decimal'
    2f|byte _ = 24;
    2f|2.1 _ = 2.0;
    2f|2.1 _ = 2;
    2f|2.1 _ = 6.0; //error: incompatible types: expected '2f|2.1', found 'float'
    2f|2.1 _ = 6.2; //error: incompatible types: expected '2f|2.1', found 'float'
    2f|2.1 _ = 2f;
    2f|2.1 _ = 2d; //error: incompatible types: expected '2f|2.1', found 'decimal'
    2f|2.1 _ = 6f; //error: incompatible types: expected '2f|2.1', found 'float'
    2f|2.1 _ = 6d; //error: incompatible types: expected '2f|2.1', found 'decimal'
    2f|2.1 _ = 2.1;
    2f|2.1 _ = 2.1f;
    2f|2.1 _ = 2.1d; //error: incompatible types: expected '2f|2.1', found 'decimal'
    3.0|1 _ = 3.0;
    3.0|1 _ = 3; //error: incompatible types: expected '3.0|1', found 'int'
    3.0|1 _ = 7.0; //error: incompatible types: expected '3.0|1', found 'float'
    3.0|1 _ = 7.2; //error: incompatible types: expected '3.0|1', found 'float'
    3.0|1 _ = 3f;
    3.0|1 _ = 3d; //error: incompatible types: expected '3.0|1', found 'decimal'
    3.0|1 _ = 7f; //error: incompatible types: expected '3.0|1', found 'float'
    3.0|1 _ = 7d; //error: incompatible types: expected '3.0|1', found 'decimal'
    3.0|1 _ = 1;
    3.0|1 _ = 10; //error: incompatible types: expected '3.0|1', found 'int'
    3.0|1 _ = 1.0; //error: incompatible types: expected '3.0|1', found 'float'
    3.0|1 _ = 1.2; //error: incompatible types: expected '3.0|1', found 'float'
    3.0|1 _ = 1f; //error: incompatible types: expected '3.0|1', found 'float'
    3.0|1 _ = 1d; //error: incompatible types: expected '3.0|1', found 'decimal'
    3.0|1 _ = 10f; //error: incompatible types: expected '3.0|1', found 'float'
    3.0|1 _ = 10d; //error: incompatible types: expected '3.0|1', found 'decimal'
    3.0|byte _ = 3.0;
    3.0|byte _ = 3;
    3.0|byte _ = 7.0; //error: incompatible types: expected '3.0|byte', found 'float'
    3.0|byte _ = 7.2; //error: incompatible types: expected '3.0|byte', found 'float'
    3.0|byte _ = 3f;
    3.0|byte _ = 3d; //error: incompatible types: expected '3.0|byte', found 'decimal'
    3.0|byte _ = 7f; //error: incompatible types: expected '3.0|byte', found 'float'
    3.0|byte _ = 7d; //error: incompatible types: expected '3.0|byte', found 'decimal'
    3.0|byte _ = 24;
    3.0|2.1 _ = 3.0;
    3.0|2.1 _ = 3;
    3.0|2.1 _ = 7.0; //error: incompatible types: expected '3.0|2.1', found 'float'
    3.0|2.1 _ = 7.2; //error: incompatible types: expected '3.0|2.1', found 'float'
    3.0|2.1 _ = 3f;
    3.0|2.1 _ = 3d; //error: incompatible types: expected '3.0|2.1', found 'decimal'
    3.0|2.1 _ = 7f; //error: incompatible types: expected '3.0|2.1', found 'float'
    3.0|2.1 _ = 7d; //error: incompatible types: expected '3.0|2.1', found 'decimal'
    3.0|2.1 _ = 2.1;
    3.0|2.1 _ = 2.1f;
    3.0|2.1 _ = 2.1d; //error: incompatible types: expected '3.0|2.1', found 'decimal'
    3.0|2.1 _ = 10; //error: incompatible types: expected '3.0|2.1', found 'float'
    1|byte _ = 1;
    1|byte _ = 10;
    1|byte _ = 1.0; //error: incompatible types: expected '1|byte', found 'float'
    1|byte _ = 1.2; //error: incompatible types: expected '1|byte', found 'float'
    1|byte _ = 1f; //error: incompatible types: expected '1|byte', found 'float'
    1|byte _ = 1d; //error: incompatible types: expected '1|byte', found 'decimal'
    1|byte _ = 10f; //error: incompatible types: expected '1|byte', found 'float'
    1|byte _ = 10d; //error: incompatible types: expected '1|byte', found 'decimal'
    1|byte _ = 24;
    1|2.1 _ = 1;
    1|2.1 _ = 10; //error: incompatible types: expected '1|2.1', found 'int'
    1|2.1 _ = 1.0; //error: incompatible types: expected '1|2.1', found 'float'
    1|2.1 _ = 1.2; //error: incompatible types: expected '1|2.1', found 'float'
    1|2.1 _ = 1f; //error: incompatible types: expected '1|2.1', found 'float'
    1|2.1 _ = 1d; //error: incompatible types: expected '1|2.1', found 'decimal'
    1|2.1 _ = 10f; //error: incompatible types: expected '1|2.1', found 'float'
    1|2.1 _ = 10d; //error: incompatible types: expected '1|2.1', found 'decimal'
    1|2.1 _ = 2.1;
    1|2.1 _ = 2.1f;
    1|2.1 _ = 2.1d; //error: incompatible types: expected '1|2.1', found 'decimal'
    byte|2.1 _ = 24;
    byte|2.1 _ = 2.1;
    byte|2.1 _ = 2.1f;
    byte|2.1 _ = 2.1d; //error: incompatible types: expected 'byte|2.1', found 'decimal'
    byte|decimal _ = 1;
    byte|int _ = 3;
}
