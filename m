Return-Path: <linux-mips+bounces-8840-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74836A9E7CD
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 07:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C93C7174039
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 05:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A9819882B;
	Mon, 28 Apr 2025 05:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="bHbEERZD"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA1E193062;
	Mon, 28 Apr 2025 05:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745818624; cv=none; b=LUd5eK7Z+s1QmizZpGdMKflJ+OWyuv+0M2THkUeR1mECLXS/pEigBE0Kn3IIzg6zZ6WFPB5W0tUrjgjeuRYkenYhC/8oH8LjlO669PUsloN+rZ2FYoxBXL7uy7jROargCcR+N4IrzRgmkYyX21v7rs5hzk7GxZgFkR349QTMRVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745818624; c=relaxed/simple;
	bh=M0LjuoqcMWHsQXSVOf8Nm3gaSAfKQYd2cE3gm/SfEyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OIm7PxHY9o6SLek/H+ImMZtyDnNrc5eWaxN7DlGigPft8Ov0vO5U7hkSus9gOHJ6kwzpDN4axpiA7SVIaLVlM0lKHf2+whGeb3zTKGoiUz1/1e0p3orqNo0BzZC/Kd+Ls1ZkQRcgNNJ9tIkoNz7YomkeIJjAtWVP2pNtKI+f8yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=bHbEERZD; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1745818589;
	bh=UdjdVwsGFyMI747dVYHjmVnUn3MRQZNoNL+bE5qpgw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=bHbEERZDfMGP32wRhX/I3ZGUkT/LNuhLVwr2Hagyqtn9ksxrIM0YVirFQlHwYgS5o
	 1C3zdqNQIpLHg/+mRTZj4HOM/PymyPpB6D06WdI4A4o5dUidIv7qXhijPEut4EHbId
	 scK2TyQSrH33V6tO2tDpE49Cy2ZSaw35r4so1fjA=
X-QQ-mid: zesmtpip4t1745818585t586eff5d
X-QQ-Originating-IP: Nfbd0PJ9OcESsxwpglGPLodS1rQq/nEc/H8O2c245Pg=
Received: from [IPV6:240e:668:120a::212:232] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 28 Apr 2025 13:36:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17663403777538385794
Message-ID: <8024D1C7CE1BC2F4+fb3ca587-fb54-4c3b-af44-77da7c8f4c3a@uniontech.com>
Date: Mon, 28 Apr 2025 13:36:23 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/kernel-parameters: Update memtest parameter
To: Randy Dunlap <rdunlap@infradead.org>, corbet@lwn.net,
 akpm@linux-foundation.org, rostedt@goodmis.org, paulmck@kernel.org,
 thuth@redhat.com, bp@alien8.de, ardb@kernel.org, gregkh@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev,
 tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, chris@zankel.net,
 jcmvbkbc@gmail.com
References: <0FC3D21CA22E8251+20250428034746.21216-1-wangyuli@uniontech.com>
 <b8ffdc7e-1b5b-41df-835e-c11a200d7dec@infradead.org>
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
In-Reply-To: <b8ffdc7e-1b5b-41df-835e-c11a200d7dec@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Hk6rtjDbqvMS3GCpq8DpmwCI"
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NyPaQtJYQgeorUhi4yGzMqOYfia0pkcETVCmcsCsFpL08dI284ZIdV/z
	o4ar5ZBkRRuOsW+/J2qv+trfi2BweXprsJK3/Jpm+1AUrY20za3drGqdQkzRazVevPEVzbN
	sXZ2kXWCjr6czEpLOqTENq/BjRciB5wvxmTV+Chol5OMg7LD5dD14Z2QBoqaO+jiu2gMIdL
	Z8CTf1+MFWav7t8mdBM2lmok/E7I2wns5r2MfnVVH9yLvTeYoX3UdB3KG6QFK436lI0koje
	QuhB5peLX01x75MTlGuYZ44PSFRC+fkmGd5mFRdpr7SctZZLHNxxWD7ZKAHR+l60LQwwr4O
	JsDSWudPF8W1r2lvr0+PxpTeor46wuCj68dZMtTMQl+FqTK1QUlGrIk4l10TfiiOTuwXU6x
	qpkXzt6AOJTrFZ4XWLoepRPfZDr8hGrXIcwmf5DuasvoQaKs8OTrWpgZxsE3DJ8cdzmZFwa
	qc7rByHRzPP/x1IjDlMAZPDzZypKZ4iML8LL51EIj5BwEiCn3Ryb6sOJej/mxMOeL0mOatZ
	9Aax8ULr+hMCcWQzul+ICbs1GoodMbnze9ALFkW765Ke/sj+aK1MP5qnsDcEOE+Cl7mb4d2
	Q4IiuknRK4auPyM4aKuBLeXg06N/6gBb9IrMZCKbStC08uNrPMhVBbhykhlr89LTKtWZpuI
	6Y08IB4ueXGBvzX94Vp9gAWMkb317gR0KEF7DmNtUBf4KoQ4gFGc1/V96CpA3k/9yNf4e/Q
	BmEFKtDOZSPUFQS+SdprLs4c6eXzkWHo3QXayEvVAwVr2udmLumtH5ekQ4OkMq06Ke+E5U9
	Bh4XlikmFLjbwv6m0VHqNxcVN46jE+jeG7neB6/hyjB9dXj74tXHIEgKWiT46smLM+giabU
	0xth5yJHp+Z36LiyfuFknMai+bIDU1fEpNtKkfPpGohB2mpsOjN3doAaPpEt6YaHFl/7Zfy
	ZI85WlgpIYkZbBHIFn/M40goi6ljSP3hYF0iLwcrwoqJxKCdxlbkOraRHvUh/kLsSMu63mv
	WHVzgCuk0/T5rUhaA1Y6+LrhKdiykEDdJXwYLpyAS5qzJjNh5J
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Hk6rtjDbqvMS3GCpq8DpmwCI
Content-Type: multipart/mixed; boundary="------------TFjB48ibnpBza0lpiW4f2rV2";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Randy Dunlap <rdunlap@infradead.org>, corbet@lwn.net,
 akpm@linux-foundation.org, rostedt@goodmis.org, paulmck@kernel.org,
 thuth@redhat.com, bp@alien8.de, ardb@kernel.org, gregkh@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev,
 tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, chris@zankel.net,
 jcmvbkbc@gmail.com
