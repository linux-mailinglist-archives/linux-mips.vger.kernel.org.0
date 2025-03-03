Return-Path: <linux-mips+bounces-8068-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E784A4B720
	for <lists+linux-mips@lfdr.de>; Mon,  3 Mar 2025 05:23:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 310B9188EF2A
	for <lists+linux-mips@lfdr.de>; Mon,  3 Mar 2025 04:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087A2158D8B;
	Mon,  3 Mar 2025 04:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="K8aFmrKf"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B022AE89;
	Mon,  3 Mar 2025 04:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740975834; cv=none; b=fyj4rA/As3vADvB2ETabtkl8BWXUk1zpfbgSAFLEkqICsqDqMZango6yrU5ALM0DLxHgGoQGRWmGgYemlBl9sBOgakRuC0Iz2ASpVDLeEI0N8HlzH6ED6rloWqeKYRkDC8DLS+6VIxT4kWkWbCJiB2aBxJwYMzh1+RlTK4nroZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740975834; c=relaxed/simple;
	bh=RHRwTwF2rci0UsFXaOFZeSD9+Dqtg4+acVTeXRyCq9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8ESWoyzbxVDBzJ4VY/zM37ZtnlZDZnz0yDp61tytsmAP+ZS6cqT7qfDdaQvq9CLdp9sL1cXKttuCBXguX9KowiZYexkNQRvbC5oed5uICcLbi4WQ1kHBkexCLpesUuO7x8SBmzzpuHjNHjlUe5pQolACOsb6Qylsd4BzDbpXuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=K8aFmrKf; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1740975808;
	bh=eEGr07Gnc/KgfHm5IaSFcJgCJQ+k3INFRhhVYtc5hGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=K8aFmrKfyWPhQtQP3w30b88YIdD9QzX2FmdBp9s4OQqMZSUhl4T9kiA3933ZC9Wom
	 dDgOKBZ7v8vcNr8vvyGB5+q3+kUokwaHvOs1ar4Vm7YVk2Al5l2hOl/RzaOIy3Dqek
	 G71S7IZmqyOvw8qcBOG+nJ+A+v6nJ4zNjt919Qk0=
