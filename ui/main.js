$(function () {
    function display(bool) {
        if(bool) {
            $("#drug-container").show()
        } else {
            $("#drug-container").hide()
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        const zod = event.data;

        if (zod.type === "ui") {
            if (zod.status) {
                display(true)
            } else {
                display(false)
            }
        }
    })
    
    document.onkeyup = function (data) {
        if (data.which === 27) {
            $.post('http://krp_pets/exit', JSON.stringify({}));
            return true
        }
    }

    $("#cocaine").click(function() {
        $.post('http://krp_drugs/submit', JSON.stringify({choice: "seedcoca"}));
        return true
    })

    $("#weed").click(function() {
        $.post('http://krp_drugs/submit', JSON.stringify({choice: "seedweed"}));
        return true
    })

    $("#champihallu").click(function() {
        $.post('http://krp_drugs/submit', JSON.stringify({choice: "seedchampi"}));
        return true
    })

    $("#exit").click(function() {
        $.post('http://krp_drugs/exit', JSON.stringify({}));
        return true
    })

    $("#discord").click(function() {
        const discord = "https://discord.gg/t3ZxqJJAAH"

        const copyToClipboard = (str) => {
            const el = document.createElement('textarea')
            el.value = str
            document.body.appendChild(el)
            el.select()
            document.execCommand('copy')
            document.body.removeChild(el)
        }

        copyToClipboard(discord)

        $.post('http://krp_pets/discord', JSON.stringify({}));
    })
})