MODULE MainModule

VAR socketdev serversocket;
VAR socketdev clientsocket;
VAR bool okX;
VAR bool okY;
VAR string data;
VAR num cambioStrX;
VAR num cambioStrY;
VAR string XValorString;
VAR string YValorString;

PROC main()

    !Creacion del servidor en el ABB
    SocketCreate serversocket;
    !Le damos una ip y el puerto por el  que queremos recibir  datos
    SocketBind serversocket, "127.0.0.1", 8000;
    !Ponemos el servidor en modo de escucha
    SocketListen serversocket;
    !Aqui nos quedamos en esta instruccion esperando la conexion del cliente
    SocketAccept serversocket, clientsocket, \Time := WAIT_MAX;
    !Una vez nos hemos conectado le devolvemos conexion correcta
    SocketSend  clientsocket \str:= "Conexioncon abb correcta";

    WHILE True DO
        !Almacenamos  los datos recibidos en la variable data
        SocketReceive clientsocket \str:data;

        !Particionar el dato para sacar de un  string los diferentes datos
        !Con StrPart almacenamos en la variale todo aquello que en
        !La variable madre vaya de el primer caracter que introducimos al caracter
        !x contando 3 caracteres es decir al 3
        XValorString := StrPart(data, 1, 3);
        okX := StrToVal(XValorString, cambioStrX);
        YValorString := StrPart(data, 4, 3);
        okY := StrToVal(YValorString, cambioStrY);

        WaitTime(2);
        


        
