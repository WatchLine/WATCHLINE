<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $userId = 1; // Substitua pelo ID do usuário logado

    // Conexão com o banco de dados
    $conn = new mysqli("bd_watchline.mysql.dbaas.com.br", "bd_watchline", "WTLNtcc#23", "bd_watchline");

    if ($conn->connect_error) {
        die("Erro na conexão com o banco de dados: " . $conn->connect_error);
    }

    // Verifique se o campo de upload da imagem não está vazio
    if (!empty($_FILES['avatar']['name'])) {
        $avatar_name = $_FILES['avatar']['name'];
        $avatar_tmp = $_FILES['avatar']['tmp_name'];
        $avatar_path = "uploads/" . $avatar_name; // Pasta onde as imagens são armazenadas

        // Move a imagem para o diretório de uploads
        move_uploaded_file($avatar_tmp, $avatar_path);

        // Atualiza o caminho da imagem no banco de dados
        $sql = "UPDATE users SET avatar_path = '$avatar_path' WHERE id = $userId";

        if ($conn->query($sql) === TRUE) {
            echo "Foto de perfil atualizada com sucesso.";
        } else {
            echo "Erro ao atualizar a foto de perfil: " . $conn->error;
        }
    } else {
        echo "Nenhuma imagem selecionada para atualização.";
    }

    $conn->close();
}
?>
