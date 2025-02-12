Return-Path: <linux-mips+bounces-7744-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEA0A32121
	for <lists+linux-mips@lfdr.de>; Wed, 12 Feb 2025 09:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FDF47A25FF
	for <lists+linux-mips@lfdr.de>; Wed, 12 Feb 2025 08:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06E62054FC;
	Wed, 12 Feb 2025 08:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="MDr0TNRs"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC34E1DED5F;
	Wed, 12 Feb 2025 08:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739349101; cv=none; b=hGsFQEpGh/DvtD1E+Mw54mpPAQJXbsLnLHDXbfwsUMso0SC/k5naDkC1ZbUuWDo1Xdtnl+CJjwqjwxLeLStEoQpMEEDpVDkC84f/DHOH8vTeoqOXeP6QuNjSMbah8LvVVAMDVdz/8VPxXxQfCl1uBxa00Ijyz/i5gaom15njfn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739349101; c=relaxed/simple;
	bh=jKmnbO01U7PB1ktXnak6Z7V9ixmJZFoi1KmEdzP/atQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NpzhXfnu5ozenwwLzqe93DdYanU8JHTO3baT1EtdmwFLXfuGlpXeMRZroHsd5wiZcgLiBD4mvdZPtgZPQy+KRD/H7kPasoFvKb+Z43nN152R8zUQjNvjpufsKxLCbReZAaEJlGcodhtvY89BZyDmyUaUJLRo4Scswgp+YSw9xG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=MDr0TNRs; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739349044;
	bh=jKmnbO01U7PB1ktXnak6Z7V9ixmJZFoi1KmEdzP/atQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=MDr0TNRsoaKrZaTsSZrz0IQk9fjlhL+GfDKybLppuAjCVsGP6at3besprbK4FJF09
	 Z2FxPYXjlVJFixr/5hD/Zglb2IMdi+MZLNRScis14vTBhLzldFnULnmc/UCVcki9mI
	 F7oJZm+dWkvg6uwH89g+uYS2ntw9C4XtvFVamRyo=
X-QQ-mid: bizesmtpip2t1739349011tbs791d
X-QQ-Originating-IP: +hRE0UJYdhCLplKuLNaNXFDgVUeA7iaIbJVTl434Lns=
Received: from [IPV6:240e:668:120a::206:15b] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Feb 2025 16:30:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8806388869146915300
Message-ID: <030FDC391902ED7E+d1a2171f-9a91-48eb-8520-a02ff7e786b4@uniontech.com>
Date: Wed, 12 Feb 2025 16:30:09 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] MIPS: Explicitly check KBUILD_SYM32=n
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 masahiroy@kernel.org, jiaxun.yang@flygoat.com, zhanjun@uniontech.com,
 guanwentao@uniontech.com, Chen Linxuan <chenlinxuan@uniontech.com>
References: <41107E6D3A125047+20250211135616.1807966-1-wangyuli@uniontech.com>
 <D23DC9B8BD1C245D+20250211140740.1812778-2-wangyuli@uniontech.com>
 <alpine.DEB.2.21.2502120612000.65342@angie.orcam.me.uk>
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
In-Reply-To: <alpine.DEB.2.21.2502120612000.65342@angie.orcam.me.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fb0TDSB84pRB0hFv1UzjXwFZ"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MINkqr8Ftjsm4CeG/ZL0D56a+kaKAZFGb+KwOdoMKyId9/CJILnpL8Id
	pT/93hT4PCDuVVSCA+VEAo78IWB26JL8m+KNyTMal0+0lrVUOMEFCi744kFTo85XuzQ+kJV
	cnS8bBnf7kOjcmA0SE7C7otdJ9d30EyAdyTNgpl6FdHxSc7xhHq58yGRJ437H9+G1vmNe2i
	BMVCqol7m9OhT1+xNkf7l1UKJqZJMqXs9j3/0hajf3nb/d15INYdU75lPkman33YgXCiz+/
	s02BOWvoy7HnigdB1FO1pjaqU5sQT+xIvO6dSnLRaAk2aPn2ybYr7zH259JwjTF2WRY32rM
	Zwe0MwzhWIS4gPsg45D6L3OBvFO6jxMUbQW6meKfsohuwgTP2TkX/JjCLh67O8k2Ppo40uY
	rS374NM+yKRl5yqai8ZnpcwjO9rmxBGWd1kkUAsoWn9a/dzV/spvoy+ciNDA2d1Vr9w6CSJ
	EqwFTjZNwKvbYk7Igfgs+1epXsOfcg/MatTeCMv5oz3oEiBjdRmoB+JrmbPyCLPdSBdNBMS
	U+RiiC6af0z+7VmdsujZOTC+vaE6zPzX6YWjv+WsuYnzRdIfskV5bCTasSIZTX9NydO9WzJ
	qLngAjcwam9Y7/RdTZOrcNK80h30OhLay8/+TwWNLycBbmCFL13VINydCT5Cqd7ZJy5ZEy3
	CR0vqpsKpb01V+nLmtRkiUdJl3iXWwH1xwJf5cDzyAgfeI1QFIw9h6lfDiQntwCWPFtOVqH
	cTWdS0KyT7N5XFEiHU3r8ps2j7zexi+CnDtrHuWG/XsknsMmjvVH1/9bavYFVMBqPI7/eAb
	LRotXfQU1+rhIoNnw0OK9FwZWUZbpnO6WvGIp+a+jFiR0EkVDSinziUyQAMNQ0i8YSPMPu5
	iF6xspPpJXm2toTZn5uUEH07Vqe4mVJD0bM3ai4M1xZw11t9fa7ZGx4UpWsSOLrblG/Joz2
	9PnhTXQtPdiLZTPZ6y0yaDQkvenp7ISdhl9VXlK1Jl4vnRKzmBNv+1EmsBtSLaeStYS9vSv
	qciufknWc4++gzALRO5lJFT/qOPqisfGy2k1hcDkohy5RtiJcTEw27w2cwsdg=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fb0TDSB84pRB0hFv1UzjXwFZ
