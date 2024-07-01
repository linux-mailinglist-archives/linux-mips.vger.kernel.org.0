Return-Path: <linux-mips+bounces-4054-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 634BD91D5ED
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 04:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D78D41F21852
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 02:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004D28BF7;
	Mon,  1 Jul 2024 02:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="bsp8Wiv6"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B991366
	for <linux-mips@vger.kernel.org>; Mon,  1 Jul 2024 02:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719799647; cv=none; b=EdyxxrreG0KQbVU31aEHuQRPj54wMHon4DRwgmoEfJLVYqXyztlC1fEXG0077GQoujoqFuMnWGUHnfBIJHuUPQ+nuvVj7a4gzYF7/eU/iL78Q4/h4YPyiLbf5pM7G/Ka7lOhGkXsNtCGLZroVM6BajN32tHqYTKxqqRVqvHwNzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719799647; c=relaxed/simple;
	bh=3vH1k6mSejPL+WX7hJiNUo2jg55Hjah/bviToUN6gZc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rTbwTYYVXTEUq0O25GvrVDW8qiEYV2NAGe8oMG4growQXxZPn9SIB+1szxYr40d4aHY4B7yXjEbqmhKYCSH9mrrp4bw96Vb8viHXtJkEzarl0WTCesncS30ZHgKGW4Ct+M/5Ljc5rMXvo+znuOslnV6uLf6H3AcvG1mEm4ij7/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=bsp8Wiv6; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 111162C02E1;
	Mon,  1 Jul 2024 14:07:22 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719799642;
	bh=3vH1k6mSejPL+WX7hJiNUo2jg55Hjah/bviToUN6gZc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=bsp8Wiv6BmdsKhz9FOOPsCesiWAw9YDY7aRMyklyhJ6QQXh//hWEIC/0tbW18XsdI
	 IcULMQKNKihQmJWYozb25p4lmE7QDeX2rRpMK9XR0AUdQjORlGaXvGgZOA86gvIvV4
	 N+n54Ipfnhdvld0efLeMrlQD+gnRZMo5966dqxWLgn7pAWnRmsuDVcYa1VNFXUHj6f
	 yAMSloiDRIxxgka9metepczJlO5MJdNbRL8Ha9xI1AgrLeFnaemZHoNQzCr1lJvaJ7
	 fIdD+wH1uHe7CMXzjqp3COWj2dqlLDldi7H5nFiJ9FeeLH8mAdqB+g9htqrcHZB1iZ
	 MKKNpOfX+X8Ag==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66820f5a0000>; Mon, 01 Jul 2024 14:07:22 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Mon, 1 Jul 2024 14:07:21 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Mon, 1 Jul 2024 14:07:21 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Mon, 1 Jul 2024 14:07:21 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Sander Vanheule <sander@svanheule.net>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "tsbogend@alpha.franken.de"
	<tsbogend@alpha.franken.de>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "paulburton@kernel.org" <paulburton@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "mail@birger-koblitz.de"
	<mail@birger-koblitz.de>, "bert@biot.com" <bert@biot.com>, "john@phrozen.org"
	<john@phrozen.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "kabel@kernel.org"
	<kabel@kernel.org>, "ericwouds@gmail.com" <ericwouds@gmail.com>, "Markus
 Stockhausen" <markus.stockhausen@gmx.de>
Subject: Re: [PATCH v3 7/9] clocksource: realtek: Add timer driver for
 rtl-otto platforms
Thread-Topic: [PATCH v3 7/9] clocksource: realtek: Add timer driver for
 rtl-otto platforms
Thread-Index: AQHayEslEo613VNYNk2gJ1HCuf0QnrHedcAAgAHnT4A=
Date: Mon, 1 Jul 2024 02:07:21 +0000
Message-ID: <5c496019-b2ff-4b65-93dd-1184aa4d776d@alliedtelesis.co.nz>
References: <20240627043317.3751996-1-chris.packham@alliedtelesis.co.nz>
 <20240627043317.3751996-8-chris.packham@alliedtelesis.co.nz>
 <e0f0f6ceb37225dd3d85038773b09c7ceee96499.camel@svanheule.net>
