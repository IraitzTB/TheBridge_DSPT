def la_funcion_de_iraitz(lista, comando, elemento = None):

    if comando in ["add", "remove"]:
        if comando == "add":
            return lista + [elemento]
        else:
            return lista.remove(elemento)
    else:
        print("No se conoce el comando")