﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAT602_MIlestone_Two
{
    public class Player
    {
        public string Username { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int LockState { get; set; }
        public int IsAdministrator { get; set; }
    }
}
