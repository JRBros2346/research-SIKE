#set page(
  paper: "a4",
  margin: (x: 1in, y: 1in),
)
#set text(
  font: "Times New Roman",
  size: 10pt,
)
#set par(
  justify: true,
)

#align(center, text(17pt)[
  *The Foundations behind the \
  Supersingular Isogeny Key Exchange*
])

#align(center, [
  Samuel Jabez P. \
  Chennai Institute of Technology \
  #link("mailto:samueljabezp.cs2023@citchennai.net")
])

#text(10pt)[
  == Abstract
  *Supersingular Isogeny Key Exchange (SIKE) is an advanced post-quantum cryptographic scheme rooted in the mathematical framework of elliptic curve isogenies. This review explores its mathematical foundations, applications in key exchange, and broader implications for quantum-resistant cryptographic schemes. Emphasis is placed on its unique advantages, including its compact key sizes and efficiency, alongside an analysis of its vulnerabilities to the GPST attack. Despite its  exclusion from NIST's post-quantum cryptography  candidates, SIKE offers valuable insights for the design of future isogeny-based quantum-secure  protocols*
]

= Introduction
#par(first-line-indent: 0.5in)[
  Supersingular Isogeny Key Exchange (SIKE) is an Isogeny-based Protocol that was one of the six types of candidates initially selected for the *NIST Post-Quantum Cryptography Standardization*. The other five categories include: @intro-to-pqc
  #align(center, [
    - Lattice-based
    - Multivariate
    - Hash-based
    - Code-based
    - Symmetric-key-based
  ])
  Cryptography has undergone significant evolution to reach the sophistication of SIKE. Among the post-quantum schemes, SIKE stands out due to its innovativee use of mathematical isogenies. Despite its promising attributes, including efficiency and compact key sizes, SIKE was ultimately found vulnerable to the GPST attack. This timely discovery, while leading to its exclusion from the final NIST standards, likely averted potential large-scale security risks.

  This paper begins by exploring the early history of cryptography, delves into the mathematical foundations underpinning SIKE, and concludes with reflections on its strengths, vulnerabilities, and its role in advancing post-quantum cryptographic research.
]

= A Brief History of Cryptography
#par(first-line-indent: 0.5in)[
  Cryptography, initially a tool for mystery and amusement, has evolved into a cornerstone of secure communication. Its origins date back to 1900 BC, when simple keyless codes were inscribed in an Egyptian tomb @codebreakers. These codes are usually keyless, and are easy to crack once we know how it is encoded. Later keyed ciphers were discovered. Even if we know how these are encrypted, we won't be able to crack it without the key. This allowed the usage of same encryption algorithm across different people groups, without interference and secrecy. A notable example of a keyed cipher is the *Caesar cipher*, employed by the Romans for military communication.

  Ancient Arabs were the first to extensively study cryptography. One of their greatest finding is frequency analysis, which could effectively break _monoalphabetic substitution ciphers_ and _transposition ciphers_. Frequency analysis examines the statistical occurrence of characters in encrypted text, comparing it to known language patterns. For example, in English, 'E' is the most frequent letter, while 'Q' and 'Z' are rare. For a monoalphabetic substitution cipher, the character that is more frequent is most probably mapped to 'E', while the least frequent characters are mapped to 'Q' or 'Z'. If the frequency distribution is the same as English, then we can conclude this as a transposition cipher. As cryptographic methods advanced, the focus shifted from substitution ciphers to polyalphabetic techniques like the *Vigenère cipher*. However, even these were eventually broken during World War I with the advent of methods like the *Kasiski Examination*.
  
  The World Wars marked a turning point for cryptography, with mechanical and electromechanical devices revolutionizing the field. Among these, the *Enigma machine* stood out, used extensively by the Germans for secure communication. Its decryption by _Alan Turing_ and his team at Bletchley Park not only shaped the course of the war but also laid the foundation for modern computing..

  Today, cryptography is the backbone of digital security, enabling privacy and trust in our interconnected world. Techniques that once secured military secrets now protect our emails, financial transactions, and more. Ironically, the once-impenetrable Enigma machine can now be cracked effortlessly by a standard laptop—a testament to how far the field has progressed.
]

= Mathematical Foundations of Modern Cryptography
#par(first-line-indent: 0.5in)[
  There are different cryptographic functions in Modern Cryptography, namely:
  #align(center, [
    - Symmetric Cryptography
    - Asymmetric Cryptography
    - Cryptographic Hashes
  ])
  Each of these solve different purposes and have different approaches. We will look deeper into symmetric and asymmetric cryptography.

  The main concerns of cryptography according to _Claude E. Shannon_ are: _secrecy_ and _authenticity_. Shannon spent most of his life on studying about secrecy. He formulated two kinds of secrecy namely: _theoretical secrecy_ and _practical secrecy_. Thanks to Shannon, the art of cryptography gradually changed to be the science of cryptography

  Theoretical secrecy assumes that the intruder has unlimited resources, while practical secrecy assumes that the intruder have limited resources. If a cipher is _unbreakable_, it means that it follows _perfect secrecy_. 
]

#bibliography("references.yml")