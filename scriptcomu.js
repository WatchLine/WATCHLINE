// Função para adicionar um novo post
function adicionarPost() {
    var postText = document.getElementById('post-text').value;
    var postImage = document.getElementById('post-image').files[0];
    var postVideo = document.getElementById('post-video').value;

    // Validar se pelo menos um campo foi preenchido
    if (!postText && !postImage && !postVideo) {
        alert('Preencha pelo menos um campo para adicionar um post.');
        return;
    }

    var newPost = {
        text: postText,
        image: postImage ? URL.createObjectURL(postImage) : null,
        video: postVideo ? postVideo : null,
        likes: 0,
        comments: [],
        timestamp: new Date().toISOString()
    };

    // Adiciona o post à lista
    adicionarPostNaLista(newPost);

    // Salva a lista completa de postagens no armazenamento local
    salvarPostagens();
    limparCampos();

    // Adiciona uma mensagem de sucesso
    alert('Post adicionado com sucesso!');
}

// Função para salvar a lista de postagens no armazenamento local
function salvarPostagens() {
    var postagens = obterPostagensSalvas();
    postagens.push(newPost); // Adiciona o novo post à lista
    localStorage.setItem('postagens', JSON.stringify(postagens));
}

// Função para obter a lista de postagens salvas do armazenamento local
function obterPostagensSalvas() {
    var postagens = localStorage.getItem('postagens');
    return postagens ? JSON.parse(postagens) : [];
}

// Função para limpar os campos do formulário após adicionar um post
function limparCampos() {
    document.getElementById('post-text').value = '';
    document.getElementById('post-image').value = '';
    document.getElementById('post-video').value = '';
}

// Função para exibir as postagens salvas
function exibirPostagensSalvas() {
    var postagens = obterPostagensSalvas();
    var postList = document.getElementById('post-list');

    // Limpa as postagens existentes
    postList.innerHTML = '';

    // Adiciona as postagens salvas
    postagens.forEach(function (post) {
        var postDiv = criarElementoPost(post);
        adicionarBotoesAcoes(postDiv, post);
        postList.appendChild(postDiv);
    });
}

// Chama a função para exibir as postagens salvas ao carregar a página
window.onload = function () {
    loadProfileData();
    loadProfileFromServer();
    showMembers(); // Adicionado para exibir membros
    exibirPostagensSalvas();
};
