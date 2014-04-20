/* load.js */
var open = false;
function load(url)
{
  if (!open)
  {
    window.location.href=url;
    open = true;
  }
  return false;
}