X-QQ-mid: bizesmtpip4t1740975795t603la1
X-QQ-Originating-IP: AcZd1tD18G2+fzJs10igiJn3HJWy/8QKPUnlHzTb1Cc=
Received: from [IPV6:240e:668:120a::212:156] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Mar 2025 12:23:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11475789549793595180
Message-ID: <A1142BF8B63D5EC4+98768bf8-7bde-46ec-85fc-f077d67a1798@uniontech.com>
Date: Mon, 3 Mar 2025 12:23:13 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] MIPS: dec: Remove dec_irq_dispatch()
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: chenlinxuan@uniontech.com, guanwentao@uniontech.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 niecheng1@uniontech.com, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 zhanjun@uniontech.com
References: <487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com>
 <222468E85948B141+20250218125842.667798-1-wangyuli@uniontech.com>
 <alpine.DEB.2.21.2502220019210.65342@angie.orcam.me.uk>
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <alpine.DEB.2.21.2502220019210.65342@angie.orcam.me.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cpzNAlvaVuHJSvSPikjQO7we"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MMKL56urm3zQZA3sqrdtmNGN9V/2Fi1TOCTMQddWnLV1tUFsuIDCZZGu
	F0jdSNsD1WU2RDETI1kBfM5aYCjDis5Ta1xqkdJzvVpqhb0QuApccPEMWLMGqCLcw88gkKD
	NbbyWYveaoBmtJQjlQ1DNUgC1WeUPQIQcN33eg3iuLWdVZB32q26DpDWSdvQ49uKHySl+uY
	ngW/+dXCVhMAmJo0e75OWbC96Ai03b1z1pkqxxkNjVbQcCWWXnZQ0E8ma5PiJa3CFXYO5rM
	oIonKCeOFZyjxNsaGZm9kb4RUeTxZX2Vk1NM0wL+zccUqr5vjg8KAEhVcZ+1wUrIP1F/tOD
	6Fxw4y4OOPvwtrrDKXvl5bqB/cLaXO18E/ve0mQgLiWd7yIP+wAMnptHtUFjSacySO07n3W
	ytAduYm2eFT5fTyyZmOsDoglefMCyvwfmuQkdo3G1HITLVpKiU553ie6kwPh55UWJElCvzV
	En/VK3UNctrI21qN3rjjbJ+Uc5qUOebANDG150LX92YFScm37FzfbTS12PN9SuQwZw3HEoY
	AqKyMhNB9Q6+3iBWpJWG/nlf3fK9tJUNdwuLUWl+tT5BYtWSOx9sOC0QsjC+YnflpDNqdQ6
	rXJdD9sbAxi5qFBShq40ZZW2qnE7v+hC6guOgtvEf2OAd7DV4V/X76cJMJLeXu3thOOcToR
	crwE5EpTtMqyqzF/Tac4Qdt/m0qBhP8teve0ICSdpxaPQlnYriYtKsCkspp9qOrzcQzvkq8
	HaglUgj2LwtmRKmYvcwcmWuzXlKaVoGXa49AqQrfpJswm1v1yumP8D81eAiOzShy54Kq9o/
	rZjJGa0BfFKGLINsoIBZ5V5dA7TcwdtV+Vq8xAz/WmVK2H71I7u06tG8CsUvXcI9K1HvuKf
	Pn6x4LFJLUicjbnMMDN/p1DPOApbLEOZdlBTzPCXjhD4SWqqSEVRa6XzkHqXBW6vYHDEA2v
	CK12x+EHZtD+rLnJt5EsOOvGcJXJxhuc7xZX2NwRAw/HlQrxLOw8X6eohqrtSAk72coB2nO
	yDrebExt8mw8RsE/PK0TQbvgc7iVwsKyXHnWmTatCDTy8MSxwkL4nu+4JUzSJvAX0tUbBbI
	j+eYvveBndJZDzi//ZFOjvMxPEP17gyE4sK9162q9aM
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cpzNAlvaVuHJSvSPikjQO7we
Content-Type: multipart/mixed; boundary="------------Dr8oZ0Svb2l280lRAcsbpviW";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: chenlinxuan@uniontech.com, guanwentao@uniontech.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 niecheng1@uniontech.com, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 zhanjun@uniontech.com
Message-ID: <98768bf8-7bde-46ec-85fc-f077d67a1798@uniontech.com>
Subject: Re: [PATCH 5/7] MIPS: dec: Remove dec_irq_dispatch()
References: <487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com>
 <222468E85948B141+20250218125842.667798-1-wangyuli@uniontech.com>
 <alpine.DEB.2.21.2502220019210.65342@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2502220019210.65342@angie.orcam.me.uk>

--------------Dr8oZ0Svb2l280lRAcsbpviW
Content-Type: multipart/mixed; boundary="------------VWdM82tDfrgrrAVtP6lrC0RP"

--------------VWdM82tDfrgrrAVtP6lrC0RP
Content-Type: multipart/alternative;
 boundary="------------qVwLyZwqZC4S0TSExECJBtOy"

