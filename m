Return-Path: <linux-mips+bounces-4046-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C7691D4A1
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 00:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F69B1C20B9B
	for <lists+linux-mips@lfdr.de>; Sun, 30 Jun 2024 22:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA4B768FD;
	Sun, 30 Jun 2024 22:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="MVFocY70"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76F8433DC
	for <linux-mips@vger.kernel.org>; Sun, 30 Jun 2024 22:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719787150; cv=none; b=LfxoOlX+pEKpp/dKQfyRfuoXNQopiRFRU8xp5UoBA1E9xCegrL+eJl273pD7BPE9yBPJnkHcKEf8XKtatUgwIqk3TGYGEh0UX0tm2Xmrx5dpskkp5Pmb6fHvDT8Sp1agrO8JWEBWMU1I73XOhLCYGTRinZoVev/UfIrzXPFoPNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719787150; c=relaxed/simple;
	bh=EBst8jDX0m2x2Os+ldGHtnWSdwL2qYUeD6r0tInvt0U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r8sGu2RSVRAyGg7+FJOTIBvfjrRKyYfCc0Lmi9mHex2AvHq0fmGQZWFuPr8r3dCDysnIlo24iiHgdyWdg7cgBLQifS/oS9R4ZeLmMCO4+Cd68+GXResI1G4O1VqxCaG/v6KNJPuoTTNMahuW0msbIt0PPBlkgij0T+uMWdhe/Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=MVFocY70; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 99DAF2C0659;
	Mon,  1 Jul 2024 10:39:05 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719787145;
	bh=EBst8jDX0m2x2Os+ldGHtnWSdwL2qYUeD6r0tInvt0U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=MVFocY707JW5a24g5yP6oiGumC21p/ceRhRQ+uM/aTYxMFZuy8aT0i4ge6NDzC2k0
	 BFcpHtW+i+VrA5j/1KwoUyZ1C71S1BMtIPnuZ7Q7zmt2OxTtwSAcuhYi/2fyOmbg2c
	 6lPzxbRV5QabJyIfULVbRufRpouPcGe7hjtdFZ8esqLhKH8JqmfmpSdd3k7UalRHc7
	 Frhgxf2ChL9ujHzAOjzdG3AAKvU1YsddmHeti4ZiHMkwZbbGy1k1jquRdwiwKzVrBs
	 E4dI5P5tppNm+ntHTVbZqZBWrHBXH0EcmtzydaO0b9a7ivIbqcuNcTy9weqbIXzyOR
	 SgBbIMSn7F30w==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6681de890001>; Mon, 01 Jul 2024 10:39:05 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Mon, 1 Jul 2024 10:39:05 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Mon, 1 Jul 2024 10:39:05 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Mon, 1 Jul 2024 10:39:05 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Rob Herring <robh@kernel.org>
CC: "tglx@linutronix.de" <tglx@linutronix.de>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"paulburton@kernel.org" <paulburton@kernel.org>, "peterz@infradead.org"
	<peterz@infradead.org>, "mail@birger-koblitz.de" <mail@birger-koblitz.de>,
	"bert@biot.com" <bert@biot.com>, "john@phrozen.org" <john@phrozen.org>,
	"sander@svanheule.net" <sander@svanheule.net>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "kabel@kernel.org" <kabel@kernel.org>,
	"ericwouds@gmail.com" <ericwouds@gmail.com>
Subject: Re: [PATCH v3 8/9] mips: generic: add fdt fixup for Realtek reference
 board
Thread-Topic: [PATCH v3 8/9] mips: generic: add fdt fixup for Realtek
 reference board
Thread-Index: AQHayEskKL2U1sX/vU+rjbi3qGT2zbHbGpKAgAUISwA=
Date: Sun, 30 Jun 2024 22:39:04 +0000
Message-ID: <529c73bb-849c-434f-888c-0b010d280424@alliedtelesis.co.nz>
References: <20240627043317.3751996-1-chris.packham@alliedtelesis.co.nz>
 <20240627043317.3751996-9-chris.packham@alliedtelesis.co.nz>
 <CAL_JsqKGJ_MNbfuApdziDusYzYoFC3LD_zqkt1ZkWL4AWkjVrw@mail.gmail.com>
