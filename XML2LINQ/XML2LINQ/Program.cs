// XML To HTML suing LINQ 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace XML2LINQ
{
    class Program
    {
        static void Main(string[] args)
        {
            XDocument objDOC = new XDocument(
                new XElement("table", new XAttribute("border", 1),
                    new XElement("thead",
                        new XElement("tr",
                            new XElement("th", "Country"),
                            new XElement("th", "Name"),
                            new XElement("th", "Gender"),
                            new XElement("th", "TotalMarks"))),
                    new XElement("tbody",
                        from student in XDocument.Load(@"C:\proj\XML2LINQ\XML2LINQ\XMLData.xml").Descendants("Student")
                        select new XElement("tr",
                            new XElement("td", student.Attribute("Country").Value),
                            new XElement("td", student.Element("Name").Value),
                            new XElement("td", student.Element("Gender").Value),
                            new XElement("td", student.Element("TotalMarks").Value)))));
            objDOC.Save(@"C:\proj\XML2LINQ\XML2LINQ\HTMLData.HTM");
        }
    }
}
