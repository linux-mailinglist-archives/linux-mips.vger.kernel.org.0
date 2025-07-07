Return-Path: <linux-mips+bounces-9648-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1B5AFAC71
	for <lists+linux-mips@lfdr.de>; Mon,  7 Jul 2025 09:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F01C617D2EF
	for <lists+linux-mips@lfdr.de>; Mon,  7 Jul 2025 07:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE4E286430;
	Mon,  7 Jul 2025 06:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="OC3gMEuy"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37D22874F3;
	Mon,  7 Jul 2025 06:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751871560; cv=none; b=g5Nwkj+rzdpO1CEYiMmGtciiHqBxR+N7BDAvWEpJVrGmVbUU94NCuJn6rTdTAueda4F+mcZttSg9zMIJn+11Pg8QYbKOV4USzjH81rbHsbpmwqW+P2FXGH2Zfsvw3UN1u8ERDXEHdtTE+aSSKQuAGqzjQ0XwR0znnL5iU0yx3F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751871560; c=relaxed/simple;
	bh=/pX/l5Wc/0xNbeAulJb6lD23yHL76TsKOLIU/5lq8r4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TOlqC0qTjdt2sxhoOY625pQ2qqmnWBhcnjGfVYSB0PShoup0qKc351+8yHcU+Knvfbmp6bhPzw2LsSgv+Elgez3gsja8oxZzm8sKvVXGAL/4Ki6RLOXDWKT1tVTv8h2Gr4FtLEN3cNj5o+KB2EHcdbyMSOe9VRUnbYsjXscy/fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=OC3gMEuy; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1751871532;
	bh=/pX/l5Wc/0xNbeAulJb6lD23yHL76TsKOLIU/5lq8r4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=OC3gMEuyzu749A0ZiYqYVDBO880qnNHlxVileKZcY9hlqZnZUVLP0xbsamfh2DZIE
	 yxPrisdl9hPe+78HHzGGfwWdskenH5a6X8798sP2ecWrnfaXP7ohoR+o+eG0dIovYj
	 gJ+RT7IvzEycecSoqltHa/oBaGdDWBsIRRMFkudA=
X-QQ-mid: zesmtpip2t1751871495td943d749
X-QQ-Originating-IP: msbOsRCPf0JID4PpdTPYL8wQtjscG7pzBpPERYJf0XY=
Received: from [IPV6:240e:668:120a::212:232] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Jul 2025 14:58:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7165771838115011995
EX-QQ-RecipientCnt: 7
Message-ID: <9ED003291C66C906+94d03a66-3573-4e3f-aaac-d7c55f750776@uniontech.com>
Date: Mon, 7 Jul 2025 14:58:12 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Gentle ping: [PATCH v2 0/6] MIPS: Resolve build problems on
 decstation_64
To: tsbogend@alpha.franken.de, macro@orcam.me.uk
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhanjun@uniontech.com, niecheng1@uniontech.com, guanwentao@uniontech.com
References: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com>
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
In-Reply-To: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6OmAPHmhuwYa09o3Kw770IMo"
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N8EjZstfjwKXmItYcyjzZvwrpDGXMAiKuLGzdn5nwuEpgLgBQ6VjQ6r/
	aIEYK8JlLI5MFDwg5h4jqWgPkeD8qZ1V6XXMOqyDZDpXvGydOGEJ5LooM/tZ3daqeehYu5L
	SEbu4ymg2CQpKHntythzspyMblArqe1JlkLuwmy3/yfMejF8ymy1Tz+renRSI5ODGEvKqNl
	fHqiRNr2mvc0fkXkmgmXI6X3pHF4z0VBzwE0MF892fjfadHKQgS3bzyra7ccdiJyNNggvDl
	elyG/HInTr6QjRLwZvM8ton2hMAkJxSDcXBhV/K9ppMQrTBhRhWuj2rasoIh5ySB092zCep
	wScrCd0YE5R/veXO89NW4nsWWdqLp+jQunZGRw8yNUs4JQ6QUiY0Bia0vi9Io4YUvo1eNfZ
	pNsc9VKe3zX9fch0Q46VtdJXCpVAhCFb2GgBaGm+QjE1aIZ5rKKabT32yVGAD3H/TXe6qeE
	wQkAAPQ/t4Cbmr7RQMS/y/kO1t9RA/DTklA6vMvQe/Lz+nc0XrlMEAEafnueQfe+Mj8hbbF
	pVXfyTcbWOG7jjMfKE+reaalwDq2E4wAJvCh1TMl4UN5U4nhsziTNR70FWDKCbfUeDXO85Z
	mg2lSEsfvBg8GngHU12abEmMGLdr6HRw3r2IS5hZe8f3D6+Cpv1KimU3ZNuy4YoZL21fWWm
	SOY8sNnelgkAdPurzVq3am3B9CARjmxShAxtFr6VWenHhm+6BbGnVIYswMra94w6eEPgPH/
	e/hfzt8U8WVgYZO3PMEVkRwvKtzjyiaW9+Hq+p8oCzMVcvqGLfs9bdJpcDipzcHuw7V5kg5
	uzkbaWDWbBlCCVf1w3PRWjq5DFMDsn8UVrIlZargusDGAMExRGvzZi2vUsSF6i0StJG5G/8
	sz65GpdBGM8wqV+6/59QhfeDo2LQU3Mn78rC/amZRXjEj664BoQoVTe/mLc/U1M01Idj3Lg
	8/mHke4Svjh8ajdwL+Ww44+CpMv6eT9blEnPWS8i/V/ha/fv1n+tlvFNGKnmhLhKLgR5Vci
	agLn9bttupXh0Zx5OPMG8VmZ50NZBWrMchSpd98hl5Ys5Z0pHzVhpzgrfouf8o7HRavvQ1v
	97B61dTelrELZIireWLp1D2t4/BZUH6Ew==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6OmAPHmhuwYa09o3Kw770IMo
