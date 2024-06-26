/*
 * Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com).
 *
 * WSO2 LLC. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package org.wso2.ballerinalang.compiler.bir.codegen.internal;

import org.wso2.ballerinalang.compiler.bir.model.BIRInstruction;

/**
 * A data holder to information of lambda function.
 *
 * @since 2201.10.0
 */
public class LambdaFunction {

    public String lambdaName;

    public String enclosingClass;

    public BIRInstruction callInstruction;

    public LambdaFunction(String lambdaName, String enclosingClass, BIRInstruction callInstruction) {
        this.lambdaName = lambdaName;
        this.enclosingClass = enclosingClass;
        this.callInstruction = callInstruction;
    }
}
