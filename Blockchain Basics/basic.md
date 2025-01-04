
 * ### Understanding Hash Functions
 *
 * At its simplest, a hash is a unique, fixed-length string that serves to identify any piece of data. 
 * When you input any kind of data into a hash function, it produces a hash. In this demo, the hash algorithm 
 * we'll focus on is SHA-256.
 *
 * **Децентрализиран** означава, че системата или структурата не се управлява от един централен орган 
 * (напр. компания, правителство или институция), а вместо това разчита на мрежа от независими участници 
 * или възли (nodes), които си сътрудничат, за да функционира системата.
 *
 * В контекста на блокчейн:
 *
 * 1. **Липса на централен контрол:** 
 *    - Няма единен орган или институция, който да контролира цялата мрежа. Всички участници (възли) имат 
 *      равни права и достъп до информация.
 *
 * 2. **Разпределено съхранение:** 
 *    - Данните се съхраняват на много места (възли), а не в централизирана база данни. Това прави системата 
 *      по-сигурна и устойчива на хакерски атаки.
 *
 * 3. **Прозрачност:** 
 *    - Всички транзакции или промени в системата са видими за участниците в мрежата, което гарантира доверие 
 *      и прозрачност.
 *
 * 4. **Устойчивост:** 
 *    - Поради разпределената структура, системата продължава да функционира, дори ако някои от възлите спрат 
 *      да работят.
 *
 * Пример: Блокчейнът е децентрализиран, защото всички участници имат достъп до една и съща информация и 
 * решенията се вземат колективно чрез консенсус, а не от един централен администратор.
 *
 * ### Decentralized Finance (DeFi)
 *
 * DeFi, or Decentralized Finance, allows users to engage with financial markets without relying on centralized 
 * intermediaries. With smart contracts, users have transparent access to financial markets and can engage with 
 * sophisticated financial products efficiently and securely. We will provide practical examples of how to build 
 * and interact with DeFi protocols in upcoming lessons.
 *
 * ### Decentralized Autonomous Organizations (DAOs)
 *
 * DAOs are governed entirely by smart contracts and operate in a decentralized manner. This structure offers 
 * benefits such as transparent governance, efficient engagement, and clear rules. DAOs are an evolution in 
 * politics and governance, and we will cover how to build and work with DAOs in future lessons.
 *
 * ### Non-Fungible Tokens (NFTs)
 *
 * NFTs, or Non-Fungible Tokens, can be thought of as digital art or unique assets. NFTs have created new avenues 
 * for artists and creators to monetize their work. We will also cover how to create and interact with NFTs in 
 * this course.
### Non-Fungible Tokens (NFTs)

NFTs, or Non-Fungible Tokens, can be thought of as digital art or unique assets. NFTs have created new avenues for artists and creators to monetize their work. We will also cover how to create and interact with NFTs in this course.

### Blockchain Layers

In this course, we've mentioned Layer 1 (L1), Layer 2 (L2), and Rollups. We will deploy and interact with smart contracts on Sepolia (L1 test net) and zkSync Sepolia (L2 Rollup).

**Layer 1 (L1):** The base layer of the blockchain ecosystem, where nodes help the chain reach consensus. Examples include Bitcoin, BNB Chain, Solana, and Avalanche. We focus on Ethereum, the hub of the Ethereum ecosystem.

**Layer 2 (L2):** Applications built outside an L1 blockchain that hook back into it. Examples include Chainlink and The Graph. The most popular L2s are rollups.

**Rollups:** L2 scaling solutions that bundle multiple transactions into one, reducing gas costs and enhancing scalability without compromising security or decentralization.

**How Rollups Work:** Users submit transactions to a rollup, which are then bundled, compressed, and submitted back to the L1 blockchain. This process splits gas costs among users.

**Types of Rollups:**
- **Optimistic Rollups:** Assume transactions are valid by default. Fraudulent transactions can be challenged during a challenge period.
- **Zero-Knowledge (ZK) Rollups:** Use zk proofs to verify transaction batches. The prover generates a zk proof, and a verifier checks it to ensure validity.

**Conclusion:** Rollups enhance Ethereum's scalability by processing transactions off-chain, bundling them, and submitting them back to Ethereum with validity proofs, maintaining security and decentralization while increasing transaction throughput.