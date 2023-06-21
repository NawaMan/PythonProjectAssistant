import greeter
def test_greet():
        assert greeter.greet("World") == "Hello, World!"
        assert greeter.greet("John") == "Hello, John!"
