import heapq
import re

class MiniGoogle:
    def __init__(self):
        # Inverted Index: {word: {doc_id: frequency}}
        self.index = {}
        # Trie for Autocomplete: {char: {char: ..., '_is_word': True}}
        self.trie = {}
        # Document contents: {doc_id: content}
        self.documents = {}

    def add_document(self, doc_id, text):
        """Adds a document to the index and updates autocomplete."""
        self.documents[doc_id] = text
        words = re.findall(r'\w+', text.lower())
        
        for word in words:
            # 1. Update Inverted Index
            if word not in self.index:
                self.index[word] = {}
            self.index[word][doc_id] = self.index[word].get(doc_id, 0) + 1
            
            # 2. Update Trie for Autocomplete
            node = self.trie
            for char in word:
                if char not in node:
                    node[char] = {}
                node = node[char]
            node['_is_word'] = True

    def autocomplete(self, prefix):
        """Returns words in the index that start with the given prefix."""
        prefix = prefix.lower()
        node = self.trie
        for char in prefix:
            if char not in node:
                return []
            node = node[char]
        
        # Traverse subtree to find all words
        results = []
        self._dfs_trie(node, prefix, results)
        return results[:5] # Return top 5

    def _dfs_trie(self, node, prefix, results):
        if '_is_word' in node:
            results.append(prefix)
        for char, next_node in node.items():
            if char != '_is_word':
                self._dfs_trie(next_node, prefix + char, results)

    def search(self, query):
        """Searches for a word and returns ranked documents using a Heap."""
        query = query.lower()
        if query not in self.index:
            return []
        
        # Get list of (frequency, doc_id)
        postings = self.index[query]
        
        # Use a Min-Heap to get Top-K (K=3 here)
        # In Python, heapq is a Min-Heap.
        # We store (frequency, doc_id)
        heap = []
        K = 3
        
        for doc_id, freq in postings.items():
            if len(heap) < K:
                heapq.heappush(heap, (freq, doc_id))
            else:
                if freq > heap[0][0]:
                    heapq.heapreplace(heap, (freq, doc_id))
        
        # Return sorted results (highest first)
        return sorted(heap, reverse=True)

# --- REAL-TIME DEMONSTRATION ---
if __name__ == "__main__":
    engine = MiniGoogle()
    
    # 1. Indexing some 'Web Pages'
    engine.add_document("Doc1", "Rust is a fast and safe programming language for systems.")
    engine.add_document("Doc2", "Python is an easy to learn language but slower than Rust.")
    engine.add_document("Doc3", "Rust has no garbage collector, making it predictable.")
    engine.add_document("Doc4", "Learning systems programming requires understanding memory and rust.")

    print("--- ⌨️  Autocomplete for 'ru' ---")
    print(engine.autocomplete("ru")) # Expected: ['rust']

    print("\n--- 🔍 Searching for 'Rust' (Ranked by Frequency) ---")
    results = engine.search("rust")
    for score, doc_id in results:
        print(f"Ranked {doc_id} with relevance score: {score}")
        print(f"Snippet: {engine.documents[doc_id][:50]}...")
        print("-" * 20)