Content-Type: multipart/mixed; boundary="------------0JYSzbnNmAlGqpICg0m9kdWN";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 masahiroy@kernel.org, jiaxun.yang@flygoat.com, zhanjun@uniontech.com,
 guanwentao@uniontech.com, Chen Linxuan <chenlinxuan@uniontech.com>
Message-ID: <d1a2171f-9a91-48eb-8520-a02ff7e786b4@uniontech.com>
Subject: Re: [PATCH 2/2] MIPS: Explicitly check KBUILD_SYM32=n
References: <41107E6D3A125047+20250211135616.1807966-1-wangyuli@uniontech.com>
 <D23DC9B8BD1C245D+20250211140740.1812778-2-wangyuli@uniontech.com>
 <alpine.DEB.2.21.2502120612000.65342@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2502120612000.65342@angie.orcam.me.uk>

--------------0JYSzbnNmAlGqpICg0m9kdWN
Content-Type: multipart/mixed; boundary="------------vxlzmYTZu00HKN3nLVM2Qejw"

--------------vxlzmYTZu00HKN3nLVM2Qejw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWFjaWVqLA0KDQpZb3VyIHJlcGx5IGlzIGEgbGl0dGxlIGJpdCBjb25mdXNpbmcsIHNv
IGxldCBtZSByZXBocmFzZSB0byBtYWtlIHN1cmUgSSANCmdvdCB0aGlzIHJpZ2h0Og0KDQpU
aGVyZSBhcmUgZXhwcmVzc2lvbiBhbmQgc3BlbGxpbmcgZXJyb3JzIGluIG15IGNvbW1pdCBt
ZXNzYWdlIGFuZCBjb2RlIA0KY29tbWVudHMsIG5lY2Vzc2l0YXRpbmcgYSBwYXRjaCB2MiBm
b3IgY29ycmVjdGlvbnMsIGlzIHRoYXQgcmlnaHQ/DQoNCkFzIGZvciB3aGV0aGVyIHRvIGNo
ZWNrIG5lZWQtY29tcGlsZXIgb3IgS0JVSUxEX1NZTTMyIGluIHRoZSBjb2RlLCB0aGUgDQpl
ZmZlY3QgaXMgZXNzZW50aWFsbHkgdGhlIHNhbWUsIGNvcnJlY3Q/DQoNClRoYW5rcywNCg0K
LS0NCg0KV2FuZ1l1bGkNCg0K
--------------vxlzmYTZu00HKN3nLVM2Qejw
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

--------------vxlzmYTZu00HKN3nLVM2Qejw--

--------------0JYSzbnNmAlGqpICg0m9kdWN--

--------------fb0TDSB84pRB0hFv1UzjXwFZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZ6xcEQUDAAAAAAAKCRDF2h8wRvQL7q2y
AP9Eidu3oPeJ87oNZZhy4+daHyKf+S+4GHZdhzKT1bahzQEAydFuZi2/FDAim4aN01H0/hDEf6as
xBdKkqIaLy7CRwk=
=pmho
-----END PGP SIGNATURE-----

--------------fb0TDSB84pRB0hFv1UzjXwFZ--