--------------qVwLyZwqZC4S0TSExECJBtOy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWFjaWVqLA0KDQpPbiAyMDI1LzMvMSAwMDowMSwgTWFjaWVqIFcuIFJvenlja2kgd3Jv
dGU6DQo+ICAgVXAgdG8gY29tbWl0IDhmOTlhMTYyNjUzNTMgKCJNSVBTOiBUcmFjaW5nOiBB
ZGQgSVJRRU5UUllfRVhJVCBzZWN0aW9uIGZvcg0KPiBNSVBTIikgYGRvX0lSUScgdXNlZCB0
byBiZSBhIG1hY3JvLCB0aGF0J3Mgd2h5LiAgQXQgdGhlIHRpbWUgYGRvX0lSUScgd2FzDQo+
IGNvbnZlcnRlZCB0byBhIG1hY3JvIGBkZWNfaXJxX2Rpc3BhdGNoJyB3YXMgY3JlYXRlZCBh
bmQgcHJldmlvdXNseSB0aGlzDQo+IHBsYWNlIHVzZWQgdG8gY2FsbCBgZG9fSVJRJyB0b28u
DQo+DQo+ICAgSXQncyBhbHdheXMgZ29vZCBmaW5kaW5nIG91dCB3aHkgdGhpbmdzIGFyZSBh
cyB0aGV5IGFyZSBzbyBhcyB0byBtYWtlDQo+IHN1cmUgeW91IGhhdmVuJ3QgYmVlbiBtaXNz
aW5nIHNvbWV0aGluZy4gIFRoaXMgY2xlYW51cCBzaG91bGQgaGF2ZSBiZWVuDQo+IG1hZGUg
YWxvbmcgd2l0aCBjb21taXQgOGY5OWExNjI2NTM1Mywgc28gaXQncyBwcmV0dHkgb2xkIGEg
dGVjaG5pY2FsIGRlYnQNCj4gYmVpbmcgc29ydGVkIGhlcmUuDQo+DQo+ICAgUGxlYXNlIGFk
ZCB0aGVzZSBmaW5kaW5ncyB0byB5b3VyIGNvbW1pdCBkZXNjcmlwdGlvbiBpbiB2Mi4NCg0K
QWxyaWdodCwgdGhhbmsgeW91IGZvciB0aGUgY29ycmVjdGlvbi4NCg0KSSBkbyBzZWUgdGhh
dCB0aGlzIGNvbW1pdCBoYXMgYWxyZWFkeSBiZWVuIGFwcGxpZWQgdG8gbWlwcy1uZXh0Lg0K
DQogwqBJZiBpdCdzIGFscmlnaHQgd2l0aCB5b3UgYW5kIFRob21hcywgSSdtIGhhcHB5IHRv
IHNlbmQgYSBwYXRjaCB2MiB0byANCmluY2x1ZGUgdGhlc2UgZGV0YWlscyBzb29uLg0KDQo+
ICAgTkIgSSdtIG9mZiBvbiBob2xpZGF5IHN0YXJ0aW5nIGZyb20gdG9tb3Jyb3cgYW5kIEkg
aGFkIGlzc3VlcyB3aXRoIERFQw0KPiBoYXJkd2FyZSBpbiBteSBsYWIgKG5vdyBzb3J0ZWQs
IHJlcXVpcmVkIGEgdmlzaXQgb24gc2l0ZSkgc28gSSBjb3VsZG4ndA0KPiBnZXQgdG8geW91
ciBzdHVmZiBzb29uZXIgYW5kIGFsc28gSSB3b24ndCBiZSBhYmxlIHRvIHZlcmlmeSBhbnkg
b2YgdGhpcw0KPiB1bnRpbCBJJ20gYmFjayBtaWQtTWFyY2guDQo+DQo+ICAgIE1hY2llag0K
DQpJdCdzIGEgcGl0eSBJIGRvbid0IGhhdmUgREVDIGhhcmR3YXJlIG15c2VsZiwgdGhlcmVm
b3JlIEknbSBsaW1pdGVkIHRvIA0KdXNpbmcgY3Jvc3MtY29tcGlsYXRpb24gdG8gdmFsaWRh
dGUgY29tcGlsYXRpb24gaXNzdWVzLg0KDQpOZXZlcnRoZWxlc3MsIGhhdmUgYSBmYW50YXN0
aWMgaG9saWRheSENCg0KVGhhbmtzLA0KDQotLSANCldhbmdZdWxpKg0KKg0K
--------------qVwLyZwqZC4S0TSExECJBtOy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi Maciej,<br>
    </p>
    <div class=3D"moz-cite-prefix">On 2025/3/1 00:01, Maciej W. Rozycki
      wrote:<span style=3D"white-space: pre-wrap">
