const INITIAL_STATE = {
    message: 'Hello World!'
};

export default function (state = INITIAL_STATE, action) {
    switch (action.type) {
        case 'CHANGE_MESSAGE':
            return Object.assign({}, state, {
                message: action.payload
            })
        default:
            return state;
    }
}