import React, {Component} from 'react';
import {connect} from 'react-redux';
import ItemList from './ItemList';
import EnterMessage from './EnterMessage';

@connect(({items}) => ({items}))
export default class MainPage extends Component{

  render(){
    const items = [
      {title: 'Футболка Медиазона', price: 2017, description: 'Halelujah', img_src: 'https://zona.media/s/defaultShare.png'}
    ];
    return (
      <div className="main-page">
        <EnterMessage/>
        <ItemList list={items}/>
      </div>
    );
  }
}