#import "@preview/charged-ieee:0.1.3": ieee

#show: ieee.with(
  title: [Foundations of the Supersingular Isogeny Key Exchange],
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
  figure-supplement: [Fig.],
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
Modern cryptography encompasses various cryptographic functions, including
  - Symmetric Cryptography
  - Asymmetric Cryptography
  - Cryptographic Hashes
Each of these solve different purposes and have different approaches. We will look deeper into symmetric and asymmetric cryptography.

_Claude E. Shannon_ identified _secrecy_ and _authenticity_ as the main concerns of cryptography. Shannon spent most of his life on studying about secrecy. He formulated two kinds of secrecy namely: _theoretical secrecy_ and _practical secrecy_. Thanks to Shannon, the art of cryptography gradually changed to be the science of cryptography

Theoretical secrecy considers an adversary with unlimited computational resources, while practical secrecy acknowledges real-world constraints, where brute-force attacks are infeasible. If a cipher is _unbreakable_, it means that it follows _perfect secrecy_. In theory, no known cryptographic schemes achieve perfect secrecy, as brute force attacks are always possible given a finite key space. Theoretical secrecy assumes unlimited adversarial resources, while practical secrecy assumes resource limitations, making brute-force attacks infeasible.

All cryptographic schemes up until now are symmetric key cryptography. Symmetric key cryptography, while efficient, requires all parties to share a secret key. This reliance poses a significant vulnerability: if the key is compromised, the entire communication is at risk. All cryptographic functions are modeled as one-way functions. This is based on the assumption that $P != N P$, this is an unsolved problem in theoretical computer science. Simplified, it roughly translates to "If a single hard problem is solvable in polynomial time, then potentially all problems can be solved in polynomial time." Most of em believe that $P != N P$, but its not proven. If instead $P = N P$, then the world will have serious consequences, like potential for an optimal route for the Traveling Sales Person in optimum time without brute forcing, while also some terrible  consequences including the vulnerability of all cryptographic algorithms. 