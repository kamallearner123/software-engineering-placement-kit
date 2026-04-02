# 💡 Networking Interview Questions & Answers (Expanded)

Core Networking interview questions (20+ total) covering internet communication protocols and concepts.

---

## 1. Typing "www.google.com" - What happens?
**Answer**: DNS -> TCP -> HTTP -> Rendering. See Networking module.

---

## 2. OSI Model (7 Layers)
**Answer**: Physical, Data Link, Network, Transport, Session, Presentation, Application.

---

## 3. TCP vs UDP
**Answer**: TCP (Reliable/Connected); UDP (Fast/Connectionless).

---

## 4. HTTP vs HTTPS
**Answer**: HTTPS adds SSL/TLS encryption for privacy and security.

---

## 5. What is a RESTful API?
**Answer**: An architectural style for networking that uses standard HTTP methods and treats everything as resources.

```python
# REST Example (Python Flask)
@app.route('/users/<int:user_id>', methods=['GET'])
def get_user(user_id):
    return jsonify(find_user(user_id))
```

---

## 6. HTTP Methods
**Answer**:
- **GET**: Retrieve data.
- **POST**: Create new data.
- **PUT**: Update existing data (all fields).
- **PATCH**: Partial update of existing data.
- **DELETE**: Remove data.

---

## 7. HTTP Status Codes
**Answer**:
- **2xx (Success)**: 200 (OK), 201 (Created).
- **3xx (Redirection)**: 301 (Moved Permanently), 302 (Found).
- **4xx (Client Error)**: 400 (Bad Request), 401 (Unauthorized), 404 (Not Found).
- **5xx (Server Error)**: 500 (Internal Server Error), 503 (Service Unavailable).

---

## 8. Proxy vs Reverse Proxy
**Answer**:
- **Proxy**: Hides the client's IP from the server (e.g., VPN).
- **Reverse Proxy**: Hides the server's IP from the client (e.g., Nginx, Load Balancer).

---

## 9. Web Sockets
**Answer**: Persistent, bi-directional communication over a single TCP connection. (Used for chat/real-time).

---

## 10. DNS (Domain Name System)
**Answer**: Translates human-readable names (google.com) to machine IP addresses (142.250.xxx.xxx).

---

## 11. SSL/TLS Handshake
**Answer**:
1.  **Client Hello**: Cipher suites supported.
2.  **Server Hello**: Certificate + Public Key.
3.  **Key Exchange**: Symmetric key generation for encryption.
4.  **Finish**: Encrypted channel established.

---

## 12. IPv4 vs IPv6
**Answer**:
- **IPv4**: 32-bit (約43億 addresses).
- **IPv6**: 128-bit (nearly infinite addresses).

---

## 13. Subnetting and CIDR
**Answer**: CIDR (Classless Inter-Domain Routing) divides an IP block into smaller sub-networks (subnets) for efficient routing.

---

## 14. Router vs Switch vs Hub
**Answer**:
- **Hub**: (Layer 1) Broadcasts to everyone (Dumb).
- **Switch**: (Layer 2) Sends to specific MAC address (Smart).
- **Router**: (Layer 3) Routes data between networks based on IP (Genius).

---

## 15. NAT (Network Address Translation)
**Answer**: Maps a private network IP to a single public IP to save IPv4 addresses.

---

## 16. Firewall
**Answer**: A security system that monitors and controls incoming/outgoing network traffic based on rules.

---

## 17. ICMP and Ping
**Answer**: ICMP (Internet Control Message Protocol) is used for network diagnostics; `ping` uses its echo requests to test reachability.

---

## 18. DHCP
**Answer**: (Dynamic Host Configuration Protocol) Automatically assigns IP addresses to devices on a network.

---

## 19. Cookies vs LocalStorage
**Answer**:
- **Cookies**: Sent with every HTTP request; small (4KB).
- **LocalStorage**: Client-side only; larger (5MB+).

---

## 20. CORS (Cross-Origin Resource Sharing)
**Answer**: A browser security feature that prevents a script from one domain (origin) from accessing a different domain unless permitted by the server.

---

## 🎓 Summary Table: HTTP Codes

| Code Range | Meaning | Example |
| :--- | :--- | :--- |
| **200s** | Success | Everything works. |
| **300s** | Redirects | Look elsewhere. |
| **400s** | Client Error | Your fault (Bad Req). |
| **500s** | Server Error | Server fault (Crash). |
