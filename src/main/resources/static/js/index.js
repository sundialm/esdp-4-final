let idStructure = document.getElementById('area structure')
const modal = $.modal({
    closable: true,
    content: `
        <h5 style="height: 0">Добавить ${idStructure.id} </h5>
    `
})

document.addEventListener('click', event => {
    event.preventDefault()
    const btnType = event.target.dataset.btn
    if (btnType === 'price') {

        modal.open()
    } else if (btnType === 'work') {
        const modal = $.modal({
            closable: true,
            content: `
        <h5 style="height: 0">Добавить work structure:  </h5>
    `
        })
        modal.open()
    }
    else if (btnType === 'materials') {
        const modal = $.modal({
            closable: true,
            content: `
        <h5 style="height: 0">Добавить материал:  </h5>
    `
        })
        modal.open()
    } else if (btnType === 'equipment') {
        const modal = $.modal({
            closable: true,
            content: `
        <h5 style="height: 0">Добавить оборудование:  </h5>
    `
        })
        modal.open()
    }
})
// let idWorkStructure = document.getElementById('work structure')
// const modal = $.modal({
//     closable: true,
//     content:`
//         <h5 style="height: 0">Добавить ${idWorkStructure.id} </h5>
//     `
// })
// document.addEventListener('click',event=>{
//     event.preventDefault()
//     const btnType = event.target.dataset.btn
//     if(btnType === 'work'){
//         modal.open()
//     }
// })
