// Função para alternar as abas
function mostrarConteudo(conteudoId) {
    var conteudo = document.getElementById(conteudoId);
    var abas = document.querySelectorAll('nav a');
    for (var i = 0; i < abas.length; i++) {
        abas[i].classList.remove('active');
    }
    document.querySelector('nav a[href="#' + conteudoId + '"]').classList.add('active');
    var conteudos = document.querySelectorAll('section > div');
    for (var i = 0; i < conteudos.length; i++) {
        conteudos[i].style.display = 'none';
    }
    conteudo.style.display = 'block';
}

// Mostrar o conteúdo "Início" por padrão
mostrarConteudo('inicio');

// Adicionar eventos de clique às abas
var abas = document.querySelectorAll('nav a');
for (var i = 0; i < abas.length; i++) {
    abas[i].addEventListener('click', function (e) {
        e.preventDefault();
        var href = this.getAttribute('href').substr(1);
        mostrarConteudo(href);
    });
}

// Função para adicionar um novo post
function adicionarPost(texto, imagem, video) {
    var postList = document.getElementById('post-list');
    var postDiv = document.createElement('div');
    postDiv.classList.add('post');

    // Crie elementos para exibir o post
    var postText = document.createElement('p');
    postText.textContent = texto;

    // Verifica se há imagem e a exibe
    if (imagem) {
        var img = document.createElement('img');
        img.src = URL.createObjectURL(imagem);
        postDiv.appendChild(img);
    }

    // Verifica se há vídeo e o exibe
    if (video) {
        var videoFrame = document.createElement('iframe');
        videoFrame.src = video;
        postDiv.appendChild(videoFrame);
    }

    postDiv.appendChild(postText);
    postList.appendChild(postDiv);
}

// Manipula o evento de envio do formulário
var postButton = document.getElementById('post-button');
postButton.addEventListener('click', function () {
    var postText = document.getElementById('post-text').value;
    var postImage = document.getElementById('post-image').files[0];
    var postVideo = document.getElementById('post-video').value;

    if (postText || postImage || postVideo) {
        adicionarPost(postText, postImage, postVideo);
    }

    // Limpa os campos do formulário
    document.getElementById('post-text').value = '';
    document.getElementById('post-image').value = '';
    document.getElementById('post-video').value = '';
});