</span><span style=3D"white-space: pre-wrap">
</span></div>
    <blockquote type=3D"cite"
      cite=3D"mid:alpine.DEB.2.21.2502220019210.65342@angie.orcam.me.uk">=

      <pre wrap=3D"" class=3D"moz-quote-pre"> Up to commit 8f99a16265353 =
("MIPS: Tracing: Add IRQENTRY_EXIT section for=20
MIPS") `do_IRQ' used to be a macro, that's why.  At the time `do_IRQ' was=
=20
converted to a macro `dec_irq_dispatch' was created and previously this=20
place used to call `do_IRQ' too.

 It's always good finding out why things are as they are so as to make=20
sure you haven't been missing something.  This cleanup should have been=20
made along with commit 8f99a16265353, so it's pretty old a technical debt=
=20
being sorted here.

 Please add these findings to your commit description in v2.
</pre>
    </blockquote>
    <p>Alright, thank you for the correction.</p>
    <p>I do see that this commit has already been applied to mips-next.</=
p>
    <p>=C2=A0If it's alright with you and Thomas, I'm happy to send a pat=
ch
      v2 to include these details soon.</p>
    <blockquote type=3D"cite"
      cite=3D"mid:alpine.DEB.2.21.2502220019210.65342@angie.orcam.me.uk">=

      <pre wrap=3D"" class=3D"moz-quote-pre">
 NB I'm off on holiday starting from tomorrow and I had issues with DEC=20
hardware in my lab (now sorted, required a visit on site) so I couldn't=20
get to your stuff sooner and also I won't be able to verify any of this=20
until I'm back mid-March.

  Maciej
</pre>
    </blockquote>
    <p><span style=3D"white-space: pre-wrap">It's a pity I don't have DEC=
 hardware myself, therefore I'm limited to using cross-compilation to val=
idate compilation issues.</span></p>
    <p><span style=3D"white-space: pre-wrap">Nevertheless, have a fantast=
ic holiday!
</span></p>
    <p><span style=3D"white-space: pre-wrap">Thanks,
</span></p>
    <div class=3D"moz-signature">-- <br>
      WangYuli<b><br>
      </b></div>
  </body>
</html>

--------------qVwLyZwqZC4S0TSExECJBtOy--

--------------VWdM82tDfrgrrAVtP6lrC0RP
Content-Type: application/pgp-keys; name="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSK
P+nX39DNIVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAx
FiEEa1GMzYeuKPkgqDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMB
AAAKCRDF2h8wRvQL7g0UAQCH3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfP
bwD/SrncJwwPAL4GiLPEC4XssV6FPUAY0rA68eNNI9cJLArOOARmgSyJEgorBgEE
AZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7VTL0dvPDofBTjFYDAQgHwngE
GBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIbDAAKCRDF2h8wRvQL
7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkUo9ERi7qS
/hbUdUgtitI89efbY0TVetgDsyeQiwU=3D
=3DBlkq
-----END PGP PUBLIC KEY BLOCK-----

--------------VWdM82tDfrgrrAVtP6lrC0RP--

--------------Dr8oZ0Svb2l280lRAcsbpviW--

--------------cpzNAlvaVuHJSvSPikjQO7we
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZ8UusQUDAAAAAAAKCRDF2h8wRvQL7tDp
AQDeXbKIvClZphmjWsTVAvytlWgwVr8RgDUeDlo9r9vDOgEAgihKfOgFduggtNFdn006Xf1MoXv7
R2Lv+968xgdMRw0=
=3ama
-----END PGP SIGNATURE-----

--------------cpzNAlvaVuHJSvSPikjQO7we--

