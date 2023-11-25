<?php
$hostname = "bd_watchline.mysql.dbaas.com.br";
$username = "bd_watchline";
$password = "WTLNtcc#23";
$dbname = "bd_watchline";

$conn = new mysqli($hostname, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Email = $_POST["Email"];
    $novaSenha = $_POST["nova_senha"];

    // Realizar a atualização da senha no banco de dados sem criptografia
    $sql = "UPDATE usuario SET Senha = ? WHERE Email = ?";
    $stmt = $conn->prepare($sql);

    if ($stmt) {
        $stmt->bind_param("ss", $novaSenha, $Email);
        $stmt->execute();

        echo "Senha redefinida com sucesso!";
        $stmt->close();
    } else {
        echo "Erro na atualização de senha: " . $conn->error;
    }
}

$conn->close();
?>
