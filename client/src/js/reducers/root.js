import { combineReducers } from 'redux';

import dashboard from './dashboard';
import nav from './nav';
import session from './session';
import tasks from './tasks';

export default combineReducers({
  items: (state = [], action) => {
    switch(action.type){
      case 'ITEMS_LOAD':
        return action.items;
      default:
        return state;
    }
  },
  order: (state = {list: [], donate: 0, email: null, name: null, address: null}, action) => {
    switch(action.type){
      case 'ADD_ITEM': {
        const foundIndex = state.list.findIndex((x) => {
          return action.item.id === x.id
        });
        if (foundIndex >= 0) {
          let newList = state.list;
          let item = newList.splice(found, 1);
          let newItem = {...item, count: item.count + 1};
          newList.splice(found, 0, newItem);
          return {
            ...state,
            list: newList
          };
        }
        else {
          return {
            ...state,
            list: [...state.list, {...action.item, count: 1}]
          };
        }
      }
      case 'SET_ITEM_QUANTITY': {
        const foundIndex = state.list.findIndex((x) => {
          return action.item.id === x.id
        });
        if (foundIndex >= 0) {
          let newList = state.list;
          let item = newList.splice(found, 1);
          let newItem = {...item, count: action.count};
          newList.splice(found, 0, newItem);
          return {
            ...state,
            list: newList
          };
        }
        else {
          return {
            ...state,
            list: [...state.list, {...action.item, count: action.count}]
          };
        }
      }
      case 'REMOVE_ITEM': {
        const foundIndex = state.list.findIndex((x) => {
          return action.item.id === x.id
        });
        if (foundIndex >= 0) {
          let newList = state.list;
          newList.splice(found, 1);
          return {...state, list: newList};
        }
        else
          return state;
      }
      case 'SET_EMAIL':
        return {...state, email: action.email};
      case 'SET_NAME':
        return {...state, name: action.name};
      case 'SET_ADDRESS':
        return {...state, name: action.address};
      case 'EXECUTE_ORDER':
        return {list: [], donate: 0};
      default:
        return state;

    }
  },

});
