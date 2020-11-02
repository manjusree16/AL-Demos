import React, { Component } from "react";
import styles from './pivot.scss';
import { Pivot, PivotItem } from 'office-ui-fabric-react/lib/Pivot';
import ReactDOM from 'react-dom';
import reportWebVitals from './reportWebVitals';

function ListItem(props) {
  // Correct! There is no need to specify the key here:
  return <li>{props.value}</li>;
}
function NumberList(props) {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =>
    <ListItem key={number.toString()} value={number} />
  );
  return (
    <ul>
      {listItems}
    </ul>
  );
}
class App extends Component {
  state = {
    ISampleItems: []
  };

  componentDidMount() {
    window.SendData = (ItemDataArray) => {
      ItemDataArray.map((data) => {
        return this.setState(prevState => ({
          ISampleItems: [...prevState.ISampleItems, data]
        }))
      })
    }
  }
  render() {
    return (
      <div className="App">
        <Pivot>
          {this.state.ISampleItems.map((item) => {
            return (
              <PivotItem headerText={item.text} key={item.key}>
                <div className={styles.pivotContent}>
                  <NumberList numbers={item.data} /></div>
              </PivotItem>
            );
          })}
        </Pivot>
      </div>
    );
  };
};

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('controlAddIn')
);
reportWebVitals();