Content-Type: multipart/mixed; boundary="------------RgbllARWsLlZYSThzRw90KaD";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: tsbogend@alpha.franken.de, macro@orcam.me.uk
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhanjun@uniontech.com, niecheng1@uniontech.com, guanwentao@uniontech.com
Message-ID: <94d03a66-3573-4e3f-aaac-d7c55f750776@uniontech.com>
Subject: Gentle ping: [PATCH v2 0/6] MIPS: Resolve build problems on
 decstation_64
References: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com>
In-Reply-To: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com>

--------------RgbllARWsLlZYSThzRw90KaD
Content-Type: multipart/mixed; boundary="------------0h1pXDOEcfzHJPxW8vqcdnBv"

--------------0h1pXDOEcfzHJPxW8vqcdnBv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpUaGlzIGlzIGEgZ2VudGxlIHBpbmcuDQoNCkkndmUgYWRkcmVzc2VkIGFs
bCB0aGUgZmVlZGJhY2sgZnJvbSBwcmV2aW91cyBkaXNjdXNzaW9ucyBhbmQgdHJpZWQgDQpy
ZXNlbmRpbmcgbXVsdGlwbGUgdGltZXMsIGJ1dCBoYXZlbid0IHJlY2VpdmVkIGFueSByZXNw
b25zZQ0KDQoNCk9uIDIwMjUvNC8yMiAxODoxOCwgV2FuZ1l1bGkgd3JvdGU6DQo+IFsgUGFy
dCAxIF06IE1JUFM6IGRlYzogT25seSBjaGVjayAtbXN5bTMyIHdoZW4gbmVlZCBjb21waWxl
cg0KPg0KPiBEdXJpbmcgJ21ha2UgbW9kdWxlc19pbnN0YWxsJywgdGhlIG5lZWQtY29tcGls
ZXIgdmFyaWFibGUgYmVjb21lcw0KPiBudWxsLCBzbyBNYWtlZmlsZS5jb21waWxlciBpc24n
dCBpbmNsdWRlZC4NCj4gICAgICANCj4gVGhpcyByZXN1bHRzIGluIGNhbGwgY2Mtb3B0aW9u
LXluIHJldHVybmluZyBub3RoaW5nLg0KPiAgICAgIA0KPiBGb3IgbW9yZSB0ZWNobmljYWwg
ZGV0YWlscyBvbiB3aHkgbmVlZC1jb21waWxlciBpcyBudWxsIGR1cmluZw0KPiAnbWFrZSBt
b2R1bGVzX2luc3RhbGwnIGFuZCB3aHkgbm8gY29tcGlsZXIgaW52b2NhdGlvbiBpcyBhY3R1
YWxseQ0KPiBuZWVkZWQgYXQgdGhpcyBwb2ludCwgcGxlYXNlIHJlZmVyIHRvIGNvbW1pdCA0
ZmU0YTYzNzRjNGQgKCJNSVBTOg0KPiBPbmx5IGZpZGRsZSB3aXRoIENIRUNLRkxBR1MgaWYg
bmVlZC1jb21waWxlciIpIGFuZCBjb21taXQNCj4gODA1YjJlMWQ0MjdhICgia2J1aWxkOiBp
bmNsdWRlIE1ha2VmaWxlLmNvbXBpbGVyIG9ubHkgd2hlbiBjb21waWxlcg0KPiBpcyBuZWVk
ZWQiKS4NCj4gICAgICANCj4gQ29tbWl0IGE3OWE0MDRlNmMyMiAoIk1JUFM6IEZpeCBDT05G
SUdfQ1BVX0RBRERJX1dPUktBUk9VTkRTDQo+IGBtb2R1bGVzX2luc3RhbGwnIHJlZ3Jlc3Np
b24iKSB0cmllZCB0byBmaXggdGhlIHNhbWUgaXNzdWUgYnV0IGl0DQo+IGNhdXNlZCBhIGNv
bXBpbGUgZXJyb3Igb24gY2xhbmcgY29tcGlsZXIgYmVjYXVzZSBpdCBkb2Vzbid0IHN1cHBv
cnQNCj4gJy1tc3ltMzInLiBUaGVuLCBjb21taXQgMThjYTYzYTJlMjNjICgiTUlQUzogUHJv
YmUgdG9vbGNoYWluIHN1cHBvcnQNCj4gb2YgLW1zeW0zMiIpIGZpeGVkIGl0IGJ1dCByZWlu
dHJvZHVjZWQgdGhlIENPTkZJR19DUFVfREFERElfV09SS0FST1VORFMNCj4gYG1vZHVsZXNf
aW5zdGFsbCcgcmVncmVzc2lvbi4NCj4NCj4gV3JhcHBpbmcgdGhpcyBlbnRpcmUgY29kZSBi
bG9jayB3aXRoICNpZmRlZiBuZWVkLWNvbXBpbGVyIHRvIGF2b2lkDQo+IGFsbCBpc3N1ZXMg
aXMgdGhlIGJlc3Qgc29sdXRpb24gZm9yIG5vdy4NCj4gICAgICANCj4gVG8gZ2V0IHJpZCBv
ZiBzcHVyaW91cyAiQ09ORklHX0NQVV9EQURESV9XT1JLQVJPVU5EUyB1bnN1cHBvcnRlZA0K
PiB3aXRob3V0IC1tc3ltMzIiIGVycm9yLg0KPg0KPiBNb3Jlb3ZlciwgSSBhbHNvIGlkZW50
aWZpZWQgYW4gdW5uZWNlc3NhcnkgY2hlY2sgZm9yIEtCVUlMRF9TWU0zMg0KPiBpbiB0aGlz
IE1ha2VmaWxlIHNlY3Rpb24uIEVsaW1pbmF0ZSBpdCBmb3IgY29kZSBzaW1wbGlmaWNhdGlv
bi4NCj4NCj4gTk9URToNCj4NCj4gSXQgaXMgcGFydGljdWxhcmx5IGltcG9ydGFudCB0byBu
b3RlIHRoYXQgdGhpcyBjb2RlIGZpeCBkb2VzIG5vdA0KPiBpbXBseSB0aGF0IHdlIGhhdmUg
cmVzb2x2ZWQgdGhlIHByb2JsZW0gZW50aXJlbHkuDQo+DQo+IEluIGZhY3QsIHRoZSBlbnRp
cmUgYXBwbGljYXRpb24gb2YgY2Mtb3B0aW9uIGFuZCBpdHMgYXV4aWxpYXJ5DQo+IGNvbW1h
bmRzIHdpdGhpbiB0aGUga2VybmVsIGNvZGViYXNlIGN1cnJlbnRseSBjYXJyaWVzIHNpZ25p
ZmljYW50DQo+IHJpc2suDQo+DQo+IFdoZW4gd2UgZXhlY3V0ZSBtYWtlIG1vZHVsZXNfaW5z
dGFsbCwgdGhlIE1ha2VmaWxlIGZvciB0aGUNCj4gY29ycmVzcG9uZGluZyBhcmNoaXRlY3R1
cmUgdW5kZXIgYXJjaC9zdWJhcmNoZXMvTWFrZWZpbGUgaXMNCj4gaW52YXJpYWJseSBpbmNs
dWRlZC4gV2l0aGluIHRoZXNlIGZpbGVzLCB0aGVyZSBhcmUgbnVtZXJvdXMNCj4gdXNhZ2Vz
IG9mIGNjLW9wdGlvbiBhbmQgaXRzIGF1eGlsaWFyeSBjb21tYW5kcywgYWxsIG9mIHdoaWNo
IHdpbGwNCj4gcmV0dXJuIGVtcHR5IHN0cmluZ3MuIFRoZSByZWFzb24gb3RoZXIgYXJjaGl0
ZWN0dXJlcyBjYW4NCj4gc3VjY2Vzc2Z1bGx5IGNvbXBsZXRlIGNvbXBpbGF0aW9uIHVuZGVy
IHRoZXNlIGNpcmN1bXN0YW5jZXMgaXMNCj4gcHVyZWx5IGJlY2F1c2UgdGhleSBkbyBub3Qs
IHVubGlrZSBNSVBTLCBjaGVjayB0aGUgcmV0dXJuIHZhbHVlcw0KPiBvZiBjYy1vcHRpb24g
YW5kIGl0cyBhdXhpbGlhcnkgY29tbWFuZHMgd2l0aGluIHRoZWlyIE1ha2VmaWxlcw0KPiBh
bmQgaGFsdCB0aGUgY29tcGlsYXRpb24gcHJvY2VzcyB3aGVuIHRoZSBleHBlY3RlZCByZXN1
bHRzIGFyZQ0KPiBub3QgcmVjZWl2ZWQuDQo+DQo+IEEgZmVhc2libGUgYXBwcm9hY2ggdG8g
cmVtZWRpYXRpb24gbWlnaHQgYmUgdG8gZW5jYXBzdWxhdGUgYWxsDQo+IHVzYWdlcyBvZiBj
Yy1vcHRpb24gYW5kIGl0cyBhdXhpbGlhcnkgY29tbWFuZHMgd2l0aGluIGNvbmRpdGlvbmFs
DQo+IHN0YXRlbWVudHMgYWNyb3NzIGFsbCBhcmNoaXRlY3R1cmUgTWFrZWZpbGVzLCBwcmV2
ZW50aW5nIHRoZWlyDQo+IGV4ZWN1dGlvbiBlbnRpcmVseSBkdXJpbmcgbWFrZSBtb2R1bGVz
X2luc3RhbGwuDQo+DQo+IEhvd2V2ZXIsIHRoaXMgd291bGQgbGVhZCB0byBhIG1hc3NpdmUg
bnVtYmVyIG9mIGluZWxlZ2FudA0KPiBtb2RpZmljYXRpb25zLCBhbmQgdGhlc2UgYnJvYWRl
ciBpbXBsaWNhdGlvbnMgbWF5IHJlcXVpcmUNCj4gZGVsaWJlcmF0aW9uIGJ5IE1hc2FoaXJv
IFlhbWFkYS4NCj4NCj4gUmVnYXJkbGVzcywgdGhpcyBkb2VzIG5vdCBwcmVjbHVkZSB1cyBm
cm9tIGFkZHJlc3NpbmcgdGhlDQo+IGlzc3VlIG9uIE1JUFMgZmlyc3QuDQo+DQo+IExpbms6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC80MTEwN0U2RDNBMTI1MDQ3KzIwMjUwMjEx
MTM1NjE2LjE4MDc5NjYtMS13YW5neXVsaUB1bmlvbnRlY2guY29tLw0KPiBMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvRjQ5RjVFRTk5NzVGMjlFQSsyMDI1MDIxNDA5NDc1
OC4xNzIwNTUtMS13YW5neXVsaUB1bmlvbnRlY2guY29tLw0KPiBMaW5rOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvOEFCQkYzMjM0MTRBRUY5MysyMDI1MDIxNzE0MjU0MS40ODE0
OS0xLXdhbmd5dWxpQHVuaW9udGVjaC5jb20vDQo+DQo+DQo+IFsgUGFydCAyIF06IE1JUFM6
IGRlY3N0YXRpb25fNjRfZGVmY29uZmlnOiBDb21waWxlIHRoZSBrZXJuZWwgd2l0aCB3YXJu
aW5ncyBhcyBlcnJvcnMNCj4NCj4gUGF0Y2ggKCJNSVBTOiBkZWM6IE9ubHkgY2hlY2sgLW1z
eW0zMiB3aGVuIG5lZWQgY29tcGlsZXIiKSBhbGxvd3MNCj4gdXMgdG8gY29tcGlsZSBrZXJu
ZWwgaW1hZ2UgcGFja2FnZXMgd2l0aCBkZWNzdGF0aW9uXzY0X2RlZmNvbmZpZy4NCj4NCj4g
SG93ZXZlciwgY29tcGlsYXRpb24gd2FybmluZ3MgcmVtYWluIGR1cmluZyB0aGUgYnVpbGQu
DQo+DQo+IEFkZHJlc3MgdGhlc2Ugd2FybmluZ3MgYW5kIGVuYWJsZSBDT05GSUdfV0VSUk9S
IGZvciBkZWNzdGF0aW9uXzY0X2RlZmNvbmZpZy4NCj4NCj4gTGluazogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzQ4N0NFOEFBOTM3NjIxRTIrMjAyNTAyMTgxMjUxMDEuNjYzOTgw
LTEtd2FuZ3l1bGlAdW5pb250ZWNoLmNvbS8NCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsL0VBMEFGQjE1RERDRjY1QzErMjAyNTAyMjcxNDE5NDkuMTEyOTUzNi0xLXdh
bmd5dWxpQHVuaW9udGVjaC5jb20vDQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8zMDNFRkQ2QkZCREFDN0M4KzIwMjUwMzA1MDMzNDM2LjMxMjE0LTEtd2FuZ3l1bGlA
dW5pb250ZWNoLmNvbS8NCj4NCj4NCj4gWyBDaGFuZ2Vsb2c6IF0NCj4NCj4gICAqdjEtPnYy
OiBBZGQgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kncyAiUmV2aWV3ZWQtYnkiIHRhZyBpbiBw
YXRjaDMuDQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8xMTc0MEIwMUU2
NTlDQUZGKzIwMjUwNDA3MDczMTU4LjQ5MzE4My0xLXdhbmd5dWxpQHVuaW9udGVjaC5jb20v
DQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC84ZGNiNWM2ZC1iZTRmLTQ4
OTEtYTk5OS0xMzdkNTNlZGZjMDVAbGluYXJvLm9yZy8NCj4NCj4gV2FuZ1l1bGkgKDYpOg0K
PiAgICBNSVBTOiBkZWM6IE9ubHkgY2hlY2sgLW1zeW0zMiB3aGVuIG5lZWQgY29tcGlsZXIN
Cj4gICAgTUlQUzogRWxpbWluYXRlIFJlZHVuZGFudCBLQlVJTERfU1lNMzIgQ2hlY2tzDQo+
ICAgIE1JUFM6IGRlYzogQ3JlYXRlIHJlc2V0LmgNCj4gICAgTUlQUzogZGVjOiBSZW1vdmUg
ZGVjX2lycV9kaXNwYXRjaCgpDQo+ICAgIE1JUFM6IGRlY3N0YXRpb25fNjRfZGVmY29uZmln
OiBVcGRhdGUgY29uZmlncyBkZXBlbmRlbmNpZXMNCj4gICAgTUlQUzogZGVjc3RhdGlvbl82
NF9kZWZjb25maWc6IENvbXBpbGUgdGhlIGtlcm5lbCB3aXRoIHdhcm5pbmdzIGFzDQo+ICAg
ICAgZXJyb3JzDQo+DQo+ICAgYXJjaC9taXBzL01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgNiArKy0tDQo+ICAgYXJjaC9taXBzL2NvbmZpZ3MvZGVjc3RhdGlvbl82NF9k
ZWZjb25maWcgfCA0MyArKysrKysrKystLS0tLS0tLS0tLS0tLQ0KPiAgIGFyY2gvbWlwcy9k
ZWMvaW50LWhhbmRsZXIuUyAgICAgICAgICAgICAgIHwgIDIgKy0NCj4gICBhcmNoL21pcHMv
ZGVjL3Byb20vaW5pdC5jICAgICAgICAgICAgICAgICB8ICAzICstDQo+ICAgYXJjaC9taXBz
L2RlYy9yZXNldC5jICAgICAgICAgICAgICAgICAgICAgfCAgMiArKw0KPiAgIGFyY2gvbWlw
cy9kZWMvc2V0dXAuYyAgICAgICAgICAgICAgICAgICAgIHwgMTUgKystLS0tLS0NCj4gICBh
cmNoL21pcHMvaW5jbHVkZS9hc20vZGVjL3Jlc2V0LmggICAgICAgICB8IDIwICsrKysrKysr
KysrDQo+ICAgNyBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCA0NCBkZWxldGlv
bnMoLSkNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9taXBzL2luY2x1ZGUvYXNtL2Rl
Yy9yZXNldC5oDQo+DQotLSANCldhbmdZdWxpDQo=
--------------0h1pXDOEcfzHJPxW8vqcdnBv
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

--------------0h1pXDOEcfzHJPxW8vqcdnBv--

--------------RgbllARWsLlZYSThzRw90KaD--

--------------6OmAPHmhuwYa09o3Kw770IMo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCaGtwBAUDAAAAAAAKCRDF2h8wRvQL7haJ
AQCImMeUp5U97CUX9OHDlotIOrnmhCfK2I0kpRlJV0HDLAD8DVxY0CYPjuiLz3MKNtOKhFCNOxnI
U/CGZ+vucIhr1go=
=Mc5F
-----END PGP SIGNATURE-----

--------------6OmAPHmhuwYa09o3Kw770IMo--