In-Reply-To: <e0f0f6ceb37225dd3d85038773b09c7ceee96499.camel@svanheule.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9E2A34E70803A4FABE270930AB84DDD@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=66820f5a a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=4kmOji7k6h8A:10 a=jU52IrjdAAAA:8 a=VwQbUJbxAAAA:8 a=yCIpqFjWN3u_uuX1nyQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=udjdHy_fWrGJRxLc5KTh:22 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0

DQpPbiAzMC8wNi8yNCAwOTowMywgU2FuZGVyIFZhbmhldWxlIHdyb3RlOg0KPiBIaSBDaHJpcywN
Cj4NCj4gT24gVGh1LCAyMDI0LTA2LTI3IGF0IDE2OjMzICsxMjAwLCBDaHJpcyBQYWNraGFtIHdy
b3RlOg0KPj4gVGhlIHRpbWVyL2NvdW50ZXIgYmxvY2sgb24gdGhlIFJlYWx0ZWsgU29DcyBwcm92
aWRlcyB1cCB0byA1IHRpbWVycy4gSXQNCj4+IGFsc28gaW5jbHVkZXMgYSB3YXRjaGRvZyB0aW1l
ciBidXQgdGhpcyBpc24ndCBiZWluZyB1c2VkIGN1cnJlbnRseSAoaXQNCj4+IHdpbGwgYmUgYWRk
ZWQgYXMgYSBzZXBhcmF0ZSB3ZHQgZHJpdmVyKS4NCj4gRG8geW91IG1lYW4gdGhlIHdhdGNoZG9n
IHRpbWVyIHN1cHBvcnRlZCBieSBkcml2ZXJzL3dhdGNoZG9nL3JlYWx0ZWtfb3R0b193ZHQuYz8g
T3IgYXJlDQo+IHlvdSByZWZlcnJpbmcgdG8gYW5vdGhlciB3YXRjaGRvZyB0aW1lcj8NCg0KWWVz
IHJlYWx0ZWtfb3R0b193ZHQuYy4gSSB0aG91Z2h0IHRoYXQgd2FzIG9ubHkgb24gb3BlbndydCBi
dXQgbG9va3MgDQpsaWtlIHlvdSd2ZSBhbHJlYWR5IGxhbmRlZCB0aGF0IG9uZS4gSSdsbCByZXdv
cmQgbXkgbWVzc2FnZSB0byByZWZsZWN0IHRoYXQuDQoNCj4+IE9uZSB0aW1lciB3aWxsIGJlIHVz
ZWQgcGVyIENQVSBhcyBhIGxvY2FsIGNsb2NrIGV2ZW50IGdlbmVyYXRvci4gQW4NCj4+IGFkZGl0
aW9uYWwgdGltZXIgd2lsbCBiZSB1c2VkIGFzIGFuIG92ZXJhbCBzdGFibGUgY2xvY2tzb3VyY2Uu
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTWFya3VzIFN0b2NraGF1c2VuIDxtYXJrdXMuc3RvY2to
YXVzZW5AZ214LmRlPg0KPj4gU2lnbmVkLW9mZi1ieTogU2FuZGVyIFZhbmhldWxlIDxzYW5kZXJA
c3ZhbmhldWxlLm5ldD4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBh
Y2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCj4+IC0tLQ0KPiBGb3IgcmVmZXJlbmNlLCBJIHN1
Ym1pdHRlZCBhIGRyaXZlciBmb3IgdGhlIHNhbWUgaGFyZHdhcmUgYmFjayBpbiAyMDIyLCBidXQg
ZGlkbid0IG1hbmFnZQ0KPiB0byBmb2xsb3cgdXAgdG8gZmluYWxpemUgdGhlIHN1Ym1pc3Npb246
DQo+DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9jb3Zlci4xNjQyMzY5MTE3LmdpdC5z
YW5kZXJAc3ZhbmhldWxlLm5ldC8NCk9LIHRoYW5rcyBmb3IgdGhlIGxpbmsuIEknbGwgdHJ5IGFu
ZCBtYWtlIHN1cmUgSSdtIG5vdCByZWhhc2hpbmcgdGhpbmdzIA0KdGhhdCBoYXZlIGFscmVhZHkg
YmVlbiBkaXNjdXNzZWQuDQoNCj4+ICsNCj4+ICsvKiBNb2R1bGUgaW5pdGlhbGl6YXRpb24gcGFy
dC4gKi8NCj4+ICtzdGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IHRpbWVyX29mLCBydHRtX3Rv
KSA9IHsNCj4+ICsJLmZsYWdzCQkJCT0gVElNRVJfT0ZfQkFTRSB8IFRJTUVSX09GX0NMT0NLIHwN
Cj4+IFRJTUVSX09GX0lSUSwNCj4+ICsJLm9mX2lycSA9IHsNCj4+ICsJCS5mbGFncwkJCT0gSVJR
Rl9QRVJDUFUgfCBJUlFGX1RJTUVSLA0KPiBJbiB0aGUgb3JpZ2luYWwgcmV2aWV3IG9mIHRoaXMg
Y29kZSwgSSBoYWQgc29tZSBkb3VidHMgYWJvdXQgdGhlIHVzZSBvZiBJUlFGX1BFUkNQVS4gTWF5
YmUNCj4gdGhlIHBlb3BsZSBpbiBDYyBjYW4gc2hlZCBzb21lIGxpZ2h0IG9uIHRoaXMuDQo+DQo+
IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIHRoZSBTb0MgaW50ZXJydXB0cyB0aGVzZSB0aW1l
cnMgdXNlIGFyZSBub3QgcGVyLWNwdSBpbnRlcnJ1cHRzLg0KPiAoRm9yIGNvbXBhcmlzb24sIEFG
QUlDVCB0aGUgTUlQUyBDUFUgaW50ZXJydXB0cyBhcmUpDQoNCkknbSBub3QgZXhhY3RseSBzdXJl
IGVpdGhlciBhbmQgSSd2ZSBvbmx5IGdvdCB0aGUgc2luZ2xlIGNvcmUgUlRMOTMwMiB0byANCnRl
c3Qgd2l0aCBzbyBpZiB0aGVyZSB3ZXJlIHNvbWUgZGlmZmVyZW5jZSBJIG1heSBub3Qgbm90aWNl
LiBFdmVudHVhbGx5IA0Kd2UncmUgcGxhbm5pbmcgYSBSVEw5MzF4IGJhc2VkIGJvYXJkIHNvIHRo
YXQgbWF5IGJlIHNvbWV0aGluZyBJIGNhbiANCmNoZWNrIHRoZW4uDQoNCj4+ICsJCS5oYW5kbGVy
CQk9IHJ0dG1fdGltZXJfaW50ZXJydXB0LA0KPj4gKwl9LA0KPj4gKwkuY2xrZXZ0ID0gew0KPj4g
KwkJLnJhdGluZwkJCT0gNDAwLA0KPj4gKwkJLmZlYXR1cmVzCQk9IENMT0NLX0VWVF9GRUFUX1BF
UklPRElDIHwNCj4+IENMT0NLX0VWVF9GRUFUX09ORVNIT1QsDQo+IElmIHRoZSB1c2Ugb2YgSVJR
Rl9QRVJDUFUgaXMgYXBwcm9wcmlhdGUsIEkgd29uZGVyIGlmIHRoZSBkcml2ZXIgc2hvdWxkIGFs
c28gdXNlDQo+IENMT0NLX0VWVF9GRUFUX1BFUkNQVS4NCj4NCj4NCj4gQmVzdCwNCj4gU2FuZGVy
DQo+

