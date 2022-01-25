document.getElementById('reset__modal').addEventListener('click', event => {
        event.preventDefault()
    document.getElementById('reset').classList.add('open');
    document.getElementById('cd-form').classList.remove('open');

    }
)