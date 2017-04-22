<home-page>
    <h2>{ message }</h2>
    <input type="text" ref="message" />
    <button onclick={ updateMessage }>Change!</button>

    <script>
        this.message = Store.getState().message

        updateMessage() {
            Store.dispatch({
                type: 'CHANGE_MESSAGE',
                payload: this.refs.message.value
            })
        }

        Store.subscribe(() => {
            this.message = Store.getState().message
            this.update()
        })
    </script>

    <style>
        @import '../scss/clrs';
        :scope {
            display: flex;
            flex-direction: column;
            width: 20em;
            background: $black;
            padding: .5em;

            h2 {
                font-family: sans-serif;
                color: $white;
                display: inline-block;
            }

            button {
                margin-top: .5em;
                background: $orange;
                border: 0;
                border-radius: 5px;
            }
        }
    </style>
</home-page>