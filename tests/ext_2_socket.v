int func tcpSock()
    var sockfd: int;

    _asm
        li a0, 2;   % AF_INET = 2
        li a1, 1;   % SOCK_STREAM = 1
        li a2, 0;   % IPPROTO_IP = 0
        li a7, 198; % __NR_socket = 198

        ecall;      % do syscall

        sw a0, <sockfd>;
    _endasm;

    return sockfd;
endfunc

int func bindSock(sockfd: int)
    var ret: int;

    _asm
        lw a0, <sockfd>;
        li a1, 2;           % AF_INET = 2
        li a2, 0xd60b;      % port = 3030 (0xbd6 in hex)
        li a3, 0;           % INADDR_ANY = 0
        li a7, 200;         % __NR_bind = 200

        ecall;

        sw a0, <ret>;
    _endasm;

    return ret;
endfunc

int func listenSock(sockfd: int)
    var ret: int;

    _asm
        lw a0, <sockfd>;
        li a1, 0;           % backlog = 0
        li a7, 201;         % __NR_listen = 201

        ecall;

        sw a0, <ret>;
    _endasm;

    return ret;
endfunc

int func main()
    var sockfd: int, errno: int;

    sockfd := tcpSock();

    if sockfd < 1 then
        print "Error opening socket.\n";
        return 1;
    endif;

    errno := bindSock(sockfd);

    if errno < 0 then
        print "Error binding socket. Errno: ", errno, "\n";
        return 1;
    endif;

    errno := listenSock(sockfd);

    if errno < 0 then
        print "Error listening from socket. Errno: ", errno, "\n";
        return 1;
    endif;

    % TODO: accept() and start communication with client.

    return 0;
endfunc