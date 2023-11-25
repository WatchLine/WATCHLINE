document.addEventListener('DOMContentLoaded', function () {
    const form = document.querySelector('form');

    form.addEventListener('submit', function (event) {
        const usuarioField = form.querySelector('[name="usuario"]');
        const emailField = form.querySelector('[name="email"]');
        const senhaField = form.querySelector('[name="senha"]');

        if (!usuarioField.value || !emailField.value || !senhaField.value) {
            alert('Por favor, preencha todos os campos obrigatórios.');
            event.preventDefault(); // Impede o envio do formulário
        }
    });
});