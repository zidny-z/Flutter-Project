export const userColumns = [
  { field: 'id', headerName: 'ID', width: 70 },
  {
    field: 'Name',
    headerName: 'Name',
    width: 230,
    renderCell: (params) => {
      return (
        <div className="cellWithImg">
          <img className="cellImg" src={params.row.img} alt="avatar" />
          {params.row.username}
        </div>
      );
    },
  },
  {
    field: 'email',
    headerName: 'Email',
    width: 230,
  },
  {
    field: 'age',
    headerName: 'Age',
    width: 100,
  },
  {
    field: 'dateJoined',
    headerName: 'Date Joined',
    width: 230,
  },
];

export const userNewsColumns = [
  { field: 'id', headerName: 'ID', width: 70 },
  {
    field: 'title',
    headerName: 'Title',
    width: 230,
    renderCell: (params) => {
      return (
        <div className="cellWithImg">
          <img className="cellImg" src={params.row.img} alt="avatar" />
          {params.row.title}
        </div>
      );
    },
  },
  {
    field: 'category',
    headerName: 'Category',
    width: 230,
  },
  {
    field: 'description',
    headerName: 'Description',
    width: 230,
  },
];
