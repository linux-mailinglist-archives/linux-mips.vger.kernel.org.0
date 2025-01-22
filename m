Return-Path: <linux-mips+bounces-7573-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD60BA19A06
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2025 21:53:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DDA13A9B10
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2025 20:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BCE1C5496;
	Wed, 22 Jan 2025 20:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="QM7fOA/M"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085471BBBE3
	for <linux-mips@vger.kernel.org>; Wed, 22 Jan 2025 20:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737579200; cv=none; b=nc8hreqAxMjZhm9c6JSh0mCQdGJCiReYxAEWwL4dxq6cSvlCtsTdA+9UFIgV2MGrVbOcR2eQbx50RfXAN8MqqrgNgx6jKXwQ0km9b0C1xjYPUkCeDRWzg3kLaDBheAljfKXCblxqFa/mu5HDNuzlMB/+X2wSw38KDH3vq6h/mjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737579200; c=relaxed/simple;
	bh=iCxCAx6ohnaH68e+Tgm1pRg7x5ZdMVCV9KhGCrGWUIk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KYxXdA3HQId6BE3WLNjI1uiyIkjLz81rIQKKmAdCoed+wZtnz3DoexK+BNmYy6jnngNBL+Afg8SOHlqGLx29S89S9cUBlH8+HaOjkWUXAAblhUCFt2S7wi731YUhawAeLukffw1LFJhxySSaK4239CTj3DQxTZ74INQVDJK8mso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=QM7fOA/M; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E21172C0B9B;
	Thu, 23 Jan 2025 09:53:08 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1737579188;
	bh=iCxCAx6ohnaH68e+Tgm1pRg7x5ZdMVCV9KhGCrGWUIk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=QM7fOA/M9b5OQEFRDAj7DWSKC0oyjDg1vDpNyp6okhhxP4BIE3ePuHIVBMB3j6Z4L
	 ePHn1pVW+6GdXMYwsvQtKgWA5irYhrOpzAXmygZyGZtKuPrx+kGUD38nhgfGha1T0u
	 Kh/zyiMRNnxubbKb2FkIPyBU7m3QiBfXAQ6tIK7uMF9HMri3QCdnc0tuYDdRj0sm53
	 vG5ynwng3F2jrgjwAme655kRnnDebtqcS0YWvqZdnHsfIRLk8kJV3WUylstxonpjRw
	 9duS6uM8klwQmwgOiSCKlYnQlUlWNnNv9JgSi0F+EpiR8XNQzObh7YXa1mP9FrfQYi
	 4edx3qKl7/6VA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67915ab40001>; Thu, 23 Jan 2025 09:53:08 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 23 Jan 2025 09:53:08 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Thu, 23 Jan 2025 09:53:08 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "lee@kernel.org" <lee@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "tsbogend@alpha.franken.de"
	<tsbogend@alpha.franken.de>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, "sander@svanheule.net"
	<sander@svanheule.net>, "markus.stockhausen@gmx.de"
	<markus.stockhausen@gmx.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: mfd: Add MDIO interface to
 rtl9301-switch
Thread-Topic: [PATCH v4 2/4] dt-bindings: mfd: Add MDIO interface to
 rtl9301-switch
Thread-Index: AQHbavAdfrwa1e98nEWkvQh+G18FzLMhm3mAgADUAAA=
Date: Wed, 22 Jan 2025 20:53:08 +0000
Message-ID: <db76d5ab-3eda-439d-8b92-c0423d1e39c8@alliedtelesis.co.nz>
References: <20250120040214.2538839-1-chris.packham@alliedtelesis.co.nz>
 <20250120040214.2538839-3-chris.packham@alliedtelesis.co.nz>
 <20250122-macho-flat-sawfly-7ca93d@krzk-bin>
In-Reply-To: <20250122-macho-flat-sawfly-7ca93d@krzk-bin>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FD9D3F406CDB94D91BF870C48475349@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=67915ab4 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=SNri9qoxPTwurTm3CgAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

