Return-Path: <linux-mips+bounces-8014-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0834A479F5
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 11:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D2583A46FC
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 10:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4FF1E1E01;
	Thu, 27 Feb 2025 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="aCPCR/UV"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1801527B4;
	Thu, 27 Feb 2025 10:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740651330; cv=none; b=jX4LDBH4y/FcshE/HBsGahQI4i776j6BSJntcLg7mz+/U8EpKxxEB6fPs40zG2xX+YzgywpAbmQT6gWA1rGk/ugPFcMASBB9L/d7qf+rAthK/rCG/3ERNPIXNU6jZEnKczBlgnoYonCB3SJkXnzYLjLhgHYfWWfD4y0PC95ZMqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740651330; c=relaxed/simple;
	bh=sJtGvH6T3YnBZqj3leXQ+q1WiYFWcKZltELvoGu/mQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rpNozFAMU1/aEzTpbI4mtI+LUadZCL5dttpJvC8qVg+ab9R+vOZUnup1aDX5AXZstbw0mT2RMh8+GrJJfJlS1DdVVTi3KHKsunQk5PseWD0JVK/NR07IzGn5LEgepdh9aebIdKO70QCSUGWmoEO/4KW+mMrcnpdT5gA13EVcXcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=aCPCR/UV; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1740651305;
	bh=sJtGvH6T3YnBZqj3leXQ+q1WiYFWcKZltELvoGu/mQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=aCPCR/UVqnaOY57DQCiujuO4Gxmn+k2jwY4mFBIqDZVOFdzRBDJ1XI9G12cam75Xr
	 jxcBEW/lSf0xvWTEAb9nwG058z+uemNATudMb8VAJQfWRgJcatC80cOcuVC8y1LFS0
	 YC5VrQ2cbRlFdytT98OpeuDO/fkow/skz/KCVcTg=
X-QQ-mid: bizesmtpip3t1740651293tq8l0eh
X-QQ-Originating-IP: epTPV+fe7KvLKKL+kURLRX8Vo49pXsGehJKwdj6aKug=
Received: from [IPV6:240e:668:120a::212:156] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Feb 2025 18:14:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4524885663681403227
Message-ID: <6107DFE9C8CE6962+3fb1c557-9903-45e0-82e9-659bc50b3695@uniontech.com>
Date: Thu, 27 Feb 2025 18:14:51 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] MIPS: dec: Create reset.h
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: chenlinxuan@uniontech.com, guanwentao@uniontech.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, macro@orcam.me.uk,
 niecheng1@uniontech.com, zhanjun@uniontech.com
References: <487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com>
 <65F124DA37C9CC6A+20250218125633.666501-1-wangyuli@uniontech.com>
 <Z8A0JeFYfBxXOFCD@alpha.franken.de>
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
In-Reply-To: <Z8A0JeFYfBxXOFCD@alpha.franken.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XLgaN7Uhu4ShdeXLdG0nf6KM"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NJvWNRsNVoV4P1vqh3LLXa1xOjN6GrfNUJgaYueIY/+9YjKqT8EEHbHl
	MmB1vKKPJNwtNSXvnMWS4B0Y64xX40jTV8zz4xy95yTkqgsl3AHQfrcqh+pfb4Zf9pe0fq+
	bYUbn1kTz/dmC8SnqvUvPy1BaavgLcyjhB/jf9l3STH5aj63q0zmWqmbv9CgGNLBWkraoAo
	8tgmQ/PCNYMR2SuGBnANyHZPBjqXKuUGumpHJAfak/2hhtmXc/gvdWO8hE5MvymgA6kOK32
	HHyz9g8n8suNE1JtdBHYUjKthlSBR/BWbcLFjdG+UdMthD3XkVXi99tsaJPuMqCFULSyOSn
	/9+qQw30Etas5Hj5MOk8WwI1HI+Xl0e9cOFOYTW+2XcOsHuij9QuOlFy37EsjM4Tb3IuOzQ
	qgaDzcADTm7E+unqN44euFaaorkYM4hoT6f+92H3+vqWq0mT2JuWDH74oCB9yHMu5wCSdR8
	bqe6nKeLPOFFCoKh+chliHUiqJNWBSf/ep0M1iFWdcAFrQs5gGR3VljwAfuURpdFt0DfNxr
	k/BwQOmVSmN+F0dNOxrhhp+3mC1rBLoKJHaNkXqt75B8fWFIahiOyTwVLdQDL1FLxWh/zd+
	EaJxerlPVSiNgZcM0i6/YWZFj9ZUG6eMPt4WnQ4DXdlN1mmTHYam0l5SgKUDuimCeMa93AW
	3QlbW9c8LjLYVYELMlCbXTwJDNLbW6JnGVW7h3i7cjHiOsZjQXiI5RdMyjQt2cGB/uF/Rjm
	AikJjs2j+9/Oww7GNvni2J4v8B+tQg4U8FpoAW4FLRrnDECjg5e1HPaINCGBsHOtizwxCbG
	ZeVGpy1+OEWaRY/pkDrlzBtvGfZ76ufwDntgMXELVosacbNyTOkYNKYzytW6C0atFDbieAL
	hSJbDmfZpSPiSldLYzNw4ThkKEhi+bGUOSPIIuz+KzZnp7VN2pGQ6b/FnMDYOLqasb0c+t4
	ueORVYMq3pI6Uw2QIT3a4ojD8jdK26tZuWxx7MiwxFO6ftAA8/xTCvzJlmJl/HbzZJ20j08
	4zJaxlZnLSJacFKqsUjWyNlq5/63SE9vZfwy/GcQfand1lxWRU
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XLgaN7Uhu4ShdeXLdG0nf6KM
Content-Type: multipart/mixed; boundary="------------sI41dO22yyiiCcjZ0xfXjL0d";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: chenlinxuan@uniontech.com, guanwentao@uniontech.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, macro@orcam.me.uk,
 niecheng1@uniontech.com, zhanjun@uniontech.com
