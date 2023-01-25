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


// MARK: - MissingPatternSyntax

public struct MissingPatternSyntax: PatternSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .missingPattern else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `MissingPatternSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .missingPattern)
    self._syntaxNode = Syntax(data)
  }

  public init() {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), ())) { (arena, _) in
      let raw = RawSyntax.makeEmptyLayout(kind: SyntaxKind.missingPattern, arena: arena)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
    ])
  }

  public func childNameForDiagnostics(_ index: SyntaxChildrenIndex) -> String? {
    switch index.data?.indexInParent {
    default:
      fatalError("Invalid index")
    }
  }
}

extension MissingPatternSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
    ])
  }
}

// MARK: - IsTypePatternSyntax

public struct IsTypePatternSyntax: PatternSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .isTypePattern else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `IsTypePatternSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .isTypePattern)
    self._syntaxNode = Syntax(data)
  }

  public init<T: TypeSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeIsKeyword: UnexpectedNodesSyntax? = nil,
    isKeyword: TokenSyntax = .keyword(.is),
    _ unexpectedBetweenIsKeywordAndType: UnexpectedNodesSyntax? = nil,
    type: T,
    _ unexpectedAfterType: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeIsKeyword, isKeyword, unexpectedBetweenIsKeywordAndType, type, unexpectedAfterType))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeIsKeyword?.raw,
        isKeyword.raw,
        unexpectedBetweenIsKeywordAndType?.raw,
        type.raw,
        unexpectedAfterType?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.isTypePattern, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeIsKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = IsTypePatternSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var isKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = IsTypePatternSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenIsKeywordAndType: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = IsTypePatternSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var type: TypeSyntax {
    get {
      return TypeSyntax(data.child(at: 3, parent: Syntax(self))!)
    }
    set(value) {
      self = IsTypePatternSyntax(data.replacingChild(at: 3, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterType: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = IsTypePatternSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeIsKeyword,
      \Self.isKeyword,
      \Self.unexpectedBetweenIsKeywordAndType,
      \Self.type,
      \Self.unexpectedAfterType,
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

extension IsTypePatternSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeIsKeyword": unexpectedBeforeIsKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "isKeyword": Syntax(isKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenIsKeywordAndType": unexpectedBetweenIsKeywordAndType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "type": Syntax(type).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterType": unexpectedAfterType.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - IdentifierPatternSyntax

public struct IdentifierPatternSyntax: PatternSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .identifierPattern else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `IdentifierPatternSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .identifierPattern)
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
        kind: SyntaxKind.identifierPattern, from: layout, arena: arena,
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
      self = IdentifierPatternSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var identifier: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = IdentifierPatternSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterIdentifier: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = IdentifierPatternSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
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

extension IdentifierPatternSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeIdentifier": unexpectedBeforeIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "identifier": Syntax(identifier).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterIdentifier": unexpectedAfterIdentifier.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - TuplePatternSyntax

public struct TuplePatternSyntax: PatternSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .tuplePattern else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `TuplePatternSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .tuplePattern)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeLeftParen: UnexpectedNodesSyntax? = nil,
    leftParen: TokenSyntax = .leftParenToken(),
    _ unexpectedBetweenLeftParenAndElements: UnexpectedNodesSyntax? = nil,
    elements: TuplePatternElementListSyntax,
    _ unexpectedBetweenElementsAndRightParen: UnexpectedNodesSyntax? = nil,
    rightParen: TokenSyntax = .rightParenToken(),
    _ unexpectedAfterRightParen: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeLeftParen, leftParen, unexpectedBetweenLeftParenAndElements, elements, unexpectedBetweenElementsAndRightParen, rightParen, unexpectedAfterRightParen))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeLeftParen?.raw,
        leftParen.raw,
        unexpectedBetweenLeftParenAndElements?.raw,
        elements.raw,
        unexpectedBetweenElementsAndRightParen?.raw,
        rightParen.raw,
        unexpectedAfterRightParen?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.tuplePattern, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeLeftParen: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = TuplePatternSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var leftParen: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = TuplePatternSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenLeftParenAndElements: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = TuplePatternSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var elements: TuplePatternElementListSyntax {
    get {
      return TuplePatternElementListSyntax(data.child(at: 3, parent: Syntax(self))!)
    }
    set(value) {
      self = TuplePatternSyntax(data.replacingChild(at: 3, with: value.raw, arena: SyntaxArena()))
    }
  }

  /// Adds the provided `Element` to the node's `elements`
  /// collection.
  /// - param element: The new `Element` to add to the node's
  ///                  `elements` collection.
  /// - returns: A copy of the receiver with the provided `Element`
  ///            appended to its `elements` collection.
  public func addElement(_ element: TuplePatternElementSyntax) -> TuplePatternSyntax {
    var collection: RawSyntax
    let arena = SyntaxArena()
    if let col = raw.layoutView!.children[3] {
      collection = col.layoutView!.appending(element.raw, arena: arena)
    } else {
      collection = RawSyntax.makeLayout(kind: SyntaxKind.tuplePatternElementList,
        from: [element.raw], arena: arena)
    }
    let newData = data.replacingChild(at: 3, with: collection, arena: arena)
    return TuplePatternSyntax(newData)
  }

  public var unexpectedBetweenElementsAndRightParen: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = TuplePatternSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var rightParen: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 5, parent: Syntax(self))!)
    }
    set(value) {
      self = TuplePatternSyntax(data.replacingChild(at: 5, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterRightParen: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 6, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = TuplePatternSyntax(data.replacingChild(at: 6, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeLeftParen,
      \Self.leftParen,
      \Self.unexpectedBetweenLeftParenAndElements,
      \Self.elements,
      \Self.unexpectedBetweenElementsAndRightParen,
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
      return nil
    case 6:
      return nil
    default:
      fatalError("Invalid index")
    }
  }
}

extension TuplePatternSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLeftParen": unexpectedBeforeLeftParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "leftParen": Syntax(leftParen).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLeftParenAndElements": unexpectedBetweenLeftParenAndElements.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "elements": Syntax(elements).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenElementsAndRightParen": unexpectedBetweenElementsAndRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "rightParen": Syntax(rightParen).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterRightParen": unexpectedAfterRightParen.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - WildcardPatternSyntax

public struct WildcardPatternSyntax: PatternSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .wildcardPattern else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `WildcardPatternSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .wildcardPattern)
    self._syntaxNode = Syntax(data)
  }

  public init(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeWildcard: UnexpectedNodesSyntax? = nil,
    wildcard: TokenSyntax = .wildcardToken(),
    _ unexpectedBetweenWildcardAndTypeAnnotation: UnexpectedNodesSyntax? = nil,
    typeAnnotation: TypeAnnotationSyntax? = nil,
    _ unexpectedAfterTypeAnnotation: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeWildcard, wildcard, unexpectedBetweenWildcardAndTypeAnnotation, typeAnnotation, unexpectedAfterTypeAnnotation))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeWildcard?.raw,
        wildcard.raw,
        unexpectedBetweenWildcardAndTypeAnnotation?.raw,
        typeAnnotation?.raw,
        unexpectedAfterTypeAnnotation?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.wildcardPattern, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeWildcard: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = WildcardPatternSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var wildcard: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = WildcardPatternSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenWildcardAndTypeAnnotation: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = WildcardPatternSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var typeAnnotation: TypeAnnotationSyntax? {
    get {
      return data.child(at: 3, parent: Syntax(self)).map(TypeAnnotationSyntax.init)
    }
    set(value) {
      self = WildcardPatternSyntax(data.replacingChild(at: 3, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterTypeAnnotation: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = WildcardPatternSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeWildcard,
      \Self.wildcard,
      \Self.unexpectedBetweenWildcardAndTypeAnnotation,
      \Self.typeAnnotation,
      \Self.unexpectedAfterTypeAnnotation,
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

extension WildcardPatternSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeWildcard": unexpectedBeforeWildcard.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "wildcard": Syntax(wildcard).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenWildcardAndTypeAnnotation": unexpectedBetweenWildcardAndTypeAnnotation.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "typeAnnotation": typeAnnotation.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "unexpectedAfterTypeAnnotation": unexpectedAfterTypeAnnotation.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ExpressionPatternSyntax

public struct ExpressionPatternSyntax: PatternSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .expressionPattern else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `ExpressionPatternSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .expressionPattern)
    self._syntaxNode = Syntax(data)
  }

  public init<E: ExprSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeExpression: UnexpectedNodesSyntax? = nil,
    expression: E,
    _ unexpectedAfterExpression: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeExpression, expression, unexpectedAfterExpression))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeExpression?.raw,
        expression.raw,
        unexpectedAfterExpression?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.expressionPattern, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeExpression: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ExpressionPatternSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var expression: ExprSyntax {
    get {
      return ExprSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = ExpressionPatternSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterExpression: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ExpressionPatternSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeExpression,
      \Self.expression,
      \Self.unexpectedAfterExpression,
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

extension ExpressionPatternSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeExpression": unexpectedBeforeExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "expression": Syntax(expression).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterExpression": unexpectedAfterExpression.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

// MARK: - ValueBindingPatternSyntax

public struct ValueBindingPatternSyntax: PatternSyntaxProtocol, SyntaxHashable {
  public let _syntaxNode: Syntax

  public init?<S: SyntaxProtocol>(_ node: S) {
    guard node.raw.kind == .valueBindingPattern else { return nil }
    self._syntaxNode = node._syntaxNode
  }

  /// Creates a `ValueBindingPatternSyntax` node from the given `SyntaxData`. This assumes
  /// that the `SyntaxData` is of the correct kind. If it is not, the behaviour
  /// is undefined.
  internal init(_ data: SyntaxData) {
    assert(data.raw.kind == .valueBindingPattern)
    self._syntaxNode = Syntax(data)
  }

  public init<V: PatternSyntaxProtocol>(
    leadingTrivia: Trivia? = nil,
    _ unexpectedBeforeLetOrVarKeyword: UnexpectedNodesSyntax? = nil,
    letOrVarKeyword: TokenSyntax,
    _ unexpectedBetweenLetOrVarKeywordAndValuePattern: UnexpectedNodesSyntax? = nil,
    valuePattern: V,
    _ unexpectedAfterValuePattern: UnexpectedNodesSyntax? = nil,
    trailingTrivia: Trivia? = nil
  ) {
    // Extend the lifetime of all parameters so their arenas don't get destroyed 
    // before they can be added as children of the new arena.
    let data: SyntaxData = withExtendedLifetime((SyntaxArena(), (unexpectedBeforeLetOrVarKeyword, letOrVarKeyword, unexpectedBetweenLetOrVarKeywordAndValuePattern, valuePattern, unexpectedAfterValuePattern))) { (arena, _) in
      let layout: [RawSyntax?] = [
        unexpectedBeforeLetOrVarKeyword?.raw,
        letOrVarKeyword.raw,
        unexpectedBetweenLetOrVarKeywordAndValuePattern?.raw,
        valuePattern.raw,
        unexpectedAfterValuePattern?.raw,
      ]
      let raw = RawSyntax.makeLayout(
        kind: SyntaxKind.valueBindingPattern, from: layout, arena: arena,
        leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
      return SyntaxData.forRoot(raw)
    }
    self.init(data)
  }

  public var unexpectedBeforeLetOrVarKeyword: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 0, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ValueBindingPatternSyntax(data.replacingChild(at: 0, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var letOrVarKeyword: TokenSyntax {
    get {
      return TokenSyntax(data.child(at: 1, parent: Syntax(self))!)
    }
    set(value) {
      self = ValueBindingPatternSyntax(data.replacingChild(at: 1, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedBetweenLetOrVarKeywordAndValuePattern: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 2, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ValueBindingPatternSyntax(data.replacingChild(at: 2, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public var valuePattern: PatternSyntax {
    get {
      return PatternSyntax(data.child(at: 3, parent: Syntax(self))!)
    }
    set(value) {
      self = ValueBindingPatternSyntax(data.replacingChild(at: 3, with: value.raw, arena: SyntaxArena()))
    }
  }

  public var unexpectedAfterValuePattern: UnexpectedNodesSyntax? {
    get {
      return data.child(at: 4, parent: Syntax(self)).map(UnexpectedNodesSyntax.init)
    }
    set(value) {
      self = ValueBindingPatternSyntax(data.replacingChild(at: 4, with: value?.raw, arena: SyntaxArena()))
    }
  }

  public static var structure: SyntaxNodeStructure {
    return .layout([
      \Self.unexpectedBeforeLetOrVarKeyword,
      \Self.letOrVarKeyword,
      \Self.unexpectedBetweenLetOrVarKeywordAndValuePattern,
      \Self.valuePattern,
      \Self.unexpectedAfterValuePattern,
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

extension ValueBindingPatternSyntax: CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(self, children: [
      "unexpectedBeforeLetOrVarKeyword": unexpectedBeforeLetOrVarKeyword.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "letOrVarKeyword": Syntax(letOrVarKeyword).asProtocol(SyntaxProtocol.self),
      "unexpectedBetweenLetOrVarKeywordAndValuePattern": unexpectedBetweenLetOrVarKeywordAndValuePattern.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
      "valuePattern": Syntax(valuePattern).asProtocol(SyntaxProtocol.self),
      "unexpectedAfterValuePattern": unexpectedAfterValuePattern.map(Syntax.init)?.asProtocol(SyntaxProtocol.self) as Any,
    ])
  }
}

