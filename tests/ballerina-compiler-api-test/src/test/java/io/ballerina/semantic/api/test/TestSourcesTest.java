/*
 * Copyright (c) 2020, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 * WSO2 Inc. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package io.ballerina.semantic.api.test;

import io.ballerina.compiler.api.SemanticModel;
import io.ballerina.compiler.api.symbols.Symbol;
import io.ballerina.compiler.api.symbols.TypeDescKind;
import io.ballerina.compiler.api.symbols.TypeSymbol;
import io.ballerina.compiler.syntax.tree.BasicLiteralNode;
import io.ballerina.compiler.syntax.tree.ConstantDeclarationNode;
import io.ballerina.compiler.syntax.tree.NodeVisitor;
import io.ballerina.compiler.syntax.tree.SyntaxTree;
import io.ballerina.projects.Document;
import io.ballerina.projects.DocumentId;
import io.ballerina.projects.Module;
import io.ballerina.projects.Project;
import io.ballerina.tools.diagnostics.Location;
import io.ballerina.tools.text.LineRange;
import org.ballerinalang.test.BCompileUtil;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static io.ballerina.compiler.api.symbols.TypeDescKind.FLOAT;
import static io.ballerina.compiler.api.symbols.TypeDescKind.INT;
import static io.ballerina.semantic.api.test.util.SemanticAPITestUtils.assertList;
import static io.ballerina.semantic.api.test.util.SemanticAPITestUtils.getModule;
import static io.ballerina.semantic.api.test.util.SemanticAPITestUtils.getSymbolNames;
import static io.ballerina.tools.text.LinePosition.from;
import static org.testng.Assert.assertEquals;
import static org.testng.Assert.assertNull;
import static org.testng.Assert.assertTrue;

/**
 * Test cases for the positions of symbols.
 *
 * @since 2.0.0
 */
public class TestSourcesTest {

    private SemanticModel model;
    private Document srcFile;
    private Project project;

    @BeforeClass
    public void setup() {
        this.project = BCompileUtil.loadProject("test-src/test-project");
        Module baz = getModule(project, "baz");
        model = project.currentPackage().getCompilation().getSemanticModel(baz.moduleId());
        DocumentId id = baz.testDocumentIds().iterator().next();
        srcFile = baz.document(id);
    }

    @Test(dataProvider = "SymbolPosProvider")
    public void testSymbolAtCursor(int sLine, int sCol, String expSymbolName) {
        Optional<Symbol> symbol = model.symbol(srcFile, from(sLine, sCol));

        if (symbol.isEmpty()) {
            assertNull(expSymbolName);
        }

        assertEquals(symbol.get().getName().get(), expSymbolName);
    }

    @DataProvider(name = "SymbolPosProvider")
    public Object[][] getSymbolPos() {
        return new Object[][]{
                {18, 7, "Config"},
                {20, 9, "assertEquals"},
                {20, 22, "PI"},
        };
    }

    @Test(dataProvider = "VisibleSymbolPosProvider")
    public void testVisibleSymbols(int line, int col, List<String> expSymbols) {
        List<Symbol> symbols = model.visibleSymbols(srcFile, from(line, col)).stream()
                .filter(sym -> {
                    if (sym.getModule().isEmpty()) {
                        return false;
                    }
                    String moduleName = sym.getModule().get().id().moduleName();
                    return moduleName.equals("semapi.baz") || !moduleName.startsWith("lang.");
                })
                .collect(Collectors.toList());

        assertEquals(symbols.size(), expSymbols.size());
        assertList(symbols, expSymbols);
    }

    @DataProvider(name = "VisibleSymbolPosProvider")
    public Object[][] getVisibleSymbolPos() {
        List<String> moduleSymbols = List.of("PI", "ZERO", "add", "concat", "newPerson", "Person", "Employee",
                                             "BasicType", "PersonObj", "Digit", "FileNotFoundError", "EofError",
                                             "Error", "Address", "IV");
        return new Object[][]{
                {17, 0, getSymbolNames(moduleSymbols, "testConstUse", "testAdd", "test")},
                {26, 31, getSymbolNames(moduleSymbols, "testConstUse", "testAdd", "test", "sum")},
        };
    }

