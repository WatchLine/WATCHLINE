<?php
// Conexão com o banco de dados
$conn = new mysqli("bd_watchline.mysql.dbaas.com.br", "bd_watchline", "WTLNtcc#23", "bd_watchline");

// Verifica a conexão
if ($conn->connect_error) {
    die("Erro na conexão com o banco de dados: " . $conn->connect_error);
}

// Verifique se o usuário está autenticado (substitua isso com seu sistema de autenticação)
$userId = "SEU_ID_DO_USUARIO"; // Substitua pelo valor real do ID do usuário

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtenha e sanitize os dados do formulário
    $name = htmlspecialchars($_POST["name"]);
    $email = htmlspecialchars($_POST["email"]);
    $age = htmlspecialchars($_POST["age"]);
    $location = htmlspecialchars($_POST["location"]);
    $bio = htmlspecialchars($_POST["bio"]);

    // Processar a imagem de perfil
    if (!empty($_FILES['profileImage']['name'])) {
        $profileImage_name = $_FILES['profileImage']['name'];
        $profileImage_tmp = $_FILES['profileImage']['tmp_name'];
        $profileImage_path = "caminho/para/armazenar/" . $profileImage_name;

        // Move a imagem para o diretório de armazenamento
        if (move_uploaded_file($profileImage_tmp, $profileImage_path)) {
            // Atualize o caminho da imagem no banco de dados
            $sqlUpdateImage = "UPDATE users SET profile_image_path = ? WHERE user_id = ?";
            
            // Prepare a declaração SQL
            $stmtUpdateImage = $conn->prepare($sqlUpdateImage);
            
            // Vincule os parâmetros
            $stmtUpdateImage->bind_param("si", $profileImage_path, $userId);
            
            // Execute a declaração SQL
            if ($stmtUpdateImage->execute()) {
                // Sucesso ao atualizar o caminho da imagem
            } else {
                echo "Erro ao atualizar o caminho da imagem: " . $stmtUpdateImage->error;
            }
            
            // Feche a declaração
            $stmtUpdateImage->close();
        } else {
            echo "Erro ao fazer upload da imagem.";
        }
    }

    // Atualize as informações do perfil no banco de dados
    $sqlUpdateProfile = "UPDATE users SET name = ?, email = ?, age = ?, location = ?, bio = ? WHERE user_id = ?";
    
    // Prepare a declaração SQL
    $stmtUpdateProfile = $conn->prepare($sqlUpdateProfile);
    
    // Vincule os parâmetros
    $stmtUpdateProfile->bind_param("sssisi", $name, $email, $age, $location, $bio, $userId);
    
    // Execute a declaração SQL
    if ($stmtUpdateProfile->execute()) {
        // Sucesso ao atualizar as informações do perfil
    } else {
        echo "Erro ao atualizar as informações do perfil: " . $stmtUpdateProfile->error;
    }
    
    // Feche a declaração
    $stmtUpdateProfile->close();

    // Redirecione de volta à página do perfil
    header("Location: profile.php");
    exit();
}

// Feche a conexão com o banco de dados (opcional)
$conn->close();
?>