DQpPbiAyMi8wMS8yMDI1IDIxOjE0LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBPbiBN
b24sIEphbiAyMCwgMjAyNSBhdCAwNTowMjoxMlBNICsxMzAwLCBDaHJpcyBQYWNraGFtIHdyb3Rl
Og0KPj4gVGhlIE1ESU8gY29udHJvbGxlciBpcyBwYXJ0IG9mIHRoZSBzd2l0Y2ggb24gdGhlIFJU
TDkzMDAgZmFtaWx5IG9mDQo+PiBkZXZpY2VzLiBBZGQgYSAkcmVmIHRvIHRoZSBtZmQgYmluZGlu
ZyBmb3IgdGhlc2UgZGV2aWNlcy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBQYWNraGFt
IDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+PiAtLS0NCj4+DQo+IFlvdSBu
ZWVkIHRvIGV4cGxhaW4gbWVyZ2luZyBkZXBlbmRlbmNpZXMuIE5vdGhpbmcgaW4gY292ZXIgbGV0
dGVyLA0KPiBub3RoaW5nIGhlcmUsIGJ1dCB0aGlzICpDQU5OT1QqIGJlIG1lcmdlZCBpbmRlcGVu
ZGVudGx5Lg0KT0suIEknbGwgbWFrZSBzdXJlIHRvIGFkZCBhIG5vdGUgaGVyZSBhbmQgdG8gdGhl
IHNlcmllcyBjb3ZlciBsZXR0ZXIuDQo+PiBOb3RlczoNCj4+ICAgICAgQ2hhbmdlcyBpbiB2NDoN
Cj4+ICAgICAgLSBUaGVyZSBpcyBhIHNpbmdsZSBNRElPIGNvbnRyb2xsZXIgdGhhdCBoYXMgTURJ
TyBidXNlcyBhcyBjaGlsZHJlbg0KPj4gICAgICBDaGFuZ2VzIGluIHYzOg0KPj4gICAgICAtIE5v
bmUNCj4+ICAgICAgQ2hhbmdlcyBpbiB2MjoNCj4+ICAgICAgLSBOb25lDQo+Pg0KPj4gICAuLi4v
YmluZGluZ3MvbWZkL3JlYWx0ZWsscnRsOTMwMS1zd2l0Y2gueWFtbCAgfCAyNCArKysrKysrKysr
KysrKysrKysrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvcmVhbHRl
ayxydGw5MzAxLXN3aXRjaC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21mZC9yZWFsdGVrLHJ0bDkzMDEtc3dpdGNoLnlhbWwNCj4+IGluZGV4IGYwNTMzMDNhYjFlNi4u
YzE5ZDJjMjA5NDM0IDEwMDY0NA0KPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21mZC9yZWFsdGVrLHJ0bDkzMDEtc3dpdGNoLnlhbWwNCj4+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvcmVhbHRlayxydGw5MzAxLXN3aXRjaC55YW1s
DQo+PiBAQCAtMjgsNiArMjgsOSBAQCBwcm9wZXJ0aWVzOg0KPj4gICAgIHJlZzoNCj4+ICAgICAg
IG1heEl0ZW1zOiAxDQo+PiAgIA0KPj4gKyAgbWRpby1jb250cm9sbGVyOg0KPj4gKyAgICAkcmVm
OiAvc2NoZW1hcy9uZXQvcmVhbHRlayxydGw5MzAxLW1kaW8ueWFtbCMNCj4+ICsNCj4+ICAgICAn
I2FkZHJlc3MtY2VsbHMnOg0KPj4gICAgICAgY29uc3Q6IDENCj4+ICAgDQo+PiBAQCAtMTEwLDUg
KzExMywyNiBAQCBleGFtcGxlczoNCj4+ICAgICAgICAgICAgIH07DQo+PiAgICAgICAgICAgfTsN
Cj4+ICAgICAgICAgfTsNCj4+ICsNCj4+ICsgICAgICBtZGlvLWNvbnRyb2xsZXIgew0KPiBObywg
bm8gcmVzb3VyY2VzIGhlcmUsIG5vIHVuaXQgYWRkcmVzcy4gTG9vayBhdCBvdGhlciBub2RlcyAt
IHRoZXkgaGF2ZQ0KPiB0aGUgcmVzb3VyY2UsIHRoZSBhZGRyZXNzLiBNaXhpbmcgc3VjaCBub2Rl
cyBpcyBjbGVhciBpbmRpY2F0aW9uIHRoaXMgaXMNCj4gbm90IGNvcnJlY3QgaGFyZHdhcmUgZGVz
Y3JpcHRpb24gYW5kIHlvdSBkbyB0aGlzIG9ubHkgZm9yIExpbnV4Lg0KPg0KPiBGb2xkIGNoaWxk
IGRldmljZSBpbnRvIHBhcmVudC4NCg0KSW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UgYWxsIHRoZSBt
ZGlvIHN0dWZmIGlzIGFjdHVhbGx5IGNvbnRhaW5lZCB0byBhIA0KcmFuZ2Ugc3RhcnRpbmcgYXQg
b2Zmc2V0IDB4Y2EwMC4gSSBkcm9wcGVkIGl0IGJlY2F1c2UgaXQgd2FzIHNpbXBsZXIgaW4gDQp0
aGUgZHJpdmVyIHRvIHVzZSB0aGUgZnVsbCAxNi1iaXQgYWRkcmVzcyByYXRoZXIgdGhhbiB0cnlp
bmcgdG8gdXNlIA0Kb2Zmc2V0cyBmcm9tIHRoZSBiYXNlIGFkZHJlc3MgdGhhdCBkaWRuJ3QgY29y
cmVzcG9uZCB0byB0aGUgZGF0YXNoZWV0LiANCkFzIHlvdSd2ZSBoaWdobGlnaHRlZCB0aGF0J3Mg
bWFraW5nIHRoZSBkdC1iaW5kaW5nIGltcG9zZSBkcml2ZXIgDQpzcGVjaWZpY3Mgc28gd291bGQg
YWRkaW5nIGJhY2sgYG1kaW8tY29udHJvbGxlckBjYTAwYCBhbmQgYHJlZyA9IDwweGNhMDAgDQow
eDIwMD47YCBiZSBPSyBldmVuIGlmIHRoZSBkcml2ZXIgZG9lc24ndCBhY3R1YWxseSB1c2UgdGhl
bT8NCg0KPg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPg==

