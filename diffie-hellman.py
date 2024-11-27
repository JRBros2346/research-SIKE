from manim import *
from manim_mobject_svg import *

class DiffieHellman(Scene):
    def construct(self):
        self.camera.background_color = WHITE
        VMobject.set_default(color=BLACK)

        public_channel = VGroup(
            DashedLine(start=LEFT+UP*4, end=LEFT+DOWN*4),
            DashedLine(start=RIGHT+UP*4, end=RIGHT+DOWN*4),
            Text("Public Channel", font_size=18).move_to(UP*3)
        )

        shared_public_parameter = Text("a", font_size=20).move_to(UP * 2)
        shared_public_parameter = VGroup(
            shared_public_parameter,
            Text("(Shared Public)", font_size=15).next_to(shared_public_parameter, DOWN),
        )
        alice_label = Text("Alice").move_to(LEFT * 4 + UP * 2)
        alice_secret = Text("b", font_size=20).next_to(alice_label, DOWN)
        alice_secret_label = Text("(Alice's Secret)", font_size=15).next_to(alice_secret, RIGHT)
        alice = VGroup(alice_label, alice_secret, alice_secret_label)

        bob_label = Text("Bob").move_to(RIGHT * 4 + UP * 2)
        bob_secret = Text("c", font_size=20).next_to(bob_label, DOWN)
        bob_secret_label = Text("(Bob's Secret)", font_size=15).next_to(bob_secret, LEFT)
        bob = VGroup(bob_label, bob_secret, bob_secret_label)

        alice_public_key = Text("ab", font_size=20).next_to(alice, DOWN, buff=1)
        alice_public_key = VGroup(
            alice_public_key,
            Text("(Alice's Public Key)", font_size=15).next_to(alice_public_key, DOWN),
        )

        bob_public_key = Text("ac", font_size=20).next_to(bob, DOWN, buff=1)
        bob_public_key = VGroup(
            bob_public_key,
            Text("(Bob's Public Key)", font_size=15).next_to(bob_public_key, DOWN),
        )

        alice_combine = VGroup(
            Arrow(start=shared_public_parameter.get_bottom(), end=alice_public_key.get_top()),
            Arrow(start=alice_secret.get_bottom(), end=alice_public_key.get_top()),
        )
        bob_combine = VGroup(
            Arrow(start=shared_public_parameter.get_bottom(), end=bob_public_key.get_top()),
            Arrow(start=bob_secret.get_bottom(), end=bob_public_key.get_top()),
        )

        alice_public_key_with_bob = Text("ab", font_size=20).next_to(bob_public_key, DOWN, buff=1)
        bob_public_key_with_alice = Text("ac", font_size=20).next_to(alice_public_key, DOWN, buff=1)

        key_exchange = VGroup(
            Arrow(start=alice_public_key.get_right(), end=alice_public_key_with_bob.get_top()),
            Arrow(start=bob_public_key.get_left(), end=bob_public_key_with_alice.get_top()),
        )
        key_exchange = VGroup(
            key_exchange,
            Text("(Key Exchange)", font_size=15).next_to(key_exchange, DOWN, buff=-0.5),
        )


        alice_shared_secret = Text("abc", font_size=20).next_to(bob_public_key_with_alice, DOWN, buff=1)
        bob_shared_secret = Text("abc", font_size=20).next_to(alice_public_key_with_bob, DOWN, buff=1)
        shared_secret = VGroup(
            alice_shared_secret,
            bob_shared_secret,
            Text("(Shared Secret)", font_size=15).shift(DOWN*2.5),
        )

        alice_shared_combine = VGroup(
            CurvedArrow(start_point=alice_secret.get_left()+LEFT*0.25, end_point=alice_shared_secret.get_left()+LEFT*0.25),
            Arrow(start=bob_public_key_with_alice.get_bottom(), end=alice_shared_secret.get_top()),
        )
        bob_shared_combine = VGroup(
            ArcBetweenPoints(end=bob_secret.get_right()+RIGHT*0.25, start=bob_shared_secret.get_right()+RIGHT*0.25).add_tip(at_start=True),
            Arrow(start=alice_public_key_with_bob.get_bottom(), end=bob_shared_secret.get_top()),
        )

        output = VGroup(
            public_channel, shared_public_parameter,
            alice, bob,
            alice_public_key,
            bob_public_key,
            alice_combine,
            bob_combine,
            alice_public_key_with_bob,
            bob_public_key_with_alice,
            key_exchange,
            shared_secret,
            alice_shared_combine,
            bob_shared_combine,
        )
        output.to_svg("diffie-hellman.svg", crop=False)
        self.add(output)

if __name__=='__main__':
    scene = DiffieHellman()
    scene.construct()