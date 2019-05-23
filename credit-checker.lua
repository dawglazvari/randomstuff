function checkCreditCard(n, t) {
    var i = [], e, r, u, l, y;
    for (i[0] = {
        name: "Visa",
        length: "13,16",
        prefixes: "4",
        checkdigit: !0
    },
    i[1] = {
        name: "MasterCard",
        length: "16",
        prefixes: "51,52,53,54,55",
        checkdigit: !0
    },
    i[2] = {
        name: "DinersClub",
        length: "14,16",
        prefixes: "36,38,54,55",
        checkdigit: !0
    },
    i[3] = {
        name: "CarteBlanche",
        length: "14",
        prefixes: "300,301,302,303,304,305",
        checkdigit: !0
    },
    i[4] = {
        name: "American Express",
        length: "15",
        prefixes: "34,37",
        checkdigit: !0
    },
    i[5] = {
        name: "Discover",
        length: "16",
        prefixes: "6011,622,64,65",
        checkdigit: !0
    },
    i[6] = {
        name: "JCB",
        length: "16",
        prefixes: "35",
        checkdigit: !0
    },
    i[7] = {
        name: "enRoute",
        length: "15",
        prefixes: "2014,2149",
        checkdigit: !0
    },
    i[8] = {
        name: "Solo",
        length: "16,18,19",
        prefixes: "6334,6767",
        checkdigit: !0
    },
    i[9] = {
        name: "Switch",
        length: "16,18,19",
        prefixes: "4903,4905,4911,4936,564182,633110,6333,6759",
        checkdigit: !0
    },
    i[10] = {
        name: "Maestro",
        length: "12,13,14,15,16,18,19",
        prefixes: "5018,5020,5038,6304,6759,6761,6762,6763",
        checkdigit: !0
    },
    i[11] = {
        name: "VisaElectron",
        length: "16",
        prefixes: "4026,417500,4508,4844,4913,4917",
        checkdigit: !0
    },
    i[12] = {
        name: "LaserCard",
        length: "16,17,18,19",
        prefixes: "6304,6706,6771,6709",
        checkdigit: !0
    },
    e = -1,
    r = 0; r < i.length; r++)
        if (t.toLowerCase() == i[r].name.toLowerCase()) {
            e = r;
            break
        }
    if (e == -1)
        return ccErrorNo = 0,
        !1;
    if (n.length == 0)
        return ccErrorNo = 1,
        !1;
    if (n = n.replace(/\s/g, ""),
    u = n,
    l = /^[0-9]{13,19}$/,
    !l.exec(u))
        return ccErrorNo = 2,
        !1;
    if (i[e].checkdigit) {
        var o = 0, f = 1, s;
        for (r = u.length - 1; r >= 0; r--)
            s = Number(u.charAt(r)) * f,
            s > 9 && (o = o + 1,
            s = s - 10),
            o = o + s,
            f = f == 1 ? 2 : 1;
        if (o % 10 != 0)
            return ccErrorNo = 3,
            !1
    }
    if (u == "5490997771092064")
        return ccErrorNo = 5,
        !1;
    var a = !1
      , v = !1
      , h = []
      , c = [];
    for (h = i[e].prefixes.split(","),
    r = 0; r < h.length; r++)
        y = new RegExp("^" + h[r]),
        y.test(u) && (v = !0);
    if (!v)
        return ccErrorNo = 3,
        !1;
    for (c = i[e].length.split(","),
    f = 0; f < c.length; f++)
        u.length == c[f] && (a = !0);
    return a ? !0 : (ccErrorNo = 4,
    !1)
}
var ccErrorNo = 0
  , ccErrors = [];
ccErrors[0] = "Unknown card type";
ccErrors[1] = "Credit card number is required.";
ccErrors[2] = "Credit card number should be numeric with length not less than 13.";
ccErrors[3] = "Credit card number is invalid";
ccErrors[4] = "Credit card number has an inappropriate number of digits";
ccErrors[5] = "Warning! This credit card number is associated with a scam attempt";
