// json2.js + easyxdm.js + kakaoLoginWidget.js + reqwest.min.js
function kko(){
"object" !== typeof JSON && (JSON = {});
(function () {
    function m(a) {
        return 10 > a ? "0" + a : a
    }

    function r() {
        return this.valueOf()
    }

    function t(a) {
        u.lastIndex = 0;
        return u.test(a) ? '"' + a.replace(u, function (a) {
            var c = w[a];
            return "string" === typeof c ? c : "\\u" + ("0000" + a.charCodeAt(0).toString(16)).slice(-4)
        }) + '"' : '"' + a + '"'
    }

    function p(a, l) {
        var c, d, h, q, g = e,
            f, b = l[a];
        b && "object" === typeof b && "function" === typeof b.toJSON && (b = b.toJSON(a));
        "function" === typeof k && (b = k.call(l, a, b));
        switch (typeof b) {
            case "string":
                return t(b);
            case "number":
                return isFinite(b) ? String(b) :
                    "null";
            case "boolean":
            case "null":
                return String(b);
            case "object":
                if (!b) return "null";
                e += n;
                f = [];
                if ("[object Array]" === Object.prototype.toString.apply(b)) {
                    q = b.length;
                    for (c = 0; c < q; c += 1) f[c] = p(c, b) || "null";
                    h = 0 === f.length ? "[]" : e ? "[\n" + e + f.join(",\n" + e) + "\n" + g + "]" : "[" + f.join(",") + "]";
                    e = g;
                    return h
                }
                if (k && "object" === typeof k)
                    for (q = k.length, c = 0; c < q; c += 1) "string" === typeof k[c] && (d = k[c], (h = p(d, b)) && f.push(t(d) + (e ? ": " : ":") + h));
                else
                    for (d in b) Object.prototype.hasOwnProperty.call(b, d) && (h = p(d, b)) && f.push(t(d) + (e ?
                        ": " : ":") + h);
                h = 0 === f.length ? "{}" : e ? "{\n" + e + f.join(",\n" + e) + "\n" + g + "}" : "{" + f.join(",") + "}";
                e = g;
                return h
        }
    }
    var x = /^[\],:{}\s]*$/,
        y = /\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,
        z = /"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,
        A = /(?:^|:|,)(?:\s*\[)+/g,
        u = /[\\\"\u0000-\u001f\u007f-\u009f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
        v = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g;
    "function" !== typeof Date.prototype.toJSON && (Date.prototype.toJSON = function () {
        return isFinite(this.valueOf()) ? this.getUTCFullYear() + "-" + m(this.getUTCMonth() + 1) + "-" + m(this.getUTCDate()) + "T" + m(this.getUTCHours()) + ":" + m(this.getUTCMinutes()) + ":" + m(this.getUTCSeconds()) + "Z" : null
    }, Boolean.prototype.toJSON = r, Number.prototype.toJSON = r, String.prototype.toJSON = r);
    var e, n, w, k;
    "function" !== typeof JSON.stringify && (w = {
            "\b": "\\b",
            "\t": "\\t",
            "\n": "\\n",
            "\f": "\\f",
            "\r": "\\r",
            '"': '\\"',
            "\\": "\\\\"
        }, JSON.stringify =
        function (a, l, c) {
            var d;
            n = e = "";
            if ("number" === typeof c)
                for (d = 0; d < c; d += 1) n += " ";
            else "string" === typeof c && (n = c);
            if ((k = l) && "function" !== typeof l && ("object" !== typeof l || "number" !== typeof l.length)) throw Error("JSON.stringify");
            return p("", {
                "": a
            })
        });
    "function" !== typeof JSON.parse && (JSON.parse = function (a, e) {
        function c(a, d) {
            var g, f, b = a[d];
            if (b && "object" === typeof b)
                for (g in b) Object.prototype.hasOwnProperty.call(b, g) && (f = c(b, g), void 0 !== f ? b[g] = f : delete b[g]);
            return e.call(a, d, b)
        }
        var d;
        a = String(a);
        v.lastIndex =
            0;
        v.test(a) && (a = a.replace(v, function (a) {
            return "\\u" + ("0000" + a.charCodeAt(0).toString(16)).slice(-4)
        }));
        if (x.test(a.replace(y, "@").replace(z, "]").replace(A, ""))) return d = eval("(" + a + ")"), "function" === typeof e ? c({
            "": d
        }, "") : d;
        throw new SyntaxError("JSON.parse");
    })
})();
(function (N, d, p, K, k, H) {
    var b = this;
    var n = Math.floor(Math.random() * 10000);
    var q = Function.prototype;
    var Q = /^((http.?:)\/\/([^:\/\s]+)(:\d+)*)/;
    var R = /[\-\w]+\/\.\.\//;
    var F = /([^:])\/\//g;
    var I = "";
    var o = {};
    var M = N.easyXDM;
    var U = "easyXDM_";
    var E;
    var y = false;
    var i;
    var h;

    function C(X, Z) {
        var Y = typeof X[Z];
        return Y == "function" || (!!(Y == "object" && X[Z])) || Y == "unknown"
    }

    function u(X, Y) {
        return !!(typeof (X[Y]) == "object" && X[Y])
    }

    function r(X) {
        return Object.prototype.toString.call(X) === "[object Array]"
    }

    function c() {
        var Z = "Shockwave Flash",
            ad = "application/x-shockwave-flash";
        if (!t(navigator.plugins) && typeof navigator.plugins[Z] == "object") {
            var ab = navigator.plugins[Z].description;
            if (ab && !t(navigator.mimeTypes) && navigator.mimeTypes[ad] && navigator.mimeTypes[ad].enabledPlugin) {
                i = ab.match(/\d+/g)
            }
        }
        if (!i) {
            var Y;
            try {
                Y = new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
                i = Array.prototype.slice.call(Y.GetVariable("$version").match(/(\d+),(\d+),(\d+),(\d+)/), 1);
                Y = null
            } catch (ac) {}
        }
        if (!i) {
            return false
        }
        var X = parseInt(i[0], 10),
            aa = parseInt(i[1], 10);
        h = X > 9 && aa > 0;
        return true
    }
    var v, x;
    if (C(N, "addEventListener")) {
        v = function (Z, X, Y) {
            Z.addEventListener(X, Y, false)
        };
        x = function (Z, X, Y) {
            Z.removeEventListener(X, Y, false)
        }
    } else {
        if (C(N, "attachEvent")) {
            v = function (X, Z, Y) {
                X.attachEvent("on" + Z, Y)
            };
            x = function (X, Z, Y) {
                X.detachEvent("on" + Z, Y)
            }
        } else {
            throw new Error("Browser not supported")
        }
    }
    var W = false,
        J = [],
        L;
    if ("readyState" in d) {
        L = d.readyState;
        W = L == "complete" || (~navigator.userAgent.indexOf("AppleWebKit/") && (L == "loaded" || L == "interactive"))
    } else {
        W = !!d.body
    }

    function s() {
        if (W) {
            return
        }
        W = true;
        for (var X = 0; X < J.length; X++) {
            J[X]()
        }
        J.length = 0
    }
    if (!W) {
        if (C(N, "addEventListener")) {
            v(d, "DOMContentLoaded", s)
        } else {
            v(d, "readystatechange", function () {
                if (d.readyState == "complete") {
                    s()
                }
            });
            if (d.documentElement.doScroll && N === top) {
                var g = function () {
                    if (W) {
                        return
                    }
                    try {
                        d.documentElement.doScroll("left")
                    } catch (X) {
                        K(g, 1);
                        return
                    }
                    s()
                };
                g()
            }
        }
        v(N, "load", s)
    }

    function G(Y, X) {
        if (W) {
            Y.call(X);
            return
        }
        J.push(function () {
            Y.call(X)
        })
    }

    function m() {
        var Z = parent;
        if (I !== "") {
            for (var X = 0, Y = I.split("."); X < Y.length; X++) {
                Z = Z[Y[X]]
            }
        }
        return Z.easyXDM
    }

    function e(X) {
        N.easyXDM = M;
        I = X;
        if (I) {
            U = "easyXDM_" + I.replace(".", "_") + "_"
        }
        return o
    }

    function z(X) {
        return X.match(Q)[3]
    }

    function f(X) {
        return X.match(Q)[4] || ""
    }

    function j(Z) {
        var X = Z.toLowerCase().match(Q);
        var aa = X[2],
            ab = X[3],
            Y = X[4] || "";
        if ((aa == "http:" && Y == ":80") || (aa == "https:" && Y == ":443")) {
            Y = ""
        }
        return aa + "//" + ab + Y
    }

    function B(X) {
        X = X.replace(F, "$1/");
        if (!X.match(/^(http||https):\/\//)) {
            var Y = (X.substring(0, 1) === "/") ? "" : p.pathname;
            if (Y.substring(Y.length - 1) !== "/") {
                Y = Y.substring(0, Y.lastIndexOf("/") + 1)
            }
            X = p.protocol + "//" + p.host + Y + X
        }
        while (R.test(X)) {
            X = X.replace(R, "")
        }
        return X
    }

    function P(X, aa) {
        var ac = "",
            Z = X.indexOf("#");
        if (Z !== -1) {
            ac = X.substring(Z);
            X = X.substring(0, Z)
        }
        var ab = [];
        for (var Y in aa) {
            if (aa.hasOwnProperty(Y)) {
                ab.push(Y + "=" + H(aa[Y]))
            }
        }
        return X + (y ? "#" : (X.indexOf("?") == -1 ? "?" : "&")) + ab.join("&") + ac
    }
    var S = (function (X) {
        X = X.substring(1).split("&");
        var Z = {},
            aa, Y = X.length;
        while (Y--) {
            aa = X[Y].split("=");
            Z[aa[0]] = k(aa[1])
        }
        return Z
    }(/xdm_e=/.test(p.search) ? p.search : p.hash));

    function t(X) {
        return typeof X === "undefined"
    }
    var O = function () {
        var Y = {};
        var Z = {
                a: [1, 2, 3]
            },
            X = '{"a":[1,2,3]}';
        if (typeof JSON != "undefined" && typeof JSON.stringify === "function" && JSON.stringify(Z).replace((/\s/g), "") === X) {
            return JSON
        }
        if (Object.toJSON) {
            if (Object.toJSON(Z).replace((/\s/g), "") === X) {
                Y.stringify = Object.toJSON
            }
        }
        if (typeof String.prototype.evalJSON === "function") {
            Z = X.evalJSON();
            if (Z.a && Z.a.length === 3 && Z.a[2] === 3) {
                Y.parse = function (aa) {
                    return aa.evalJSON()
                }
            }
        }
        if (Y.stringify && Y.parse) {
            O = function () {
                return Y
            };
            return Y
        }
        return null
    };

    function T(X, Y, Z) {
        var ab;
        for (var aa in Y) {
            if (Y.hasOwnProperty(aa)) {
                if (aa in X) {
                    ab = Y[aa];
                    if (typeof ab === "object") {
                        T(X[aa], ab, Z)
                    } else {
                        if (!Z) {
                            X[aa] = Y[aa]
                        }
                    }
                } else {
                    X[aa] = Y[aa]
                }
            }
        }
        return X
    }

    function a() {
        var Y = d.body.appendChild(d.createElement("form")),
            X = Y.appendChild(d.createElement("input"));
        X.name = U + "TEST" + n;
        E = X !== Y.elements[X.name];
        d.body.removeChild(Y)
    }

    function A(Y) {
        if (t(E)) {
            a()
        }
        var ac;
        if (E) {
            ac = d.createElement('<iframe name="' + Y.props.name + '"/>')
        } else {
            ac = d.createElement("IFRAME");
            ac.name = Y.props.name
        }
        ac.id = ac.name = Y.props.name;
        delete Y.props.name;
        if (typeof Y.container == "string") {
            Y.container = d.getElementById(Y.container)
        }
        if (!Y.container) {
            T(ac.style, {
                position: "absolute",
                top: "-2000px",
                left: "0px"
            });
            Y.container = d.body
        }
        var ab = Y.props.src;
        Y.props.src = "javascript:false";
        T(ac, Y.props);
        ac.border = ac.frameBorder = 0;
        ac.allowTransparency = true;
        Y.container.appendChild(ac);
        if (Y.onLoad) {
            v(ac, "load", Y.onLoad)
        }
        if (Y.usePost) {
            var aa = Y.container.appendChild(d.createElement("form")),
                X;
            aa.target = ac.name;
            aa.action = ab;
            aa.method = "POST";
            if (typeof (Y.usePost) === "object") {
                for (var Z in Y.usePost) {
                    if (Y.usePost.hasOwnProperty(Z)) {
                        if (E) {
                            X = d.createElement('<input name="' + Z + '"/>')
                        } else {
                            X = d.createElement("INPUT");
                            X.name = Z
                        }
                        X.value = Y.usePost[Z];
                        aa.appendChild(X)
                    }
                }
            }
            aa.submit();
            aa.parentNode.removeChild(aa)
        } else {
            ac.src = ab
        }
        Y.props.src = ab;
        return ac
    }

    function V(aa, Z) {
        if (typeof aa == "string") {
            aa = [aa]
        }
        var Y, X = aa.length;
        while (X--) {
            Y = aa[X];
            Y = new RegExp(Y.substr(0, 1) == "^" ? Y : ("^" + Y.replace(/(\*)/g, ".$1").replace(/\?/g, ".") + "$"));
            if (Y.test(Z)) {
                return true
            }
        }
        return false
    }

    function l(Z) {
        var ae = Z.protocol,
            Y;
        Z.isHost = Z.isHost || t(S.xdm_p);
        y = Z.hash || false;
        if (!Z.props) {
            Z.props = {}
        }
        if (!Z.isHost) {
            Z.channel = S.xdm_c.replace(/["'<>\\]/g, "");
            Z.secret = S.xdm_s;
            Z.remote = S.xdm_e.replace(/["'<>\\]/g, "");
            ae = S.xdm_p;
            if (Z.acl && !V(Z.acl, Z.remote)) {
                throw new Error("Access denied for " + Z.remote)
            }
        } else {
            Z.remote = B(Z.remote);
            Z.channel = Z.channel || "default" + n++;
            Z.secret = Math.random().toString(16).substring(2);
            if (t(ae)) {
                if (j(p.href) == j(Z.remote)) {
                    ae = "4"
                } else {
                    if (C(N, "postMessage") || C(d, "postMessage")) {
                        ae = "1"
                    } else {
                        if (Z.swf && C(N, "ActiveXObject") && c()) {
                            ae = "6"
                        } else {
                            if (navigator.product === "Gecko" && "frameElement" in N && navigator.userAgent.indexOf("WebKit") == -1) {
                                ae = "5"
                            } else {
                                if (Z.remoteHelper) {
                                    ae = "2"
                                } else {
                                    ae = "0"
                                }
                            }
                        }
                    }
                }
            }
        }
        Z.protocol = ae;
        switch (ae) {
            case "0":
                T(Z, {
                    interval: 100,
                    delay: 2000,
                    useResize: true,
                    useParent: false,
                    usePolling: false
                }, true);
                if (Z.isHost) {
                    if (!Z.local) {
                        var ac = p.protocol + "//" + p.host,
                            X = d.body.getElementsByTagName("img"),
                            ad;
                        var aa = X.length;
                        while (aa--) {
                            ad = X[aa];
                            if (ad.src.substring(0, ac.length) === ac) {
                                Z.local = ad.src;
                                break
                            }
                        }
                        if (!Z.local) {
                            Z.local = N
                        }
                    }
                    var ab = {
                        xdm_c: Z.channel,
                        xdm_p: 0
                    };
                    if (Z.local === N) {
                        Z.usePolling = true;
                        Z.useParent = true;
                        Z.local = p.protocol + "//" + p.host + p.pathname + p.search;
                        ab.xdm_e = Z.local;
                        ab.xdm_pa = 1
                    } else {
                        ab.xdm_e = B(Z.local)
                    }
                    if (Z.container) {
                        Z.useResize = false;
                        ab.xdm_po = 1
                    }
                    Z.remote = P(Z.remote, ab)
                } else {
                    T(Z, {
                        channel: S.xdm_c,
                        remote: S.xdm_e,
                        useParent: !t(S.xdm_pa),
                        usePolling: !t(S.xdm_po),
                        useResize: Z.useParent ? false : Z.useResize
                    })
                }
                Y = [new o.stack.HashTransport(Z), new o.stack.ReliableBehavior({}), new o.stack.QueueBehavior({
                    encode: true,
                    maxLength: 4000 - Z.remote.length
                }), new o.stack.VerifyBehavior({
                    initiate: Z.isHost
                })];
                break;
            case "1":
                Y = [new o.stack.PostMessageTransport(Z)];
                break;
            case "2":
                if (Z.isHost) {
                    Z.remoteHelper = B(Z.remoteHelper)
                }
                Y = [new o.stack.NameTransport(Z), new o.stack.QueueBehavior(), new o.stack.VerifyBehavior({
                    initiate: Z.isHost
                })];
                break;
            case "3":
                Y = [new o.stack.NixTransport(Z)];
                break;
            case "4":
                Y = [new o.stack.SameOriginTransport(Z)];
                break;
            case "5":
                Y = [new o.stack.FrameElementTransport(Z)];
                break;
            case "6":
                if (!i) {
                    c()
                }
                Y = [new o.stack.FlashTransport(Z)];
                break
        }
        Y.push(new o.stack.QueueBehavior({
            lazy: Z.lazy,
            remove: true
        }));
        return Y
    }

    function D(aa) {
        var ab, Z = {
            incoming: function (ad, ac) {
                this.up.incoming(ad, ac)
            },
            outgoing: function (ac, ad) {
                this.down.outgoing(ac, ad)
            },
            callback: function (ac) {
                this.up.callback(ac)
            },
            init: function () {
                this.down.init()
            },
            destroy: function () {
                this.down.destroy()
            }
        };
        for (var Y = 0, X = aa.length; Y < X; Y++) {
            ab = aa[Y];
            T(ab, Z, true);
            if (Y !== 0) {
                ab.down = aa[Y - 1]
            }
            if (Y !== X - 1) {
                ab.up = aa[Y + 1]
            }
        }
        return ab
    }

    function w(X) {
        X.up.down = X.down;
        X.down.up = X.up;
        X.up = X.down = null
    }
    T(o, {
        version: "2.4.19.3",
        query: S,
        stack: {},
        apply: T,
        getJSONObject: O,
        whenReady: G,
        noConflict: e
    });
    o.DomHelper = {
        on: v,
        un: x,
        requiresJSON: function (X) {
            if (!u(N, "JSON")) {
                d.write('<script type="text/javascript" src="' + X + '"><\/script>')
            }
        }
    };
    (function () {
        var X = {};
        o.Fn = {
            set: function (Y, Z) {
                X[Y] = Z
            },
            get: function (Z, Y) {
                if (!X.hasOwnProperty(Z)) {
                    return
                }
                var aa = X[Z];
                if (Y) {
                    delete X[Z]
                }
                return aa
            }
        }
    }());
    o.Socket = function (Y) {
        var X = D(l(Y).concat([{
                incoming: function (ab, aa) {
                    Y.onMessage(ab, aa)
                },
                callback: function (aa) {
                    if (Y.onReady) {
                        Y.onReady(aa)
                    }
                }
            }])),
            Z = j(Y.remote);
        this.origin = j(Y.remote);
        this.destroy = function () {
            X.destroy()
        };
        this.postMessage = function (aa) {
            X.outgoing(aa, Z)
        };
        X.init()
    };
    o.Rpc = function (Z, Y) {
        if (Y.local) {
            for (var ab in Y.local) {
                if (Y.local.hasOwnProperty(ab)) {
                    var aa = Y.local[ab];
                    if (typeof aa === "function") {
                        Y.local[ab] = {
                            method: aa
                        }
                    }
                }
            }
        }
        var X = D(l(Z).concat([new o.stack.RpcBehavior(this, Y), {
            callback: function (ac) {
                if (Z.onReady) {
                    Z.onReady(ac)
                }
            }
        }]));
        this.origin = j(Z.remote);
        this.destroy = function () {
            X.destroy()
        };
        X.init()
    };
    o.stack.SameOriginTransport = function (Y) {
        var Z, ab, aa, X;
        return (Z = {
            outgoing: function (ad, ae, ac) {
                aa(ad);
                if (ac) {
                    ac()
                }
            },
            destroy: function () {
                if (ab) {
                    ab.parentNode.removeChild(ab);
                    ab = null
                }
            },
            onDOMReady: function () {
                X = j(Y.remote);
                if (Y.isHost) {
                    T(Y.props, {
                        src: P(Y.remote, {
                            xdm_e: p.protocol + "//" + p.host + p.pathname,
                            xdm_c: Y.channel,
                            xdm_p: 4
                        }),
                        name: U + Y.channel + "_provider"
                    });
                    ab = A(Y);
                    o.Fn.set(Y.channel, function (ac) {
                        aa = ac;
                        K(function () {
                            Z.up.callback(true)
                        }, 0);
                        return function (ad) {
                            Z.up.incoming(ad, X)
                        }
                    })
                } else {
                    aa = m().Fn.get(Y.channel, true)(function (ac) {
                        Z.up.incoming(ac, X)
                    });
                    K(function () {
                        Z.up.callback(true)
                    }, 0)
                }
            },
            init: function () {
                G(Z.onDOMReady, Z)
            }
        })
    };
    o.stack.FlashTransport = function (aa) {
        var ac, X, ab, ad, Y, ae;

        function af(ah, ag) {
            K(function () {
                ac.up.incoming(ah, ad)
            }, 0)
        }

        function Z(ah) {
            var ag = aa.swf + "?host=" + aa.isHost;
            var aj = "easyXDM_swf_" + Math.floor(Math.random() * 10000);
            o.Fn.set("flash_loaded" + ah.replace(/[\-.]/g, "_"), function () {
                o.stack.FlashTransport[ah].swf = Y = ae.firstChild;
                var ak = o.stack.FlashTransport[ah].queue;
                for (var al = 0; al < ak.length; al++) {
                    ak[al]()
                }
                ak.length = 0
            });
            if (aa.swfContainer) {
                ae = (typeof aa.swfContainer == "string") ? d.getElementById(aa.swfContainer) : aa.swfContainer
            } else {
                ae = d.createElement("div");
                T(ae.style, h && aa.swfNoThrottle ? {
                    height: "20px",
                    width: "20px",
                    position: "fixed",
                    right: 0,
                    top: 0
                } : {
                    height: "1px",
                    width: "1px",
                    position: "absolute",
                    overflow: "hidden",
                    right: 0,
                    top: 0
                });
                d.body.appendChild(ae)
            }
            var ai = "callback=flash_loaded" + H(ah.replace(/[\-.]/g, "_")) + "&proto=" + b.location.protocol + "&domain=" + H(z(b.location.href)) + "&port=" + H(f(b.location.href)) + "&ns=" + H(I);
            ae.innerHTML = "<object height='20' width='20' type='application/x-shockwave-flash' id='" + aj + "' data='" + ag + "'><param name='allowScriptAccess' value='always'></param><param name='wmode' value='transparent'><param name='movie' value='" + ag + "'></param><param name='flashvars' value='" + ai + "'></param><embed type='application/x-shockwave-flash' FlashVars='" + ai + "' allowScriptAccess='always' wmode='transparent' src='" + ag + "' height='1' width='1'></embed></object>"
        }
        return (ac = {
            outgoing: function (ah, ai, ag) {
                Y.postMessage(aa.channel, ah.toString());
                if (ag) {
                    ag()
                }
            },
            destroy: function () {
                try {
                    Y.destroyChannel(aa.channel)
                } catch (ag) {}
                Y = null;
                if (X) {
                    X.parentNode.removeChild(X);
                    X = null
                }
            },
            onDOMReady: function () {
                ad = aa.remote;
                o.Fn.set("flash_" + aa.channel + "_init", function () {
                    K(function () {
                        ac.up.callback(true)
                    })
                });
                o.Fn.set("flash_" + aa.channel + "_onMessage", af);
                aa.swf = B(aa.swf);
                var ah = z(aa.swf);
                var ag = function () {
                    o.stack.FlashTransport[ah].init = true;
                    Y = o.stack.FlashTransport[ah].swf;
                    Y.createChannel(aa.channel, aa.secret, j(aa.remote), aa.isHost);
                    if (aa.isHost) {
                        if (h && aa.swfNoThrottle) {
                            T(aa.props, {
                                position: "fixed",
                                right: 0,
                                top: 0,
                                height: "20px",
                                width: "20px"
                            })
                        }
                        T(aa.props, {
                            src: P(aa.remote, {
                                xdm_e: j(p.href),
                                xdm_c: aa.channel,
                                xdm_p: 6,
                                xdm_s: aa.secret
                            }),
                            name: U + aa.channel + "_provider"
                        });
                        X = A(aa)
                    }
                };
                if (o.stack.FlashTransport[ah] && o.stack.FlashTransport[ah].init) {
                    ag()
                } else {
                    if (!o.stack.FlashTransport[ah]) {
                        o.stack.FlashTransport[ah] = {
                            queue: [ag]
                        };
                        Z(ah)
                    } else {
                        o.stack.FlashTransport[ah].queue.push(ag)
                    }
                }
            },
            init: function () {
                G(ac.onDOMReady, ac)
            }
        })
    };
    o.stack.PostMessageTransport = function (aa) {
        var ac, ad, Y, Z;

        function X(ae) {
            if (ae.origin) {
                return j(ae.origin)
            }
            if (ae.uri) {
                return j(ae.uri)
            }
            if (ae.domain) {
                return p.protocol + "//" + ae.domain
            }
            throw "Unable to retrieve the origin of the event"
        }

        function ab(af) {
            var ae = X(af);
            if (ae == Z && af.data.substring(0, aa.channel.length + 1) == aa.channel + " ") {
                ac.up.incoming(af.data.substring(aa.channel.length + 1), ae)
            }
        }
        return (ac = {
            outgoing: function (af, ag, ae) {
                Y.postMessage(aa.channel + " " + af, ag || Z);
                if (ae) {
                    ae()
                }
            },
            destroy: function () {
                x(N, "message", ab);
                if (ad) {
                    Y = null;
                    ad.parentNode.removeChild(ad);
                    ad = null
                }
            },
            onDOMReady: function () {
                Z = j(aa.remote);
                if (aa.isHost) {
                    var ae = function (af) {
                        if (af.data == aa.channel + "-ready") {
                            Y = ("postMessage" in ad.contentWindow) ? ad.contentWindow : ad.contentWindow.document;
                            x(N, "message", ae);
                            v(N, "message", ab);
                            K(function () {
                                ac.up.callback(true)
                            }, 0)
                        }
                    };
                    v(N, "message", ae);
                    T(aa.props, {
                        src: P(aa.remote, {
                            xdm_e: j(p.href),
                            xdm_c: aa.channel,
                            xdm_p: 1
                        }),
                        name: U + aa.channel + "_provider"
                    });
                    ad = A(aa)
                } else {
                    v(N, "message", ab);
                    Y = ("postMessage" in N.parent) ? N.parent : N.parent.document;
                    Y.postMessage(aa.channel + "-ready", Z);
                    K(function () {
                        ac.up.callback(true)
                    }, 0)
                }
            },
            init: function () {
                G(ac.onDOMReady, ac)
            }
        })
    };
    o.stack.FrameElementTransport = function (Y) {
        var Z, ab, aa, X;
        return (Z = {
            outgoing: function (ad, ae, ac) {
                aa.call(this, ad);
                if (ac) {
                    ac()
                }
            },
            destroy: function () {
                if (ab) {
                    ab.parentNode.removeChild(ab);
                    ab = null
                }
            },
            onDOMReady: function () {
                X = j(Y.remote);
                if (Y.isHost) {
                    T(Y.props, {
                        src: P(Y.remote, {
                            xdm_e: j(p.href),
                            xdm_c: Y.channel,
                            xdm_p: 5
                        }),
                        name: U + Y.channel + "_provider"
                    });
                    ab = A(Y);
                    ab.fn = function (ac) {
                        delete ab.fn;
                        aa = ac;
                        K(function () {
                            Z.up.callback(true)
                        }, 0);
                        return function (ad) {
                            Z.up.incoming(ad, X)
                        }
                    }
                } else {
                    if (d.referrer && j(d.referrer) != S.xdm_e) {
                        N.top.location = S.xdm_e
                    }
                    aa = N.frameElement.fn(function (ac) {
                        Z.up.incoming(ac, X)
                    });
                    Z.up.callback(true)
                }
            },
            init: function () {
                G(Z.onDOMReady, Z)
            }
        })
    };
    o.stack.NameTransport = function (ab) {
        var ac;
        var ae, ai, aa, ag, ah, Y, X;

        function af(al) {
            var ak = ab.remoteHelper + (ae ? "#_3" : "#_2") + ab.channel;
            ai.contentWindow.sendMessage(al, ak)
        }

        function ad() {
            if (ae) {
                if (++ag === 2 || !ae) {
                    ac.up.callback(true)
                }
            } else {
                af("ready");
                ac.up.callback(true)
            }
        }

        function aj(ak) {
            ac.up.incoming(ak, Y)
        }

        function Z() {
            if (ah) {
                K(function () {
                    ah(true)
                }, 0)
            }
        }
        return (ac = {
            outgoing: function (al, am, ak) {
                ah = ak;
                af(al)
            },
            destroy: function () {
                ai.parentNode.removeChild(ai);
                ai = null;
                if (ae) {
                    aa.parentNode.removeChild(aa);
                    aa = null
                }
            },
            onDOMReady: function () {
                ae = ab.isHost;
                ag = 0;
                Y = j(ab.remote);
                ab.local = B(ab.local);
                if (ae) {
                    o.Fn.set(ab.channel, function (al) {
                        if (ae && al === "ready") {
                            o.Fn.set(ab.channel, aj);
                            ad()
                        }
                    });
                    X = P(ab.remote, {
                        xdm_e: ab.local,
                        xdm_c: ab.channel,
                        xdm_p: 2
                    });
                    T(ab.props, {
                        src: X + "#" + ab.channel,
                        name: U + ab.channel + "_provider"
                    });
                    aa = A(ab)
                } else {
                    ab.remoteHelper = ab.remote;
                    o.Fn.set(ab.channel, aj)
                }
                var ak = function () {
                    var al = ai || this;
                    x(al, "load", ak);
                    o.Fn.set(ab.channel + "_load", Z);
                    (function am() {
                        if (typeof al.contentWindow.sendMessage == "function") {
                            ad()
                        } else {
                            K(am, 50)
                        }
                    }())
                };
                ai = A({
                    props: {
                        src: ab.local + "#_4" + ab.channel
                    },
                    onLoad: ak
                })
            },
            init: function () {
                G(ac.onDOMReady, ac)
            }
        })
    };
    o.stack.HashTransport = function (Z) {
        var ac;
        var ah = this,
            af, aa, X, ad, am, ab, al;
        var ag, Y;

        function ak(ao) {
            if (!al) {
                return
            }
            var an = Z.remote + "#" + (am++) + "_" + ao;
            ((af || !ag) ? al.contentWindow : al).location = an
        }

        function ae(an) {
            ad = an;
            ac.up.incoming(ad.substring(ad.indexOf("_") + 1), Y)
        }

        function aj() {
            if (!ab) {
                return
            }
            var an = ab.location.href,
                ap = "",
                ao = an.indexOf("#");
            if (ao != -1) {
                ap = an.substring(ao)
            }
            if (ap && ap != ad) {
                ae(ap)
            }
        }

        function ai() {
            aa = setInterval(aj, X)
        }
        return (ac = {
            outgoing: function (an, ao) {
                ak(an)
            },
            destroy: function () {
                N.clearInterval(aa);
                if (af || !ag) {
                    al.parentNode.removeChild(al)
                }
                al = null
            },
            onDOMReady: function () {
                af = Z.isHost;
                X = Z.interval;
                ad = "#" + Z.channel;
                am = 0;
                ag = Z.useParent;
                Y = j(Z.remote);
                if (af) {
                    T(Z.props, {
                        src: Z.remote,
                        name: U + Z.channel + "_provider"
                    });
                    if (ag) {
                        Z.onLoad = function () {
                            ab = N;
                            ai();
                            ac.up.callback(true)
                        }
                    } else {
                        var ap = 0,
                            an = Z.delay / 50;
                        (function ao() {
                            if (++ap > an) {
                                throw new Error("Unable to reference listenerwindow")
                            }
                            try {
                                ab = al.contentWindow.frames[U + Z.channel + "_consumer"]
                            } catch (aq) {}
                            if (ab) {
                                ai();
                                ac.up.callback(true)
                            } else {
                                K(ao, 50)
                            }
                        }())
                    }
                    al = A(Z)
                } else {
                    ab = N;
                    ai();
                    if (ag) {
                        al = parent;
                        ac.up.callback(true)
                    } else {
                        T(Z, {
                            props: {
                                src: Z.remote + "#" + Z.channel + new Date(),
                                name: U + Z.channel + "_consumer"
                            },
                            onLoad: function () {
                                ac.up.callback(true)
                            }
                        });
                        al = A(Z)
                    }
                }
            },
            init: function () {
                G(ac.onDOMReady, ac)
            }
        })
    };
    o.stack.ReliableBehavior = function (Y) {
        var aa, ac;
        var ab = 0,
            X = 0,
            Z = "";
        return (aa = {
            incoming: function (af, ad) {
                var ae = af.indexOf("_"),
                    ag = af.substring(0, ae).split(",");
                af = af.substring(ae + 1);
                if (ag[0] == ab) {
                    Z = "";
                    if (ac) {
                        ac(true)
                    }
                }
                if (af.length > 0) {
                    aa.down.outgoing(ag[1] + "," + ab + "_" + Z, ad);
                    if (X != ag[1]) {
                        X = ag[1];
                        aa.up.incoming(af, ad)
                    }
                }
            },
            outgoing: function (af, ad, ae) {
                Z = af;
                ac = ae;
                aa.down.outgoing(X + "," + (++ab) + "_" + af, ad)
            }
        })
    };
    o.stack.QueueBehavior = function (Z) {
        var ac, ad = [],
            ag = true,
            aa = "",
            af, X = 0,
            Y = false,
            ab = false;

        function ae() {
            if (Z.remove && ad.length === 0) {
                w(ac);
                return
            }
            if (ag || ad.length === 0 || af) {
                return
            }
            ag = true;
            var ah = ad.shift();
            ac.down.outgoing(ah.data, ah.origin, function (ai) {
                ag = false;
                if (ah.callback) {
                    K(function () {
                        ah.callback(ai)
                    }, 0)
                }
                ae()
            })
        }
        return (ac = {
            init: function () {
                if (t(Z)) {
                    Z = {}
                }
                if (Z.maxLength) {
                    X = Z.maxLength;
                    ab = true
                }
                if (Z.lazy) {
                    Y = true
                } else {
                    ac.down.init()
                }
            },
            callback: function (ai) {
                ag = false;
                var ah = ac.up;
                ae();
                ah.callback(ai)
            },
            incoming: function (ak, ai) {
                if (ab) {
                    var aj = ak.indexOf("_"),
                        ah = parseInt(ak.substring(0, aj), 10);
                    aa += ak.substring(aj + 1);
                    if (ah === 0) {
                        if (Z.encode) {
                            aa = k(aa)
                        }
                        ac.up.incoming(aa, ai);
                        aa = ""
                    }
                } else {
                    ac.up.incoming(ak, ai)
                }
            },
            outgoing: function (al, ai, ak) {
                if (Z.encode) {
                    al = H(al)
                }
                var ah = [],
                    aj;
                if (ab) {
                    while (al.length !== 0) {
                        aj = al.substring(0, X);
                        al = al.substring(aj.length);
                        ah.push(aj)
                    }
                    while ((aj = ah.shift())) {
                        ad.push({
                            data: ah.length + "_" + aj,
                            origin: ai,
                            callback: ah.length === 0 ? ak : null
                        })
                    }
                } else {
                    ad.push({
                        data: al,
                        origin: ai,
                        callback: ak
                    })
                }
                if (Y) {
                    ac.down.init()
                } else {
                    ae()
                }
            },
            destroy: function () {
                af = true;
                ac.down.destroy()
            }
        })
    };
    o.stack.VerifyBehavior = function (ab) {
        var ac, aa, Y, Z = false;

        function X() {
            aa = Math.random().toString(16).substring(2);
            ac.down.outgoing(aa)
        }
        return (ac = {
            incoming: function (af, ad) {
                var ae = af.indexOf("_");
                if (ae === -1) {
                    if (af === aa) {
                        ac.up.callback(true)
                    } else {
                        if (!Y) {
                            Y = af;
                            if (!ab.initiate) {
                                X()
                            }
                            ac.down.outgoing(af)
                        }
                    }
                } else {
                    if (af.substring(0, ae) === Y) {
                        ac.up.incoming(af.substring(ae + 1), ad)
                    }
                }
            },
            outgoing: function (af, ad, ae) {
                ac.down.outgoing(aa + "_" + af, ad, ae)
            },
            callback: function (ad) {
                if (ab.initiate) {
                    X()
                }
            }
        })
    };
    o.stack.RpcBehavior = function (ad, Y) {
        var aa, af = Y.serializer || O();
        var ae = 0,
            ac = {};

        function X(ag) {
            ag.jsonrpc = "2.0";
            aa.down.outgoing(af.stringify(ag))
        }

        function ab(ag, ai) {
            var ah = Array.prototype.slice;
            return function () {
                var aj = arguments.length,
                    al, ak = {
                        method: ai
                    };
                if (aj > 0 && typeof arguments[aj - 1] === "function") {
                    if (aj > 1 && typeof arguments[aj - 2] === "function") {
                        al = {
                            success: arguments[aj - 2],
                            error: arguments[aj - 1]
                        };
                        ak.params = ah.call(arguments, 0, aj - 2)
                    } else {
                        al = {
                            success: arguments[aj - 1]
                        };
                        ak.params = ah.call(arguments, 0, aj - 1)
                    }
                    ac["" + (++ae)] = al;
                    ak.id = ae
                } else {
                    ak.params = ah.call(arguments, 0)
                }
                if (ag.namedParams && ak.params.length === 1) {
                    ak.params = ak.params[0]
                }
                X(ak)
            }
        }

        function Z(an, am, ai, al) {
            if (!ai) {
                if (am) {
                    X({
                        id: am,
                        error: {
                            code: -32601,
                            message: "Procedure not found."
                        }
                    })
                }
                return
            }
            var ak, ah;
            if (am) {
                ak = function (ao) {
                    ak = q;
                    X({
                        id: am,
                        result: ao
                    })
                };
                ah = function (ao, ap) {
                    ah = q;
                    var aq = {
                        id: am,
                        error: {
                            code: -32099,
                            message: ao
                        }
                    };
                    if (ap) {
                        aq.error.data = ap
                    }
                    X(aq)
                }
            } else {
                ak = ah = q
            }
            if (!r(al)) {
                al = [al]
            }
            try {
                var ag = ai.method.apply(ai.scope, al.concat([ak, ah]));
                if (!t(ag)) {
                    ak(ag)
                }
            } catch (aj) {
                ah(aj.message)
            }
        }
        return (aa = {
            incoming: function (ah, ag) {
                var ai = af.parse(ah);
                if (ai.method) {
                    if (Y.handle) {
                        Y.handle(ai, X)
                    } else {
                        Z(ai.method, ai.id, Y.local[ai.method], ai.params)
                    }
                } else {
                    var aj = ac[ai.id];
                    if (ai.error) {
                        if (aj.error) {
                            aj.error(ai.error)
                        }
                    } else {
                        if (aj.success) {
                            aj.success(ai.result)
                        }
                    }
                    delete ac[ai.id]
                }
            },
            init: function () {
                if (Y.remote) {
                    for (var ag in Y.remote) {
                        if (Y.remote.hasOwnProperty(ag)) {
                            ad[ag] = ab(Y.remote[ag], ag)
                        }
                    }
                }
                aa.down.init()
            },
            destroy: function () {
                for (var ag in Y.remote) {
                    if (Y.remote.hasOwnProperty(ag) && ad.hasOwnProperty(ag)) {
                        delete ad[ag]
                    }
                }
                aa.down.destroy()
            }
        })
    };
    b.easyXDM = o
})(window, document, location, window.setTimeout, decodeURIComponent, encodeURIComponent);
! function (r, s, p) {
    "undefined" != typeof module && module.exports ? module.exports = p() : "function" == typeof define && define.amd ? define(p) : s[r] = p()
}("reqwest", this, function () {
    function r(a, b, c) {
        return function () {
            if (a._aborted) return c(a.request);
            if (a._timedOut) return c(a.request, "Request is aborted: timeout");
            if (a.request && 4 == a.request.readyState) {
                a.request.onreadystatechange = H;
                var f = I.exec(a.url),
                    f = f && f[1] || m.location.protocol;
                (J.test(f) ? K.test(a.request.status) : a.request.response) ? b(a.request): c(a.request)
            }
        }
    }

    function s(a, b) {
        var c = b.headers || {},
            f;
        c.Accept = c.Accept || n.accept[b.type] || n.accept["*"];
        var d = "undefined" !== typeof FormData && b.data instanceof FormData;
        b.crossOrigin || c["X-Requested-With"] || (c["X-Requested-With"] = n.requestedWith);
        c["Content-Type"] || d || (c["Content-Type"] = b.contentType || n.contentType);
        for (f in c) c.hasOwnProperty(f) && "setRequestHeader" in a && a.setRequestHeader(f, c[f])
    }

    function p(a) {
        q = a
    }

    function A(a, b) {
        return a + (/\?/.test(a) ? "\x26" : "?") + b
    }

    function L(a, b, c, f) {
        var d = M++,
            e = a.jsonpCallback ||
            "callback";
        a = a.jsonpCallbackName || k.getcallbackPrefix(d);
        var g = new RegExp("((^|\\?|\x26)" + e + ")\x3d([^\x26]+)"),
            l = f.match(g),
            h = B.createElement("script"),
            t = 0,
            n = -1 !== navigator.userAgent.indexOf("MSIE 10.0");
        l ? "?" === l[3] ? f = f.replace(g, "$1\x3d" + a) : a = l[3] : f = A(f, e + "\x3d" + a);
        m[a] = p;
        h.type = "text/javascript";
        h.src = f;
        h.async = !0;
        "undefined" === typeof h.onreadystatechange || n || (h.htmlFor = h.id = "_reqwest_" + d);
        h.onload = h.onreadystatechange = function () {
            if (h.readyState && "complete" !== h.readyState && "loaded" !== h.readyState ||
                t) return !1;
            h.onload = h.onreadystatechange = null;
            h.onclick && h.onclick();
            b(q);
            q = void 0;
            u.removeChild(h);
            t = 1
        };
        u.appendChild(h);
        return {
            abort: function () {
                h.onload = h.onreadystatechange = null;
                c({}, "Request is aborted: timeout", {});
                q = void 0;
                u.removeChild(h);
                t = 1
            }
        }
    }

    function N(a, b) {
        var c = this.o,
            f = (c.method || "GET").toUpperCase(),
            d = "string" === typeof c ? c : c.url,
            e = !1 !== c.processData && c.data && "string" !== typeof c.data ? k.toQueryString(c.data) : c.data || null,
            g, l = !1;
        "jsonp" != c.type && "GET" != f || !e || (d = A(d, e), e = null);
        if ("jsonp" ==
            c.type) return L(c, a, b, d);
        g = c.xhr && c.xhr(c) || O(c);
        g.open(f, d, !1 === c.async ? !1 : !0);
        s(g, c);
        "undefined" !== typeof c.withCredentials && "undefined" !== typeof g.withCredentials && (g.withCredentials = !!c.withCredentials);
        m.XDomainRequest && g instanceof m.XDomainRequest ? (g.onload = a, g.onerror = b, g.onprogress = function () {}, l = !0) : g.onreadystatechange = r(this, a, b);
        c.before && c.before(g);
        l ? setTimeout(function () {
            g.send(e)
        }, 200) : g.send(e);
        return g
    }

    function v(a, b) {
        this.o = a;
        this.fn = b;
        C.apply(this, arguments)
    }

    function P(a) {
        if (null !==
            a) {
            if (a.match("json")) return "json";
            if (a.match("javascript")) return "js";
            if (a.match("text")) return "html";
            if (a.match("xml")) return "xml"
        }
    }

    function C(a, b) {
        function c(b) {
            a.timeout && clearTimeout(d.timeout);
            for (d.timeout = null; 0 < d._completeHandlers.length;) d._completeHandlers.shift()(b)
        }

        function f(a, b, f) {
            a = d.request;
            d._responseArgs.resp = a;
            d._responseArgs.msg = b;
            d._responseArgs.t = f;
            for (d._erred = !0; 0 < d._errorHandlers.length;) d._errorHandlers.shift()(a, b, f);
            c(a)
        }
        this.url = "string" == typeof a ? a : a.url;
        this.timeout =
            null;
        this._fulfilled = !1;
        this._successHandler = function () {};
        this._fulfillmentHandlers = [];
        this._errorHandlers = [];
        this._completeHandlers = [];
        this._erred = !1;
        this._responseArgs = {};
        var d = this;
        b = b || function () {};
        a.timeout && (this.timeout = setTimeout(function () {
            d._timedOut = !0;
            d.request.abort()
        }, a.timeout));
        a.success && (this._successHandler = function () {
            a.success.apply(a, arguments)
        });
        a.error && this._errorHandlers.push(function () {
            a.error.apply(a, arguments)
        });
        a.complete && this._completeHandlers.push(function () {
            a.complete.apply(a,
                arguments)
        });
        this.request = N.call(this, function (e) {
            var g = a.type || e && P(e.getResponseHeader("Content-Type"));
            e = "jsonp" !== g ? d.request : e;
            var l = D.dataFilter(e.responseText, g);
            try {
                e.responseText = l
            } catch (h) {}
            if (l) switch (g) {
                case "json":
                    try {
                        e = m.JSON ? m.JSON.parse(l) : eval("(" + l + ")")
                    } catch (k) {
                        return f(e, "Could not parse JSON in response", k)
                    }
                    break;
                case "js":
                    e = eval(l);
                    break;
                case "html":
                    e = l;
                    break;
                case "xml":
                    e = e.responseXML && e.responseXML.parseError && e.responseXML.parseError.errorCode && e.responseXML.parseError.reason ?
                        null : e.responseXML
            }
            d._responseArgs.resp = e;
            d._fulfilled = !0;
            b(e);
            for (d._successHandler(e); 0 < d._fulfillmentHandlers.length;) e = d._fulfillmentHandlers.shift()(e);
            c(e)
        }, f)
    }

    function k(a, b) {
        return new v(a, b)
    }

    function w(a) {
        return a ? a.replace(/\r?\n/g, "\r\n") : ""
    }

    function E(a, b) {
        var c = a.name,
            f = a.tagName.toLowerCase(),
            d = function (a) {
                a && !a.disabled && b(c, w(a.attributes.value && a.attributes.value.specified ? a.value : a.text))
            },
            e;
        if (!a.disabled && c) switch (f) {
            case "input":
                /reset|button|image|file/i.test(a.type) || (d = /checkbox/i.test(a.type),
                    f = /radio/i.test(a.type), e = a.value, (!d && !f || a.checked) && b(c, w(d && "" === e ? "on" : e)));
                break;
            case "textarea":
                b(c, w(a.value));
                break;
            case "select":
                if ("select-one" === a.type.toLowerCase()) d(0 <= a.selectedIndex ? a.options[a.selectedIndex] : null);
                else
                    for (f = 0; a.length && f < a.length; f++) a.options[f].selected && d(a.options[f])
        }
    }

    function F() {
        var a, b;
        for (b = 0; b < arguments.length; b++) {
            a = arguments[b];
            /input|select|textarea/i.test(a.tagName) && E(a, this);
            for (var c = ["input", "select", "textarea"], f = void 0, d = void 0, e = void 0, f = 0; f <
                c.length; f++)
                for (e = a[G](c[f]), d = 0; d < e.length; d++) E(e[d], this)
        }
    }

    function Q() {
        return k.toQueryString(k.serializeArray.apply(null, arguments))
    }

    function R() {
        var a = {};
        F.apply(function (b, c) {
            b in a ? (a[b] && !x(a[b]) && (a[b] = [a[b]]), a[b].push(c)) : a[b] = c
        }, arguments);
        return a
    }

    function y(a, b, c, f) {
        var d, e, g = /\[\]$/;
        if (x(b))
            for (d = 0; b && d < b.length; d++) e = b[d], c || g.test(a) ? f(a, e) : y(a + "[" + ("object" === typeof e ? d : "") + "]", e, c, f);
        else if (b && "[object Object]" === b.toString())
            for (d in b) y(a + "[" + d + "]", b[d], c, f);
        else f(a, b)
    }
    var m =
        this;
    if ("window" in m) var B = document,
        G = "getElementsByTagName",
        u = B[G]("head")[0];
    else {
        var z;
        try {
            z = require("xhr2")
        } catch (T) {
            throw Error("Peer dependency `xhr2` required! Please npm install xhr2");
        }
    }
    var J = /^http/,
        I = /(^\w+):\/\//,
        K = /^(20\d|1223)$/,
        M = 0,
        S = "reqwest_" + +new Date,
        q, H = function () {},
        x = "function" == typeof Array.isArray ? Array.isArray : function (a) {
            return a instanceof Array
        },
        n = {
            contentType: "application/x-www-form-urlencoded",
            requestedWith: "XMLHttpRequest",
            accept: {
                "*": "text/javascript, text/html, application/xml, text/xml, */*",
                xml: "application/xml, text/xml",
                html: "text/html",
                text: "text/plain",
                json: "application/json, text/javascript",
                js: "application/javascript, text/javascript"
            }
        },
        O = function (a) {
            if (!0 === a.crossOrigin) {
                if ((a = m.XMLHttpRequest ? new XMLHttpRequest : null) && "withCredentials" in a) return a;
                if (m.XDomainRequest) return new XDomainRequest;
                throw Error("Browser does not support cross-origin requests");
            }
            return m.XMLHttpRequest ? new XMLHttpRequest : z ? new z : new ActiveXObject("Microsoft.XMLHTTP")
        },
        D = {
            dataFilter: function (a) {
                return a
            }
        };
    v.prototype = {
        abort: function () {
            this._aborted = !0;
            this.request.abort()
        },
        retry: function () {
            C.call(this, this.o, this.fn)
        },
        then: function (a, b) {
            a = a || function () {};
            b = b || function () {};
            this._fulfilled ? this._responseArgs.resp = a(this._responseArgs.resp) : this._erred ? b(this._responseArgs.resp, this._responseArgs.msg, this._responseArgs.t) : (this._fulfillmentHandlers.push(a), this._errorHandlers.push(b));
            return this
        },
        always: function (a) {
            this._fulfilled || this._erred ? a(this._responseArgs.resp) : this._completeHandlers.push(a);
            return this
        },
        fail: function (a) {
            this._erred ? a(this._responseArgs.resp, this._responseArgs.msg, this._responseArgs.t) : this._errorHandlers.push(a);
            return this
        },
        "catch": function (a) {
            return this.fail(a)
        }
    };
    k.serializeArray = function () {
        var a = [];
        F.apply(function (b, c) {
            a.push({
                name: b,
                value: c
            })
        }, arguments);
        return a
    };
    k.serialize = function () {
        if (0 === arguments.length) return "";
        var a, b = Array.prototype.slice.call(arguments, 0);
        (a = b.pop()) && a.nodeType && b.push(a) && (a = null);
        a && (a = a.type);
        return ("map" == a ? R : "array" == a ? k.serializeArray :
            Q).apply(null, b)
    };
    k.toQueryString = function (a, b) {
        var c, f = b || !1,
            d = [],
            e = encodeURIComponent,
            g = function (a, b) {
                b = "function" === typeof b ? b() : null == b ? "" : b;
                d[d.length] = e(a) + "\x3d" + e(b)
            };
        if (x(a))
            for (c = 0; a && c < a.length; c++) g(a[c].name, a[c].value);
        else
            for (c in a) a.hasOwnProperty(c) && y(c, a[c], f, g);
        return d.join("\x26").replace(/%20/g, "+")
    };
    k.getcallbackPrefix = function () {
        return S
    };
    k.compat = function (a, b) {
        a && (a.type && (a.method = a.type) && delete a.type, a.dataType && (a.type = a.dataType), a.jsonpCallback && (a.jsonpCallbackName =
            a.jsonpCallback) && delete a.jsonpCallback, a.jsonp && (a.jsonpCallback = a.jsonp));
        return new v(a, b)
    };
    k.ajaxSetup = function (a) {
        a = a || {};
        for (var b in a) D[b] = a[b]
    };
    return k
});
(function () {
    function l(a) {
        a = {
            redirect_uri: "kakaojs",
            response_type: "code",
            state: a
        };
        for (var b in f) f.hasOwnProperty(b) && (a[b] = f[b]);
        b = [];
        for (var c in a)
            if (a.hasOwnProperty(c)) {
                var d = a[c];
                d === Object(d) && (d = JSON.stringify(d));
                b.push(encodeURIComponent(c) + "\x3d" + encodeURIComponent(d))
            }
        return "/oauth/authorize?" + b.join("\x26")
    }

    function k(a, b, c) {
        b = b || document.domain;
        document.cookie = a + "\x3d; expires\x3dThu, 01 Jan 1970 00:00:00 GMT; domain\x3d" + b + "; path\x3d" + (c || "/")
    }
    var g;
    try {
        g = window.self !== window.top
    } catch (m) {
        g = !0
    }
    if (g) {
        var f = {},
            e = new easyXDM.Rpc({}, {
                local: {
                    setClient: function (a, b, c, d, e) {
                        c === Object(c) ? f = c : f.client_id = c;
                        c = document.getElementById("kakao-cus-btn");
                        c.className = a + " " + b;
                        return {
                            width: c.offsetWidth,
                            height: c.offsetHeight
                        }
                    },
                    setStateToken: function (a, b, c) {
                        window.document.getElementById("kakao-cus-btn").onclick = function () {
                            window.open(l(a), "", "width\x3d480, height\x3d520")
                        }
                    },
                    deleteAuthCookie: function (a, b) {
                        k("_kawlt", ".kakao.com", "/");
                        k("_maldive_oauth_si", ".kakao.com", "/");
                        return !0
                    },
                    getCode: function (a, b) {
                        reqwest({
                            url: "/apiweb/code.json",
                            method: "get",
                            data: {
                                state: a,
                                client_id: b
                            },
                            success: function (a) {
                                e.postResponse(a)
                            }
                        })
                    },
                    getAccessToken: function (a, b, c, d) {
                        reqwest({
                            url: "/oauth/token",
                            method: "post",
                            headers: {
                                KA: getKakaoAgent()
                            },
                            data: {
                                grant_type: "authorization_code",
                                code: a,
                                redirect_uri: c,
                                client_id: b,
                                approval_type: d === "project" ? "project" : "individual",
                                client_origin: getProxyOrigin()
                            },
                            success: function (a) {
                                e.postResponse(a)
                            }
                        })
                    }
                },
                remote: {
                    postResponse: {},
                    getKakaoAgent: {}
                }
            });
        window.postResponse = function (a) {
            var b = {};
            easyXDM.apply(b, a);
            e.postResponse(b, function (a) {}, function (a) {
                console.log("Errogir: " + JSON.stringify(a))
            })
        };
        window.getProxyOrigin = function () {
            return e.origin
        };
        var h = "os/javascript";
        window.getKakaoAgent = function () {
            return h
        };
        e.getKakaoAgent(function (a) {
            h = a
        }, function (a) {
            h = "sdk/\x3c\x3d1.0.3 os/javascript lang/" + (navigator.userLanguage || navigator.language) + " device/" + navigator.platform.replace(/ /g, "_")
        })
    }
})();
}
