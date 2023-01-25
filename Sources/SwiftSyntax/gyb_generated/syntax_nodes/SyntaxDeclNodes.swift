//// Automatically Generated From SyntaxNodes.swift.gyb.
//// Do Not Edit Directly!
//===------------ SyntaxNodes.swift - Syntax Node definitions -------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2022 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//


// MARK: - MissingDeclSyntax

public struct MissingDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .missingDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `MissingDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .missingDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax? = nil,
    _ unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? = nil,
    modifiers: ModifierListSyntax? = nil,
    _ unexpectedAfterModifiers: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeAttributes, attributes, unexpectedBetweenAttributesAndModifiers, modifiers, unexpectedAfterModifiers))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeAttributes?.raw,
        attributes?.raw,
        unexpectedBetweenAttributesAndModifiers?.raw,
        modifiers?.raw,
        unexpectedAfterModifiers?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.missingDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MissingDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var attributes: AttributeListSyntax? {
    get {
      return data.child(at: 1, parent: Syntax(self)).map(AttributeListSyntax.init)
    }
    set(value) {
      self = MissingDeclSyntax(data.replacingChild(at: 1, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> MissingDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return MissingDeclSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MissingDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var modifiers: ModifierListSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(ModifierListSyntax.init)
    }
    set(value) {
      self = MissingDeclSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: DeclModifierSyntax) -> MissingDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.modifierList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return MissingDeclSyntax(newData)
  }

  public var unexpectedAfterModifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MissingDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAttributes,
      \Self.attributes,
      \Self.unexpectedBetweenAttributesAndModifiers,
      \Self.modifiers,
      \Self.unexpectedAfterModifiers,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension MissingDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndModifiers": unexpectedBetweenAttributesAndModifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifiers": modifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterModifiers": unexpectedAfterModifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - TypealiasDeclSyntax

public struct TypealiasDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .typealiasDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `TypealiasDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .typealiasDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax? = nil,
    _ unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? = nil,
    modifiers: ModifierListSyntax? = nil,
    _ unexpectedBetweenModifiersAndTypealiasKeyword: UnexpectedNodesSyntax? = nil,
    typealiasKeyword: TokenSyntax = .keyword(.typealias),
    _ unexpectedBetweenTypealiasKeywordAndIdentifier: UnexpectedNodesSyntax? = nil,
    identifier: TokenSyntax,
    _ unexpectedBetweenIdentifierAndGenericParameterClause: UnexpectedNodesSyntax? = nil,
    genericParameterClause: GenericParameterClauseSyntax? = nil,
    _ unexpectedBetweenGenericParameterClauseAndInitializer: UnexpectedNodesSyntax? = nil,
    initializer: TypeInitializerClauseSyntax,
    _ unexpectedBetweenInitializerAndGenericWhereClause: UnexpectedNodesSyntax? = nil,
    genericWhereClause: GenericWhereClauseSyntax? = nil,
    _ unexpectedAfterGenericWhereClause: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeAttributes, attributes, unexpectedBetweenAttributesAndModifiers, modifiers, unexpectedBetweenModifiersAndTypealiasKeyword, typealiasKeyword, unexpectedBetweenTypealiasKeywordAndIdentifier, identifier, unexpectedBetweenIdentifierAndGenericParameterClause, genericParameterClause, unexpectedBetweenGenericParameterClauseAndInitializer, initializer, unexpectedBetweenInitializerAndGenericWhereClause, genericWhereClause, unexpectedAfterGenericWhereClause))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeAttributes?.raw,
        attributes?.raw,
        unexpectedBetweenAttributesAndModifiers?.raw,
        modifiers?.raw,
        unexpectedBetweenModifiersAndTypealiasKeyword?.raw,
        typealiasKeyword.raw,
        unexpectedBetweenTypealiasKeywordAndIdentifier?.raw,
        identifier.raw,
        unexpectedBetweenIdentifierAndGenericParameterClause?.raw,
        genericParameterClause?.raw,
        unexpectedBetweenGenericParameterClauseAndInitializer?.raw,
        initializer.raw,
        unexpectedBetweenInitializerAndGenericWhereClause?.raw,
        genericWhereClause?.raw,
        unexpectedAfterGenericWhereClause?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.typealiasDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = TypealiasDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var attributes: AttributeListSyntax? {
    get {
      return data.child(at: 1, parent: Syntax(self)).map(AttributeListSyntax.init)
    }
    set(value) {
      self = TypealiasDeclSyntax(data.replacingChild(at: 1, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> TypealiasDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return TypealiasDeclSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = TypealiasDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var modifiers: ModifierListSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(ModifierListSyntax.init)
    }
    set(value) {
      self = TypealiasDeclSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: DeclModifierSyntax) -> TypealiasDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.modifierList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return TypealiasDeclSyntax(newData)
  }

  public var unexpectedBetweenModifiersAndTypealiasKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = TypealiasDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var typealiasKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = TypealiasDeclSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenTypealiasKeywordAndIdentifier: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = TypealiasDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var identifier: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 7, parent: Syntax(self))!)
    }
    set(value) {
      self = TypealiasDeclSyntax(data.replacingChild(at: 7, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenIdentifierAndGenericParameterClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = TypealiasDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericParameterClause: GenericParameterClauseSyntax? {
    get {
      return data.child(at: 9, parent: Syntax(self)).map(GenericParameterClauseSyntax.init)
    }
    set(value) {
      self = TypealiasDeclSyntax(data.replacingChild(at: 9, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenGenericParameterClauseAndInitializer: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 10, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = TypealiasDeclSyntax(data.replacingChild(at: 10, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var initializer: TypeInitializerClauseSyntax {
    get {
      return TypeInitializerClauseSyntax(data.child(at: 11, parent: Syntax(self))!)
    }
    set(value) {
      self = TypealiasDeclSyntax(data.replacingChild(at: 11, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenInitializerAndGenericWhereClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 12, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = TypealiasDeclSyntax(data.replacingChild(at: 12, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericWhereClause: GenericWhereClauseSyntax? {
    get {
      return data.child(at: 13, parent: Syntax(self)).map(GenericWhereClauseSyntax.init)
    }
    set(value) {
      self = TypealiasDeclSyntax(data.replacingChild(at: 13, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterGenericWhereClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 14, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = TypealiasDeclSyntax(data.replacingChild(at: 14, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAttributes,
      \Self.attributes,
      \Self.unexpectedBetweenAttributesAndModifiers,
      \Self.modifiers,
      \Self.unexpectedBetweenModifiersAndTypealiasKeyword,
      \Self.typealiasKeyword,
      \Self.unexpectedBetweenTypealiasKeywordAndIdentifier,
      \Self.identifier,
      \Self.unexpectedBetweenIdentifierAndGenericParameterClause,
      \Self.genericParameterClause,
      \Self.unexpectedBetweenGenericParameterClauseAndInitializer,
      \Self.initializer,
      \Self.unexpectedBetweenInitializerAndGenericWhereClause,
      \Self.genericWhereClause,
      \Self.unexpectedAfterGenericWhereClause,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "attributes"
    case 2:
      return nil
    case 3:
      return "modifiers"
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    case 9:
      return "generic parameter clause"
    case 10:
      return nil
    case 11:
      return nil
    case 12:
      return nil
    case 13:
      return "generic where clause"
    case 14:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension TypealiasDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndModifiers": unexpectedBetweenAttributesAndModifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifiers": modifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenModifiersAndTypealiasKeyword": unexpectedBetweenModifiersAndTypealiasKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "typealiasKeyword": Syntax(typealiasKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenTypealiasKeywordAndIdentifier": unexpectedBetweenTypealiasKeywordAndIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "identifier": Syntax(identifier).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenIdentifierAndGenericParameterClause": unexpectedBetweenIdentifierAndGenericParameterClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericParameterClause": genericParameterClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenGenericParameterClauseAndInitializer": unexpectedBetweenGenericParameterClauseAndInitializer.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "initializer": Syntax(initializer).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenInitializerAndGenericWhereClause": unexpectedBetweenInitializerAndGenericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericWhereClause": genericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterGenericWhereClause": unexpectedAfterGenericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AssociatedtypeDeclSyntax

public struct AssociatedtypeDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .associatedtypeDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `AssociatedtypeDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .associatedtypeDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax? = nil,
    _ unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? = nil,
    modifiers: ModifierListSyntax? = nil,
    _ unexpectedBetweenModifiersAndAssociatedtypeKeyword: UnexpectedNodesSyntax? = nil,
    associatedtypeKeyword: TokenSyntax = .keyword(.associatedtype),
    _ unexpectedBetweenAssociatedtypeKeywordAndIdentifier: UnexpectedNodesSyntax? = nil,
    identifier: TokenSyntax,
    _ unexpectedBetweenIdentifierAndInheritanceClause: UnexpectedNodesSyntax? = nil,
    inheritanceClause: TypeInheritanceClauseSyntax? = nil,
    _ unexpectedBetweenInheritanceClauseAndInitializer: UnexpectedNodesSyntax? = nil,
    initializer: TypeInitializerClauseSyntax? = nil,
    _ unexpectedBetweenInitializerAndGenericWhereClause: UnexpectedNodesSyntax? = nil,
    genericWhereClause: GenericWhereClauseSyntax? = nil,
    _ unexpectedAfterGenericWhereClause: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeAttributes, attributes, unexpectedBetweenAttributesAndModifiers, modifiers, unexpectedBetweenModifiersAndAssociatedtypeKeyword, associatedtypeKeyword, unexpectedBetweenAssociatedtypeKeywordAndIdentifier, identifier, unexpectedBetweenIdentifierAndInheritanceClause, inheritanceClause, unexpectedBetweenInheritanceClauseAndInitializer, initializer, unexpectedBetweenInitializerAndGenericWhereClause, genericWhereClause, unexpectedAfterGenericWhereClause))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeAttributes?.raw,
        attributes?.raw,
        unexpectedBetweenAttributesAndModifiers?.raw,
        modifiers?.raw,
        unexpectedBetweenModifiersAndAssociatedtypeKeyword?.raw,
        associatedtypeKeyword.raw,
        unexpectedBetweenAssociatedtypeKeywordAndIdentifier?.raw,
        identifier.raw,
        unexpectedBetweenIdentifierAndInheritanceClause?.raw,
        inheritanceClause?.raw,
        unexpectedBetweenInheritanceClauseAndInitializer?.raw,
        initializer?.raw,
        unexpectedBetweenInitializerAndGenericWhereClause?.raw,
        genericWhereClause?.raw,
        unexpectedAfterGenericWhereClause?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.associatedtypeDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = AssociatedtypeDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var attributes: AttributeListSyntax? {
    get {
      return data.child(at: 1, parent: Syntax(self)).map(AttributeListSyntax.init)
    }
    set(value) {
      self = AssociatedtypeDeclSyntax(data.replacingChild(at: 1, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> AssociatedtypeDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return AssociatedtypeDeclSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = AssociatedtypeDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var modifiers: ModifierListSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(ModifierListSyntax.init)
    }
    set(value) {
      self = AssociatedtypeDeclSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: DeclModifierSyntax) -> AssociatedtypeDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.modifierList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return AssociatedtypeDeclSyntax(newData)
  }

  public var unexpectedBetweenModifiersAndAssociatedtypeKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = AssociatedtypeDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var associatedtypeKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = AssociatedtypeDeclSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenAssociatedtypeKeywordAndIdentifier: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = AssociatedtypeDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var identifier: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 7, parent: Syntax(self))!)
    }
    set(value) {
      self = AssociatedtypeDeclSyntax(data.replacingChild(at: 7, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenIdentifierAndInheritanceClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = AssociatedtypeDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var inheritanceClause: TypeInheritanceClauseSyntax? {
    get {
      return data.child(at: 9, parent: Syntax(self)).map(TypeInheritanceClauseSyntax.init)
    }
    set(value) {
      self = AssociatedtypeDeclSyntax(data.replacingChild(at: 9, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenInheritanceClauseAndInitializer: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 10, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = AssociatedtypeDeclSyntax(data.replacingChild(at: 10, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var initializer: TypeInitializerClauseSyntax? {
    get {
      return data.child(at: 11, parent: Syntax(self)).map(TypeInitializerClauseSyntax.init)
    }
    set(value) {
      self = AssociatedtypeDeclSyntax(data.replacingChild(at: 11, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenInitializerAndGenericWhereClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 12, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = AssociatedtypeDeclSyntax(data.replacingChild(at: 12, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericWhereClause: GenericWhereClauseSyntax? {
    get {
      return data.child(at: 13, parent: Syntax(self)).map(GenericWhereClauseSyntax.init)
    }
    set(value) {
      self = AssociatedtypeDeclSyntax(data.replacingChild(at: 13, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterGenericWhereClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 14, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = AssociatedtypeDeclSyntax(data.replacingChild(at: 14, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAttributes,
      \Self.attributes,
      \Self.unexpectedBetweenAttributesAndModifiers,
      \Self.modifiers,
      \Self.unexpectedBetweenModifiersAndAssociatedtypeKeyword,
      \Self.associatedtypeKeyword,
      \Self.unexpectedBetweenAssociatedtypeKeywordAndIdentifier,
      \Self.identifier,
      \Self.unexpectedBetweenIdentifierAndInheritanceClause,
      \Self.inheritanceClause,
      \Self.unexpectedBetweenInheritanceClauseAndInitializer,
      \Self.initializer,
      \Self.unexpectedBetweenInitializerAndGenericWhereClause,
      \Self.genericWhereClause,
      \Self.unexpectedAfterGenericWhereClause,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "attributes"
    case 2:
      return nil
    case 3:
      return "modifiers"
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    case 9:
      return "inheritance clause"
    case 10:
      return nil
    case 11:
      return nil
    case 12:
      return nil
    case 13:
      return "generic where clause"
    case 14:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension AssociatedtypeDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndModifiers": unexpectedBetweenAttributesAndModifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifiers": modifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenModifiersAndAssociatedtypeKeyword": unexpectedBetweenModifiersAndAssociatedtypeKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "associatedtypeKeyword": Syntax(associatedtypeKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenAssociatedtypeKeywordAndIdentifier": unexpectedBetweenAssociatedtypeKeywordAndIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "identifier": Syntax(identifier).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenIdentifierAndInheritanceClause": unexpectedBetweenIdentifierAndInheritanceClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "inheritanceClause": inheritanceClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenInheritanceClauseAndInitializer": unexpectedBetweenInheritanceClauseAndInitializer.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "initializer": initializer.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenInitializerAndGenericWhereClause": unexpectedBetweenInitializerAndGenericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericWhereClause": genericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterGenericWhereClause": unexpectedAfterGenericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - IfConfigDeclSyntax

public struct IfConfigDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .ifConfigDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `IfConfigDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .ifConfigDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeClauses: UnexpectedNodesSyntax? = nil,
    clauses: IfConfigClauseListSyntax,
    _ unexpectedBetweenClausesAndPoundEndif: UnexpectedNodesSyntax? = nil,
    poundEndif: TokenSyntax = .poundEndifKeyword(),
    _ unexpectedAfterPoundEndif: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeClauses, clauses, unexpectedBetweenClausesAndPoundEndif, poundEndif, unexpectedAfterPoundEndif))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeClauses?.raw,
        clauses.raw,
        unexpectedBetweenClausesAndPoundEndif?.raw,
        poundEndif.raw,
        unexpectedAfterPoundEndif?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.ifConfigDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeClauses: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = IfConfigDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var clauses: IfConfigClauseListSyntax {
    get {
      return IfConfigClauseListSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = IfConfigDeclSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Clause` to the node's `clauses`
  /// collection.
  /// - param element: The new `Clause` to add to the node's
  ///                  `clauses` collection.
  /// - returns: A copy of the receiver with the provided `Clause`
  ///            appended to its `clauses` collection.
  public func addClause(_ element: IfConfigClauseSyntax) -> IfConfigDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.ifConfigClauseList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return IfConfigDeclSyntax(newData)
  }

  public var unexpectedBetweenClausesAndPoundEndif: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = IfConfigDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var poundEndif: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 3, parent: Syntax(self))!)
    }
    set(value) {
      self = IfConfigDeclSyntax(data.replacingChild(at: 3, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterPoundEndif: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = IfConfigDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeClauses,
      \Self.clauses,
      \Self.unexpectedBetweenClausesAndPoundEndif,
      \Self.poundEndif,
      \Self.unexpectedAfterPoundEndif,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension IfConfigDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeClauses": unexpectedBeforeClauses.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "clauses": Syntax(clauses).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenClausesAndPoundEndif": unexpectedBetweenClausesAndPoundEndif.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "poundEndif": Syntax(poundEndif).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterPoundEndif": unexpectedAfterPoundEndif.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - PoundErrorDeclSyntax

public struct PoundErrorDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .poundErrorDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `PoundErrorDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .poundErrorDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforePoundError: UnexpectedNodesSyntax? = nil,
    poundError: TokenSyntax = .poundErrorKeyword(),
    _ unexpectedBetweenPoundErrorAndLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax = .leftParenToken(),
    _ unexpectedBetweenLeftParenAndMessage: UnexpectedNodesSyntax? = nil,
    message: StringLiteralExprSyntax,
    _ unexpectedBetweenMessageAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax = .rightParenToken(),
    _ unexpectedAfterRightParen: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforePoundError, poundError, unexpectedBetweenPoundErrorAndLeftParen, leftParen, unexpectedBetweenLeftParenAndMessage, message, unexpectedBetweenMessageAndRightParen, rightParen, unexpectedAfterRightParen))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforePoundError?.raw,
        poundError.raw,
        unexpectedBetweenPoundErrorAndLeftParen?.raw,
        leftParen.raw,
        unexpectedBetweenLeftParenAndMessage?.raw,
        message.raw,
        unexpectedBetweenMessageAndRightParen?.raw,
        rightParen.raw,
        unexpectedAfterRightParen?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.poundErrorDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforePoundError: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PoundErrorDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var poundError: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = PoundErrorDeclSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenPoundErrorAndLeftParen: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PoundErrorDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var leftParen: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 3, parent: Syntax(self))!)
    }
    set(value) {
      self = PoundErrorDeclSyntax(data.replacingChild(at: 3, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenLeftParenAndMessage: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PoundErrorDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var message: StringLiteralExprSyntax {
    get {
      return StringLiteralExprSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = PoundErrorDeclSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenMessageAndRightParen: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PoundErrorDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var rightParen: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 7, parent: Syntax(self))!)
    }
    set(value) {
      self = PoundErrorDeclSyntax(data.replacingChild(at: 7, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterRightParen: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PoundErrorDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforePoundError,
      \Self.poundError,
      \Self.unexpectedBetweenPoundErrorAndLeftParen,
      \Self.leftParen,
      \Self.unexpectedBetweenLeftParenAndMessage,
      \Self.message,
      \Self.unexpectedBetweenMessageAndRightParen,
      \Self.rightParen,
      \Self.unexpectedAfterRightParen,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    case 5:
      return "message"
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension PoundErrorDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforePoundError": unexpectedBeforePoundError.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "poundError": Syntax(poundError).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenPoundErrorAndLeftParen": unexpectedBetweenPoundErrorAndLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftParenAndMessage": unexpectedBetweenLeftParenAndMessage.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "message": Syntax(message).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenMessageAndRightParen": unexpectedBetweenMessageAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterRightParen": unexpectedAfterRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - PoundWarningDeclSyntax

public struct PoundWarningDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .poundWarningDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `PoundWarningDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .poundWarningDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforePoundWarning: UnexpectedNodesSyntax? = nil,
    poundWarning: TokenSyntax = .poundWarningKeyword(),
    _ unexpectedBetweenPoundWarningAndLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax = .leftParenToken(),
    _ unexpectedBetweenLeftParenAndMessage: UnexpectedNodesSyntax? = nil,
    message: StringLiteralExprSyntax,
    _ unexpectedBetweenMessageAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax = .rightParenToken(),
    _ unexpectedAfterRightParen: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforePoundWarning, poundWarning, unexpectedBetweenPoundWarningAndLeftParen, leftParen, unexpectedBetweenLeftParenAndMessage, message, unexpectedBetweenMessageAndRightParen, rightParen, unexpectedAfterRightParen))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforePoundWarning?.raw,
        poundWarning.raw,
        unexpectedBetweenPoundWarningAndLeftParen?.raw,
        leftParen.raw,
        unexpectedBetweenLeftParenAndMessage?.raw,
        message.raw,
        unexpectedBetweenMessageAndRightParen?.raw,
        rightParen.raw,
        unexpectedAfterRightParen?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.poundWarningDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforePoundWarning: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PoundWarningDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var poundWarning: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = PoundWarningDeclSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenPoundWarningAndLeftParen: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PoundWarningDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var leftParen: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 3, parent: Syntax(self))!)
    }
    set(value) {
      self = PoundWarningDeclSyntax(data.replacingChild(at: 3, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenLeftParenAndMessage: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PoundWarningDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var message: StringLiteralExprSyntax {
    get {
      return StringLiteralExprSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = PoundWarningDeclSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenMessageAndRightParen: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PoundWarningDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var rightParen: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 7, parent: Syntax(self))!)
    }
    set(value) {
      self = PoundWarningDeclSyntax(data.replacingChild(at: 7, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterRightParen: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PoundWarningDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforePoundWarning,
      \Self.poundWarning,
      \Self.unexpectedBetweenPoundWarningAndLeftParen,
      \Self.leftParen,
      \Self.unexpectedBetweenLeftParenAndMessage,
      \Self.message,
      \Self.unexpectedBetweenMessageAndRightParen,
      \Self.rightParen,
      \Self.unexpectedAfterRightParen,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    case 5:
      return "message"
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension PoundWarningDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforePoundWarning": unexpectedBeforePoundWarning.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "poundWarning": Syntax(poundWarning).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenPoundWarningAndLeftParen": unexpectedBetweenPoundWarningAndLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftParenAndMessage": unexpectedBetweenLeftParenAndMessage.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "message": Syntax(message).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenMessageAndRightParen": unexpectedBetweenMessageAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterRightParen": unexpectedAfterRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - PoundSourceLocationSyntax

public struct PoundSourceLocationSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .poundSourceLocation else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `PoundSourceLocationSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .poundSourceLocation)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforePoundSourceLocation: UnexpectedNodesSyntax? = nil,
    poundSourceLocation: TokenSyntax = .poundSourceLocationKeyword(),
    _ unexpectedBetweenPoundSourceLocationAndLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax = .leftParenToken(),
    _ unexpectedBetweenLeftParenAndArgs: UnexpectedNodesSyntax? = nil,
    args: PoundSourceLocationArgsSyntax? = nil,
    _ unexpectedBetweenArgsAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax = .rightParenToken(),
    _ unexpectedAfterRightParen: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforePoundSourceLocation, poundSourceLocation, unexpectedBetweenPoundSourceLocationAndLeftParen, leftParen, unexpectedBetweenLeftParenAndArgs, args, unexpectedBetweenArgsAndRightParen, rightParen, unexpectedAfterRightParen))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforePoundSourceLocation?.raw,
        poundSourceLocation.raw,
        unexpectedBetweenPoundSourceLocationAndLeftParen?.raw,
        leftParen.raw,
        unexpectedBetweenLeftParenAndArgs?.raw,
        args?.raw,
        unexpectedBetweenArgsAndRightParen?.raw,
        rightParen.raw,
        unexpectedAfterRightParen?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.poundSourceLocation, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforePoundSourceLocation: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PoundSourceLocationSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var poundSourceLocation: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = PoundSourceLocationSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenPoundSourceLocationAndLeftParen: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PoundSourceLocationSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var leftParen: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 3, parent: Syntax(self))!)
    }
    set(value) {
      self = PoundSourceLocationSyntax(data.replacingChild(at: 3, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenLeftParenAndArgs: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PoundSourceLocationSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var args: PoundSourceLocationArgsSyntax? {
    get {
      return data.child(at: 5, parent: Syntax(self)).map(PoundSourceLocationArgsSyntax.init)
    }
    set(value) {
      self = PoundSourceLocationSyntax(data.replacingChild(at: 5, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenArgsAndRightParen: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PoundSourceLocationSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var rightParen: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 7, parent: Syntax(self))!)
    }
    set(value) {
      self = PoundSourceLocationSyntax(data.replacingChild(at: 7, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterRightParen: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PoundSourceLocationSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforePoundSourceLocation,
      \Self.poundSourceLocation,
      \Self.unexpectedBetweenPoundSourceLocationAndLeftParen,
      \Self.leftParen,
      \Self.unexpectedBetweenLeftParenAndArgs,
      \Self.args,
      \Self.unexpectedBetweenArgsAndRightParen,
      \Self.rightParen,
      \Self.unexpectedAfterRightParen,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    case 5:
      return "arguments"
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension PoundSourceLocationSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforePoundSourceLocation": unexpectedBeforePoundSourceLocation.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "poundSourceLocation": Syntax(poundSourceLocation).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenPoundSourceLocationAndLeftParen": unexpectedBetweenPoundSourceLocationAndLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftParenAndArgs": unexpectedBetweenLeftParenAndArgs.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "args": args.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenArgsAndRightParen": unexpectedBetweenArgsAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterRightParen": unexpectedAfterRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ClassDeclSyntax

public struct ClassDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .classDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `ClassDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .classDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax? = nil,
    _ unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? = nil,
    modifiers: ModifierListSyntax? = nil,
    _ unexpectedBetweenModifiersAndClassKeyword: UnexpectedNodesSyntax? = nil,
    classKeyword: TokenSyntax = .keyword(.class),
    _ unexpectedBetweenClassKeywordAndIdentifier: UnexpectedNodesSyntax? = nil,
    identifier: TokenSyntax,
    _ unexpectedBetweenIdentifierAndGenericParameterClause: UnexpectedNodesSyntax? = nil,
    genericParameterClause: GenericParameterClauseSyntax? = nil,
    _ unexpectedBetweenGenericParameterClauseAndInheritanceClause: UnexpectedNodesSyntax? = nil,
    inheritanceClause: TypeInheritanceClauseSyntax? = nil,
    _ unexpectedBetweenInheritanceClauseAndGenericWhereClause: UnexpectedNodesSyntax? = nil,
    genericWhereClause: GenericWhereClauseSyntax? = nil,
    _ unexpectedBetweenGenericWhereClauseAndMembers: UnexpectedNodesSyntax? = nil,
    members: MemberDeclBlockSyntax,
    _ unexpectedAfterMembers: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeAttributes, attributes, unexpectedBetweenAttributesAndModifiers, modifiers, unexpectedBetweenModifiersAndClassKeyword, classKeyword, unexpectedBetweenClassKeywordAndIdentifier, identifier, unexpectedBetweenIdentifierAndGenericParameterClause, genericParameterClause, unexpectedBetweenGenericParameterClauseAndInheritanceClause, inheritanceClause, unexpectedBetweenInheritanceClauseAndGenericWhereClause, genericWhereClause, unexpectedBetweenGenericWhereClauseAndMembers, members, unexpectedAfterMembers))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeAttributes?.raw,
        attributes?.raw,
        unexpectedBetweenAttributesAndModifiers?.raw,
        modifiers?.raw,
        unexpectedBetweenModifiersAndClassKeyword?.raw,
        classKeyword.raw,
        unexpectedBetweenClassKeywordAndIdentifier?.raw,
        identifier.raw,
        unexpectedBetweenIdentifierAndGenericParameterClause?.raw,
        genericParameterClause?.raw,
        unexpectedBetweenGenericParameterClauseAndInheritanceClause?.raw,
        inheritanceClause?.raw,
        unexpectedBetweenInheritanceClauseAndGenericWhereClause?.raw,
        genericWhereClause?.raw,
        unexpectedBetweenGenericWhereClauseAndMembers?.raw,
        members.raw,
        unexpectedAfterMembers?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.classDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ClassDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var attributes: AttributeListSyntax? {
    get {
      return data.child(at: 1, parent: Syntax(self)).map(AttributeListSyntax.init)
    }
    set(value) {
      self = ClassDeclSyntax(data.replacingChild(at: 1, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> ClassDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return ClassDeclSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ClassDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var modifiers: ModifierListSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(ModifierListSyntax.init)
    }
    set(value) {
      self = ClassDeclSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: DeclModifierSyntax) -> ClassDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.modifierList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return ClassDeclSyntax(newData)
  }

  public var unexpectedBetweenModifiersAndClassKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ClassDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var classKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = ClassDeclSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenClassKeywordAndIdentifier: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ClassDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var identifier: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 7, parent: Syntax(self))!)
    }
    set(value) {
      self = ClassDeclSyntax(data.replacingChild(at: 7, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenIdentifierAndGenericParameterClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ClassDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericParameterClause: GenericParameterClauseSyntax? {
    get {
      return data.child(at: 9, parent: Syntax(self)).map(GenericParameterClauseSyntax.init)
    }
    set(value) {
      self = ClassDeclSyntax(data.replacingChild(at: 9, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenGenericParameterClauseAndInheritanceClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 10, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ClassDeclSyntax(data.replacingChild(at: 10, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var inheritanceClause: TypeInheritanceClauseSyntax? {
    get {
      return data.child(at: 11, parent: Syntax(self)).map(TypeInheritanceClauseSyntax.init)
    }
    set(value) {
      self = ClassDeclSyntax(data.replacingChild(at: 11, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenInheritanceClauseAndGenericWhereClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 12, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ClassDeclSyntax(data.replacingChild(at: 12, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericWhereClause: GenericWhereClauseSyntax? {
    get {
      return data.child(at: 13, parent: Syntax(self)).map(GenericWhereClauseSyntax.init)
    }
    set(value) {
      self = ClassDeclSyntax(data.replacingChild(at: 13, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenGenericWhereClauseAndMembers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 14, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ClassDeclSyntax(data.replacingChild(at: 14, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var members: MemberDeclBlockSyntax {
    get {
      return MemberDeclBlockSyntax(data.child(at: 15, parent: Syntax(self))!)
    }
    set(value) {
      self = ClassDeclSyntax(data.replacingChild(at: 15, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterMembers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 16, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ClassDeclSyntax(data.replacingChild(at: 16, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAttributes,
      \Self.attributes,
      \Self.unexpectedBetweenAttributesAndModifiers,
      \Self.modifiers,
      \Self.unexpectedBetweenModifiersAndClassKeyword,
      \Self.classKeyword,
      \Self.unexpectedBetweenClassKeywordAndIdentifier,
      \Self.identifier,
      \Self.unexpectedBetweenIdentifierAndGenericParameterClause,
      \Self.genericParameterClause,
      \Self.unexpectedBetweenGenericParameterClauseAndInheritanceClause,
      \Self.inheritanceClause,
      \Self.unexpectedBetweenInheritanceClauseAndGenericWhereClause,
      \Self.genericWhereClause,
      \Self.unexpectedBetweenGenericWhereClauseAndMembers,
      \Self.members,
      \Self.unexpectedAfterMembers,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "attributes"
    case 2:
      return nil
    case 3:
      return "modifiers"
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    case 9:
      return "generic parameter clause"
    case 10:
      return nil
    case 11:
      return "inheritance clause"
    case 12:
      return nil
    case 13:
      return "generic where clause"
    case 14:
      return nil
    case 15:
      return nil
    case 16:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension ClassDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndModifiers": unexpectedBetweenAttributesAndModifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifiers": modifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenModifiersAndClassKeyword": unexpectedBetweenModifiersAndClassKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "classKeyword": Syntax(classKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenClassKeywordAndIdentifier": unexpectedBetweenClassKeywordAndIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "identifier": Syntax(identifier).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenIdentifierAndGenericParameterClause": unexpectedBetweenIdentifierAndGenericParameterClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericParameterClause": genericParameterClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenGenericParameterClauseAndInheritanceClause": unexpectedBetweenGenericParameterClauseAndInheritanceClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "inheritanceClause": inheritanceClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenInheritanceClauseAndGenericWhereClause": unexpectedBetweenInheritanceClauseAndGenericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericWhereClause": genericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenGenericWhereClauseAndMembers": unexpectedBetweenGenericWhereClauseAndMembers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "members": Syntax(members).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterMembers": unexpectedAfterMembers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ActorDeclSyntax

public struct ActorDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .actorDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `ActorDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .actorDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax? = nil,
    _ unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? = nil,
    modifiers: ModifierListSyntax? = nil,
    _ unexpectedBetweenModifiersAndActorKeyword: UnexpectedNodesSyntax? = nil,
    actorKeyword: TokenSyntax = .keyword(.actor),
    _ unexpectedBetweenActorKeywordAndIdentifier: UnexpectedNodesSyntax? = nil,
    identifier: TokenSyntax,
    _ unexpectedBetweenIdentifierAndGenericParameterClause: UnexpectedNodesSyntax? = nil,
    genericParameterClause: GenericParameterClauseSyntax? = nil,
    _ unexpectedBetweenGenericParameterClauseAndInheritanceClause: UnexpectedNodesSyntax? = nil,
    inheritanceClause: TypeInheritanceClauseSyntax? = nil,
    _ unexpectedBetweenInheritanceClauseAndGenericWhereClause: UnexpectedNodesSyntax? = nil,
    genericWhereClause: GenericWhereClauseSyntax? = nil,
    _ unexpectedBetweenGenericWhereClauseAndMembers: UnexpectedNodesSyntax? = nil,
    members: MemberDeclBlockSyntax,
    _ unexpectedAfterMembers: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeAttributes, attributes, unexpectedBetweenAttributesAndModifiers, modifiers, unexpectedBetweenModifiersAndActorKeyword, actorKeyword, unexpectedBetweenActorKeywordAndIdentifier, identifier, unexpectedBetweenIdentifierAndGenericParameterClause, genericParameterClause, unexpectedBetweenGenericParameterClauseAndInheritanceClause, inheritanceClause, unexpectedBetweenInheritanceClauseAndGenericWhereClause, genericWhereClause, unexpectedBetweenGenericWhereClauseAndMembers, members, unexpectedAfterMembers))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeAttributes?.raw,
        attributes?.raw,
        unexpectedBetweenAttributesAndModifiers?.raw,
        modifiers?.raw,
        unexpectedBetweenModifiersAndActorKeyword?.raw,
        actorKeyword.raw,
        unexpectedBetweenActorKeywordAndIdentifier?.raw,
        identifier.raw,
        unexpectedBetweenIdentifierAndGenericParameterClause?.raw,
        genericParameterClause?.raw,
        unexpectedBetweenGenericParameterClauseAndInheritanceClause?.raw,
        inheritanceClause?.raw,
        unexpectedBetweenInheritanceClauseAndGenericWhereClause?.raw,
        genericWhereClause?.raw,
        unexpectedBetweenGenericWhereClauseAndMembers?.raw,
        members.raw,
        unexpectedAfterMembers?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.actorDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ActorDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var attributes: AttributeListSyntax? {
    get {
      return data.child(at: 1, parent: Syntax(self)).map(AttributeListSyntax.init)
    }
    set(value) {
      self = ActorDeclSyntax(data.replacingChild(at: 1, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> ActorDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return ActorDeclSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ActorDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var modifiers: ModifierListSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(ModifierListSyntax.init)
    }
    set(value) {
      self = ActorDeclSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: DeclModifierSyntax) -> ActorDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.modifierList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return ActorDeclSyntax(newData)
  }

  public var unexpectedBetweenModifiersAndActorKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ActorDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var actorKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = ActorDeclSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenActorKeywordAndIdentifier: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ActorDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var identifier: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 7, parent: Syntax(self))!)
    }
    set(value) {
      self = ActorDeclSyntax(data.replacingChild(at: 7, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenIdentifierAndGenericParameterClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ActorDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericParameterClause: GenericParameterClauseSyntax? {
    get {
      return data.child(at: 9, parent: Syntax(self)).map(GenericParameterClauseSyntax.init)
    }
    set(value) {
      self = ActorDeclSyntax(data.replacingChild(at: 9, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenGenericParameterClauseAndInheritanceClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 10, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ActorDeclSyntax(data.replacingChild(at: 10, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var inheritanceClause: TypeInheritanceClauseSyntax? {
    get {
      return data.child(at: 11, parent: Syntax(self)).map(TypeInheritanceClauseSyntax.init)
    }
    set(value) {
      self = ActorDeclSyntax(data.replacingChild(at: 11, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenInheritanceClauseAndGenericWhereClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 12, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ActorDeclSyntax(data.replacingChild(at: 12, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericWhereClause: GenericWhereClauseSyntax? {
    get {
      return data.child(at: 13, parent: Syntax(self)).map(GenericWhereClauseSyntax.init)
    }
    set(value) {
      self = ActorDeclSyntax(data.replacingChild(at: 13, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenGenericWhereClauseAndMembers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 14, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ActorDeclSyntax(data.replacingChild(at: 14, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var members: MemberDeclBlockSyntax {
    get {
      return MemberDeclBlockSyntax(data.child(at: 15, parent: Syntax(self))!)
    }
    set(value) {
      self = ActorDeclSyntax(data.replacingChild(at: 15, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterMembers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 16, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ActorDeclSyntax(data.replacingChild(at: 16, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAttributes,
      \Self.attributes,
      \Self.unexpectedBetweenAttributesAndModifiers,
      \Self.modifiers,
      \Self.unexpectedBetweenModifiersAndActorKeyword,
      \Self.actorKeyword,
      \Self.unexpectedBetweenActorKeywordAndIdentifier,
      \Self.identifier,
      \Self.unexpectedBetweenIdentifierAndGenericParameterClause,
      \Self.genericParameterClause,
      \Self.unexpectedBetweenGenericParameterClauseAndInheritanceClause,
      \Self.inheritanceClause,
      \Self.unexpectedBetweenInheritanceClauseAndGenericWhereClause,
      \Self.genericWhereClause,
      \Self.unexpectedBetweenGenericWhereClauseAndMembers,
      \Self.members,
      \Self.unexpectedAfterMembers,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "attributes"
    case 2:
      return nil
    case 3:
      return "modifiers"
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    case 9:
      return "generic parameter clause"
    case 10:
      return nil
    case 11:
      return "type inheritance clause"
    case 12:
      return nil
    case 13:
      return "generic where clause"
    case 14:
      return nil
    case 15:
      return nil
    case 16:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension ActorDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndModifiers": unexpectedBetweenAttributesAndModifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifiers": modifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenModifiersAndActorKeyword": unexpectedBetweenModifiersAndActorKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "actorKeyword": Syntax(actorKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenActorKeywordAndIdentifier": unexpectedBetweenActorKeywordAndIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "identifier": Syntax(identifier).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenIdentifierAndGenericParameterClause": unexpectedBetweenIdentifierAndGenericParameterClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericParameterClause": genericParameterClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenGenericParameterClauseAndInheritanceClause": unexpectedBetweenGenericParameterClauseAndInheritanceClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "inheritanceClause": inheritanceClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenInheritanceClauseAndGenericWhereClause": unexpectedBetweenInheritanceClauseAndGenericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericWhereClause": genericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenGenericWhereClauseAndMembers": unexpectedBetweenGenericWhereClauseAndMembers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "members": Syntax(members).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterMembers": unexpectedAfterMembers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - StructDeclSyntax

public struct StructDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .structDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `StructDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .structDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax? = nil,
    _ unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? = nil,
    modifiers: ModifierListSyntax? = nil,
    _ unexpectedBetweenModifiersAndStructKeyword: UnexpectedNodesSyntax? = nil,
    structKeyword: TokenSyntax = .keyword(.struct),
    _ unexpectedBetweenStructKeywordAndIdentifier: UnexpectedNodesSyntax? = nil,
    identifier: TokenSyntax,
    _ unexpectedBetweenIdentifierAndGenericParameterClause: UnexpectedNodesSyntax? = nil,
    genericParameterClause: GenericParameterClauseSyntax? = nil,
    _ unexpectedBetweenGenericParameterClauseAndInheritanceClause: UnexpectedNodesSyntax? = nil,
    inheritanceClause: TypeInheritanceClauseSyntax? = nil,
    _ unexpectedBetweenInheritanceClauseAndGenericWhereClause: UnexpectedNodesSyntax? = nil,
    genericWhereClause: GenericWhereClauseSyntax? = nil,
    _ unexpectedBetweenGenericWhereClauseAndMembers: UnexpectedNodesSyntax? = nil,
    members: MemberDeclBlockSyntax,
    _ unexpectedAfterMembers: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeAttributes, attributes, unexpectedBetweenAttributesAndModifiers, modifiers, unexpectedBetweenModifiersAndStructKeyword, structKeyword, unexpectedBetweenStructKeywordAndIdentifier, identifier, unexpectedBetweenIdentifierAndGenericParameterClause, genericParameterClause, unexpectedBetweenGenericParameterClauseAndInheritanceClause, inheritanceClause, unexpectedBetweenInheritanceClauseAndGenericWhereClause, genericWhereClause, unexpectedBetweenGenericWhereClauseAndMembers, members, unexpectedAfterMembers))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeAttributes?.raw,
        attributes?.raw,
        unexpectedBetweenAttributesAndModifiers?.raw,
        modifiers?.raw,
        unexpectedBetweenModifiersAndStructKeyword?.raw,
        structKeyword.raw,
        unexpectedBetweenStructKeywordAndIdentifier?.raw,
        identifier.raw,
        unexpectedBetweenIdentifierAndGenericParameterClause?.raw,
        genericParameterClause?.raw,
        unexpectedBetweenGenericParameterClauseAndInheritanceClause?.raw,
        inheritanceClause?.raw,
        unexpectedBetweenInheritanceClauseAndGenericWhereClause?.raw,
        genericWhereClause?.raw,
        unexpectedBetweenGenericWhereClauseAndMembers?.raw,
        members.raw,
        unexpectedAfterMembers?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.structDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = StructDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var attributes: AttributeListSyntax? {
    get {
      return data.child(at: 1, parent: Syntax(self)).map(AttributeListSyntax.init)
    }
    set(value) {
      self = StructDeclSyntax(data.replacingChild(at: 1, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> StructDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return StructDeclSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = StructDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var modifiers: ModifierListSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(ModifierListSyntax.init)
    }
    set(value) {
      self = StructDeclSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: DeclModifierSyntax) -> StructDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.modifierList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return StructDeclSyntax(newData)
  }

  public var unexpectedBetweenModifiersAndStructKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = StructDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var structKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = StructDeclSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenStructKeywordAndIdentifier: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = StructDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var identifier: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 7, parent: Syntax(self))!)
    }
    set(value) {
      self = StructDeclSyntax(data.replacingChild(at: 7, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenIdentifierAndGenericParameterClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = StructDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericParameterClause: GenericParameterClauseSyntax? {
    get {
      return data.child(at: 9, parent: Syntax(self)).map(GenericParameterClauseSyntax.init)
    }
    set(value) {
      self = StructDeclSyntax(data.replacingChild(at: 9, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenGenericParameterClauseAndInheritanceClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 10, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = StructDeclSyntax(data.replacingChild(at: 10, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var inheritanceClause: TypeInheritanceClauseSyntax? {
    get {
      return data.child(at: 11, parent: Syntax(self)).map(TypeInheritanceClauseSyntax.init)
    }
    set(value) {
      self = StructDeclSyntax(data.replacingChild(at: 11, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenInheritanceClauseAndGenericWhereClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 12, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = StructDeclSyntax(data.replacingChild(at: 12, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericWhereClause: GenericWhereClauseSyntax? {
    get {
      return data.child(at: 13, parent: Syntax(self)).map(GenericWhereClauseSyntax.init)
    }
    set(value) {
      self = StructDeclSyntax(data.replacingChild(at: 13, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenGenericWhereClauseAndMembers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 14, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = StructDeclSyntax(data.replacingChild(at: 14, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var members: MemberDeclBlockSyntax {
    get {
      return MemberDeclBlockSyntax(data.child(at: 15, parent: Syntax(self))!)
    }
    set(value) {
      self = StructDeclSyntax(data.replacingChild(at: 15, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterMembers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 16, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = StructDeclSyntax(data.replacingChild(at: 16, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAttributes,
      \Self.attributes,
      \Self.unexpectedBetweenAttributesAndModifiers,
      \Self.modifiers,
      \Self.unexpectedBetweenModifiersAndStructKeyword,
      \Self.structKeyword,
      \Self.unexpectedBetweenStructKeywordAndIdentifier,
      \Self.identifier,
      \Self.unexpectedBetweenIdentifierAndGenericParameterClause,
      \Self.genericParameterClause,
      \Self.unexpectedBetweenGenericParameterClauseAndInheritanceClause,
      \Self.inheritanceClause,
      \Self.unexpectedBetweenInheritanceClauseAndGenericWhereClause,
      \Self.genericWhereClause,
      \Self.unexpectedBetweenGenericWhereClauseAndMembers,
      \Self.members,
      \Self.unexpectedAfterMembers,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "attributes"
    case 2:
      return nil
    case 3:
      return "modifiers"
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    case 9:
      return "generic parameter clause"
    case 10:
      return nil
    case 11:
      return "type inheritance clause"
    case 12:
      return nil
    case 13:
      return "generic where clause"
    case 14:
      return nil
    case 15:
      return nil
    case 16:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension StructDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndModifiers": unexpectedBetweenAttributesAndModifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifiers": modifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenModifiersAndStructKeyword": unexpectedBetweenModifiersAndStructKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "structKeyword": Syntax(structKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenStructKeywordAndIdentifier": unexpectedBetweenStructKeywordAndIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "identifier": Syntax(identifier).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenIdentifierAndGenericParameterClause": unexpectedBetweenIdentifierAndGenericParameterClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericParameterClause": genericParameterClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenGenericParameterClauseAndInheritanceClause": unexpectedBetweenGenericParameterClauseAndInheritanceClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "inheritanceClause": inheritanceClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenInheritanceClauseAndGenericWhereClause": unexpectedBetweenInheritanceClauseAndGenericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericWhereClause": genericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenGenericWhereClauseAndMembers": unexpectedBetweenGenericWhereClauseAndMembers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "members": Syntax(members).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterMembers": unexpectedAfterMembers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ProtocolDeclSyntax

public struct ProtocolDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .protocolDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `ProtocolDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .protocolDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax? = nil,
    _ unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? = nil,
    modifiers: ModifierListSyntax? = nil,
    _ unexpectedBetweenModifiersAndProtocolKeyword: UnexpectedNodesSyntax? = nil,
    protocolKeyword: TokenSyntax = .keyword(.protocol),
    _ unexpectedBetweenProtocolKeywordAndIdentifier: UnexpectedNodesSyntax? = nil,
    identifier: TokenSyntax,
    _ unexpectedBetweenIdentifierAndPrimaryAssociatedTypeClause: UnexpectedNodesSyntax? = nil,
    primaryAssociatedTypeClause: PrimaryAssociatedTypeClauseSyntax? = nil,
    _ unexpectedBetweenPrimaryAssociatedTypeClauseAndInheritanceClause: UnexpectedNodesSyntax? = nil,
    inheritanceClause: TypeInheritanceClauseSyntax? = nil,
    _ unexpectedBetweenInheritanceClauseAndGenericWhereClause: UnexpectedNodesSyntax? = nil,
    genericWhereClause: GenericWhereClauseSyntax? = nil,
    _ unexpectedBetweenGenericWhereClauseAndMembers: UnexpectedNodesSyntax? = nil,
    members: MemberDeclBlockSyntax,
    _ unexpectedAfterMembers: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeAttributes, attributes, unexpectedBetweenAttributesAndModifiers, modifiers, unexpectedBetweenModifiersAndProtocolKeyword, protocolKeyword, unexpectedBetweenProtocolKeywordAndIdentifier, identifier, unexpectedBetweenIdentifierAndPrimaryAssociatedTypeClause, primaryAssociatedTypeClause, unexpectedBetweenPrimaryAssociatedTypeClauseAndInheritanceClause, inheritanceClause, unexpectedBetweenInheritanceClauseAndGenericWhereClause, genericWhereClause, unexpectedBetweenGenericWhereClauseAndMembers, members, unexpectedAfterMembers))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeAttributes?.raw,
        attributes?.raw,
        unexpectedBetweenAttributesAndModifiers?.raw,
        modifiers?.raw,
        unexpectedBetweenModifiersAndProtocolKeyword?.raw,
        protocolKeyword.raw,
        unexpectedBetweenProtocolKeywordAndIdentifier?.raw,
        identifier.raw,
        unexpectedBetweenIdentifierAndPrimaryAssociatedTypeClause?.raw,
        primaryAssociatedTypeClause?.raw,
        unexpectedBetweenPrimaryAssociatedTypeClauseAndInheritanceClause?.raw,
        inheritanceClause?.raw,
        unexpectedBetweenInheritanceClauseAndGenericWhereClause?.raw,
        genericWhereClause?.raw,
        unexpectedBetweenGenericWhereClauseAndMembers?.raw,
        members.raw,
        unexpectedAfterMembers?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.protocolDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ProtocolDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var attributes: AttributeListSyntax? {
    get {
      return data.child(at: 1, parent: Syntax(self)).map(AttributeListSyntax.init)
    }
    set(value) {
      self = ProtocolDeclSyntax(data.replacingChild(at: 1, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> ProtocolDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return ProtocolDeclSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ProtocolDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var modifiers: ModifierListSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(ModifierListSyntax.init)
    }
    set(value) {
      self = ProtocolDeclSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: DeclModifierSyntax) -> ProtocolDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.modifierList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return ProtocolDeclSyntax(newData)
  }

  public var unexpectedBetweenModifiersAndProtocolKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ProtocolDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var protocolKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = ProtocolDeclSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenProtocolKeywordAndIdentifier: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ProtocolDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var identifier: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 7, parent: Syntax(self))!)
    }
    set(value) {
      self = ProtocolDeclSyntax(data.replacingChild(at: 7, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenIdentifierAndPrimaryAssociatedTypeClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ProtocolDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var primaryAssociatedTypeClause: PrimaryAssociatedTypeClauseSyntax? {
    get {
      return data.child(at: 9, parent: Syntax(self)).map(PrimaryAssociatedTypeClauseSyntax.init)
    }
    set(value) {
      self = ProtocolDeclSyntax(data.replacingChild(at: 9, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenPrimaryAssociatedTypeClauseAndInheritanceClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 10, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ProtocolDeclSyntax(data.replacingChild(at: 10, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var inheritanceClause: TypeInheritanceClauseSyntax? {
    get {
      return data.child(at: 11, parent: Syntax(self)).map(TypeInheritanceClauseSyntax.init)
    }
    set(value) {
      self = ProtocolDeclSyntax(data.replacingChild(at: 11, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenInheritanceClauseAndGenericWhereClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 12, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ProtocolDeclSyntax(data.replacingChild(at: 12, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericWhereClause: GenericWhereClauseSyntax? {
    get {
      return data.child(at: 13, parent: Syntax(self)).map(GenericWhereClauseSyntax.init)
    }
    set(value) {
      self = ProtocolDeclSyntax(data.replacingChild(at: 13, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenGenericWhereClauseAndMembers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 14, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ProtocolDeclSyntax(data.replacingChild(at: 14, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var members: MemberDeclBlockSyntax {
    get {
      return MemberDeclBlockSyntax(data.child(at: 15, parent: Syntax(self))!)
    }
    set(value) {
      self = ProtocolDeclSyntax(data.replacingChild(at: 15, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterMembers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 16, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ProtocolDeclSyntax(data.replacingChild(at: 16, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAttributes,
      \Self.attributes,
      \Self.unexpectedBetweenAttributesAndModifiers,
      \Self.modifiers,
      \Self.unexpectedBetweenModifiersAndProtocolKeyword,
      \Self.protocolKeyword,
      \Self.unexpectedBetweenProtocolKeywordAndIdentifier,
      \Self.identifier,
      \Self.unexpectedBetweenIdentifierAndPrimaryAssociatedTypeClause,
      \Self.primaryAssociatedTypeClause,
      \Self.unexpectedBetweenPrimaryAssociatedTypeClauseAndInheritanceClause,
      \Self.inheritanceClause,
      \Self.unexpectedBetweenInheritanceClauseAndGenericWhereClause,
      \Self.genericWhereClause,
      \Self.unexpectedBetweenGenericWhereClauseAndMembers,
      \Self.members,
      \Self.unexpectedAfterMembers,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "attributes"
    case 2:
      return nil
    case 3:
      return "modifiers"
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    case 9:
      return "primary associated type clause"
    case 10:
      return nil
    case 11:
      return "inheritance clause"
    case 12:
      return nil
    case 13:
      return "generic where clause"
    case 14:
      return nil
    case 15:
      return nil
    case 16:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension ProtocolDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndModifiers": unexpectedBetweenAttributesAndModifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifiers": modifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenModifiersAndProtocolKeyword": unexpectedBetweenModifiersAndProtocolKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "protocolKeyword": Syntax(protocolKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenProtocolKeywordAndIdentifier": unexpectedBetweenProtocolKeywordAndIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "identifier": Syntax(identifier).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenIdentifierAndPrimaryAssociatedTypeClause": unexpectedBetweenIdentifierAndPrimaryAssociatedTypeClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "primaryAssociatedTypeClause": primaryAssociatedTypeClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenPrimaryAssociatedTypeClauseAndInheritanceClause": unexpectedBetweenPrimaryAssociatedTypeClauseAndInheritanceClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "inheritanceClause": inheritanceClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenInheritanceClauseAndGenericWhereClause": unexpectedBetweenInheritanceClauseAndGenericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericWhereClause": genericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenGenericWhereClauseAndMembers": unexpectedBetweenGenericWhereClauseAndMembers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "members": Syntax(members).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterMembers": unexpectedAfterMembers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ExtensionDeclSyntax

public struct ExtensionDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .extensionDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `ExtensionDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .extensionDecl)
    self._syntaxNode = Syntax(data)
  }

  public init<E: TypeSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax? = nil,
    _ unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? = nil,
    modifiers: ModifierListSyntax? = nil,
    _ unexpectedBetweenModifiersAndExtensionKeyword: UnexpectedNodesSyntax? = nil,
    extensionKeyword: TokenSyntax = .keyword(.extension),
    _ unexpectedBetweenExtensionKeywordAndExtendedType: UnexpectedNodesSyntax? = nil,
    extendedType: E,
    _ unexpectedBetweenExtendedTypeAndInheritanceClause: UnexpectedNodesSyntax? = nil,
    inheritanceClause: TypeInheritanceClauseSyntax? = nil,
    _ unexpectedBetweenInheritanceClauseAndGenericWhereClause: UnexpectedNodesSyntax? = nil,
    genericWhereClause: GenericWhereClauseSyntax? = nil,
    _ unexpectedBetweenGenericWhereClauseAndMembers: UnexpectedNodesSyntax? = nil,
    members: MemberDeclBlockSyntax,
    _ unexpectedAfterMembers: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeAttributes, attributes, unexpectedBetweenAttributesAndModifiers, modifiers, unexpectedBetweenModifiersAndExtensionKeyword, extensionKeyword, unexpectedBetweenExtensionKeywordAndExtendedType, extendedType, unexpectedBetweenExtendedTypeAndInheritanceClause, inheritanceClause, unexpectedBetweenInheritanceClauseAndGenericWhereClause, genericWhereClause, unexpectedBetweenGenericWhereClauseAndMembers, members, unexpectedAfterMembers))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeAttributes?.raw,
        attributes?.raw,
        unexpectedBetweenAttributesAndModifiers?.raw,
        modifiers?.raw,
        unexpectedBetweenModifiersAndExtensionKeyword?.raw,
        extensionKeyword.raw,
        unexpectedBetweenExtensionKeywordAndExtendedType?.raw,
        extendedType.raw,
        unexpectedBetweenExtendedTypeAndInheritanceClause?.raw,
        inheritanceClause?.raw,
        unexpectedBetweenInheritanceClauseAndGenericWhereClause?.raw,
        genericWhereClause?.raw,
        unexpectedBetweenGenericWhereClauseAndMembers?.raw,
        members.raw,
        unexpectedAfterMembers?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.extensionDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ExtensionDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var attributes: AttributeListSyntax? {
    get {
      return data.child(at: 1, parent: Syntax(self)).map(AttributeListSyntax.init)
    }
    set(value) {
      self = ExtensionDeclSyntax(data.replacingChild(at: 1, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> ExtensionDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return ExtensionDeclSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ExtensionDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var modifiers: ModifierListSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(ModifierListSyntax.init)
    }
    set(value) {
      self = ExtensionDeclSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: DeclModifierSyntax) -> ExtensionDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.modifierList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return ExtensionDeclSyntax(newData)
  }

  public var unexpectedBetweenModifiersAndExtensionKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ExtensionDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var extensionKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = ExtensionDeclSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenExtensionKeywordAndExtendedType: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ExtensionDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var extendedType: TypeSyntax {
    get {
      return TypeSyntax(data.child(at: 7, parent: Syntax(self))!)
    }
    set(value) {
      self = ExtensionDeclSyntax(data.replacingChild(at: 7, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenExtendedTypeAndInheritanceClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ExtensionDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var inheritanceClause: TypeInheritanceClauseSyntax? {
    get {
      return data.child(at: 9, parent: Syntax(self)).map(TypeInheritanceClauseSyntax.init)
    }
    set(value) {
      self = ExtensionDeclSyntax(data.replacingChild(at: 9, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenInheritanceClauseAndGenericWhereClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 10, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ExtensionDeclSyntax(data.replacingChild(at: 10, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericWhereClause: GenericWhereClauseSyntax? {
    get {
      return data.child(at: 11, parent: Syntax(self)).map(GenericWhereClauseSyntax.init)
    }
    set(value) {
      self = ExtensionDeclSyntax(data.replacingChild(at: 11, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenGenericWhereClauseAndMembers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 12, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ExtensionDeclSyntax(data.replacingChild(at: 12, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var members: MemberDeclBlockSyntax {
    get {
      return MemberDeclBlockSyntax(data.child(at: 13, parent: Syntax(self))!)
    }
    set(value) {
      self = ExtensionDeclSyntax(data.replacingChild(at: 13, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterMembers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 14, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ExtensionDeclSyntax(data.replacingChild(at: 14, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAttributes,
      \Self.attributes,
      \Self.unexpectedBetweenAttributesAndModifiers,
      \Self.modifiers,
      \Self.unexpectedBetweenModifiersAndExtensionKeyword,
      \Self.extensionKeyword,
      \Self.unexpectedBetweenExtensionKeywordAndExtendedType,
      \Self.extendedType,
      \Self.unexpectedBetweenExtendedTypeAndInheritanceClause,
      \Self.inheritanceClause,
      \Self.unexpectedBetweenInheritanceClauseAndGenericWhereClause,
      \Self.genericWhereClause,
      \Self.unexpectedBetweenGenericWhereClauseAndMembers,
      \Self.members,
      \Self.unexpectedAfterMembers,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "attributes"
    case 2:
      return nil
    case 3:
      return "modifiers"
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    case 9:
      return "inheritance clause"
    case 10:
      return nil
    case 11:
      return "generic where clause"
    case 12:
      return nil
    case 13:
      return nil
    case 14:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension ExtensionDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndModifiers": unexpectedBetweenAttributesAndModifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifiers": modifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenModifiersAndExtensionKeyword": unexpectedBetweenModifiersAndExtensionKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "extensionKeyword": Syntax(extensionKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenExtensionKeywordAndExtendedType": unexpectedBetweenExtensionKeywordAndExtendedType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "extendedType": Syntax(extendedType).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenExtendedTypeAndInheritanceClause": unexpectedBetweenExtendedTypeAndInheritanceClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "inheritanceClause": inheritanceClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenInheritanceClauseAndGenericWhereClause": unexpectedBetweenInheritanceClauseAndGenericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericWhereClause": genericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenGenericWhereClauseAndMembers": unexpectedBetweenGenericWhereClauseAndMembers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "members": Syntax(members).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterMembers": unexpectedAfterMembers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - FunctionDeclSyntax

public struct FunctionDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .functionDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `FunctionDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .functionDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax? = nil,
    _ unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? = nil,
    modifiers: ModifierListSyntax? = nil,
    _ unexpectedBetweenModifiersAndFuncKeyword: UnexpectedNodesSyntax? = nil,
    funcKeyword: TokenSyntax = .keyword(.func),
    _ unexpectedBetweenFuncKeywordAndIdentifier: UnexpectedNodesSyntax? = nil,
    identifier: TokenSyntax,
    _ unexpectedBetweenIdentifierAndGenericParameterClause: UnexpectedNodesSyntax? = nil,
    genericParameterClause: GenericParameterClauseSyntax? = nil,
    _ unexpectedBetweenGenericParameterClauseAndSignature: UnexpectedNodesSyntax? = nil,
    signature: FunctionSignatureSyntax,
    _ unexpectedBetweenSignatureAndGenericWhereClause: UnexpectedNodesSyntax? = nil,
    genericWhereClause: GenericWhereClauseSyntax? = nil,
    _ unexpectedBetweenGenericWhereClauseAndBody: UnexpectedNodesSyntax? = nil,
    body: CodeBlockSyntax? = nil,
    _ unexpectedAfterBody: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeAttributes, attributes, unexpectedBetweenAttributesAndModifiers, modifiers, unexpectedBetweenModifiersAndFuncKeyword, funcKeyword, unexpectedBetweenFuncKeywordAndIdentifier, identifier, unexpectedBetweenIdentifierAndGenericParameterClause, genericParameterClause, unexpectedBetweenGenericParameterClauseAndSignature, signature, unexpectedBetweenSignatureAndGenericWhereClause, genericWhereClause, unexpectedBetweenGenericWhereClauseAndBody, body, unexpectedAfterBody))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeAttributes?.raw,
        attributes?.raw,
        unexpectedBetweenAttributesAndModifiers?.raw,
        modifiers?.raw,
        unexpectedBetweenModifiersAndFuncKeyword?.raw,
        funcKeyword.raw,
        unexpectedBetweenFuncKeywordAndIdentifier?.raw,
        identifier.raw,
        unexpectedBetweenIdentifierAndGenericParameterClause?.raw,
        genericParameterClause?.raw,
        unexpectedBetweenGenericParameterClauseAndSignature?.raw,
        signature.raw,
        unexpectedBetweenSignatureAndGenericWhereClause?.raw,
        genericWhereClause?.raw,
        unexpectedBetweenGenericWhereClauseAndBody?.raw,
        body?.raw,
        unexpectedAfterBody?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.functionDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = FunctionDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var attributes: AttributeListSyntax? {
    get {
      return data.child(at: 1, parent: Syntax(self)).map(AttributeListSyntax.init)
    }
    set(value) {
      self = FunctionDeclSyntax(data.replacingChild(at: 1, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> FunctionDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return FunctionDeclSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = FunctionDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var modifiers: ModifierListSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(ModifierListSyntax.init)
    }
    set(value) {
      self = FunctionDeclSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: DeclModifierSyntax) -> FunctionDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.modifierList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return FunctionDeclSyntax(newData)
  }

  public var unexpectedBetweenModifiersAndFuncKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = FunctionDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var funcKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = FunctionDeclSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenFuncKeywordAndIdentifier: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = FunctionDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var identifier: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 7, parent: Syntax(self))!)
    }
    set(value) {
      self = FunctionDeclSyntax(data.replacingChild(at: 7, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenIdentifierAndGenericParameterClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = FunctionDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericParameterClause: GenericParameterClauseSyntax? {
    get {
      return data.child(at: 9, parent: Syntax(self)).map(GenericParameterClauseSyntax.init)
    }
    set(value) {
      self = FunctionDeclSyntax(data.replacingChild(at: 9, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenGenericParameterClauseAndSignature: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 10, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = FunctionDeclSyntax(data.replacingChild(at: 10, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var signature: FunctionSignatureSyntax {
    get {
      return FunctionSignatureSyntax(data.child(at: 11, parent: Syntax(self))!)
    }
    set(value) {
      self = FunctionDeclSyntax(data.replacingChild(at: 11, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenSignatureAndGenericWhereClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 12, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = FunctionDeclSyntax(data.replacingChild(at: 12, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericWhereClause: GenericWhereClauseSyntax? {
    get {
      return data.child(at: 13, parent: Syntax(self)).map(GenericWhereClauseSyntax.init)
    }
    set(value) {
      self = FunctionDeclSyntax(data.replacingChild(at: 13, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenGenericWhereClauseAndBody: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 14, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = FunctionDeclSyntax(data.replacingChild(at: 14, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var body: CodeBlockSyntax? {
    get {
      return data.child(at: 15, parent: Syntax(self)).map(CodeBlockSyntax.init)
    }
    set(value) {
      self = FunctionDeclSyntax(data.replacingChild(at: 15, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterBody: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 16, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = FunctionDeclSyntax(data.replacingChild(at: 16, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAttributes,
      \Self.attributes,
      \Self.unexpectedBetweenAttributesAndModifiers,
      \Self.modifiers,
      \Self.unexpectedBetweenModifiersAndFuncKeyword,
      \Self.funcKeyword,
      \Self.unexpectedBetweenFuncKeywordAndIdentifier,
      \Self.identifier,
      \Self.unexpectedBetweenIdentifierAndGenericParameterClause,
      \Self.genericParameterClause,
      \Self.unexpectedBetweenGenericParameterClauseAndSignature,
      \Self.signature,
      \Self.unexpectedBetweenSignatureAndGenericWhereClause,
      \Self.genericWhereClause,
      \Self.unexpectedBetweenGenericWhereClauseAndBody,
      \Self.body,
      \Self.unexpectedAfterBody,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "attributes"
    case 2:
      return nil
    case 3:
      return "modifiers"
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    case 9:
      return "generic parameter clause"
    case 10:
      return nil
    case 11:
      return "function signature"
    case 12:
      return nil
    case 13:
      return "generic where clause"
    case 14:
      return nil
    case 15:
      return nil
    case 16:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension FunctionDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndModifiers": unexpectedBetweenAttributesAndModifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifiers": modifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenModifiersAndFuncKeyword": unexpectedBetweenModifiersAndFuncKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "funcKeyword": Syntax(funcKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenFuncKeywordAndIdentifier": unexpectedBetweenFuncKeywordAndIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "identifier": Syntax(identifier).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenIdentifierAndGenericParameterClause": unexpectedBetweenIdentifierAndGenericParameterClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericParameterClause": genericParameterClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenGenericParameterClauseAndSignature": unexpectedBetweenGenericParameterClauseAndSignature.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "signature": Syntax(signature).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenSignatureAndGenericWhereClause": unexpectedBetweenSignatureAndGenericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericWhereClause": genericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenGenericWhereClauseAndBody": unexpectedBetweenGenericWhereClauseAndBody.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "body": body.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterBody": unexpectedAfterBody.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - InitializerDeclSyntax

public struct InitializerDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .initializerDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `InitializerDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .initializerDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax? = nil,
    _ unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? = nil,
    modifiers: ModifierListSyntax? = nil,
    _ unexpectedBetweenModifiersAndInitKeyword: UnexpectedNodesSyntax? = nil,
    initKeyword: TokenSyntax = .keyword(.`init`),
    _ unexpectedBetweenInitKeywordAndOptionalMark: UnexpectedNodesSyntax? = nil,
    optionalMark: TokenSyntax? = nil,
    _ unexpectedBetweenOptionalMarkAndGenericParameterClause: UnexpectedNodesSyntax? = nil,
    genericParameterClause: GenericParameterClauseSyntax? = nil,
    _ unexpectedBetweenGenericParameterClauseAndSignature: UnexpectedNodesSyntax? = nil,
    signature: FunctionSignatureSyntax,
    _ unexpectedBetweenSignatureAndGenericWhereClause: UnexpectedNodesSyntax? = nil,
    genericWhereClause: GenericWhereClauseSyntax? = nil,
    _ unexpectedBetweenGenericWhereClauseAndBody: UnexpectedNodesSyntax? = nil,
    body: CodeBlockSyntax? = nil,
    _ unexpectedAfterBody: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeAttributes, attributes, unexpectedBetweenAttributesAndModifiers, modifiers, unexpectedBetweenModifiersAndInitKeyword, initKeyword, unexpectedBetweenInitKeywordAndOptionalMark, optionalMark, unexpectedBetweenOptionalMarkAndGenericParameterClause, genericParameterClause, unexpectedBetweenGenericParameterClauseAndSignature, signature, unexpectedBetweenSignatureAndGenericWhereClause, genericWhereClause, unexpectedBetweenGenericWhereClauseAndBody, body, unexpectedAfterBody))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeAttributes?.raw,
        attributes?.raw,
        unexpectedBetweenAttributesAndModifiers?.raw,
        modifiers?.raw,
        unexpectedBetweenModifiersAndInitKeyword?.raw,
        initKeyword.raw,
        unexpectedBetweenInitKeywordAndOptionalMark?.raw,
        optionalMark?.raw,
        unexpectedBetweenOptionalMarkAndGenericParameterClause?.raw,
        genericParameterClause?.raw,
        unexpectedBetweenGenericParameterClauseAndSignature?.raw,
        signature.raw,
        unexpectedBetweenSignatureAndGenericWhereClause?.raw,
        genericWhereClause?.raw,
        unexpectedBetweenGenericWhereClauseAndBody?.raw,
        body?.raw,
        unexpectedAfterBody?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.initializerDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = InitializerDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var attributes: AttributeListSyntax? {
    get {
      return data.child(at: 1, parent: Syntax(self)).map(AttributeListSyntax.init)
    }
    set(value) {
      self = InitializerDeclSyntax(data.replacingChild(at: 1, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> InitializerDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return InitializerDeclSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = InitializerDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var modifiers: ModifierListSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(ModifierListSyntax.init)
    }
    set(value) {
      self = InitializerDeclSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: DeclModifierSyntax) -> InitializerDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.modifierList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return InitializerDeclSyntax(newData)
  }

  public var unexpectedBetweenModifiersAndInitKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = InitializerDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var initKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = InitializerDeclSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenInitKeywordAndOptionalMark: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = InitializerDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var optionalMark: TokenSyntax? {
    get {
      return data.child(at: 7, parent: Syntax(self)).map(TokenSyntax.init)
    }
    set(value) {
      self = InitializerDeclSyntax(data.replacingChild(at: 7, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenOptionalMarkAndGenericParameterClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = InitializerDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericParameterClause: GenericParameterClauseSyntax? {
    get {
      return data.child(at: 9, parent: Syntax(self)).map(GenericParameterClauseSyntax.init)
    }
    set(value) {
      self = InitializerDeclSyntax(data.replacingChild(at: 9, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenGenericParameterClauseAndSignature: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 10, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = InitializerDeclSyntax(data.replacingChild(at: 10, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var signature: FunctionSignatureSyntax {
    get {
      return FunctionSignatureSyntax(data.child(at: 11, parent: Syntax(self))!)
    }
    set(value) {
      self = InitializerDeclSyntax(data.replacingChild(at: 11, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenSignatureAndGenericWhereClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 12, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = InitializerDeclSyntax(data.replacingChild(at: 12, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericWhereClause: GenericWhereClauseSyntax? {
    get {
      return data.child(at: 13, parent: Syntax(self)).map(GenericWhereClauseSyntax.init)
    }
    set(value) {
      self = InitializerDeclSyntax(data.replacingChild(at: 13, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenGenericWhereClauseAndBody: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 14, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = InitializerDeclSyntax(data.replacingChild(at: 14, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var body: CodeBlockSyntax? {
    get {
      return data.child(at: 15, parent: Syntax(self)).map(CodeBlockSyntax.init)
    }
    set(value) {
      self = InitializerDeclSyntax(data.replacingChild(at: 15, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterBody: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 16, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = InitializerDeclSyntax(data.replacingChild(at: 16, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAttributes,
      \Self.attributes,
      \Self.unexpectedBetweenAttributesAndModifiers,
      \Self.modifiers,
      \Self.unexpectedBetweenModifiersAndInitKeyword,
      \Self.initKeyword,
      \Self.unexpectedBetweenInitKeywordAndOptionalMark,
      \Self.optionalMark,
      \Self.unexpectedBetweenOptionalMarkAndGenericParameterClause,
      \Self.genericParameterClause,
      \Self.unexpectedBetweenGenericParameterClauseAndSignature,
      \Self.signature,
      \Self.unexpectedBetweenSignatureAndGenericWhereClause,
      \Self.genericWhereClause,
      \Self.unexpectedBetweenGenericWhereClauseAndBody,
      \Self.body,
      \Self.unexpectedAfterBody,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "attributes"
    case 2:
      return nil
    case 3:
      return "modifiers"
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    case 9:
      return "generic parameter clause"
    case 10:
      return nil
    case 11:
      return "function signature"
    case 12:
      return nil
    case 13:
      return "generic where clause"
    case 14:
      return nil
    case 15:
      return nil
    case 16:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension InitializerDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndModifiers": unexpectedBetweenAttributesAndModifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifiers": modifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenModifiersAndInitKeyword": unexpectedBetweenModifiersAndInitKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "initKeyword": Syntax(initKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenInitKeywordAndOptionalMark": unexpectedBetweenInitKeywordAndOptionalMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "optionalMark": optionalMark.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenOptionalMarkAndGenericParameterClause": unexpectedBetweenOptionalMarkAndGenericParameterClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericParameterClause": genericParameterClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenGenericParameterClauseAndSignature": unexpectedBetweenGenericParameterClauseAndSignature.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "signature": Syntax(signature).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenSignatureAndGenericWhereClause": unexpectedBetweenSignatureAndGenericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericWhereClause": genericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenGenericWhereClauseAndBody": unexpectedBetweenGenericWhereClauseAndBody.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "body": body.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterBody": unexpectedAfterBody.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - DeinitializerDeclSyntax

public struct DeinitializerDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .deinitializerDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `DeinitializerDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .deinitializerDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax? = nil,
    _ unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? = nil,
    modifiers: ModifierListSyntax? = nil,
    _ unexpectedBetweenModifiersAndDeinitKeyword: UnexpectedNodesSyntax? = nil,
    deinitKeyword: TokenSyntax = .keyword(.deinit),
    _ unexpectedBetweenDeinitKeywordAndBody: UnexpectedNodesSyntax? = nil,
    body: CodeBlockSyntax? = nil,
    _ unexpectedAfterBody: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeAttributes, attributes, unexpectedBetweenAttributesAndModifiers, modifiers, unexpectedBetweenModifiersAndDeinitKeyword, deinitKeyword, unexpectedBetweenDeinitKeywordAndBody, body, unexpectedAfterBody))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeAttributes?.raw,
        attributes?.raw,
        unexpectedBetweenAttributesAndModifiers?.raw,
        modifiers?.raw,
        unexpectedBetweenModifiersAndDeinitKeyword?.raw,
        deinitKeyword.raw,
        unexpectedBetweenDeinitKeywordAndBody?.raw,
        body?.raw,
        unexpectedAfterBody?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.deinitializerDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = DeinitializerDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var attributes: AttributeListSyntax? {
    get {
      return data.child(at: 1, parent: Syntax(self)).map(AttributeListSyntax.init)
    }
    set(value) {
      self = DeinitializerDeclSyntax(data.replacingChild(at: 1, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> DeinitializerDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return DeinitializerDeclSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = DeinitializerDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var modifiers: ModifierListSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(ModifierListSyntax.init)
    }
    set(value) {
      self = DeinitializerDeclSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: DeclModifierSyntax) -> DeinitializerDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.modifierList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return DeinitializerDeclSyntax(newData)
  }

  public var unexpectedBetweenModifiersAndDeinitKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = DeinitializerDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var deinitKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = DeinitializerDeclSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenDeinitKeywordAndBody: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = DeinitializerDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var body: CodeBlockSyntax? {
    get {
      return data.child(at: 7, parent: Syntax(self)).map(CodeBlockSyntax.init)
    }
    set(value) {
      self = DeinitializerDeclSyntax(data.replacingChild(at: 7, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterBody: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = DeinitializerDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAttributes,
      \Self.attributes,
      \Self.unexpectedBetweenAttributesAndModifiers,
      \Self.modifiers,
      \Self.unexpectedBetweenModifiersAndDeinitKeyword,
      \Self.deinitKeyword,
      \Self.unexpectedBetweenDeinitKeywordAndBody,
      \Self.body,
      \Self.unexpectedAfterBody,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "attributes"
    case 2:
      return nil
    case 3:
      return "modifiers"
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension DeinitializerDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndModifiers": unexpectedBetweenAttributesAndModifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifiers": modifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenModifiersAndDeinitKeyword": unexpectedBetweenModifiersAndDeinitKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "deinitKeyword": Syntax(deinitKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenDeinitKeywordAndBody": unexpectedBetweenDeinitKeywordAndBody.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "body": body.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterBody": unexpectedAfterBody.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - SubscriptDeclSyntax

public struct SubscriptDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public enum Accessor: SyntaxChildChoices {
    case `accessors`(AccessorBlockSyntax)
    case `getter`(CodeBlockSyntax)
    public var _syntaxNode: Syntax {
      switch self {
      case .accessors(let node): return node._syntaxNode
      case .getter(let node): return node._syntaxNode
      }
    }
    init(_ data: SyntaxData) { self.init(Syntax(data))! }
    public init(_ node: AccessorBlockSyntax) {
      self = .accessors(node)
    }
    public init(_ node: CodeBlockSyntax) {
      self = .getter(node)
    }
    public init?<S: SyntaxProtocol>(_ node: S) {
      if let node = node.as(AccessorBlockSyntax.self) {
        self = .accessors(node)
        return
      }
      if let node = node.as(CodeBlockSyntax.self) {
        self = .getter(node)
        return
      }
      return nil
    }

    public static var structure: SyntaxNodeStructure {
      return .choices([
        .node(AccessorBlockSyntax.self),
        .node(CodeBlockSyntax.self),
      ])
    }
  }

  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .subscriptDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `SubscriptDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .subscriptDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax? = nil,
    _ unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? = nil,
    modifiers: ModifierListSyntax? = nil,
    _ unexpectedBetweenModifiersAndSubscriptKeyword: UnexpectedNodesSyntax? = nil,
    subscriptKeyword: TokenSyntax = .keyword(.subscript),
    _ unexpectedBetweenSubscriptKeywordAndGenericParameterClause: UnexpectedNodesSyntax? = nil,
    genericParameterClause: GenericParameterClauseSyntax? = nil,
    _ unexpectedBetweenGenericParameterClauseAndIndices: UnexpectedNodesSyntax? = nil,
    indices: ParameterClauseSyntax,
    _ unexpectedBetweenIndicesAndResult: UnexpectedNodesSyntax? = nil,
    result: ReturnClauseSyntax,
    _ unexpectedBetweenResultAndGenericWhereClause: UnexpectedNodesSyntax? = nil,
    genericWhereClause: GenericWhereClauseSyntax? = nil,
    _ unexpectedBetweenGenericWhereClauseAndAccessor: UnexpectedNodesSyntax? = nil,
    accessor: Accessor? = nil,
    _ unexpectedAfterAccessor: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeAttributes, attributes, unexpectedBetweenAttributesAndModifiers, modifiers, unexpectedBetweenModifiersAndSubscriptKeyword, subscriptKeyword, unexpectedBetweenSubscriptKeywordAndGenericParameterClause, genericParameterClause, unexpectedBetweenGenericParameterClauseAndIndices, indices, unexpectedBetweenIndicesAndResult, result, unexpectedBetweenResultAndGenericWhereClause, genericWhereClause, unexpectedBetweenGenericWhereClauseAndAccessor, accessor, unexpectedAfterAccessor))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeAttributes?.raw,
        attributes?.raw,
        unexpectedBetweenAttributesAndModifiers?.raw,
        modifiers?.raw,
        unexpectedBetweenModifiersAndSubscriptKeyword?.raw,
        subscriptKeyword.raw,
        unexpectedBetweenSubscriptKeywordAndGenericParameterClause?.raw,
        genericParameterClause?.raw,
        unexpectedBetweenGenericParameterClauseAndIndices?.raw,
        indices.raw,
        unexpectedBetweenIndicesAndResult?.raw,
        result.raw,
        unexpectedBetweenResultAndGenericWhereClause?.raw,
        genericWhereClause?.raw,
        unexpectedBetweenGenericWhereClauseAndAccessor?.raw,
        accessor?.raw,
        unexpectedAfterAccessor?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.subscriptDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = SubscriptDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var attributes: AttributeListSyntax? {
    get {
      return data.child(at: 1, parent: Syntax(self)).map(AttributeListSyntax.init)
    }
    set(value) {
      self = SubscriptDeclSyntax(data.replacingChild(at: 1, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> SubscriptDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return SubscriptDeclSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = SubscriptDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var modifiers: ModifierListSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(ModifierListSyntax.init)
    }
    set(value) {
      self = SubscriptDeclSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: DeclModifierSyntax) -> SubscriptDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.modifierList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return SubscriptDeclSyntax(newData)
  }

  public var unexpectedBetweenModifiersAndSubscriptKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = SubscriptDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var subscriptKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = SubscriptDeclSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenSubscriptKeywordAndGenericParameterClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = SubscriptDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericParameterClause: GenericParameterClauseSyntax? {
    get {
      return data.child(at: 7, parent: Syntax(self)).map(GenericParameterClauseSyntax.init)
    }
    set(value) {
      self = SubscriptDeclSyntax(data.replacingChild(at: 7, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenGenericParameterClauseAndIndices: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = SubscriptDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var indices: ParameterClauseSyntax {
    get {
      return ParameterClauseSyntax(data.child(at: 9, parent: Syntax(self))!)
    }
    set(value) {
      self = SubscriptDeclSyntax(data.replacingChild(at: 9, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenIndicesAndResult: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 10, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = SubscriptDeclSyntax(data.replacingChild(at: 10, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var result: ReturnClauseSyntax {
    get {
      return ReturnClauseSyntax(data.child(at: 11, parent: Syntax(self))!)
    }
    set(value) {
      self = SubscriptDeclSyntax(data.replacingChild(at: 11, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenResultAndGenericWhereClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 12, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = SubscriptDeclSyntax(data.replacingChild(at: 12, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericWhereClause: GenericWhereClauseSyntax? {
    get {
      return data.child(at: 13, parent: Syntax(self)).map(GenericWhereClauseSyntax.init)
    }
    set(value) {
      self = SubscriptDeclSyntax(data.replacingChild(at: 13, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenGenericWhereClauseAndAccessor: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 14, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = SubscriptDeclSyntax(data.replacingChild(at: 14, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var accessor: Accessor? {
    get {
      return data.child(at: 15, parent: Syntax(self)).map(Accessor.init)
    }
    set(value) {
      self = SubscriptDeclSyntax(data.replacingChild(at: 15, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterAccessor: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 16, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = SubscriptDeclSyntax(data.replacingChild(at: 16, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAttributes,
      \Self.attributes,
      \Self.unexpectedBetweenAttributesAndModifiers,
      \Self.modifiers,
      \Self.unexpectedBetweenModifiersAndSubscriptKeyword,
      \Self.subscriptKeyword,
      \Self.unexpectedBetweenSubscriptKeywordAndGenericParameterClause,
      \Self.genericParameterClause,
      \Self.unexpectedBetweenGenericParameterClauseAndIndices,
      \Self.indices,
      \Self.unexpectedBetweenIndicesAndResult,
      \Self.result,
      \Self.unexpectedBetweenResultAndGenericWhereClause,
      \Self.genericWhereClause,
      \Self.unexpectedBetweenGenericWhereClauseAndAccessor,
      \Self.accessor,
      \Self.unexpectedAfterAccessor,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "attributes"
    case 2:
      return nil
    case 3:
      return "modifiers"
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return "generic parameter clause"
    case 8:
      return nil
    case 9:
      return nil
    case 10:
      return nil
    case 11:
      return nil
    case 12:
      return nil
    case 13:
      return "generic where clause"
    case 14:
      return nil
    case 15:
      return nil
    case 16:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension SubscriptDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndModifiers": unexpectedBetweenAttributesAndModifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifiers": modifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenModifiersAndSubscriptKeyword": unexpectedBetweenModifiersAndSubscriptKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "subscriptKeyword": Syntax(subscriptKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenSubscriptKeywordAndGenericParameterClause": unexpectedBetweenSubscriptKeywordAndGenericParameterClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericParameterClause": genericParameterClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenGenericParameterClauseAndIndices": unexpectedBetweenGenericParameterClauseAndIndices.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "indices": Syntax(indices).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenIndicesAndResult": unexpectedBetweenIndicesAndResult.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "result": Syntax(result).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenResultAndGenericWhereClause": unexpectedBetweenResultAndGenericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericWhereClause": genericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenGenericWhereClauseAndAccessor": unexpectedBetweenGenericWhereClauseAndAccessor.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "accessor": accessor.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterAccessor": unexpectedAfterAccessor.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ImportDeclSyntax

public struct ImportDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .importDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `ImportDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .importDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax? = nil,
    _ unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? = nil,
    modifiers: ModifierListSyntax? = nil,
    _ unexpectedBetweenModifiersAndImportTok: UnexpectedNodesSyntax? = nil,
    importTok: TokenSyntax = .keyword(.import),
    _ unexpectedBetweenImportTokAndImportKind: UnexpectedNodesSyntax? = nil,
    importKind: TokenSyntax? = nil,
    _ unexpectedBetweenImportKindAndPath: UnexpectedNodesSyntax? = nil,
    path: AccessPathSyntax,
    _ unexpectedAfterPath: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeAttributes, attributes, unexpectedBetweenAttributesAndModifiers, modifiers, unexpectedBetweenModifiersAndImportTok, importTok, unexpectedBetweenImportTokAndImportKind, importKind, unexpectedBetweenImportKindAndPath, path, unexpectedAfterPath))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeAttributes?.raw,
        attributes?.raw,
        unexpectedBetweenAttributesAndModifiers?.raw,
        modifiers?.raw,
        unexpectedBetweenModifiersAndImportTok?.raw,
        importTok.raw,
        unexpectedBetweenImportTokAndImportKind?.raw,
        importKind?.raw,
        unexpectedBetweenImportKindAndPath?.raw,
        path.raw,
        unexpectedAfterPath?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.importDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ImportDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var attributes: AttributeListSyntax? {
    get {
      return data.child(at: 1, parent: Syntax(self)).map(AttributeListSyntax.init)
    }
    set(value) {
      self = ImportDeclSyntax(data.replacingChild(at: 1, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> ImportDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return ImportDeclSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ImportDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var modifiers: ModifierListSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(ModifierListSyntax.init)
    }
    set(value) {
      self = ImportDeclSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: DeclModifierSyntax) -> ImportDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.modifierList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return ImportDeclSyntax(newData)
  }

  public var unexpectedBetweenModifiersAndImportTok: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ImportDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var importTok: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = ImportDeclSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenImportTokAndImportKind: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ImportDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var importKind: TokenSyntax? {
    get {
      return data.child(at: 7, parent: Syntax(self)).map(TokenSyntax.init)
    }
    set(value) {
      self = ImportDeclSyntax(data.replacingChild(at: 7, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenImportKindAndPath: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ImportDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var path: AccessPathSyntax {
    get {
      return AccessPathSyntax(data.child(at: 9, parent: Syntax(self))!)
    }
    set(value) {
      self = ImportDeclSyntax(data.replacingChild(at: 9, with: value.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `PathComponent` to the node's `path`
  /// collection.
  /// - param element: The new `PathComponent` to add to the node's
  ///                  `path` collection.
  /// - returns: A copy of the receiver with the provided `PathComponent`
  ///            appended to its `path` collection.
  public func addPathComponent(_ element: AccessPathComponentSyntax) -> ImportDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[9] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.accessPath,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 9, with: collection, arena: arena)
    return ImportDeclSyntax(newData)
  }

  public var unexpectedAfterPath: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 10, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ImportDeclSyntax(data.replacingChild(at: 10, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAttributes,
      \Self.attributes,
      \Self.unexpectedBetweenAttributesAndModifiers,
      \Self.modifiers,
      \Self.unexpectedBetweenModifiersAndImportTok,
      \Self.importTok,
      \Self.unexpectedBetweenImportTokAndImportKind,
      \Self.importKind,
      \Self.unexpectedBetweenImportKindAndPath,
      \Self.path,
      \Self.unexpectedAfterPath,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "attributes"
    case 2:
      return nil
    case 3:
      return "modifiers"
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    case 9:
      return nil
    case 10:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension ImportDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndModifiers": unexpectedBetweenAttributesAndModifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifiers": modifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenModifiersAndImportTok": unexpectedBetweenModifiersAndImportTok.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "importTok": Syntax(importTok).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenImportTokAndImportKind": unexpectedBetweenImportTokAndImportKind.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "importKind": importKind.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenImportKindAndPath": unexpectedBetweenImportKindAndPath.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "path": Syntax(path).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterPath": unexpectedAfterPath.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - AccessorDeclSyntax

public struct AccessorDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .accessorDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `AccessorDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .accessorDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax? = nil,
    _ unexpectedBetweenAttributesAndModifier: UnexpectedNodesSyntax? = nil,
    modifier: DeclModifierSyntax? = nil,
    _ unexpectedBetweenModifierAndAccessorKind: UnexpectedNodesSyntax? = nil,
    accessorKind: TokenSyntax,
    _ unexpectedBetweenAccessorKindAndParameter: UnexpectedNodesSyntax? = nil,
    parameter: AccessorParameterSyntax? = nil,
    _ unexpectedBetweenParameterAndEffectSpecifiers: UnexpectedNodesSyntax? = nil,
    effectSpecifiers: DeclEffectSpecifiersSyntax? = nil,
    _ unexpectedBetweenEffectSpecifiersAndBody: UnexpectedNodesSyntax? = nil,
    body: CodeBlockSyntax? = nil,
    _ unexpectedAfterBody: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeAttributes, attributes, unexpectedBetweenAttributesAndModifier, modifier, unexpectedBetweenModifierAndAccessorKind, accessorKind, unexpectedBetweenAccessorKindAndParameter, parameter, unexpectedBetweenParameterAndEffectSpecifiers, effectSpecifiers, unexpectedBetweenEffectSpecifiersAndBody, body, unexpectedAfterBody))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeAttributes?.raw,
        attributes?.raw,
        unexpectedBetweenAttributesAndModifier?.raw,
        modifier?.raw,
        unexpectedBetweenModifierAndAccessorKind?.raw,
        accessorKind.raw,
        unexpectedBetweenAccessorKindAndParameter?.raw,
        parameter?.raw,
        unexpectedBetweenParameterAndEffectSpecifiers?.raw,
        effectSpecifiers?.raw,
        unexpectedBetweenEffectSpecifiersAndBody?.raw,
        body?.raw,
        unexpectedAfterBody?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.accessorDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = AccessorDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var attributes: AttributeListSyntax? {
    get {
      return data.child(at: 1, parent: Syntax(self)).map(AttributeListSyntax.init)
    }
    set(value) {
      self = AccessorDeclSyntax(data.replacingChild(at: 1, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> AccessorDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return AccessorDeclSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndModifier: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = AccessorDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var modifier: DeclModifierSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(DeclModifierSyntax.init)
    }
    set(value) {
      self = AccessorDeclSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenModifierAndAccessorKind: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = AccessorDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var accessorKind: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = AccessorDeclSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenAccessorKindAndParameter: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = AccessorDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var parameter: AccessorParameterSyntax? {
    get {
      return data.child(at: 7, parent: Syntax(self)).map(AccessorParameterSyntax.init)
    }
    set(value) {
      self = AccessorDeclSyntax(data.replacingChild(at: 7, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenParameterAndEffectSpecifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = AccessorDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var effectSpecifiers: DeclEffectSpecifiersSyntax? {
    get {
      return data.child(at: 9, parent: Syntax(self)).map(DeclEffectSpecifiersSyntax.init)
    }
    set(value) {
      self = AccessorDeclSyntax(data.replacingChild(at: 9, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenEffectSpecifiersAndBody: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 10, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = AccessorDeclSyntax(data.replacingChild(at: 10, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var body: CodeBlockSyntax? {
    get {
      return data.child(at: 11, parent: Syntax(self)).map(CodeBlockSyntax.init)
    }
    set(value) {
      self = AccessorDeclSyntax(data.replacingChild(at: 11, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterBody: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 12, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = AccessorDeclSyntax(data.replacingChild(at: 12, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAttributes,
      \Self.attributes,
      \Self.unexpectedBetweenAttributesAndModifier,
      \Self.modifier,
      \Self.unexpectedBetweenModifierAndAccessorKind,
      \Self.accessorKind,
      \Self.unexpectedBetweenAccessorKindAndParameter,
      \Self.parameter,
      \Self.unexpectedBetweenParameterAndEffectSpecifiers,
      \Self.effectSpecifiers,
      \Self.unexpectedBetweenEffectSpecifiersAndBody,
      \Self.body,
      \Self.unexpectedAfterBody,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "attributes"
    case 2:
      return nil
    case 3:
      return "modifiers"
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return "parameter"
    case 8:
      return nil
    case 9:
      return nil
    case 10:
      return nil
    case 11:
      return nil
    case 12:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension AccessorDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndModifier": unexpectedBetweenAttributesAndModifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifier": modifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenModifierAndAccessorKind": unexpectedBetweenModifierAndAccessorKind.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "accessorKind": Syntax(accessorKind).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenAccessorKindAndParameter": unexpectedBetweenAccessorKindAndParameter.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "parameter": parameter.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenParameterAndEffectSpecifiers": unexpectedBetweenParameterAndEffectSpecifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "effectSpecifiers": effectSpecifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenEffectSpecifiersAndBody": unexpectedBetweenEffectSpecifiersAndBody.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "body": body.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterBody": unexpectedAfterBody.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - VariableDeclSyntax

public struct VariableDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .variableDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `VariableDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .variableDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax? = nil,
    _ unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? = nil,
    modifiers: ModifierListSyntax? = nil,
    _ unexpectedBetweenModifiersAndLetOrVarKeyword: UnexpectedNodesSyntax? = nil,
    letOrVarKeyword: TokenSyntax,
    _ unexpectedBetweenLetOrVarKeywordAndBindings: UnexpectedNodesSyntax? = nil,
    bindings: PatternBindingListSyntax,
    _ unexpectedAfterBindings: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeAttributes, attributes, unexpectedBetweenAttributesAndModifiers, modifiers, unexpectedBetweenModifiersAndLetOrVarKeyword, letOrVarKeyword, unexpectedBetweenLetOrVarKeywordAndBindings, bindings, unexpectedAfterBindings))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeAttributes?.raw,
        attributes?.raw,
        unexpectedBetweenAttributesAndModifiers?.raw,
        modifiers?.raw,
        unexpectedBetweenModifiersAndLetOrVarKeyword?.raw,
        letOrVarKeyword.raw,
        unexpectedBetweenLetOrVarKeywordAndBindings?.raw,
        bindings.raw,
        unexpectedAfterBindings?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.variableDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = VariableDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var attributes: AttributeListSyntax? {
    get {
      return data.child(at: 1, parent: Syntax(self)).map(AttributeListSyntax.init)
    }
    set(value) {
      self = VariableDeclSyntax(data.replacingChild(at: 1, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> VariableDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return VariableDeclSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = VariableDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var modifiers: ModifierListSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(ModifierListSyntax.init)
    }
    set(value) {
      self = VariableDeclSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: DeclModifierSyntax) -> VariableDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.modifierList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return VariableDeclSyntax(newData)
  }

  public var unexpectedBetweenModifiersAndLetOrVarKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = VariableDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var letOrVarKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = VariableDeclSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenLetOrVarKeywordAndBindings: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = VariableDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var bindings: PatternBindingListSyntax {
    get {
      return PatternBindingListSyntax(data.child(at: 7, parent: Syntax(self))!)
    }
    set(value) {
      self = VariableDeclSyntax(data.replacingChild(at: 7, with: value.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Binding` to the node's `bindings`
  /// collection.
  /// - param element: The new `Binding` to add to the node's
  ///                  `bindings` collection.
  /// - returns: A copy of the receiver with the provided `Binding`
  ///            appended to its `bindings` collection.
  public func addBinding(_ element: PatternBindingSyntax) -> VariableDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[7] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.patternBindingList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 7, with: collection, arena: arena)
    return VariableDeclSyntax(newData)
  }

  public var unexpectedAfterBindings: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = VariableDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAttributes,
      \Self.attributes,
      \Self.unexpectedBetweenAttributesAndModifiers,
      \Self.modifiers,
      \Self.unexpectedBetweenModifiersAndLetOrVarKeyword,
      \Self.letOrVarKeyword,
      \Self.unexpectedBetweenLetOrVarKeywordAndBindings,
      \Self.bindings,
      \Self.unexpectedAfterBindings,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "attributes"
    case 2:
      return nil
    case 3:
      return "modifiers"
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension VariableDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndModifiers": unexpectedBetweenAttributesAndModifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifiers": modifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenModifiersAndLetOrVarKeyword": unexpectedBetweenModifiersAndLetOrVarKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "letOrVarKeyword": Syntax(letOrVarKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLetOrVarKeywordAndBindings": unexpectedBetweenLetOrVarKeywordAndBindings.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "bindings": Syntax(bindings).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterBindings": unexpectedAfterBindings.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - EnumCaseDeclSyntax

/// 
/// A `case` declaration of a Swift `enum`. It can have 1 or more
/// `EnumCaseElement`s inside, each declaring a different case of the
/// enum.
/// 
public struct EnumCaseDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .enumCaseDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `EnumCaseDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .enumCaseDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax? = nil,
    _ unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? = nil,
    modifiers: ModifierListSyntax? = nil,
    _ unexpectedBetweenModifiersAndCaseKeyword: UnexpectedNodesSyntax? = nil,
    caseKeyword: TokenSyntax = .keyword(.case),
    _ unexpectedBetweenCaseKeywordAndElements: UnexpectedNodesSyntax? = nil,
    elements: EnumCaseElementListSyntax,
    _ unexpectedAfterElements: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeAttributes, attributes, unexpectedBetweenAttributesAndModifiers, modifiers, unexpectedBetweenModifiersAndCaseKeyword, caseKeyword, unexpectedBetweenCaseKeywordAndElements, elements, unexpectedAfterElements))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeAttributes?.raw,
        attributes?.raw,
        unexpectedBetweenAttributesAndModifiers?.raw,
        modifiers?.raw,
        unexpectedBetweenModifiersAndCaseKeyword?.raw,
        caseKeyword.raw,
        unexpectedBetweenCaseKeywordAndElements?.raw,
        elements.raw,
        unexpectedAfterElements?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.enumCaseDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = EnumCaseDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// 
  /// The attributes applied to the case declaration.
  /// 
  public var attributes: AttributeListSyntax? {
    get {
      return data.child(at: 1, parent: Syntax(self)).map(AttributeListSyntax.init)
    }
    set(value) {
      self = EnumCaseDeclSyntax(data.replacingChild(at: 1, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> EnumCaseDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return EnumCaseDeclSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = EnumCaseDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// 
  /// The declaration modifiers applied to the case declaration.
  /// 
  public var modifiers: ModifierListSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(ModifierListSyntax.init)
    }
    set(value) {
      self = EnumCaseDeclSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: DeclModifierSyntax) -> EnumCaseDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.modifierList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return EnumCaseDeclSyntax(newData)
  }

  public var unexpectedBetweenModifiersAndCaseKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = EnumCaseDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// The `case` keyword for this case.
  public var caseKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = EnumCaseDeclSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenCaseKeywordAndElements: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = EnumCaseDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// The elements this case declares.
  public var elements: EnumCaseElementListSyntax {
    get {
      return EnumCaseElementListSyntax(data.child(at: 7, parent: Syntax(self))!)
    }
    set(value) {
      self = EnumCaseDeclSyntax(data.replacingChild(at: 7, with: value.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Element` to the node's `elements`
  /// collection.
  /// - param element: The new `Element` to add to the node's
  ///                  `elements` collection.
  /// - returns: A copy of the receiver with the provided `Element`
  ///            appended to its `elements` collection.
  public func addElement(_ element: EnumCaseElementSyntax) -> EnumCaseDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[7] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.enumCaseElementList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 7, with: collection, arena: arena)
    return EnumCaseDeclSyntax(newData)
  }

  public var unexpectedAfterElements: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = EnumCaseDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAttributes,
      \Self.attributes,
      \Self.unexpectedBetweenAttributesAndModifiers,
      \Self.modifiers,
      \Self.unexpectedBetweenModifiersAndCaseKeyword,
      \Self.caseKeyword,
      \Self.unexpectedBetweenCaseKeywordAndElements,
      \Self.elements,
      \Self.unexpectedAfterElements,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "attributes"
    case 2:
      return nil
    case 3:
      return "modifiers"
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return "elements"
    case 8:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension EnumCaseDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndModifiers": unexpectedBetweenAttributesAndModifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifiers": modifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenModifiersAndCaseKeyword": unexpectedBetweenModifiersAndCaseKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "caseKeyword": Syntax(caseKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenCaseKeywordAndElements": unexpectedBetweenCaseKeywordAndElements.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "elements": Syntax(elements).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterElements": unexpectedAfterElements.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - EnumDeclSyntax

/// A Swift `enum` declaration.
public struct EnumDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .enumDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `EnumDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .enumDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax? = nil,
    _ unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? = nil,
    modifiers: ModifierListSyntax? = nil,
    _ unexpectedBetweenModifiersAndEnumKeyword: UnexpectedNodesSyntax? = nil,
    enumKeyword: TokenSyntax = .keyword(.enum),
    _ unexpectedBetweenEnumKeywordAndIdentifier: UnexpectedNodesSyntax? = nil,
    identifier: TokenSyntax,
    _ unexpectedBetweenIdentifierAndGenericParameters: UnexpectedNodesSyntax? = nil,
    genericParameters: GenericParameterClauseSyntax? = nil,
    _ unexpectedBetweenGenericParametersAndInheritanceClause: UnexpectedNodesSyntax? = nil,
    inheritanceClause: TypeInheritanceClauseSyntax? = nil,
    _ unexpectedBetweenInheritanceClauseAndGenericWhereClause: UnexpectedNodesSyntax? = nil,
    genericWhereClause: GenericWhereClauseSyntax? = nil,
    _ unexpectedBetweenGenericWhereClauseAndMembers: UnexpectedNodesSyntax? = nil,
    members: MemberDeclBlockSyntax,
    _ unexpectedAfterMembers: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeAttributes, attributes, unexpectedBetweenAttributesAndModifiers, modifiers, unexpectedBetweenModifiersAndEnumKeyword, enumKeyword, unexpectedBetweenEnumKeywordAndIdentifier, identifier, unexpectedBetweenIdentifierAndGenericParameters, genericParameters, unexpectedBetweenGenericParametersAndInheritanceClause, inheritanceClause, unexpectedBetweenInheritanceClauseAndGenericWhereClause, genericWhereClause, unexpectedBetweenGenericWhereClauseAndMembers, members, unexpectedAfterMembers))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeAttributes?.raw,
        attributes?.raw,
        unexpectedBetweenAttributesAndModifiers?.raw,
        modifiers?.raw,
        unexpectedBetweenModifiersAndEnumKeyword?.raw,
        enumKeyword.raw,
        unexpectedBetweenEnumKeywordAndIdentifier?.raw,
        identifier.raw,
        unexpectedBetweenIdentifierAndGenericParameters?.raw,
        genericParameters?.raw,
        unexpectedBetweenGenericParametersAndInheritanceClause?.raw,
        inheritanceClause?.raw,
        unexpectedBetweenInheritanceClauseAndGenericWhereClause?.raw,
        genericWhereClause?.raw,
        unexpectedBetweenGenericWhereClauseAndMembers?.raw,
        members.raw,
        unexpectedAfterMembers?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.enumDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = EnumDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// 
  /// The attributes applied to the enum declaration.
  /// 
  public var attributes: AttributeListSyntax? {
    get {
      return data.child(at: 1, parent: Syntax(self)).map(AttributeListSyntax.init)
    }
    set(value) {
      self = EnumDeclSyntax(data.replacingChild(at: 1, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> EnumDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return EnumDeclSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = EnumDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// 
  /// The declaration modifiers applied to the enum declaration.
  /// 
  public var modifiers: ModifierListSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(ModifierListSyntax.init)
    }
    set(value) {
      self = EnumDeclSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: DeclModifierSyntax) -> EnumDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.modifierList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return EnumDeclSyntax(newData)
  }

  public var unexpectedBetweenModifiersAndEnumKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = EnumDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// 
  /// The `enum` keyword for this declaration.
  /// 
  public var enumKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = EnumDeclSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenEnumKeywordAndIdentifier: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = EnumDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// 
  /// The name of this enum.
  /// 
  public var identifier: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 7, parent: Syntax(self))!)
    }
    set(value) {
      self = EnumDeclSyntax(data.replacingChild(at: 7, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenIdentifierAndGenericParameters: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = EnumDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// 
  /// The generic parameters, if any, for this enum.
  /// 
  public var genericParameters: GenericParameterClauseSyntax? {
    get {
      return data.child(at: 9, parent: Syntax(self)).map(GenericParameterClauseSyntax.init)
    }
    set(value) {
      self = EnumDeclSyntax(data.replacingChild(at: 9, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenGenericParametersAndInheritanceClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 10, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = EnumDeclSyntax(data.replacingChild(at: 10, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// 
  /// The inheritance clause describing conformances or raw
  /// values for this enum.
  /// 
  public var inheritanceClause: TypeInheritanceClauseSyntax? {
    get {
      return data.child(at: 11, parent: Syntax(self)).map(TypeInheritanceClauseSyntax.init)
    }
    set(value) {
      self = EnumDeclSyntax(data.replacingChild(at: 11, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenInheritanceClauseAndGenericWhereClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 12, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = EnumDeclSyntax(data.replacingChild(at: 12, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// 
  /// The `where` clause that applies to the generic parameters of
  /// this enum.
  /// 
  public var genericWhereClause: GenericWhereClauseSyntax? {
    get {
      return data.child(at: 13, parent: Syntax(self)).map(GenericWhereClauseSyntax.init)
    }
    set(value) {
      self = EnumDeclSyntax(data.replacingChild(at: 13, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenGenericWhereClauseAndMembers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 14, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = EnumDeclSyntax(data.replacingChild(at: 14, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// 
  /// The cases and other members of this enum.
  /// 
  public var members: MemberDeclBlockSyntax {
    get {
      return MemberDeclBlockSyntax(data.child(at: 15, parent: Syntax(self))!)
    }
    set(value) {
      self = EnumDeclSyntax(data.replacingChild(at: 15, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterMembers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 16, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = EnumDeclSyntax(data.replacingChild(at: 16, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAttributes,
      \Self.attributes,
      \Self.unexpectedBetweenAttributesAndModifiers,
      \Self.modifiers,
      \Self.unexpectedBetweenModifiersAndEnumKeyword,
      \Self.enumKeyword,
      \Self.unexpectedBetweenEnumKeywordAndIdentifier,
      \Self.identifier,
      \Self.unexpectedBetweenIdentifierAndGenericParameters,
      \Self.genericParameters,
      \Self.unexpectedBetweenGenericParametersAndInheritanceClause,
      \Self.inheritanceClause,
      \Self.unexpectedBetweenInheritanceClauseAndGenericWhereClause,
      \Self.genericWhereClause,
      \Self.unexpectedBetweenGenericWhereClauseAndMembers,
      \Self.members,
      \Self.unexpectedAfterMembers,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "attributes"
    case 2:
      return nil
    case 3:
      return "modifiers"
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    case 9:
      return "generic parameter clause"
    case 10:
      return nil
    case 11:
      return "inheritance clause"
    case 12:
      return nil
    case 13:
      return "generic where clause"
    case 14:
      return nil
    case 15:
      return nil
    case 16:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension EnumDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndModifiers": unexpectedBetweenAttributesAndModifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifiers": modifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenModifiersAndEnumKeyword": unexpectedBetweenModifiersAndEnumKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "enumKeyword": Syntax(enumKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenEnumKeywordAndIdentifier": unexpectedBetweenEnumKeywordAndIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "identifier": Syntax(identifier).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenIdentifierAndGenericParameters": unexpectedBetweenIdentifierAndGenericParameters.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericParameters": genericParameters.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenGenericParametersAndInheritanceClause": unexpectedBetweenGenericParametersAndInheritanceClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "inheritanceClause": inheritanceClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenInheritanceClauseAndGenericWhereClause": unexpectedBetweenInheritanceClauseAndGenericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericWhereClause": genericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenGenericWhereClauseAndMembers": unexpectedBetweenGenericWhereClauseAndMembers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "members": Syntax(members).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterMembers": unexpectedAfterMembers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - OperatorDeclSyntax

/// A Swift `operator` declaration.
public struct OperatorDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .operatorDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `OperatorDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .operatorDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax? = nil,
    _ unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? = nil,
    modifiers: ModifierListSyntax? = nil,
    _ unexpectedBetweenModifiersAndOperatorKeyword: UnexpectedNodesSyntax? = nil,
    operatorKeyword: TokenSyntax = .keyword(.operator),
    _ unexpectedBetweenOperatorKeywordAndIdentifier: UnexpectedNodesSyntax? = nil,
    identifier: TokenSyntax,
    _ unexpectedBetweenIdentifierAndOperatorPrecedenceAndTypes: UnexpectedNodesSyntax? = nil,
    operatorPrecedenceAndTypes: OperatorPrecedenceAndTypesSyntax? = nil,
    _ unexpectedAfterOperatorPrecedenceAndTypes: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeAttributes, attributes, unexpectedBetweenAttributesAndModifiers, modifiers, unexpectedBetweenModifiersAndOperatorKeyword, operatorKeyword, unexpectedBetweenOperatorKeywordAndIdentifier, identifier, unexpectedBetweenIdentifierAndOperatorPrecedenceAndTypes, operatorPrecedenceAndTypes, unexpectedAfterOperatorPrecedenceAndTypes))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeAttributes?.raw,
        attributes?.raw,
        unexpectedBetweenAttributesAndModifiers?.raw,
        modifiers?.raw,
        unexpectedBetweenModifiersAndOperatorKeyword?.raw,
        operatorKeyword.raw,
        unexpectedBetweenOperatorKeywordAndIdentifier?.raw,
        identifier.raw,
        unexpectedBetweenIdentifierAndOperatorPrecedenceAndTypes?.raw,
        operatorPrecedenceAndTypes?.raw,
        unexpectedAfterOperatorPrecedenceAndTypes?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.operatorDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = OperatorDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// 
  /// The attributes applied to the 'operator' declaration.
  /// 
  public var attributes: AttributeListSyntax? {
    get {
      return data.child(at: 1, parent: Syntax(self)).map(AttributeListSyntax.init)
    }
    set(value) {
      self = OperatorDeclSyntax(data.replacingChild(at: 1, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> OperatorDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return OperatorDeclSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = OperatorDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// 
  /// The declaration modifiers applied to the 'operator'
  /// declaration.
  /// 
  public var modifiers: ModifierListSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(ModifierListSyntax.init)
    }
    set(value) {
      self = OperatorDeclSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: DeclModifierSyntax) -> OperatorDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.modifierList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return OperatorDeclSyntax(newData)
  }

  public var unexpectedBetweenModifiersAndOperatorKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = OperatorDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var operatorKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = OperatorDeclSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenOperatorKeywordAndIdentifier: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = OperatorDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var identifier: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 7, parent: Syntax(self))!)
    }
    set(value) {
      self = OperatorDeclSyntax(data.replacingChild(at: 7, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenIdentifierAndOperatorPrecedenceAndTypes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = OperatorDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// 
  /// Optionally specify a precedence group and designated types.
  /// 
  public var operatorPrecedenceAndTypes: OperatorPrecedenceAndTypesSyntax? {
    get {
      return data.child(at: 9, parent: Syntax(self)).map(OperatorPrecedenceAndTypesSyntax.init)
    }
    set(value) {
      self = OperatorDeclSyntax(data.replacingChild(at: 9, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterOperatorPrecedenceAndTypes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 10, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = OperatorDeclSyntax(data.replacingChild(at: 10, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAttributes,
      \Self.attributes,
      \Self.unexpectedBetweenAttributesAndModifiers,
      \Self.modifiers,
      \Self.unexpectedBetweenModifiersAndOperatorKeyword,
      \Self.operatorKeyword,
      \Self.unexpectedBetweenOperatorKeywordAndIdentifier,
      \Self.identifier,
      \Self.unexpectedBetweenIdentifierAndOperatorPrecedenceAndTypes,
      \Self.operatorPrecedenceAndTypes,
      \Self.unexpectedAfterOperatorPrecedenceAndTypes,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "attributes"
    case 2:
      return nil
    case 3:
      return "modifiers"
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    case 9:
      return nil
    case 10:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension OperatorDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndModifiers": unexpectedBetweenAttributesAndModifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifiers": modifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenModifiersAndOperatorKeyword": unexpectedBetweenModifiersAndOperatorKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "operatorKeyword": Syntax(operatorKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenOperatorKeywordAndIdentifier": unexpectedBetweenOperatorKeywordAndIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "identifier": Syntax(identifier).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenIdentifierAndOperatorPrecedenceAndTypes": unexpectedBetweenIdentifierAndOperatorPrecedenceAndTypes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "operatorPrecedenceAndTypes": operatorPrecedenceAndTypes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterOperatorPrecedenceAndTypes": unexpectedAfterOperatorPrecedenceAndTypes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - PrecedenceGroupDeclSyntax

/// A Swift `precedencegroup` declaration.
public struct PrecedenceGroupDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .precedenceGroupDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `PrecedenceGroupDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .precedenceGroupDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax? = nil,
    _ unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? = nil,
    modifiers: ModifierListSyntax? = nil,
    _ unexpectedBetweenModifiersAndPrecedencegroupKeyword: UnexpectedNodesSyntax? = nil,
    precedencegroupKeyword: TokenSyntax = .keyword(.precedencegroup),
    _ unexpectedBetweenPrecedencegroupKeywordAndIdentifier: UnexpectedNodesSyntax? = nil,
    identifier: TokenSyntax,
    _ unexpectedBetweenIdentifierAndLeftBrace: UnexpectedNodesSyntax? = nil,
    leftBrace: TokenSyntax = .leftBraceToken(),
    _ unexpectedBetweenLeftBraceAndGroupAttributes: UnexpectedNodesSyntax? = nil,
    groupAttributes: PrecedenceGroupAttributeListSyntax,
    _ unexpectedBetweenGroupAttributesAndRightBrace: UnexpectedNodesSyntax? = nil,
    rightBrace: TokenSyntax = .rightBraceToken(),
    _ unexpectedAfterRightBrace: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeAttributes, attributes, unexpectedBetweenAttributesAndModifiers, modifiers, unexpectedBetweenModifiersAndPrecedencegroupKeyword, precedencegroupKeyword, unexpectedBetweenPrecedencegroupKeywordAndIdentifier, identifier, unexpectedBetweenIdentifierAndLeftBrace, leftBrace, unexpectedBetweenLeftBraceAndGroupAttributes, groupAttributes, unexpectedBetweenGroupAttributesAndRightBrace, rightBrace, unexpectedAfterRightBrace))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeAttributes?.raw,
        attributes?.raw,
        unexpectedBetweenAttributesAndModifiers?.raw,
        modifiers?.raw,
        unexpectedBetweenModifiersAndPrecedencegroupKeyword?.raw,
        precedencegroupKeyword.raw,
        unexpectedBetweenPrecedencegroupKeywordAndIdentifier?.raw,
        identifier.raw,
        unexpectedBetweenIdentifierAndLeftBrace?.raw,
        leftBrace.raw,
        unexpectedBetweenLeftBraceAndGroupAttributes?.raw,
        groupAttributes.raw,
        unexpectedBetweenGroupAttributesAndRightBrace?.raw,
        rightBrace.raw,
        unexpectedAfterRightBrace?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.precedenceGroupDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PrecedenceGroupDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// 
  /// The attributes applied to the 'precedencegroup' declaration.
  /// 
  public var attributes: AttributeListSyntax? {
    get {
      return data.child(at: 1, parent: Syntax(self)).map(AttributeListSyntax.init)
    }
    set(value) {
      self = PrecedenceGroupDeclSyntax(data.replacingChild(at: 1, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> PrecedenceGroupDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return PrecedenceGroupDeclSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PrecedenceGroupDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// 
  /// The declaration modifiers applied to the 'precedencegroup'
  /// declaration.
  /// 
  public var modifiers: ModifierListSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(ModifierListSyntax.init)
    }
    set(value) {
      self = PrecedenceGroupDeclSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: DeclModifierSyntax) -> PrecedenceGroupDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.modifierList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return PrecedenceGroupDeclSyntax(newData)
  }

  public var unexpectedBetweenModifiersAndPrecedencegroupKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PrecedenceGroupDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var precedencegroupKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = PrecedenceGroupDeclSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenPrecedencegroupKeywordAndIdentifier: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PrecedenceGroupDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// 
  /// The name of this precedence group.
  /// 
  public var identifier: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 7, parent: Syntax(self))!)
    }
    set(value) {
      self = PrecedenceGroupDeclSyntax(data.replacingChild(at: 7, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenIdentifierAndLeftBrace: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PrecedenceGroupDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var leftBrace: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 9, parent: Syntax(self))!)
    }
    set(value) {
      self = PrecedenceGroupDeclSyntax(data.replacingChild(at: 9, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenLeftBraceAndGroupAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 10, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PrecedenceGroupDeclSyntax(data.replacingChild(at: 10, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// 
  /// The characteristics of this precedence group.
  /// 
  public var groupAttributes: PrecedenceGroupAttributeListSyntax {
    get {
      return PrecedenceGroupAttributeListSyntax(data.child(at: 11, parent: Syntax(self))!)
    }
    set(value) {
      self = PrecedenceGroupDeclSyntax(data.replacingChild(at: 11, with: value.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `GroupAttribute` to the node's `groupAttributes`
  /// collection.
  /// - param element: The new `GroupAttribute` to add to the node's
  ///                  `groupAttributes` collection.
  /// - returns: A copy of the receiver with the provided `GroupAttribute`
  ///            appended to its `groupAttributes` collection.
  public func addGroupAttribute(_ element: Syntax) -> PrecedenceGroupDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[11] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.precedenceGroupAttributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 11, with: collection, arena: arena)
    return PrecedenceGroupDeclSyntax(newData)
  }

  public var unexpectedBetweenGroupAttributesAndRightBrace: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 12, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PrecedenceGroupDeclSyntax(data.replacingChild(at: 12, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var rightBrace: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 13, parent: Syntax(self))!)
    }
    set(value) {
      self = PrecedenceGroupDeclSyntax(data.replacingChild(at: 13, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterRightBrace: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 14, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = PrecedenceGroupDeclSyntax(data.replacingChild(at: 14, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAttributes,
      \Self.attributes,
      \Self.unexpectedBetweenAttributesAndModifiers,
      \Self.modifiers,
      \Self.unexpectedBetweenModifiersAndPrecedencegroupKeyword,
      \Self.precedencegroupKeyword,
      \Self.unexpectedBetweenPrecedencegroupKeywordAndIdentifier,
      \Self.identifier,
      \Self.unexpectedBetweenIdentifierAndLeftBrace,
      \Self.leftBrace,
      \Self.unexpectedBetweenLeftBraceAndGroupAttributes,
      \Self.groupAttributes,
      \Self.unexpectedBetweenGroupAttributesAndRightBrace,
      \Self.rightBrace,
      \Self.unexpectedAfterRightBrace,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "attributes"
    case 2:
      return nil
    case 3:
      return "modifiers"
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    case 9:
      return nil
    case 10:
      return nil
    case 11:
      return nil
    case 12:
      return nil
    case 13:
      return nil
    case 14:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension PrecedenceGroupDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndModifiers": unexpectedBetweenAttributesAndModifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifiers": modifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenModifiersAndPrecedencegroupKeyword": unexpectedBetweenModifiersAndPrecedencegroupKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "precedencegroupKeyword": Syntax(precedencegroupKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenPrecedencegroupKeywordAndIdentifier": unexpectedBetweenPrecedencegroupKeywordAndIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "identifier": Syntax(identifier).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenIdentifierAndLeftBrace": unexpectedBetweenIdentifierAndLeftBrace.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftBrace": Syntax(leftBrace).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftBraceAndGroupAttributes": unexpectedBetweenLeftBraceAndGroupAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "groupAttributes": Syntax(groupAttributes).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenGroupAttributesAndRightBrace": unexpectedBetweenGroupAttributesAndRightBrace.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightBrace": Syntax(rightBrace).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterRightBrace": unexpectedAfterRightBrace.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - MacroDeclSyntax

public struct MacroDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public enum Signature: SyntaxChildChoices {
    case `functionLike`(FunctionSignatureSyntax)
    case `valueLike`(TypeAnnotationSyntax)
    public var _syntaxNode: Syntax {
      switch self {
      case .functionLike(let node): return node._syntaxNode
      case .valueLike(let node): return node._syntaxNode
      }
    }
    init(_ data: SyntaxData) { self.init(Syntax(data))! }
    public init(_ node: FunctionSignatureSyntax) {
      self = .functionLike(node)
    }
    public init(_ node: TypeAnnotationSyntax) {
      self = .valueLike(node)
    }
    public init?<S: SyntaxProtocol>(_ node: S) {
      if let node = node.as(FunctionSignatureSyntax.self) {
        self = .functionLike(node)
        return
      }
      if let node = node.as(TypeAnnotationSyntax.self) {
        self = .valueLike(node)
        return
      }
      return nil
    }

    public static var structure: SyntaxNodeStructure {
      return .choices([
        .node(FunctionSignatureSyntax.self),
        .node(TypeAnnotationSyntax.self),
      ])
    }
  }

  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .macroDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `MacroDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .macroDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeAttributes: UnexpectedNodesSyntax? = nil,
    attributes: AttributeListSyntax? = nil,
    _ unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? = nil,
    modifiers: ModifierListSyntax? = nil,
    _ unexpectedBetweenModifiersAndMacroKeyword: UnexpectedNodesSyntax? = nil,
    macroKeyword: TokenSyntax = .keyword(.macro),
    _ unexpectedBetweenMacroKeywordAndIdentifier: UnexpectedNodesSyntax? = nil,
    identifier: TokenSyntax,
    _ unexpectedBetweenIdentifierAndGenericParameterClause: UnexpectedNodesSyntax? = nil,
    genericParameterClause: GenericParameterClauseSyntax? = nil,
    _ unexpectedBetweenGenericParameterClauseAndSignature: UnexpectedNodesSyntax? = nil,
    signature: Signature,
    _ unexpectedBetweenSignatureAndDefinition: UnexpectedNodesSyntax? = nil,
    definition: InitializerClauseSyntax? = nil,
    _ unexpectedBetweenDefinitionAndGenericWhereClause: UnexpectedNodesSyntax? = nil,
    genericWhereClause: GenericWhereClauseSyntax? = nil,
    _ unexpectedAfterGenericWhereClause: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeAttributes, attributes, unexpectedBetweenAttributesAndModifiers, modifiers, unexpectedBetweenModifiersAndMacroKeyword, macroKeyword, unexpectedBetweenMacroKeywordAndIdentifier, identifier, unexpectedBetweenIdentifierAndGenericParameterClause, genericParameterClause, unexpectedBetweenGenericParameterClauseAndSignature, signature, unexpectedBetweenSignatureAndDefinition, definition, unexpectedBetweenDefinitionAndGenericWhereClause, genericWhereClause, unexpectedAfterGenericWhereClause))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeAttributes?.raw,
        attributes?.raw,
        unexpectedBetweenAttributesAndModifiers?.raw,
        modifiers?.raw,
        unexpectedBetweenModifiersAndMacroKeyword?.raw,
        macroKeyword.raw,
        unexpectedBetweenMacroKeywordAndIdentifier?.raw,
        identifier.raw,
        unexpectedBetweenIdentifierAndGenericParameterClause?.raw,
        genericParameterClause?.raw,
        unexpectedBetweenGenericParameterClauseAndSignature?.raw,
        signature.raw,
        unexpectedBetweenSignatureAndDefinition?.raw,
        definition?.raw,
        unexpectedBetweenDefinitionAndGenericWhereClause?.raw,
        genericWhereClause?.raw,
        unexpectedAfterGenericWhereClause?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.macroDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeAttributes: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MacroDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var attributes: AttributeListSyntax? {
    get {
      return data.child(at: 1, parent: Syntax(self)).map(AttributeListSyntax.init)
    }
    set(value) {
      self = MacroDeclSyntax(data.replacingChild(at: 1, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: Syntax) -> MacroDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[1] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.attributeList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 1, with: collection, arena: arena)
    return MacroDeclSyntax(newData)
  }

  public var unexpectedBetweenAttributesAndModifiers: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MacroDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var modifiers: ModifierListSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(ModifierListSyntax.init)
    }
    set(value) {
      self = MacroDeclSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: DeclModifierSyntax) -> MacroDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.modifierList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return MacroDeclSyntax(newData)
  }

  public var unexpectedBetweenModifiersAndMacroKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MacroDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var macroKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = MacroDeclSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenMacroKeywordAndIdentifier: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MacroDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var identifier: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 7, parent: Syntax(self))!)
    }
    set(value) {
      self = MacroDeclSyntax(data.replacingChild(at: 7, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenIdentifierAndGenericParameterClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MacroDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericParameterClause: GenericParameterClauseSyntax? {
    get {
      return data.child(at: 9, parent: Syntax(self)).map(GenericParameterClauseSyntax.init)
    }
    set(value) {
      self = MacroDeclSyntax(data.replacingChild(at: 9, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenGenericParameterClauseAndSignature: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 10, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MacroDeclSyntax(data.replacingChild(at: 10, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var signature: Signature {
    get {
      return Signature(data.child(at: 11, parent: Syntax(self))!)
    }
    set(value) {
      self = MacroDeclSyntax(data.replacingChild(at: 11, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenSignatureAndDefinition: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 12, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MacroDeclSyntax(data.replacingChild(at: 12, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var definition: InitializerClauseSyntax? {
    get {
      return data.child(at: 13, parent: Syntax(self)).map(InitializerClauseSyntax.init)
    }
    set(value) {
      self = MacroDeclSyntax(data.replacingChild(at: 13, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenDefinitionAndGenericWhereClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 14, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MacroDeclSyntax(data.replacingChild(at: 14, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericWhereClause: GenericWhereClauseSyntax? {
    get {
      return data.child(at: 15, parent: Syntax(self)).map(GenericWhereClauseSyntax.init)
    }
    set(value) {
      self = MacroDeclSyntax(data.replacingChild(at: 15, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterGenericWhereClause: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 16, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MacroDeclSyntax(data.replacingChild(at: 16, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeAttributes,
      \Self.attributes,
      \Self.unexpectedBetweenAttributesAndModifiers,
      \Self.modifiers,
      \Self.unexpectedBetweenModifiersAndMacroKeyword,
      \Self.macroKeyword,
      \Self.unexpectedBetweenMacroKeywordAndIdentifier,
      \Self.identifier,
      \Self.unexpectedBetweenIdentifierAndGenericParameterClause,
      \Self.genericParameterClause,
      \Self.unexpectedBetweenGenericParameterClauseAndSignature,
      \Self.signature,
      \Self.unexpectedBetweenSignatureAndDefinition,
      \Self.definition,
      \Self.unexpectedBetweenDefinitionAndGenericWhereClause,
      \Self.genericWhereClause,
      \Self.unexpectedAfterGenericWhereClause,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return "attributes"
    case 2:
      return nil
    case 3:
      return "modifiers"
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    case 9:
      return "generic parameter clause"
    case 10:
      return nil
    case 11:
      return "macro signature"
    case 12:
      return nil
    case 13:
      return "macro definition"
    case 14:
      return nil
    case 15:
      return "generic where clause"
    case 16:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension MacroDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeAttributes": unexpectedBeforeAttributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "attributes": attributes.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenAttributesAndModifiers": unexpectedBetweenAttributesAndModifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "modifiers": modifiers.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenModifiersAndMacroKeyword": unexpectedBetweenModifiersAndMacroKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "macroKeyword": Syntax(macroKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenMacroKeywordAndIdentifier": unexpectedBetweenMacroKeywordAndIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "identifier": Syntax(identifier).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenIdentifierAndGenericParameterClause": unexpectedBetweenIdentifierAndGenericParameterClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericParameterClause": genericParameterClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenGenericParameterClauseAndSignature": unexpectedBetweenGenericParameterClauseAndSignature.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "signature": Syntax(signature).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenSignatureAndDefinition": unexpectedBetweenSignatureAndDefinition.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "definition": definition.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenDefinitionAndGenericWhereClause": unexpectedBetweenDefinitionAndGenericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericWhereClause": genericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterGenericWhereClause": unexpectedAfterGenericWhereClause.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - MacroExpansionDeclSyntax

public struct MacroExpansionDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .macroExpansionDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `MacroExpansionDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .macroExpansionDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforePoundToken: UnexpectedNodesSyntax? = nil,
    poundToken: TokenSyntax = .poundToken(),
    _ unexpectedBetweenPoundTokenAndMacro: UnexpectedNodesSyntax? = nil,
    macro: TokenSyntax,
    _ unexpectedBetweenMacroAndGenericArguments: UnexpectedNodesSyntax? = nil,
    genericArguments: GenericArgumentClauseSyntax? = nil,
    _ unexpectedBetweenGenericArgumentsAndLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax? = nil,
    _ unexpectedBetweenLeftParenAndArgumentList: UnexpectedNodesSyntax? = nil,
    argumentList: TupleExprElementListSyntax,
    _ unexpectedBetweenArgumentListAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax? = nil,
    _ unexpectedBetweenRightParenAndTrailingClosure: UnexpectedNodesSyntax? = nil,
    trailingClosure: ClosureExprSyntax? = nil,
    _ unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures: UnexpectedNodesSyntax? = nil,
    additionalTrailingClosures: MultipleTrailingClosureElementListSyntax? = nil,
    _ unexpectedAfterAdditionalTrailingClosures: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforePoundToken, poundToken, unexpectedBetweenPoundTokenAndMacro, macro, unexpectedBetweenMacroAndGenericArguments, genericArguments, unexpectedBetweenGenericArgumentsAndLeftParen, leftParen, unexpectedBetweenLeftParenAndArgumentList, argumentList, unexpectedBetweenArgumentListAndRightParen, rightParen, unexpectedBetweenRightParenAndTrailingClosure, trailingClosure, unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures, additionalTrailingClosures, unexpectedAfterAdditionalTrailingClosures))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforePoundToken?.raw,
        poundToken.raw,
        unexpectedBetweenPoundTokenAndMacro?.raw,
        macro.raw,
        unexpectedBetweenMacroAndGenericArguments?.raw,
        genericArguments?.raw,
        unexpectedBetweenGenericArgumentsAndLeftParen?.raw,
        leftParen?.raw,
        unexpectedBetweenLeftParenAndArgumentList?.raw,
        argumentList.raw,
        unexpectedBetweenArgumentListAndRightParen?.raw,
        rightParen?.raw,
        unexpectedBetweenRightParenAndTrailingClosure?.raw,
        trailingClosure?.raw,
        unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures?.raw,
        additionalTrailingClosures?.raw,
        unexpectedAfterAdditionalTrailingClosures?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.macroExpansionDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforePoundToken: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MacroExpansionDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// The `#` sign.
  public var poundToken: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = MacroExpansionDeclSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenPoundTokenAndMacro: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MacroExpansionDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var macro: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 3, parent: Syntax(self))!)
    }
    set(value) {
      self = MacroExpansionDeclSyntax(data.replacingChild(at: 3, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenMacroAndGenericArguments: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MacroExpansionDeclSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var genericArguments: GenericArgumentClauseSyntax? {
    get {
      return data.child(at: 5, parent: Syntax(self)).map(GenericArgumentClauseSyntax.init)
    }
    set(value) {
      self = MacroExpansionDeclSyntax(data.replacingChild(at: 5, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenGenericArgumentsAndLeftParen: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MacroExpansionDeclSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var leftParen: TokenSyntax? {
    get {
      return data.child(at: 7, parent: Syntax(self)).map(TokenSyntax.init)
    }
    set(value) {
      self = MacroExpansionDeclSyntax(data.replacingChild(at: 7, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenLeftParenAndArgumentList: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 8, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MacroExpansionDeclSyntax(data.replacingChild(at: 8, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var argumentList: TupleExprElementListSyntax {
    get {
      return TupleExprElementListSyntax(data.child(at: 9, parent: Syntax(self))!)
    }
    set(value) {
      self = MacroExpansionDeclSyntax(data.replacingChild(at: 9, with: value.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Argument` to the node's `argumentList`
  /// collection.
  /// - param element: The new `Argument` to add to the node's
  ///                  `argumentList` collection.
  /// - returns: A copy of the receiver with the provided `Argument`
  ///            appended to its `argumentList` collection.
  public func addArgument(_ element: TupleExprElementSyntax) -> MacroExpansionDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[9] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.tupleExprElementList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 9, with: collection, arena: arena)
    return MacroExpansionDeclSyntax(newData)
  }

  public var unexpectedBetweenArgumentListAndRightParen: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 10, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MacroExpansionDeclSyntax(data.replacingChild(at: 10, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var rightParen: TokenSyntax? {
    get {
      return data.child(at: 11, parent: Syntax(self)).map(TokenSyntax.init)
    }
    set(value) {
      self = MacroExpansionDeclSyntax(data.replacingChild(at: 11, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenRightParenAndTrailingClosure: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 12, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MacroExpansionDeclSyntax(data.replacingChild(at: 12, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var trailingClosure: ClosureExprSyntax? {
    get {
      return data.child(at: 13, parent: Syntax(self)).map(ClosureExprSyntax.init)
    }
    set(value) {
      self = MacroExpansionDeclSyntax(data.replacingChild(at: 13, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 14, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MacroExpansionDeclSyntax(data.replacingChild(at: 14, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var additionalTrailingClosures: MultipleTrailingClosureElementListSyntax? {
    get {
      return data.child(at: 15, parent: Syntax(self)).map(MultipleTrailingClosureElementListSyntax.init)
    }
    set(value) {
      self = MacroExpansionDeclSyntax(data.replacingChild(at: 15, with: value?.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `AdditionalTrailingClosure` to the node's `additionalTrailingClosures`
  /// collection.
  /// - param element: The new `AdditionalTrailingClosure` to add to the node's
  ///                  `additionalTrailingClosures` collection.
  /// - returns: A copy of the receiver with the provided `AdditionalTrailingClosure`
  ///            appended to its `additionalTrailingClosures` collection.
  public func addAdditionalTrailingClosure(_ element: MultipleTrailingClosureElementSyntax) -> MacroExpansionDeclSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[15] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.multipleTrailingClosureElementList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 15, with: collection, arena: arena)
    return MacroExpansionDeclSyntax(newData)
  }

  public var unexpectedAfterAdditionalTrailingClosures: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 16, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = MacroExpansionDeclSyntax(data.replacingChild(at: 16, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforePoundToken,
      \Self.poundToken,
      \Self.unexpectedBetweenPoundTokenAndMacro,
      \Self.macro,
      \Self.unexpectedBetweenMacroAndGenericArguments,
      \Self.genericArguments,
      \Self.unexpectedBetweenGenericArgumentsAndLeftParen,
      \Self.leftParen,
      \Self.unexpectedBetweenLeftParenAndArgumentList,
      \Self.argumentList,
      \Self.unexpectedBetweenArgumentListAndRightParen,
      \Self.rightParen,
      \Self.unexpectedBetweenRightParenAndTrailingClosure,
      \Self.trailingClosure,
      \Self.unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures,
      \Self.additionalTrailingClosures,
      \Self.unexpectedAfterAdditionalTrailingClosures,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    case 3:
      return nil
    case 4:
      return nil
    case 5:
      return nil
    case 6:
      return nil
    case 7:
      return nil
    case 8:
      return nil
    case 9:
      return nil
    case 10:
      return nil
    case 11:
      return nil
    case 12:
      return nil
    case 13:
      return nil
    case 14:
      return nil
    case 15:
      return nil
    case 16:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension MacroExpansionDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforePoundToken": unexpectedBeforePoundToken.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "poundToken": Syntax(poundToken).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenPoundTokenAndMacro": unexpectedBetweenPoundTokenAndMacro.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "macro": Syntax(macro).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenMacroAndGenericArguments": unexpectedBetweenMacroAndGenericArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "genericArguments": genericArguments.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenGenericArgumentsAndLeftParen": unexpectedBetweenGenericArgumentsAndLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": leftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenLeftParenAndArgumentList": unexpectedBetweenLeftParenAndArgumentList.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "argumentList": Syntax(argumentList).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenArgumentListAndRightParen": unexpectedBetweenArgumentListAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": rightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenRightParenAndTrailingClosure": unexpectedBetweenRightParenAndTrailingClosure.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "trailingClosure": trailingClosure.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures": unexpectedBetweenTrailingClosureAndAdditionalTrailingClosures.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "additionalTrailingClosures": additionalTrailingClosures.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterAdditionalTrailingClosures": unexpectedAfterAdditionalTrailingClosures.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - EditorPlaceholderDeclSyntax

public struct EditorPlaceholderDeclSyntax: DeclSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .editorPlaceholderDecl else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `EditorPlaceholderDeclSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .editorPlaceholderDecl)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeIdentifier: UnexpectedNodesSyntax? = nil,
    identifier: TokenSyntax,
    _ unexpectedAfterIdentifier: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeIdentifier, identifier, unexpectedAfterIdentifier))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeIdentifier?.raw,
        identifier.raw,
        unexpectedAfterIdentifier?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.editorPlaceholderDecl, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeIdentifier: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = EditorPlaceholderDeclSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var identifier: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = EditorPlaceholderDeclSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterIdentifier: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = EditorPlaceholderDeclSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeIdentifier,
      \Self.identifier,
      \Self.unexpectedAfterIdentifier,
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    case 0:
      return nil
    case 1:
      return nil
    case 2:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension EditorPlaceholderDeclSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeIdentifier": unexpectedBeforeIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "identifier": Syntax(identifier).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterIdentifier": unexpectedAfterIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

