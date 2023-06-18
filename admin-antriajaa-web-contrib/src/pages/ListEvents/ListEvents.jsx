import './ListEvents.scss';
import Sidebar from '../../components/sidebar/Sidebar';
import DataEvents from '../../components/dataEventsList/DataEvents';

const ListEvents = () => {
  return (
    <div className="list">
      <Sidebar />
      <div className="listContainer">
        <DataEvents />
      </div>
    </div>
  );
};

export default ListEvents;
