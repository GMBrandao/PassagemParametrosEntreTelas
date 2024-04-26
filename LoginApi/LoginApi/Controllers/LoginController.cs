using Criptografia;
using LoginApi.Model;
using Microsoft.AspNetCore.Mvc;

namespace LoginApi.Controllers;

[ApiController]
[Route("api/login")]
public class LoginController : ControllerBase
{
    public LoginController()
    {
    }

    [HttpGet]
    public bool Login(
        [FromQuery]string login)
    { 
        return Cryptography.CriptografiaUnica(login).Equals(Constant.Login);
    }
}
