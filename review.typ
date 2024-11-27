#import "@preview/charged-ieee:0.1.3": ieee

#show: ieee.with(
  title: [Foundations of Supersingular Isogeny Key Exchange],
  abstract: [
    Supersingular Isogeny Key Exchange (SIKE) is a compact and efficient post-quantum cryptographic scheme based on elliptic curve isogenies. This review examines its mathematical foundations, applications, and limitations, particularly its vulnerability to the GPST attack, which led to its exclusion from NIST's 2023 standards. Despite this, SIKE offers key insights for advancing isogeny-based quantum-resistant cryptographic protocols.
  ],
  authors: (
    (
      name: "Samuel Jabez P",
      department: [Department of Cybersecurity],
      organization: [Chennai Institute of Technology],
      location: [Chennai, India],
      email: "samueljabezp@gmail.com"
    ),
  ),
  index-terms: (
    text("WIP", size: 17pt),
  ),
  bibliography: bibliography("references.yml"),
)

= Introduction
Supersingular Isogeny Key Exchange (SIKE) is an Isogeny-based protocol that was one of the six types of candidates initially selected for the *NIST Post-Quantum Cryptography Standardization*. The other five categories include: @intro-to-pqc
  - Lattice-based
  - Multivariate
  - Hash-based
  - Code-based
  - Symmetric-key-based
Cryptography has evolved significantly, culminating in sophisticated protocols like SIKE. Among the post-quantum schemes, SIKE stands out due to its innovative use of mathematical isogenies. Although SIKE offers promising attributes like efficiency and compact key sizes, its vulnerability to the GPST attack led to its exclusion from the final NIST standards. The discovery of SIKE's vulnerabilities in a timely manner mitigated potential large-scale security risks.

This paper begins by exploring the early history of cryptography, delves into the mathematical foundations underpinning SIKE, and concludes with reflections on its strengths, vulnerabilities, and its role in advancing post-quantum cryptographic research.

= A Brief History of Cryptography
Since its origins in 1900 BC, cryptography has evolved from simple ciphers into a cornerstone of digital security @codebreakers. These codes were often keyless, making them easy to crack once their encoding method was understood. The introduction of keyed ciphers allowed encryption methods to remain secure even if the algorithm was known, as decryption required a specific key. A notable example of a keyed cipher is the *Caesar cipher*, employed by the Romans for military communication.

During the Islamic Golden Age, Arab mathematicians made foundational contributions to cryptography, including the development of frequency analysis, a technique that remains influential today. Frequency analysis examines the statistical occurrence of characters in encrypted text, comparing it to known language patterns, such as 'E' being the most frequent letter in English. For a monoalphabetic substitution cipher, the character that is more frequent is most probably mapped to 'E', while the least frequent characters are mapped to 'Q' or 'Z'. If the frequency distribution is the same as English, then we can conclude this as a transposition cipher. As cryptographic methods advanced, the focus shifted from substitution ciphers to polyalphabetic techniques like the *Vigenère cipher*. However, even these were eventually broken during World War I with the advent of methods like the *Kasiski Examination*.

The World Wars marked a turning point for cryptography, with mechanical and electromechanical devices revolutionizing the field. Among these, the *Enigma machine* stood out, used extensively by the Germans for secure communication. Its decryption by _Alan Turing_ and his team at Bletchley Park not only shaped the course of the war but also laid the foundation for modern computing.

From securing military secrets to protecting modern digital systems, cryptography remains the backbone of secure communication.

= Mathematical Foundations of Modern Cryptography
_Claude E. Shannon_ identified _secrecy_ and _authenticity_ as the main concerns of cryptography. Shannon spent most of his life on studying about secrecy. He formulated two kinds of secrecy namely: _theoretical secrecy_ and _practical secrecy_. Thanks to Shannon, the art of cryptography gradually changed to be the science of cryptography

Theoretical secrecy considers an adversary with unlimited computational resources, while practical secrecy acknowledges the constraints of the real world, where brute-force attacks are infeasible due to resource limitations. A cipher achieves perfect secrecy if the ciphertext provides no information about the plaintext, regardless of an adversary's computational power. While the one-time pad satisfies this criterion, it is impractical due to its requirement for a key as long as the message and the need for perfect key management. As a result, no widely used cryptographic scheme achieves perfect secrecy, and practical cryptographic systems must balance security with efficiency.

All cryptographic functions are modeled on the concept of one-way functions: functions that are easy to compute but hard to invert. The security of these functions is based on the widely held assumption that $P != N P$, a fundamental unsolved problem in theoretical computer science. This assumption implies that some problems are inherently hard to solve in polynomial time. If $P = N P$, it would mean that all problems in the $N P$ class could be solved efficiently, potentially enabling breakthroughs such as finding optimal solutions for the Traveling Salesperson Problem in polynomial time. However, it would also render most current cryptographic algorithms insecure, as adversaries could efficiently invert one-way functions and compromise encryption schemes.

The assumption that $P != N P$ underpins modern cryptography, but the lack of a formal proof leaves open the possibility of future breakthroughs that could have profound consequences for both cryptography and computational science.

Cryptographic systems can generally be classified as _symmetric_ or _asymmetric_. Symmetric key cryptography, which uses a single shared secret key for both encryption and decryption, is efficient and straightforward but suffers from the inherent vulnerability of key distribution. If the key is compromised, all communications are at risk. 

The *Diffie-Hellman key exchange* revolutionized cryptography by introducing a new way to distribute cryptographic keys, solving one of its fundamental problems. It laid the foundation for asymmetric cryptography. Diffie-Hellman allows symmetric keys to be generated over insecure channels.

We can understand the Diffie-Hellman key exchange by observing @fig:diffie-hellman

#figure(
  image("diffie-hellman.svg"),
  caption: [Diffie-Hellman Key Exchange]
) <fig:diffie-hellman>

Alice and Bob share the _public key_ `a`. Alice generates her _secret key_ `b` while Bob generates his _secret key_ as `c`. They independently combine the public key with their secret key and exchange the results. Ideally, the combination is an one-way function, making decomposition infeasible, so no one can discover their secret keys over an insecure channel. Now, Alice has her secret `b` and the composition from Bob, `ac`. Similarly, Bob has his secret `c` and the composition from Alice, `ab`. They both compute their shared secret as `abc`. Since decomposition is impossible, no one can deduce their individual secrets are from `abc`.

_Prime factorization_ is computationally difficult, while _multiplication_ is straightforward. This asymmetry underpins the security of many cryptographic schemes. In the context of Diffie-Hellman key exchange, we rely on the difficulty of solving the _discrete logarithm_ problem: a task made computationally hard by properties of modular arithmetic and prime numbers. Consider two public keys $g$ and $p$. Let Alice and Bob's secret keys be $a$ and $b$ respectively. Our combination function will be,
$ f(g, n) = g^n mod p $
The inverse of $f$ is known as _discrete logarithm_, which is notoriously hard to solve, thanks to prime numbers inherent stubbornness. Using this function $f$, Alice and Bob compute their shared secret to be $g^(a b) mod p$.

= Post Quantum Cryptography
