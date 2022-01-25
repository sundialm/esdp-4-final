function _createModal(options){
    const modal = document.createElement('div')
    // const test = document.getElementById('modal')
    modal.classList.add('vmodal')
    modal.insertAdjacentHTML('afterbegin',`
    <div class="modal-overlay" data-close="true">
        <div class="modalWindow">
            <div class="vmodal-header">
<!--                <span class="modal-title">Добавить area structure:</span>-->
               <span class="modal-title">${options.content || 'jryj'}</span>
           ${options.closable ? `<span class="modal-close" data-close="true"> &times;</span>`: ''}
            </div>
            <div class="modal-body">
                <input class="modal-input" type="text" placeholder="Наименование">
                <hr>
            </div>
            <div class="modal-footer">
                <button class="modal-button">Добавить</button>
            </div>
        </div>
    </div>
    `)
    document.body.appendChild(modal)
    return modal;
}

$.modal = function (options)
{
    const $modal = _createModal(options);
    let closing = false
    let destroyed = false
    const modal = {
        open(){
            if(destroyed){
                return console.log('Model is destroyed')
            }
            !closing && $modal.classList.add('open')
        },
        close(){
            $modal.classList.remove('open')
        }
    }
const listener = event=>{
    if(event.target.dataset.close){
        modal.close()
    }
}
    $modal.addEventListener('click', listener)

return Object.assign(modal,{
    destroy(){
        $modal.parentNode.removeChild($modal)
        $modal.removeEventListener('click', listener)
        destroyed=true
    }
})

}
