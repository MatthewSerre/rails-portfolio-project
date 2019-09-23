$(() => {
    bindClickHandlers()
})

const bindClickHandlers = () => {
    $('.all_caseloads').on('click', (e) => {
        e.preventDefault()
        fetch(`/caseloads.json`)
            .then((res) => res.json())
            .then(caseloads => {
                $('#app-container').html('<ul class="collection" id="caseloads_index"></ul>')
                caseloads.forEach(caseload => {
                    let newCaseload = new Caseload(caseload)
                    let caseloadHtml = newCaseload.formatIndex()
                    $('#caseloads_index').append(caseloadHtml)
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
        <li><a href="/users/${this.user.id}/caseloads/${this.id}">${this.user.first_name} ${this.user.last_name}'s caseload</a></li>
    `
    return caseloadHtml
}