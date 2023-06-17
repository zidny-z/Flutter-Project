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

export const userHospitalColumns = [
  { field: 'id', headerName: 'ID', width: 70 },
  {
    field: 'name',
    headerName: 'Name Of Hospital',
    width: 230,
    renderCell: (params) => {
      return (
        <div className="cellWithImg">
          <img className="cellImg" src={params.row.img} alt="avatar" />
          {params.row.name}
        </div>
      );
    },
  },
  {
    field: 'address',
    headerName: 'Address',
    width: 230,
  },
  {
    field: 'latitude',
    headerName: 'Latitude',
    width: 230,
  },
  {
    field: 'longitude',
    headerName: 'Longitude',
    width: 230,
  },
];
export const userPolyclinicColumns = [
  { field: 'id', headerName: 'ID', width: 70 },
  {
    field: 'name',
    headerName: 'Name Of Polyclinic',
    width: 230,
    renderCell: (params) => {
      return (
        <div className="cellWithImg">
          <img className="cellImg" src={params.row.img} alt="avatar" />
          {params.row.name}
        </div>
      );
    },
  },
  {
    field: 'type',
    headerName: 'Type Of Polyclinic',
    width: 230,
  },
  {
    field: 'openTime',
    headerName: 'Open Time',
    width: 230,
  },
  {
    field: 'closedTime',
    headerName: 'Closed Time',
    width: 230,
  },
];

export const userEventsColumns = [
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

export const userQueueColumns = [
  { field: 'id', headerName: 'ID', width: 70 },
  {
    field: 'nameHospital',
    headerName: 'Name Of Hospital',
    width: 230,
    renderCell: (params) => {
      return (
        <div className="cellWithImg">
          <img className="cellImg" src={params.row.img} alt="avatar" />
          {params.row.nameHospital}
        </div>
      );
    },
  },
  {
    field: 'name',
    headerName: 'Name Of Polyclinic',
    width: 230,
  },
  {
    field: 'date',
    headerName: 'Date',
    width: 230,
  },
  {
    field: 'user',
    headerName: 'Name Of Patient',
    width: 230,
  },
];
