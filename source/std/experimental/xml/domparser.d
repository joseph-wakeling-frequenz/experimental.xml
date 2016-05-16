
module std.experimental.xml.dom;

import std.experimental.xml.interfaces;
import std.experimental.xml.cursor;

/++
+   Built on top of XMLCursor, the DOM builder adds to it the ability to 
+   build a DOM node representing the node at the current position and, if
+   needed, its children. This allows for advanced usages like skipping entire
+   subtrees of the document, or connecting some nodes directly to their grand-parents,
+   skipping one layer of the hierarchy.
+/
struct DOMBuilder(T)
    if (isLowLevelParser!T)
{   
    /++
    +   The underlying XMLCursor methods are exposed, so that one can, for example,
    +   use the cursor API to skip some nodes.
    +/
    XMLCursor!T cursor;
    alias cursor this;
    
    /++
    +   Adds the current node to the DOM tree; if the DOM tree does not exist yet,
    +   the current node becomes its root; if the current node is not a descendant of 
    +   the root of the DOM tree, the DOM tree is discarded and the current node becomes
    +   the root of a new DOM tree.
    +/
    void build();
    
    /++
    +   Builds the current node and all of its descendants, as specified in build().
    +   Also advances the cursor to the end of the current element.
    +/
    void buildRecursive();
    
    /++ Returns the DOM tree built by this builder. +/
    Document!StringType getDOMTree() const;
}