Message-ID: <fb3ca587-fb54-4c3b-af44-77da7c8f4c3a@uniontech.com>
Subject: Re: [PATCH] Documentation/kernel-parameters: Update memtest parameter
References: <0FC3D21CA22E8251+20250428034746.21216-1-wangyuli@uniontech.com>
 <b8ffdc7e-1b5b-41df-835e-c11a200d7dec@infradead.org>
In-Reply-To: <b8ffdc7e-1b5b-41df-835e-c11a200d7dec@infradead.org>

--------------TFjB48ibnpBza0lpiW4f2rV2
Content-Type: multipart/mixed; boundary="------------RH90aBEQ6X0g71W3z0xZChr0"

--------------RH90aBEQ6X0g71W3z0xZChr0
Content-Type: multipart/alternative;
 boundary="------------t8iLN9jjEHV14tL9F7ozjhZD"

--------------t8iLN9jjEHV14tL9F7ozjhZD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgUmFuZHksDQoNCk9uIDIwMjUvNC8yOCAxMzowNSwgUmFuZHkgRHVubGFwIHdyb3RlOg0K
PiBJdCBsb29rcyB0byBtZSBsaWtlIEFSTTY0IG5lZWRzIGl0cyBvd24gZW50cnkgYWJvdmUu
DQoNClRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgdGhhdCBvdXQhDQoNCk5ldmVydGhlbGVzcywg
dGhpcyBhcHBlYXJzIHRvIGJlIGEgZGlmZmVyZW50IHByb2JsZW0uDQoNClVwb24gcmV2aWV3
aW5nIHRoaXMgZG9jdW1lbnQgY2FyZWZ1bGx5LCBJIGZvdW5kIHRoYXQgd2l0aGluIHRoaXMg
ZmlsZSwgDQp0aGVyZSBhcmUgaW5kZWVkIG90aGVyIHBhcmFtZXRlcnMgd2hlcmUgIkFSTSIg
c2hvdWxkIGJlIGNoYW5nZWQgdG8gDQoiQVJNNjQiIG9yICJBUk02NCIgc2hvdWxkIGJlIGFk
ZGVkLg0KDQpUaGlzIGlzIGRlZmluaXRlbHkgd29ydGggcmUtdmVyaWZ5aW5nIGFuZCBzdWJt
aXR0aW5nIHRoZSBjaGFuZ2VzIHNlcGFyYXRlbHkuDQoNClRoYW5rcywNCi0tIA0KV2FuZ1l1
bGkNCg==
--------------t8iLN9jjEHV14tL9F7ozjhZD
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi Randy,<br>
    </p>
    <div class=3D"moz-cite-prefix">On 2025/4/28 13:05, Randy Dunlap wrote=
:<span
      style=3D"white-space: pre-wrap">
</span></div>
    <blockquote type=3D"cite"
      cite=3D"mid:b8ffdc7e-1b5b-41df-835e-c11a200d7dec@infradead.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">It looks to me like ARM64 ne=
eds its own entry above.
</pre>
    </blockquote>
    <p>Thank you for pointing that out!</p>
    <p>Nevertheless, this appears to be a different problem.</p>
    <p>Upon reviewing this document carefully, I found that within this
      file, there are indeed other parameters where "ARM" should be
      changed to "ARM64" or "ARM64" should be added.</p>
    <p>This is definitely worth re-verifying and submitting the changes
      separately.</p>
    <div class=3D"moz-signature">Thanks,<br>
    </div>
    <div class=3D"moz-signature">-- <br>
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      WangYuli</div>
  </body>
</html>

--------------t8iLN9jjEHV14tL9F7ozjhZD--

--------------RH90aBEQ6X0g71W3z0xZChr0
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

--------------RH90aBEQ6X0g71W3z0xZChr0--

--------------TFjB48ibnpBza0lpiW4f2rV2--

--------------Hk6rtjDbqvMS3GCpq8DpmwCI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCaA8T1wUDAAAAAAAKCRDF2h8wRvQL7jYY
AQCitUPQvnSZa0VYuBIv4ZMKv1iNhr9C+0JLhXVmBxrVDQD/czRR5mngvuppzfv5jbkHleiiYMJy
HToXvJu3qA+zjQE=
=nbo1
-----END PGP SIGNATURE-----

--------------Hk6rtjDbqvMS3GCpq8DpmwCI--

