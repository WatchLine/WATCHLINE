<?php
// Conectar ao banco de dados (substitua com suas credenciais)
$hostname = "bd_watchline.mysql.dbaas.com.br";
$username = "bd_watchline";
$password = "WTLNtcc#23";
$dbname = "bd_watchline";

$conn = mysqli_connect($hostname, $username, $password, $dbname);

// Verificar a conexão
if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}

// Obter os valores do formulário
$Email = $_POST["Email"];
$Senha = $_POST["Senha"];

// Consultar o banco de dados para verificar as credenciais
$sql = "SELECT * FROM usuario WHERE Email = '$Email' AND Senha = '$Senha'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Login bem-sucedido 
    $row = $result->fetch_assoc();

    // Iniciar a sessão
    session_start();

    // Armazenar informações do usuário na sessão
    $_SESSION["user_id"] = $row["id"]; // Assumindo que o campo de ID é 'id' no banco de dados
    $_SESSION["Email"] = $Email;

    header("Location: watchlineinicio.html");
} else {
    echo "Login falhou";
}

$conn->close();
?>
