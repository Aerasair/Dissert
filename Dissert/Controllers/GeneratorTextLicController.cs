using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.IO;

using SelectPdf;

namespace Dissert.Controllers
{
    public class GeneratorTextLicController : Controller
    {
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Index([FromForm(Name = "program_name")] string program_name, [FromForm(Name = "developer_name")] string developer_name, [FromForm(Name = "developer_name")] string web_site, [FromForm(Name = "developer_name")] string email)
        {
            var steam = GetHtml(program_name, developer_name, web_site, email);

            return new FileStreamResult(steam, "application/pdf");
        }

        private FileStream GetHtml(string program_name, string  developer_name,string web_site,string email)
        {
            string html = System.IO.File.ReadAllText(Directory.GetCurrentDirectory() + @"\Files\Templates\license.html");
            html = html.Replace("{program_name}", program_name);
            html = html.Replace("{developer_name}",  developer_name);
            html = html.Replace("{web_site}", web_site);
            html = html.Replace("{date}", DateTime.Now.ToString("dd-MM-yyyy"));
            html = html.Replace("{email}", email);


            // read parameters from the webpage
            string htmlString = html;
    

            string pdf_page_size = "A4";
            PdfPageSize pageSize = (PdfPageSize)Enum.Parse(typeof(PdfPageSize),
                pdf_page_size, true);

            string pdf_orientation = PdfPageOrientation.Portrait.ToString();
            PdfPageOrientation pdfOrientation =
                (PdfPageOrientation)Enum.Parse(typeof(PdfPageOrientation),
                pdf_orientation, true);

            int webPageWidth = 1024;
            try
            {
                webPageWidth = Convert.ToInt32(1024);
            }
            catch { }

            int webPageHeight = 0;
            try
            {
                webPageHeight = Convert.ToInt32(0);
            }
            catch { }

            // instantiate a html to pdf converter object
            HtmlToPdf converter = new HtmlToPdf();

            // set converter options
            converter.Options.PdfPageSize = pageSize;
            converter.Options.PdfPageOrientation = pdfOrientation;
            converter.Options.WebPageWidth = webPageWidth;
            converter.Options.WebPageHeight = webPageHeight;

            // create a new pdf document converting an url
            PdfDocument doc = converter.ConvertHtmlString(htmlString, "localhost");

            // save pdf document
            doc.Save(Directory.GetCurrentDirectory() + @"\Files\Generations\license.pdf");

            // close pdf document
            doc.Close();
            var stream = new FileStream(Directory.GetCurrentDirectory() + @"\Files\Generations\license.pdf", FileMode.Open);

            return stream;
        }      

    }
}
