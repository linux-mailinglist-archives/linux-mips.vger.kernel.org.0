Return-Path: <linux-mips+bounces-8496-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C48F1A7D4DD
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 09:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C87A33ABB2F
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 06:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F4D22687C;
	Mon,  7 Apr 2025 06:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="fyxFsUzX"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F6D22540A;
	Mon,  7 Apr 2025 06:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744008958; cv=none; b=QeI0EoFVXKXL31lqqu4xFaD+l2V0gqJTtBkVtpVnUCEoJxhliwJGOFLJZHlNks8c7JC/pjbSofHZxxpGfcZ6+hJA3FZtnLLBNjeh2wDuf26UCPlQYi/icjj37HPgYayImtgHuJL5HeCwY4xyRjHmNFF9ybS2XNqjgxCYvpYogx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744008958; c=relaxed/simple;
	bh=0RsV/UiWuSYyhNTxCLLOFl3X8Rix1KUqQ5uoJ8qyXVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pG56BC30kLinraDwqMzElOh/wdHQ4HahqWex98KO1IZovivh413HHiHVEvRRgqLZMcco9zz7MIwpjZ9mYRJ1P2HWoEN0U5sbYu8zbXkQHdPylxWqaEj2E3itsTMmGPlvqkTfSghQiodKrzM59rVlzqfGQ5ozIsSg6MX84Eq3Ol8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=fyxFsUzX; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744008927;
	bh=0RsV/UiWuSYyhNTxCLLOFl3X8Rix1KUqQ5uoJ8qyXVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=fyxFsUzXmwXxAl66K3xJxK/9pBh8rdwMPgQvkMkajhmNpASTe9zYgaaVsrdjBHcqx
	 LfJhcEkKoWwlsmUkVxtpEBA6u02EFMgHkZvvkvc227yMpnAWgfasjdqjsC/3qemWwW
	 OKXUuZaZEyYKGWZy42DCd1fL5tDoBPSPX/nctO9Y=
X-QQ-mid: bizesmtpip4t1744008914t06b9eb
X-QQ-Originating-IP: GU3L6N8JcwWfgXCNUbLufMg08lqQRsb+nd9ZB3aqLTo=
Received: from [IPV6:240e:668:120a::212:156] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Apr 2025 14:55:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17120012834144405305
EX-QQ-RecipientCnt: 8
Message-ID: <E1C033BA7FD27C8D+cab4d687-98df-49c6-adc9-e55a1c8fef34@uniontech.com>
Date: Mon, 7 Apr 2025 14:55:13 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] MIPS: dec: Remove dec_irq_dispatch()
To: macro@orcam.me.uk, tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhanjun@uniontech.com, niecheng1@uniontech.com, guanwentao@uniontech.com,
 chenlinxuan@uniontech.com
