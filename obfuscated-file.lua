local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/' function dec(data) data = string.gsub(data, '[^'..b..'=]', '') return (data:gsub('.', function(x) if (x == '=') then return '' end local r,f='',(b:find(x)-1) for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end return r; end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x) if (#x ~= 8) then return '' end local c=0 for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end return string.char(c) end)) end load(dec('bG9jYWwgYj0nQUJDREVGR0hJSktMTU5PUFFSU1RVVldYWVphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5ejAxMjM0NTY3ODkrLycgZnVuY3Rpb24gb2JkZWMoZGF0YSkgZGF0YSA9IHN0cmluZy5nc3ViKGRhdGEsICdbXicuLmIuLic9XScsICcnKSByZXR1cm4gKGRhdGE6Z3N1YignLicsIGZ1bmN0aW9uKHgpIGlmICh4ID09ICc9JykgdGhlbiByZXR1cm4gJycgZW5kIGxvY2FsIHIsZj0nJywoYjpmaW5kKHgpLTEpIGZvciBpPTYsMSwtMSBkbyByPXIuLihmJTJeaS1mJTJeKGktMSk+MCBhbmQgJzEnIG9yICcwJykgZW5kIHJldHVybiByOyBlbmQpOmdzdWIoJyVkJWQlZD8lZD8lZD8lZD8lZD8lZD8nLCBmdW5jdGlvbih4KSBpZiAoI3ggfj0gOCkgdGhlbiByZXR1cm4gJycgZW5kIGxvY2FsIGM9MCBmb3IgaT0xLDggZG8gYz1jKyh4OnN1YihpLGkpPT0nMScgYW5kIDJeKDgtaSkgb3IgMCkgZW5kIHJldHVybiBzdHJpbmcuY2hhcihjKSBlbmQpKSBlbmQgZnVuY3Rpb24gcnVuKCkgbG9hZChvYmRlYygnYkc5allXd2dZajBuUVVKRFJFVkdSMGhKU2t0TVRVNVBVRkZTVTFSVlZsZFlXVnBoWW1Oa1pXWm5hR2xxYTJ4dGJtOXdjWEp6ZEhWMmQzaDVlakF4TWpNME5UWTNPRGtyTHljZ1puVnVZM1JwYjI0Z1pXNWpLR1JoZEdFcElISmxkSFZ5YmlBb0tHUmhkR0U2WjNOMVlpZ25MaWNzSUdaMWJtTjBhVzl1S0hncElHeHZZMkZzSUhJc1lqMG5KeXg0T21KNWRHVW9LU0JtYjNJZ2FUMDRMREVzTFRFZ1pHOGdjajF5TGk0b1lpVXlYbWt0WWlVeVhpaHBMVEVwUGpBZ1lXNWtJQ2N4SnlCdmNpQW5NQ2NwSUdWdVpDQnlaWFIxY200Z2Nqc2daVzVrS1M0dUp6QXdNREFuS1RwbmMzVmlLQ2NsWkNWa0pXUS9KV1EvSldRL0pXUS9KeXdnWm5WdVkzUnBiMjRvZUNrZ2FXWWdLQ040SUR3Z05pa2dkR2hsYmlCeVpYUjFjbTRnSnljZ1pXNWtJR3h2WTJGc0lHTTlNQ0JtYjNJZ2FUMHhMRFlnWkc4Z1l6MWpLeWg0T25OMVlpaHBMR2twUFQwbk1TY2dZVzVrSURKZUtEWXRhU2tnYjNJZ01Da2daVzVrSUhKbGRIVnliaUJpT25OMVlpaGpLekVzWXlzeEtTQmxibVFwTGk0b2V5QW5KeXdnSnowOUp5d2dKejBuSUgwcFd5TmtZWFJoSlRNck1WMHBJR1Z1WkNCbWRXNWpkR2x2YmlCa1pXTW9aR0YwWVNrZ1pHRjBZU0E5SUhOMGNtbHVaeTVuYzNWaUtHUmhkR0VzSUNkYlhpY3VMbUl1TGljOVhTY3NJQ2NuS1NCeVpYUjFjbTRnS0dSaGRHRTZaM04xWWlnbkxpY3NJR1oxYm1OMGFXOXVLSGdwSUdsbUlDaDRJRDA5SUNjOUp5a2dkR2hsYmlCeVpYUjFjbTRnSnljZ1pXNWtJR3h2WTJGc0lISXNaajBuSnl3b1lqcG1hVzVrS0hncExURXBJR1p2Y2lCcFBUWXNNU3d0TVNCa2J5QnlQWEl1TGlobUpUSmVhUzFtSlRKZUtHa3RNU2srTUNCaGJtUWdKekVuSUc5eUlDY3dKeWtnWlc1a0lISmxkSFZ5YmlCeU95QmxibVFwT21kemRXSW9KeVZrSldRbFpEOGxaRDhsWkQ4bFpEOGxaRDhsWkQ4bkxDQm1kVzVqZEdsdmJpaDRLU0JwWmlBb0kzZ2dmajBnT0NrZ2RHaGxiaUJ5WlhSMWNtNGdKeWNnWlc1a0lHeHZZMkZzSUdNOU1DQm1iM0lnYVQweExEZ2daRzhnWXoxakt5aDRPbk4xWWlocExHa3BQVDBuTVNjZ1lXNWtJREplS0RndGFTa2diM0lnTUNrZ1pXNWtJSEpsZEhWeWJpQnpkSEpwYm1jdVkyaGhjaWhqS1NCbGJtUXBLU0JsYm1RZ2NISnBiblFvSjFCcFkyc2dlVzkxY2lCd2IybHpiMjR1SnlrZ2NISnBiblFvSnloRktXNWpjbmx3ZEN3Z0tFUXBaV055ZVhCMEp5a2diRzlqWVd3Z1pTQTlJR2x2TG5KbFlXUW9LU0JwWmlCemRISnBibWN1Ykc5M1pYSW9aU2tnUFQwZ0oyVW5JSFJvWlc0Z2NISnBiblFvSjFkb1lYUmNKM01nZEdobElIQm9jbUZ6WlQ4bktTQnNiMk5oYkNCbUlEMGdhVzh1Y21WaFpDZ3BJSEJ5YVc1MEtDZElaWEpsWENkeklIUm9aU0JqYjJSbE9pQW5MaTVsYm1Nb1ppa3BJR1ZzYzJWcFppQnpkSEpwYm1jdWJHOTNaWElvWlNrZ1BUMGdKMlFuSUhSb1pXNGdjSEpwYm5Rb0oxZG9ZWFJjSjNNZ2RHaGxJSEJvY21GelpUOG5LU0JzYjJOaGJDQm1JRDBnYVc4dWNtVmhaQ2dwSUhCeWFXNTBLQ2RJWlhKbFhDZHpJSFJvWlNCamIyUmxPaUFuTGk1a1pXTW9aaWtwSUdWc2MyVWdjSEpwYm5Rb0oxUm9ZWFJjSjNNZ2JtOTBJR0VnWTJodmFXTmxMaWNwSUdWdVpBPT0nKSkoKSBlbmQ='))() run()