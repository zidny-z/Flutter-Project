import './DataQueue.scss';
import { DataGrid } from '@mui/x-data-grid';
import { userQueueColumns } from '../../datatablesource';
import { Link } from 'react-router-dom';
import { useEffect, useState } from 'react';
import { collection, deleteDoc, doc, onSnapshot } from 'firebase/firestore';
import { db } from '../../firebase';

const DataQueue = ({ typoe }) => {
  const [data, setData] = useState([]);

  useEffect(() => {
    const unsub = onSnapshot(
      collection(db, 'queue'),
      (snapshot) => {
        let list = [];
        snapshot.docs.forEach((doc) => {
          list.push({ id: doc.id, ...doc.data() });
        });
        setData(list);
      },
      (error) => {
        console.log(error);
      }
    );

    return () => {
      unsub();
    };
  }, []);

  console.log(data);

  const actionColumn = [
    {
      renderCell: (params) => {
        return <div className="cellAction"></div>;
      },
    },
  ];
  return (
    <div className="datatable">
      <div className="datatableTitle">
        List Queue
        {/* <Link to="/polyclinicPage/newDataPolyclinic" className="link">
            Add New Polyclinic
          </Link> */}
      </div>
      <DataGrid className="datagrid" rows={data} columns={userQueueColumns.concat(actionColumn)} pageSize={9} rowsPerPageOptions={[9]} checkboxSelection />
    </div>
  );
};

export default DataQueue;
