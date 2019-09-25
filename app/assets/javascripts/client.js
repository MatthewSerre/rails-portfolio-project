$(() => {
    clientSubmit()
})

const clientSubmit = () => {

    $("#client_form").on('submit', function (e) {
        e.preventDefault()

        const values = $(this).serialize()

        $.post("/clients", values).done(function(data) {
            $('#app-container').html('')
            const newClient = new Client(data)
            const clientHtml = newClient.formatShow()
            $('#app-container').append(clientHtml)
        })
    })
}

function Client(client) {
    this.id = client.id
    this.caseload = client.caseload
    this.first_name = client.first_name
    this.last_name = client.last_name
}

Client.prototype.formatShow = function() {
    let clientHtml = `
    <ul class="collection">
    <li class="collection-item"><h6><strong>${this.first_name} ${this.last_name}</strong></h6></li>
    <li class="collection-item"><a href="/clients/${this.id}/notes">Client Notes</a></li>
    <li class="collection-item"><a href="/clients/${this.id}/edit">Edit Client Information</a></li>
    `
    return clientHtml
}