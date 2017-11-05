import React, {Component} from 'react'
import Box from 'grommet/components/Box';
import ItemList from './ItemList';

export default class EnterMessage extends Component{
  render(){
    return <div className="enter-message">
      <Box
        pad="small"
        alignContent="center"
      >
          Мы открыли магазин чтобы поддержать работу редакции.
      </Box>
    </div>;
  }
}