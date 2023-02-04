def get_hello(name: str = None):
    """Says hello!

    Parameters
    ----------
    name : str
        The name to say howdy to.
    
    Returns
    -------
    str
        Hello!
    """
    return "Hello, world!" if name is None else f"Hello, {name}!"