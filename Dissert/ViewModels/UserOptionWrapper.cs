using Dissert.Models;
using System.Collections.Generic;

namespace Dissert.ViewModels
{
    public static class UserOptionWrapper
    {
        


        public static List<bool> GetUserOptionWrapper(UserOptions usOpt)
        {
           List<bool> list = new List<bool>();

           list.Add(usOpt.opt1);            
           list.Add(usOpt.opt2);            
           list.Add(usOpt.opt3);            
           list.Add(usOpt.opt4);            
           list.Add(usOpt.opt5);            
           list.Add(usOpt.opt6);            
           list.Add(usOpt.opt7);            
           list.Add(usOpt.opt8);            
           list.Add(usOpt.opt9);            
           list.Add(usOpt.opt10);            
           list.Add(usOpt.opt11);            
           list.Add(usOpt.opt12);            
           list.Add(usOpt.opt13);            
           list.Add(usOpt.opt14);            
           list.Add(usOpt.opt15);            
           list.Add(usOpt.opt16);
           return list;
        }
    }
}
