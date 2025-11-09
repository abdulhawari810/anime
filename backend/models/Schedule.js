import db from "./../config/db.js";
import { Sequelize } from "sequelize";

const { DataTypes } = Sequelize;

const Schedule = db.define(
  "jadwal_anime",
  {
    hari: {
      type: DataTypes.STRING,
      allowNull: false,
      validat: {
        notEmpty: {
          args: true,
          msg: "Hari tidak boleh kosong!",
        },
      },
    },
    waktu_rilis: {
      type: DataTypes.DATE,
      allowNull: false,
      validate: {
        notEmpty: {
          args: true,
          msg: "Jam Rilis tidak boleh kosong!",
        },
      },
    },
  },
  {
    freezeTableName: true,
  }
);

export default Schedule;
