using System.Text;

namespace Criptografia;

public class Cryptography
{
    public static string Criptografar(string frase)
    {
        string aux = "";
        StringBuilder sb = new StringBuilder();
        foreach (char c in frase)
        {
            if ((int)c + 2 < 100)
                aux = $"0{(int)c + 2}";
            else
                aux = $"{c + 2}";
            sb.Append(aux);
        }
        return sb.ToString();
    }

    public static string CriptografiaUnica(string chave)
    {
        string aux = "";
        chave = chave.Remove(3, 1);
        chave = chave.Remove(chave.Length - 1, 1);
        StringBuilder sb = new StringBuilder();
        foreach (char c in chave)
        {
            if ((int)c + 2 < 100)
                aux = $"0{(int)c + 2}";
            else
                aux = $"{c + 2}";
            sb.Append(aux);
        }
        return sb.ToString();
    }
}
