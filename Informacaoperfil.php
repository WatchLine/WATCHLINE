<?php
$hostname = "bd_watchline.mysql.dbaas.com.br";
$username = "bd_watchline";
$password = "WTLNtcc#23";
$dbname = "bd_watchline";

$conn = mysqli_connect($hostname, $username, $password, $dbname);

// Verificar a conexão
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Coletar dados do formulário
    $name = $_POST["name"];
    $email = $_POST["email"];
    $password = password_hash($_POST["password"], PASSWORD_DEFAULT); // Criptografar a senha
    $age = $_POST["age"];
    $location = $_POST["location"];
    $bio = $_POST["bio"];

    // Aqui você também pode lidar com o upload da imagem, armazenar o caminho no banco de dados, etc.

    // Preparar e executar a consulta SQL
    $sql = "INSERT INTO perfil (nome, email, senha, idade, localizacao, biografia) VALUES ('$name', '$email', '$password', $age, '$location', '$bio')";

    if ($conn->query($sql) === TRUE) {
        echo "Dados inseridos com sucesso!";
    } else {
        echo "Erro ao inserir dados: " . $conn->error;
    }
}
?>