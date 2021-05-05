using Microsoft.AspNetCore.Mvc;
using System.IO;
using System;
//using IronPdf;
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

        private FileStream GetHtml(string program_name, string developer_name, string web_site, string email)
        {
            var htmlPath = Startup.webRootPath + @"\files\template.html";
            var newLicensePath = Startup.webRootPath + @"\files\license.html";


            string html = System.IO.File.ReadAllText(htmlPath);
            html = html.Replace("{program_name}", program_name);
            html = html.Replace("{developer_name}", developer_name);
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
            doc.Save(newLicensePath);

            // close pdf document
            doc.Close();
            var stream = new FileStream(newLicensePath, FileMode.Open);

            return stream;
        }


        //private FileStream GetHtmlIron(string program_name, string developer_name, string web_site, string email)
        //{
        //    var render = new IronPdf.HtmlToPdf();
        //    //var doc = render.RenderHtmlAsPdf(System.IO.File.ReadAllText(Directory.GetCurrentDirectory() + @"\Files\Templates\license.html"));
        //    //doc.SaveAs(Directory.GetCurrentDirectory() + @"\Files\Generations\license.pdf");
        //    //var stream = new FileStream(Directory.GetCurrentDirectory() + @"\Files\Generations\license.pdf", FileMode.Open);
        //    var htmlPath = Startup.webRootPath + @"\files\template.html";// ("~/files/template.html");
        //    var newLicensePath = Startup.webRootPath + @"\files\license.html";
        //    var htmlstring = System.IO.File.ReadAllText(htmlPath);
        //    var doc = render.RenderHtmlAsPdf(htmlstring);
        //    doc.SaveAs(newLicensePath);
        //    var stream = new FileStream(newLicensePath, FileMode.Open);
        //    return stream;
        //}

    }


}
