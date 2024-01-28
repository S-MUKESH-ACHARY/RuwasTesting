using Npgsql;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

namespace RUWAS.App_Code
{
    public class RuwasDB
    {
        public NpgsqlConnection conn = new NpgsqlConnection();
        public NpgsqlCommand cmd;
        object obj_Lock = new object();
        string strpgcon = ConfigurationManager.ConnectionStrings["npgsql"].ConnectionString;
        public RuwasDB()
        {
            conn.ConnectionString = strpgcon;
        }
       public bool Insert(NpgsqlCommand _cmd)
        {
            try
            {
                cmd = _cmd;
                lock (cmd)
                {
                    cmd.Connection = conn;
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                }
                return true;
            }
            catch(Exception ex)
            {
                cmd.Connection.Close();
                throw new ApplicationException(ex.Message);
            }
            
        }
        public DataSet SelectQuery(NpgsqlCommand _cmd)
        {
            lock (obj_Lock)
            {
                cmd = _cmd;
                lock (cmd)
                {
                    try
                    {
                        DataSet dsval = new DataSet();
                        cmd.Connection = conn;
                        conn.Open();
                        NpgsqlDataAdapter sda = new NpgsqlDataAdapter();
                        sda.SelectCommand = cmd;
                        DataTable tb = new DataTable();
                        sda.Fill(dsval,"Table");
                        conn.Close();
                        return dsval;
                    }
                    catch(Exception ex)
                    {
                        conn.Close();
                        throw new ApplicationException(ex.Message);
                    }
                }
            }
        }
        public DataSet Edit(NpgsqlCommand _cmd)
        {
            lock (obj_Lock)
            {
                cmd = _cmd;
                lock (cmd)
                {
                    try
                    {
                        DataSet dsval = new DataSet();
                        cmd.Connection = conn;
                        conn.Open();
                        NpgsqlDataAdapter sda = new NpgsqlDataAdapter();
                        sda.SelectCommand = cmd;
                        sda.Fill(dsval,"Table");
                        conn.Close();
                        return dsval;
                    }
                    catch(Exception ex)
                    {
                        conn.Close();
                        throw new ApplicationException(ex.Message);
                    }
                }
            }
        }
        public DataSet Insert_Return(NpgsqlCommand _cmd)
        {
            try
            {
                cmd = _cmd;
                lock (cmd)
                {
                    DataSet dsval = new DataSet();
                    cmd.Connection = conn;
                    conn.Open();
                    NpgsqlDataAdapter sda = new NpgsqlDataAdapter(cmd);
                    sda.Fill(dsval,"Table");
                    conn.Close();
                    return dsval;
                }
            }
            catch(Exception ex)
            {
                cmd.Connection.Close();
                throw new ApplicationException(ex.Message);
            }
        }
        public int Update(NpgsqlCommand _cmd)
        {
            lock (obj_Lock)
            {
                try
                {
                    int i = 0;
                    cmd = _cmd;
                    lock (cmd)
                    {
                        cmd.Connection = conn;
                        cmd.Connection.Open();
                        i = cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                        return i;
                    }
                }
                catch (Exception ex)
                {
                    cmd.Connection.Close();
                    throw new ApplicationException(ex.Message);
                }
            }
        }

    }
}