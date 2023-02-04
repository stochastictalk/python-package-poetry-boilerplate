from pytest import raises

def test_hello_world():
    from boilerplate import say_hello

    assert isinstance(say_hello(), str)
    
    with raises(TypeError):
        say_hello("Angela", "Augustus")