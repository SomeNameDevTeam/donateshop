import React, {Component} from 'react';
import Card from 'grommet/components/Card';
import { StyleSheet, css } from 'aphrodite';
import Tile from 'grommet/components/Tile';
import Image from 'grommet/components/Image';

export default class Item extends Component{

  render(){
    const type = this.props.type;
    const item = this.props.item;
    return (<div className={`shop-item shop-item_${type}`}>
      <div className="shop-item__pic">
        <Image src={item.img_src}/>
      </div>
      <div className="shop-item__text">
        <div className="shop-item__title">{item.title}</div>
        <div className="shop-item__price">{item.price} р.</div>
        <div className="shop-item__description">{item.description}</div>
      </div>
    </div>);
  }
}