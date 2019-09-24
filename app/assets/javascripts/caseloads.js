$(() => {
    bindClickHandlers()
})

const bindClickHandlers = () => {
    $('.all_caseloads').on('click', (e) => {
        e.preventDefault()
        fetch(`/caseloads.json`)
            .then((res) => res.json())
            .then(caseloads => {
                $('#app-container').html('<ol class="collection" id="caseloads_index"></ol>')
                caseloads.forEach(caseload => {
                    let newCaseload = new Caseload(caseload)
                    let caseloadHtml = newCaseload.formatIndex()
                    $('#caseloads_index').append(caseloadHtml)
                })
            })
    })

    $(document).on('click', '.show_link', function (e) {
        e.preventDefault()
        let userId = $(this).attr('data-user-id')
        let caseloadId = $(this).attr('data-caseload-id')
        fetch(`/users/${userId}/caseloads/${caseloadId}.json`)
            .then((res) => res.json())
            .then(caseload => {
                $('#app-container').html('')
                $('#app-container').html('<ol class="collection" id="caseload_show"></ol>')
                let currentCaseload = new Caseload(caseload)
                currentCaseload.clients.forEach(client => {
                    let caseloadHtml = currentCaseload.formatShow(client)
                    $('#caseload_show').append(caseloadHtml)
                })
            })
    })
}

function Caseload(caseload) {
    this.id = caseload.id
    this.clients = caseload.clients
    this.user = caseload.user
}

Caseload.prototype.formatIndex = function() {
    let caseloadHtml = `
        <li><a href="/users/${this.user.id}/caseloads/${this.id}" data-caseload-id="${this.id}" data-user-id="${this.user.id}" class="show_link">${this.user.first_name} ${this.user.last_name}'s caseload</a></li>
    `
    return caseloadHtml
}

Caseload.prototype.formatShow = function(client) {
    let caseloadHtml = `
        <li><a href="/clients/${client.id}">${client.first_name} ${client.last_name}</a> | <a href="/clients/${client.id}/notes/new">New Note</a></li>
    `
    return caseloadHtml
}