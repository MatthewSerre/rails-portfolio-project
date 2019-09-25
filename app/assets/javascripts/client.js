$(() => {
    clientSubmit()
})

const clientSubmit = () => {

    $("#client_form").on('submit', function (e) {
        e.preventDefault()
        console.log('submitting form')

        const values = $(this).serialize()

        $.post("/clients", values).done(function(data) {
            $('#app-container').html('')
            const newClient = new Client(data)
            const clientHtml = newClient.formatShow()
            $('#app-container').append(clientHtml)
        })
    })
}