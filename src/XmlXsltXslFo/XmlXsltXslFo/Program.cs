using Fonet;
using System;
using System.Xml.Xsl;

namespace XmlXsltXslFo
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                var myXslTrans = new XslCompiledTransform();
                myXslTrans.Load("stylesheet.xsl");
                myXslTrans.Transform("source.xml", "intermediate.fo");
                FonetDriver driver = FonetDriver.Make();
                driver.Render("intermediate.fo", "result.pdf");
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }
            Console.WriteLine("Press ENTER to exit");
            Console.ReadLine();
        }
    }
}