In-Reply-To: <CAL_JsqKGJ_MNbfuApdziDusYzYoFC3LD_zqkt1ZkWL4AWkjVrw@mail.gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <074459658740D44F861E1D1BBC2804CE@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=6681de89 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=4kmOji7k6h8A:10 a=IK1q7cKMemi-JlVpuIUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

DQpPbiAyOC8wNi8yNCAwNTo0OCwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IE9uIFdlZCwgSnVuIDI2
LCAyMDI0IGF0IDEwOjMz4oCvUE0gQ2hyaXMgUGFja2hhbQ0KPiA8Y2hyaXMucGFja2hhbUBhbGxp
ZWR0ZWxlc2lzLmNvLm56PiB3cm90ZToNCj4+IFRoZSBib290bG9hZGVyIHVzZWQgb24gdGhlIFJl
YWx0ZWsgUlRMOTMwMkMgYm9hcmRzIGlzIGFuIGFuY2llbnQgdmVuZG9yDQo+PiBmb3JrIG9mIFUt
Qm9vdCB0aGF0IGRvZXNuJ3QgdW5kZXJzdGFuZCBkZXZpY2UgdHJlZXMuIFNvIHRvIHJ1biBhIG1v
ZGVybg0KPj4ga2VybmVsIGl0IGlzIG5lY2Vzc2FyeSB1c2Ugb25lIG9mIHRoZSBBUFBFTkRFRF9E
VEIgb3B0aW9ucy4NCj4+DQo+PiBXaGVuIGFwcGVuZGluZyB0aGUgRFRCIHRoZSBpbmludHJkIGlu
Zm9ybWF0aW9uLCBpZiBwcmVzZW50LCBuZWVkcyB0byBiZQ0KPj4gaW5zZXJ0ZWQgaW50byB0aGUg
L2Nob3NlbiBkZXZpY2UgdHJlZSBub2RlLiBUaGUgYm9vdGxvYWRlciBwcm92aWRlcyB0aGUNCj4+
IGluaXRyZCBzdGFydC9zaXplIHZpYSB0aGUgZmlybXdhcmUgZW52aXJvbm1lbnQuIEFkZCBhIGZk
dCBmaXh1cCB0aGF0DQo+PiB3aWxsIHVwZGF0ZSB0aGUgZGV2aWNlIHRyZWUgd2l0aCB0aGUgaW5p
dHJkIGluZm9ybWF0aW9uLg0KPiBJcyB0aGlzIHJlYWxseSBzcGVjaWZpYyB0byB0aGlzIGJvYXJk
L3NvYz8NCg0KQmFzZWQgb24gbXkgc2FtcGxlIHNpemUgb2YgMSBJIGNhbid0IHNheS4gSSB0aG91
Z2h0IHRoaXMgd2FzIGEgcXVpcmsgb2YgDQp0aGUgcmVhbHRlayBTREsgdmVyc2lvbiBvZiBVLUJv
b3QgYmVjYXVzZSBpdCdzIGJhc2VkIG9uIHNvbWV0aGluZyBvbGQgDQphbmQgZHQgdW5hd2FyZS4g
SSBkaWQgdGhpbmsgYWJvdXQgcHV0dGluZyB0aGlzIGNvZGUgaW4gYSBtb3JlIGdlbmVyaWMgDQpw
bGFjZSBidXQgaW4gdGhlIGVuZCBJIHdlbnQgd2l0aCBzb21ldGhpbmcgbGVzcyBpbnZhc2l2ZSBm
aWd1cmluZyBpdCANCmNvdWxkIGJlIGV4cGFuZGVkIG9uIGxhdGVyIGlmIG5lZWRlZC4NCg0KPiBJ
IHRoaW5rIHRoZXJlIGFyZSBsb3RzIG9mIE1JUFMgYm9hcmRzIGluIHRoaXMgc3RhdGUuDQoNCklm
IGFueW9uZSBjYW4gY29uZmlybSB0aGF0IEknZCBiZSBoYXBweSB0byBtYWtlIHRoZSB3b3JrYXJv
dW5kIGtpY2sgaW4gDQppZiB0aGUgZndfZW52IGhhcyBhbiBpbml0cmRfc3RhcnQgaW4gaXQuIEkn
bSBub3Qgc3VyZSBpZiB0aGVyZSBpcyBhbnkgDQpyaXNrIGluIHRoYXQgYXBwcm9hY2guIEkgZG9u
J3Qga25vdyBob3cgb3RoZXIgbWlwcyBib2FyZHMgYXJlIGN1cnJlbnRseSANCmJvb3RpbmcgdXNp
bmcgdGhlIGdlbmVyaWMgYm9hcmQgc3VwcG9ydC4NCg0KPiBUaGUgY29kZSB0byBoYW5kbGUgYWxs
IHRoZSBwb3NzaWJsZQ0KPiBjb21iaW5hdGlvbnMgb2YgYm9vdGxvYWRlciBoYW5kb2ZmIGluZm9y
bWF0aW9uIGFuZCBzb3VyY2VzIG9mIERUQiBpcw0KPiBxdWl0ZSB0aGUgbWVzcy4gSnVzdCBmb3Ig
RFRCIHNvdXJjZSB5b3UgaGF2ZSBib290bG9hZGVyIERUQiwgYXBwZW5kZWQNCj4gRFRCLCBvciBi
dWlsdC1pbiBEVEIgKGFuZCB0aGVyZSdzIGV2ZW4gbG9naWMgaWYgeW91IGhhdmUgbXVsdGlwbGUg
b2YNCj4gdGhvc2UpLiBDb250cmFzdCB0aGF0IHRvIGFybTMyICgndGhlIHpvbyIpLCB3aGVyZSB5
b3UgaGF2ZSAyIGNob2ljZXM6DQo+IGJvb3Rsb2FkZXIgRFRCIG9yIGFwcGVuZGVkIERUQiB3aXRo
IGxlZ2FjeSBib290bG9hZGVyIHBhcmFtZXRlcnMNCj4gdHJhbnNmZXJyZWQgdG8gRFRCLiBBbGwg
dGhlIHVnbHluZXNzIGlzIGNvbnRhaW5lZCBhbmQgdGhlIGtlcm5lbCBib290DQo+IGRlYWxzIHdp
dGggMSBwb3NzaWJpbGl0eS4gPC9yYW50Pg0KPg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgUGFj
a2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KPj4gLS0tDQo+Pg0KPj4g
Tm90ZXM6DQo+PiAgICAgIENoYW5nZXMgaW4gdjM6DQo+PiAgICAgIC0gTm9uZQ0KPj4gICAgICBD
aGFuZ2VzIGluIHYyOg0KPj4gICAgICAtIHVwZGF0ZSBjb21wYXRpYmxlIHN0cmluZw0KPj4NCj4+
ICAgYXJjaC9taXBzL2dlbmVyaWMvTWFrZWZpbGUgICAgICAgIHwgIDEgKw0KPj4gICBhcmNoL21p
cHMvZ2VuZXJpYy9ib2FyZC1yZWFsdGVrLmMgfCA4MSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgODIgaW5zZXJ0aW9ucygrKQ0KPj4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgYXJjaC9taXBzL2dlbmVyaWMvYm9hcmQtcmVhbHRlay5jDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9nZW5lcmljL01ha2VmaWxlIGIvYXJjaC9taXBzL2dlbmVy
aWMvTWFrZWZpbGUNCj4+IGluZGV4IDU2MDExZDczODQ0MS4uZWEwZTRhZDVlNjAwIDEwMDY0NA0K
Pj4gLS0tIGEvYXJjaC9taXBzL2dlbmVyaWMvTWFrZWZpbGUNCj4+ICsrKyBiL2FyY2gvbWlwcy9n
ZW5lcmljL01ha2VmaWxlDQo+PiBAQCAtMTMsMyArMTMsNCBAQCBvYmotJChDT05GSUdfTEVHQUNZ
X0JPQVJEX1NFQUQzKSAgICAgICs9IGJvYXJkLXNlYWQzLm8NCj4+ICAgb2JqLSQoQ09ORklHX0xF
R0FDWV9CT0FSRF9PQ0VMT1QpICAgICAgKz0gYm9hcmQtb2NlbG90Lm8NCj4+ICAgb2JqLSQoQ09O
RklHX01BQ0hfSU5HRU5JQykgICAgICAgICAgICAgICAgICAgICArPSBib2FyZC1pbmdlbmljLm8N
Cj4+ICAgb2JqLSQoQ09ORklHX1ZJUlRfQk9BUkRfUkFOQ0hVKSAgICAgICAgICAgICAgICArPSBi
b2FyZC1yYW5jaHUubw0KPj4gK29iai0kKENPTkZJR19NQUNIX1JFQUxURUtfUlRMKSAgICAgICAg
ICs9IGJvYXJkLXJlYWx0ZWsubw0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9nZW5lcmljL2Jv
YXJkLXJlYWx0ZWsuYyBiL2FyY2gvbWlwcy9nZW5lcmljL2JvYXJkLXJlYWx0ZWsuYw0KPj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uY2Q4M2ZiZjE5NjhjDQo+
PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9hcmNoL21pcHMvZ2VuZXJpYy9ib2FyZC1yZWFsdGVr
LmMNCj4+IEBAIC0wLDAgKzEsODEgQEANCj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vci1sYXRlcg0KPiBLZXJuZWwgbGljZW5zZSBieSBkZWZhdWx0IGlzIEdQTC0yLjAt
b25seS4gV2h5IGRvIHNvbWV0aGluZyBkaWZmZXJlbnQ/DQoNCkNvcHkgYW5kIHBhc3RlIGZyb20g
dGhlIGV4aXN0aW5nIGFyY2gvbWlwcy9nZW5lcmljL2JvYXJkLSouYy4gSSdtIGZpbmUgDQp3aXRo
IG1ha2luZyBpdCBHUEwtMi4wLW9ubHkNCg0KPj4gKy8qDQo+PiArICogQ29weXJpZ2h0IChDKSAy
MDI0IEFsbGllZCBUZWxlc2lzDQo+PiArICovDQo+PiArDQo+PiArI2luY2x1ZGUgPGxpbnV4L2Vy
cm5vLmg+DQo+PiArI2luY2x1ZGUgPGxpbnV4L2xpYmZkdC5oPg0KPj4gKyNpbmNsdWRlIDxsaW51
eC9vZl9hZGRyZXNzLmg+DQo+IFlvdSBhcmVuJ3QgdXNpbmcgdGhpcyBoZWFkZXIuDQpBY2suDQo+
PiArI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+PiArDQo+PiArI2luY2x1ZGUgPGFzbS9mdy9m
dy5oPg0KPj4gKyNpbmNsdWRlIDxhc20vbWFjaGluZS5oPg0KPj4gKw0KPj4gK3N0YXRpYyBfX2lu
aXQgaW50IHJlYWx0ZWtfYWRkX2luaXRyZCh2b2lkICpmZHQpDQo+PiArew0KPj4gKyAgICAgICBp
bnQgbm9kZSwgZXJyOw0KPj4gKyAgICAgICB1MzIgc3RhcnQsIHNpemU7DQo+PiArDQo+PiArICAg
ICAgIG5vZGUgPSBmZHRfcGF0aF9vZmZzZXQoZmR0LCAiL2Nob3NlbiIpOw0KPj4gKyAgICAgICBp
ZiAobm9kZSA8IDApIHsNCj4+ICsgICAgICAgICAgICAgICBwcl9lcnIoIi9jaG9zZW4gbm9kZSBu
b3QgZm91bmRcbiIpOw0KPj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PRU5UOw0KPj4gKyAg
ICAgICB9DQo+PiArDQo+PiArICAgICAgIHN0YXJ0ID0gZndfZ2V0ZW52bCgiaW5pdHJkX3N0YXJ0
Iik7DQo+PiArICAgICAgIHNpemUgPSBmd19nZXRlbnZsKCJpbml0cmRfc2l6ZSIpOw0KPj4gKw0K
Pj4gKyAgICAgICBpZiAoc3RhcnQgPT0gMCAmJiBzaXplID09IDApDQo+PiArICAgICAgICAgICAg
ICAgcmV0dXJuIDA7DQo+PiArDQo+PiArICAgICAgIHByX2luZm8oIkFkZGluZyBpbml0cmQgaW5m
byBmcm9tIGVudmlyb25tZW50XG4iKTsNCj4+ICsNCj4+ICsgICAgICAgZXJyID0gZmR0X3NldHBy
b3BfdTMyKGZkdCwgbm9kZSwgImxpbnV4LGluaXRyZC1zdGFydCIsIHN0YXJ0KTsNCj4+ICsgICAg
ICAgaWYgKGVycikgew0KPj4gKyAgICAgICAgICAgICAgIHByX2VycigidW5hYmxlIHRvIHNldCBp
bml0cmQtc3RhcnQ6ICVkXG4iLCBlcnIpOw0KPj4gKyAgICAgICAgICAgICAgIHJldHVybiBlcnI7
DQo+PiArICAgICAgIH0NCj4+ICsNCj4+ICsgICAgICAgZXJyID0gZmR0X3NldHByb3BfdTMyKGZk
dCwgbm9kZSwgImxpbnV4LGluaXRyZC1lbmQiLCBzdGFydCArIHNpemUpOw0KPj4gKyAgICAgICBp
ZiAoZXJyKSB7DQo+PiArICAgICAgICAgICAgICAgcHJfZXJyKCJ1bmFibGUgdG8gc2V0IGluaXRy
ZC1lbmQ6ICVkXG4iLCBlcnIpOw0KPj4gKyAgICAgICAgICAgICAgIHJldHVybiBlcnI7DQo+PiAr
ICAgICAgIH0NCj4+ICsNCj4+ICsgICAgICAgcmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgbWlwc19mZHRfZml4dXAgcmVhbHRla19mZHRfZml4dXBzW10gX19p
bml0Y29uc3QgPSB7DQo+PiArICAgICAgIHsgcmVhbHRla19hZGRfaW5pdHJkLCAiYWRkIGluaXRy
ZCIgfSwNCj4+ICsgICAgICAge30sDQo+PiArfTsNCj4+ICsNCj4+ICtzdGF0aWMgX19pbml0IGNv
bnN0IHZvaWQgKnJlYWx0ZWtfZml4dXBfZmR0KGNvbnN0IHZvaWQgKmZkdCwgY29uc3Qgdm9pZCAq
bWF0Y2hfZGF0YSkNCj4+ICt7DQo+PiArICAgICAgIHN0YXRpYyB1bnNpZ25lZCBjaGFyIGZkdF9i
dWZbMTYgPDwgMTBdIF9faW5pdGRhdGE7DQo+PiArICAgICAgIGludCBlcnI7DQo+PiArDQo+PiAr
ICAgICAgIGlmIChmZHRfY2hlY2tfaGVhZGVyKGZkdCkpDQo+PiArICAgICAgICAgICAgICAgcGFu
aWMoIkNvcnJ1cHQgRFQiKTsNCj4+ICsNCj4+ICsgICAgICAgZndfaW5pdF9jbWRsaW5lKCk7DQo+
PiArDQo+PiArICAgICAgIGVyciA9IGFwcGx5X21pcHNfZmR0X2ZpeHVwcyhmZHRfYnVmLCBzaXpl
b2YoZmR0X2J1ZiksIGZkdCwgcmVhbHRla19mZHRfZml4dXBzKTsNCj4+ICsgICAgICAgaWYgKGVy
cikNCj4+ICsgICAgICAgICAgICAgICBwYW5pYygiVW5hYmxlIHRvIGZpeHVwIEZEVDogJWQiLCBl
cnIpOw0KPj4gKw0KPj4gKyAgICAgICByZXR1cm4gZmR0X2J1ZjsNCj4+ICsNCj4+ICt9DQo+PiAr
DQo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcmVhbHRla19vZl9tYXRjaFtd
IF9faW5pdGNvbnN0ID0gew0KPj4gKyAgICAgICB7DQo+PiArICAgICAgICAgICAgICAgLmNvbXBh
dGlibGUgPSAicmVhbHRlayxydGw5MzAyIiwNCj4+ICsgICAgICAgfSwNCj4+ICsgICAgICAge30N
Cj4+ICt9Ow0KPj4gKw0KPj4gK01JUFNfTUFDSElORShyZWFsdGVrKSA9IHsNCj4+ICsgICAgICAg
Lm1hdGNoZXMgPSByZWFsdGVrX29mX21hdGNoLA0KPj4gKyAgICAgICAuZml4dXBfZmR0ID0gcmVh
bHRla19maXh1cF9mZHQsDQo+PiArfTsNCj4+IC0tDQo+PiAyLjQ1LjINCj4+DQo+Pg==

