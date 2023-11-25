<?php
// Conectar ao banco de dados (substitua com suas credenciais)
$hostname = "bd_watchline.mysql.dbaas.com.br";
$username = "bd_watchline";
$password = "WTLNtcc#23";
$dbname = "bd_watchline";

$conn = mysqli_connect($hostname, $username, $password, $dbname);

// Verificar a conexão
// Verifica se a conexão foi bem-sucedida
if (!$conn) {
    die("Falha na conexão: " . mysqli_connect_error());
}
// Obter os valores do formulário
$Usuario = mysqli_real_escape_string($conn, $_POST['Usuario']);
$Email = mysqli_real_escape_string($conn, $_POST['Email']);
$Senha = mysqli_real_escape_string($conn, $_POST['Senha']);


// Inserir dados na tabela de cadastro (certifique-se de que a tabela exista com os campos corretos)
$sql = "INSERT INTO usuario (Usuario,Email,Senha) VALUES ('$Usuario','$Email', '$Senha')";

if ($conn->query($sql) === TRUE) {
    header('Location: index.html');
} else {
    echo "Erro ao cadastrar: " . $conn->error;
}

$conn->close();
?>