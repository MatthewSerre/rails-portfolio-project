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
            console.log(newClient)
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
        <h1>Balls!</h1>
        <p>${this.caseload.user}</p>
    `
    return clientHtml
}