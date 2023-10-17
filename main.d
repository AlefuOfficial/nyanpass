import std.net.curl;
import std.stdio;
import std.parallelism;
import std.concurrency;
import std.string;

void nyanpass()
{
    while (true)
    {
        try
        {
            string payload = "nyan=pass";
            auto http = HTTP();
            http.addRequestHeader("Content-Length", "9");
            http.addRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
            auto content = post("https://nyanpass.com/add.php", payload, http);
            writeln(content);
        } catch (Exception e){
            continue;
        }
    }
}

void main()
{
    size_t num = 10;
    for (size_t i = 0; i <= num; ++i)
    {
        spawn(&nyanpass);
    }
}
