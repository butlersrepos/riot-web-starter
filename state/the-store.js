import { createStore } from 'redux';
import reducer from './main-reducer';

window.Store = createStore(reducer);