References: <303EFD6BFBDAC7C8+20250305033436.31214-1-wangyuli@uniontech.com>
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
In-Reply-To: <303EFD6BFBDAC7C8+20250305033436.31214-1-wangyuli@uniontech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KN0coP3cYQR4uMxnh4wuE0WS"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OQEfmBmUqqJ6FBuux7cBN0soiSsYrXvj8jwXLxfmDF9i0U12mYFYRUC8
	4qnoBo/YQMSZm5YobklCRJS8bRXe1AyCUx05oP05dLeEqnPwfWgCRpl2w4hBToyLpSvok48
	Dq9yWBzTbtGuvZf/PCqD/ej+14b3qlePbioivCSzu52fEQD+wFZGnS7uuQRgKP3DQA1f08l
	68VPKz2Ebu8F4WyqGNixncAN4nrqsdro52X3/hhNcOYN8kjUzQepGiB+HPZZdc2gznSeqhL
	ytEvk7zLntKKuXq3L9MkWMOcMhUYzMGlxMFXNgn6J7ugqTVKGqTF06aR7DKznglyrYKhGwl
	pzWrLuFottOyf1HTtHepnv6yi+sUJ+vpnZtofaB3u+9xO2+2at005lxelgnKGHqSFVF7vbi
	Kz7dvEgBmwucr0E4Su5DTUSqSDEESiEL/elgIBeBFl1ax8MNFDFj4YBsEG8II5kKPIPHEJj
	dBf9voLRPOsa4gUYSYVPjpIsFZl8W3Zu/ETTT1DoB5JqATtiTrz8ewkoenjlVdLRRdM7j/3
	sRZgFZgC8LKh/DVz3KZKQ1jh95j8dTKPVWlTVK7nofmQ3PzjA6uPs+Bs+Q53QPRyKyukHA2
	YQQ5ko0tJLB5udSMf/2I61hmnlM5VUpPloG2E2stEZ8I6ekGyoLd/Gy71GBsw2EvWBwBcqZ
	ZmeNnWghSOFe1RcytUAi23lQfvHlcUxTSg9j60X5/xUKGyzosv7gbdZGMLNX9qM8UTxtTQv
	sI6VecMEj0xgNFpbID43cPvzXm77Bt+/kw0uYvAAhj+cMsQ1cv2KaLDd6OpSvN2mZl0dWwa
	4JVClt03g5oCZagHXldtHSkjbPAK0zVhR9buiuxa8m/xPr/KETeoEl9lWLdSV01DzPkNa3k
	fxWl8473TVaf61NnKtmC6T1QiQWXOnHcY/FrwNY0xXePZkj4XRNol/fnRo9gJn6z+9CKQ5z
	WMthSuyUUlT7c0hIfqerAv0mmruTfEal0aGlAbiuQ8SF8RpoDyEEGWoWec2bHM6l8E5Kyvs
	/S8MZG/pff7BvVSxZY8CSlZEMbhXY=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KN0coP3cYQR4uMxnh4wuE0WS
Content-Type: multipart/mixed; boundary="------------EyBmMelODotX0r1tdK24hhvY";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: macro@orcam.me.uk, tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhanjun@uniontech.com, niecheng1@uniontech.com, guanwentao@uniontech.com,
 chenlinxuan@uniontech.com
Message-ID: <cab4d687-98df-49c6-adc9-e55a1c8fef34@uniontech.com>
Subject: Re: [PATCH v2] MIPS: dec: Remove dec_irq_dispatch()
References: <303EFD6BFBDAC7C8+20250305033436.31214-1-wangyuli@uniontech.com>
In-Reply-To: <303EFD6BFBDAC7C8+20250305033436.31214-1-wangyuli@uniontech.com>

--------------EyBmMelODotX0r1tdK24hhvY
Content-Type: multipart/mixed; boundary="------------TN7x9oijtL0BFlCv0EKyNKOK"

--------------TN7x9oijtL0BFlCv0EKyNKOK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQo2LjE1LXJjMSBpcyByZWxlYXNlZC4NCg0KSXQgbG9va3MgbGlrZSBhIHBv
cnRpb24gb2YgdGhpcyBwYXRjaHNldCBhbmQgaXRzIGltcGxpY2l0IGRlcGVuZGVuY2llcyAN
CmdvdCBtZXJnZWQgaW50byBtYWlubGluZS4NCg0KSSd2ZSBhbHJlYWR5IGFkZHJlc3NlZCB0
aGUgcmVzdCwgYW5kIEknbGwgYmUgc2VuZGluZyBvdXQgYSBmcmVzaCANCnBhdGNoc2V0IHRv
IGF2b2lkIGFueSBtZXNzLg0KDQpUaGFua3MsDQoNCi0tIA0KV2FuZ1l1bGkNCg==
--------------TN7x9oijtL0BFlCv0EKyNKOK
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

--------------TN7x9oijtL0BFlCv0EKyNKOK--

--------------EyBmMelODotX0r1tdK24hhvY--

--------------KN0coP3cYQR4uMxnh4wuE0WS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZ/N20QUDAAAAAAAKCRDF2h8wRvQL7q6h
AP4h5Su80DrjeNbLGczOJ8/S6JFYE/dilFkVYzQIHTS4EwD+IpeCXJgSzkSjBkknbChUsibhl38y
8S4pqZyv8h2j4AM=
=ocBW
-----END PGP SIGNATURE-----

--------------KN0coP3cYQR4uMxnh4wuE0WS--