Message-ID: <3fb1c557-9903-45e0-82e9-659bc50b3695@uniontech.com>
Subject: Re: [PATCH 2/7] MIPS: dec: Create reset.h
References: <487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com>
 <65F124DA37C9CC6A+20250218125633.666501-1-wangyuli@uniontech.com>
 <Z8A0JeFYfBxXOFCD@alpha.franken.de>
In-Reply-To: <Z8A0JeFYfBxXOFCD@alpha.franken.de>

--------------sI41dO22yyiiCcjZ0xfXjL0d
Content-Type: multipart/mixed; boundary="------------ft40PnVA9sxs4ZBn4yUN4WoV"

--------------ft40PnVA9sxs4ZBn4yUN4WoV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksIFRob21hcywNCg0KT24gMjAyNS8yLzI3IDE3OjQ1LCBUaG9tYXMgQm9nZW5kb2VyZmVy
IHdyb3RlOg0KPiBJIGRvbid0IHRoaW5rIHRoaXMgY29weXJpZ2h0IGlzIGFwcHJvcHJpYXRl
LCB5b3UgYXJlIG9ubHkgbW92aW5nIGNvZGUNCj4geW91IGhhdmVuJ3Qgd3JpdHRlbi4NCj4N
Cj4gVGhvbWFzLg0KPg0KSSBhZ3JlZSB3aXRoIHlvdXIgcG9pbnQuDQoNCkkganVzdCAidGhv
dWdodCIgSSBzaG91bGQgd3JpdGUgaXQgdGhhdCB3YXkgYmVmb3JlLg0KDQpJIGNhbiBzdWJt
aXQgYSBwYXRjaCB2MiB0byBmaXggdGhpcy4NCg0KRG8geW91IHRoaW5rIGl0J3MgYmV0dGVy
IHRvIGtlZXAgdGhlIG9yaWdpbmFsIGNvcHlyaWdodCBpbiByZXNldC5jIG9yIA0KanVzdCBy
ZW1vdmUgdGhhdCBsaW5lIGFsdG9nZXRoZXI/DQoNClRoYW5rcywNCg0KLS0gDQpXYW5nWXVs
aQ0K
--------------ft40PnVA9sxs4ZBn4yUN4WoV
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

--------------ft40PnVA9sxs4ZBn4yUN4WoV--

--------------sI41dO22yyiiCcjZ0xfXjL0d--

--------------XLgaN7Uhu4ShdeXLdG0nf6KM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZ8A7GwUDAAAAAAAKCRDF2h8wRvQL7pKe
AQClFY+r58078ndUlvPjyRD9x9a7eqaI6nXljFOvc68+NwD7BJJYyVFxWqDQ3ctaq47F/pm0YHAT
1qD2W+1mgoQMwwU=
=0HQ6
-----END PGP SIGNATURE-----

--------------XLgaN7Uhu4ShdeXLdG0nf6KM--

