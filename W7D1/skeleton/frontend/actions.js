const selectLoctaion = (city,jobs) => {
  return {
    type: "SWITCH_LOCATION",
    city,
    jobs,
  };
};
