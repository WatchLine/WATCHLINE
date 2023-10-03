<?php
// Conectar ao banco de dados (substitua com suas credenciais)
$hostname = "localhost";
$username = "root";
$password = "WTLNtcc#23";
$dbname = "bd_watchline";

$conn = new mysqli($hostname, $username, $password, $dbname);

// Verificar a conexão
if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}

// Obter os valores do formulário
$Nome = $_POST["Nome"];
$Senha = $_POST["Senha"];
$Email = $_POST["Email"];
$Telefone = $_POST["Telefone"];
$DataRegistro = $_POST["DataRegistro"];
$DatadeNasc = $_POST["DatadeNascimento"];

// Inserir dados na tabela de cadastro (certifique-se de que a tabela exista com os campos corretos)
$sql = "INSERT INTO usuario (Nome,Senha,Email,Telefone,DataRegistro,DatadeNascimento) VALUES ('$Nome', '$Senha', '$Email', '$Telefone', '$DataRegistro', '$DatadeNasc')";

if ($conn->query($sql) === TRUE) {
    header("Location: login.html");
} else {
    echo "Erro ao cadastrar: " . $conn->error;
}

$conn->close();
?>