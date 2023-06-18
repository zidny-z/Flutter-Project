import './DataPolyclinic.scss';
import { DataGrid } from '@mui/x-data-grid';
import { userPolyclinicColumns } from '../../datatablesource';
import { Link } from 'react-router-dom';
import { useEffect, useState } from 'react';
import { collection, deleteDoc, doc, onSnapshot } from 'firebase/firestore';
import { db } from '../../firebase';

const DataPolyclinic = ({ typoe }) => {
    const [data, setData] = useState([]);
  
    useEffect(() => {
      const unsub = onSnapshot(
        collection(db, 'polyclinic'),
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
  
    const handleDelete = async (id) => {
      try {
        await deleteDoc(doc(db, 'polyclinic', id));
        setData(data.filter((item) => item.id !== id));
      } catch (error) {}
    };
  
    const actionColumn = [
      {
        field: 'action',
        headerName: 'Action',
        width: 200,
        renderCell: (params) => {
          return (
            <div className="cellAction">
              <div className="deleteButton" onClick={() => handleDelete(params.row.id)}>
                Delete
              </div>
            </div>
          );
        },
      },
    ];
    return (
      <div className="datatable">
        <div className="datatableTitle">
          Add New Polyclinic
          <Link to="/polyclinicPage/newDataPolyclinic" className="link">
            Add New Polyclinic
          </Link>
        </div>
        <DataGrid className="datagrid" rows={data} columns={userPolyclinicColumns.concat(actionColumn)} pageSize={9} rowsPerPageOptions={[9]} checkboxSelection />
      </div>
    );
  };

export default DataPolyclinic;