    @Test(dataProvider = "ExprPosProvider")
    public void testType(int sLine, int sCol, int eLine, int eCol, TypeDescKind expKind) {
        LineRange exprRange = LineRange.from("tests/test1.bal", from(sLine, sCol), from(eLine, eCol));
        Optional<TypeSymbol> type = model.type(exprRange);

        assertEquals(type.get().typeKind(), expKind);
    }

    @DataProvider(name = "ExprPosProvider")
    public Object[][] getExprPos() {
        return new Object[][]{
                {20, 22, 20, 24, FLOAT},
                {20, 26, 20, 30, FLOAT},
                {26, 22, 26, 25, INT},
        };
    }

    @Test
    public void testSemanticModelForWrongModule() {
        Module foo = getModule(this.project, "foo");
        SemanticModel fooSemanticModel = foo.getCompilation().getSemanticModel();

        Module baz = getModule(this.project, "baz");
        SemanticModel bazSemanticModel = baz.getCompilation().getSemanticModel();

        DocumentId bazConstantsDocId = baz.documentIds().stream()
                .filter(docId -> docId.toString().contains("baz.bal"))
                .findFirst().get();

        SyntaxTree bazSyntaxTree = baz.document(bazConstantsDocId).syntaxTree();

        // `symbol(Node node)` and `typeOf(Node node)`
        // use `fooSemanticModel` for `baz` module
        bazSyntaxTree.rootNode().accept(getNodeVisitor(fooSemanticModel));

        Document bazConstantsDoc = baz.document(bazConstantsDocId);

        // `symbol(Document sourceDocument, LinePosition position)`
        Optional<Symbol> personRecSymbol = fooSemanticModel.symbol(bazConstantsDoc, from(16, 13));
        assertTrue(personRecSymbol.isEmpty());

        // `visibleSymbols(Document sourceFile, LinePosition position, DiagnosticState... states)`
        List<Symbol> visibleSymbols = fooSemanticModel.visibleSymbols(bazConstantsDoc, from(16, 23));
        assertTrue(visibleSymbols.isEmpty());

        // `references(Document sourceDocument, LinePosition position)`
        List<Location> references1 = fooSemanticModel.references(bazConstantsDoc, from(0, 0));
        assertTrue(references1.isEmpty());

        // `references(Document sourceDocument, LinePosition position, boolean withDefinition)`
        List<Location> references2 = fooSemanticModel.references(bazConstantsDoc, from(0, 0), true);
        assertTrue(references2.isEmpty());

        // `references(Symbol symbol, Document targetDocument, boolean withDefinition)`
        Optional<Symbol> constSym = bazSemanticModel.symbol(bazConstantsDoc, from(16, 13));
        assertTrue(constSym.isPresent());
        List<Location> references3 = fooSemanticModel.references(constSym.get(), bazConstantsDoc, true);
        assertTrue(references3.isEmpty());

        // `references(Document sourceDocument, Document targetDocument, LinePosition position, boolean withDefinition)`
        List<Location> references4 = fooSemanticModel.references(bazConstantsDoc, bazConstantsDoc, from(16, 13), true);
        assertTrue(references4.isEmpty());

        // `expectedType(Document sourceDocument, LinePosition linePosition)`
        Optional<TypeSymbol> expType = fooSemanticModel.expectedType(bazConstantsDoc, from(16, 18));
        assertTrue(expType.isEmpty());
    }

    private NodeVisitor getNodeVisitor(SemanticModel semanticModel) {
        return new NodeVisitor() {
            @Override
            public void visit(ConstantDeclarationNode constantDeclarationNode) {
                Optional<Symbol> foundSymbol = semanticModel.symbol(constantDeclarationNode);
                assertTrue(foundSymbol.isEmpty());
                constantDeclarationNode.initializer().accept(this);
            }

            @Override
            public void visit(BasicLiteralNode basicLiteralNode) {
                Optional<TypeSymbol> foundTypeSymbol = semanticModel.typeOf(basicLiteralNode);
                assertTrue(foundTypeSymbol.isEmpty());
            }
        };
    }
}
