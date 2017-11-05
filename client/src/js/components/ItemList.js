import React, {Component} from 'react';
import Item from './Item';

export default class ItemList extends Component{
  render(){
      const list = this.props.list;
      return (<div className="shop-list">
        {list.map(x => <Item item={x}/>)}
      </div>)
  }
}