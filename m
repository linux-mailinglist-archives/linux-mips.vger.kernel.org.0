Return-Path: <linux-mips+bounces-4056-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F4691D666
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 05:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ED7A1F21552
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 03:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0185EAD2;
	Mon,  1 Jul 2024 03:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Sn105TYe"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D97D534
	for <linux-mips@vger.kernel.org>; Mon,  1 Jul 2024 03:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719802953; cv=none; b=RqPMFUR1/7BZrfIWUroCPOcTPNaFvW4QKsYrxo9oGWuiF1wNPfXIzl1YTiAFhnitDwo4WQh9yia9JZkI+A4bTowpfgGth8WQ+86OEgb8OmAJ0oXaUbgo2DT1gZe8h5khG2kz2gIgsxOhBSljh5ZOrfE4XL/FyHbMdD/L85nFYkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719802953; c=relaxed/simple;
	bh=oQ7rpryzsTz1eIjsSTfHG66pAISA+j+qm8IQAPhoeiM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JSCuPqMBlYdI1/Y9z6Q3koOptD485caCwhhE5ECLqO/gD9V7OfSOfIWT/LcdHvw4XG+kb/zHvzcvPIMFhjySrqYojftH+2fZJ4EikQ3YEPiE8psvpW62xz6k1p6877HC9tNhbHRjNL9VExbtt+60caC22miqWwGNzXcDQbukYTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=Sn105TYe; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E92EF2C02E1;
	Mon,  1 Jul 2024 15:02:27 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719802947;
	bh=oQ7rpryzsTz1eIjsSTfHG66pAISA+j+qm8IQAPhoeiM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Sn105TYeAHC/o4B2ZpXE9H8y4jHNxQlG34B/bweYtuUfBMW/y4QoA1NmeXXBB+xkn
	 fUNOaJdZ6IJQ784GmMpih9vTd3rxW4rLjsZcPtkN+SdSgcEX3Lfu1w32zzedGEDIdH
	 BnsHTsKAQ/M2uqXSWgXg9030cn/V+VXcH3u4D63XozzUn9GWdYyBJWmFYHPopPZRzF
	 9UK1AyfpDLNh1CgDkb7aZv+lm2HiQ9P+L0LrETX4gGYeNllRZHtDuuGUzzjCStZvoo
	 P+83+6yncZBlwJXUNKp6e2GWHrVe34qZSuCgytka4l2UklmvfpgiXKbqIMBQJEvObJ
	 tDtfWmIAJnrfA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66821c430001>; Mon, 01 Jul 2024 15:02:27 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 1 Jul 2024 15:02:27 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Mon, 1 Jul 2024 15:02:27 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Krzysztof Kozlowski <krzk@kernel.org>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "tsbogend@alpha.franken.de"
	<tsbogend@alpha.franken.de>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "paulburton@kernel.org" <paulburton@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "mail@birger-koblitz.de"
	<mail@birger-koblitz.de>, "bert@biot.com" <bert@biot.com>, "john@phrozen.org"
	<john@phrozen.org>, "sander@svanheule.net" <sander@svanheule.net>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "kabel@kernel.org"
	<kabel@kernel.org>, "ericwouds@gmail.com" <ericwouds@gmail.com>
Subject: Re: [PATCH v3 6/9] dt-bindings: interrupt-controller:
 realtek,rtl-intc: Add rtl9300-intc
Thread-Topic: [PATCH v3 6/9] dt-bindings: interrupt-controller:
 realtek,rtl-intc: Add rtl9300-intc
Thread-Index: AQHayEsk886ha4dF906RSsJN+a1s27HacQGAgAWqb4CAAFEEgA==
Date: Mon, 1 Jul 2024 03:02:27 +0000
Message-ID: <0ffcb229-0feb-4bc8-bbb2-6a9143401e88@alliedtelesis.co.nz>
References: <20240627043317.3751996-1-chris.packham@alliedtelesis.co.nz>
 <20240627043317.3751996-7-chris.packham@alliedtelesis.co.nz>
 <8a708add-52a7-4189-b0f1-e2a4c83230a9@kernel.org>
 <1b9f9deb-37b9-4be7-9e95-9ee4f95d3d69@alliedtelesis.co.nz>
In-Reply-To: <1b9f9deb-37b9-4be7-9e95-9ee4f95d3d69@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <79824120C8E8B746804C9A66ACE85205@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=66821c43 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=4kmOji7k6h8A:10 a=Rk-_PRSAtc41h617atMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

DQpPbiAxLzA3LzI0IDEwOjEyLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPg0KPiBPbiAyNy8wNi8y
NCAxOTo0MSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4+IE9uIDI3LzA2LzIwMjQgMDY6
MzMsIENocmlzIFBhY2toYW0gd3JvdGU6DQo+Pj4gQWRkIGEgY29tcGF0aWJsZSBzdHJpbmcgZm9y
IHRoZSBpbnRlcnJ1cHQgY29udHJvbGxlciBmb3VuZCBvbiB0aGUNCj4+PiBydGw5MzB4IFNvQ3Mu
IFRoZSBpbnRlcnJ1cHQgY29udHJvbGxlciBoYXMgcmVnaXN0ZXJzIGZvciBWUEUxIHNvIHRoZXNl
DQo+Pj4gYXJlIGFkZGVkIGFzIGEgc2Vjb25kIHJlZyBjZWxsLg0KPj4+DQo+Pj4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0K
Pj4+IC0tLQ0KPj4+DQo+Pj4gTm90ZXM6DQo+Pj4gwqDCoMKgwqAgQ2hhbmdlcyBpbiB2MzoNCj4+
PiDCoMKgwqDCoCAtIFVzZSBpdGVtcyB0byBkZXNjcmliZSB0aGUgcmVncyBwcm9wZXJ0eQ0KPj4+
IMKgwqDCoMKgIENoYW5nZXMgaW4gdjI6DQo+Pj4gwqDCoMKgwqAgLSBTZXQgcmVnOm1heEl0ZW1z
IHRvIDIgdG8gYWxsb3cgZm9yIFZQRTEgcmVnaXN0ZXJzIG9uIHRoZSANCj4+PiBydGw5MzAwLiBB
ZGQNCj4+PiDCoMKgwqDCoMKgwqAgYSBjb25kaXRpb24gdG8gZW5mb3JjZSB0aGUgb2xkIGxpbWl0
IG9uIG90aGVyIFNvQ3MuDQo+Pj4gwqDCoMKgwqAgLSBDb25ub3IgYW5kIEtyenlzenRvZiBvZmZl
cmVkIGFja3Mgb24gdjEgYnV0IEkgdGhpbmsgdGhlIA0KPj4+IGNoYW5nZXMgaGVyZQ0KPj4+IMKg
wqDCoMKgwqDCoCBhcmUgYmlnIGVub3VnaCB0byB2b2lkIHRob3NlLg0KPj4+DQo+Pj4gwqAgLi4u
L2ludGVycnVwdC1jb250cm9sbGVyL3JlYWx0ZWsscnRsLWludGMueWFtbCB8IDE4IA0KPj4+ICsr
KysrKysrKysrKysrKysrLQ0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IA0KPj4+IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3JlYWx0ZWsscnRsLWlu
dGMueWFtbCANCj4+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1
cHQtY29udHJvbGxlci9yZWFsdGVrLHJ0bC1pbnRjLnlhbWwgDQo+Pj4NCj4+PiBpbmRleCBmYjU1
OTM3MjQwNTkuLmQwZTViZGY0NWQwNSAxMDA2NDQNCj4+PiAtLS0gDQo+Pj4gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvcmVhbHRlayxydGwt
aW50Yy55YW1sDQo+Pj4gKysrIA0KPj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2ludGVycnVwdC1jb250cm9sbGVyL3JlYWx0ZWsscnRsLWludGMueWFtbA0KPj4+IEBAIC0y
NSw2ICsyNSw3IEBAIHByb3BlcnRpZXM6DQo+Pj4gwqDCoMKgwqDCoMKgwqAgLSBpdGVtczoNCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZW51bToNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLSByZWFsdGVrLHJ0bDgzODAtaW50Yw0KPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAtIHJlYWx0ZWsscnRsOTMwMC1pbnRjDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAtIGNvbnN0OiByZWFsdGVrLHJ0bC1pbnRjDQo+Pj4gwqDCoMKgwqDCoMKgwqAgLSBjb25z
dDogcmVhbHRlayxydGwtaW50Yw0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkZXByZWNhdGVkOiB0
cnVlDQo+Pj4gQEAgLTM1LDcgKzM2LDkgQEAgcHJvcGVydGllczoNCj4+PiDCoMKgwqDCoMKgIGNv
bnN0OiAxDQo+Pj4gwqAgwqDCoMKgIHJlZzoNCj4+PiAtwqDCoMKgIG1heEl0ZW1zOiAxDQo+PiBN
aXNzaW5nIG1pbkl0ZW1zIChhcyB0ZXN0aW5nIHdvdWxkIHRlbGwgeW91KQ0KPg0KPiBIbW0gSSBy
ZWFsbHkgZGlkIHRlc3QgdGhpcy4gRXZlbiBub3cgcnVubmluZw0KPg0KPiBgbWFrZSBBUkNIPW1p
cHMgTz1idWlsZF9taXBzIA0KPiBEVF9TQ0hFTUFfRklMRVM9cmVhbHRlayxydGwtaW50Yy55YW1s
OnJlYWx0ZWstcnRsLnlhbWw6cmVhbHRlayxvdHRvLXRpbWVyLnlhbWwgDQo+IGNsZWFuIGR0X2Jp
bmRpbmdfY2hlY2tgIGRvZXNuJ3Qgc2VlbSB0byB5aWVsZCBhbnkgY29tcGxhaW50cy4gQW0gSSAN
Cj4gdGVzdGluZyB0aGlzIHByb3Blcmx5Pw0KDQpMb29rcyBsaWtlIHRoZXJlIGlzIGEgZGlmZmVy
ZW5jZSBiZXR3ZWVuIA0KYERUX1NDSEVNQV9GSUxFUz1yZWFsdGVrLHJ0bC1pbnRjLnlhbWxgIGFu
ZCANCmBEVF9TQ0hFTUFfRklMRVM9cmVhbHRlayxydGwtaW50Yy55YW1sOnJlYWx0ZWstcnRsLnlh
bWw6cmVhbHRlayxvdHRvLXRpbWVyLnlhbWxgLg0KDQo+DQo+DQo+Pg0KPj4+ICvCoMKgwqAgaXRl
bXM6DQo+Pj4gK8KgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogdnBlMCByZWdpc3RlcnMNCj4+PiAr
wqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiB2cGUxIHJlZ2lzdGVycw0KPj4+IMKgIMKgwqDCoCBp
bnRlcnJ1cHRzOg0KPj4+IMKgwqDCoMKgwqAgbWluSXRlbXM6IDENCj4+PiBAQCAtNzEsNiArNzQs
MTkgQEAgYWxsT2Y6DQo+Pj4gwqDCoMKgwqDCoCBlbHNlOg0KPj4+IMKgwqDCoMKgwqDCoMKgIHJl
cXVpcmVkOg0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAtIGludGVycnVwdHMNCj4+PiArwqAgLSBp
ZjoNCj4+PiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOg0KPj4+ICvCoMKgwqDCoMKgwqDCoCBjb21w
YXRpYmxlOg0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgY29udGFpbnM6DQo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY29uc3Q6IHJlYWx0ZWsscnRsOTMwMC1pbnRjDQo+Pj4gK8KgwqDCoCB0
aGVuOg0KPj4+ICvCoMKgwqDCoMKgIHByb3BlcnRpZXM6DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJl
ZzoNCj4+IE5lZWRlZCBpczogbWluSXRlbXM6IDINCj4+DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oCBtYXhJdGVtczogMg0KPj4+ICvCoMKgwqAgZWxzZToNCj4+PiArwqDCoMKgwqDCoCBwcm9wZXJ0
aWVzOg0KPj4+ICvCoMKgwqDCoMKgwqDCoCByZWc6DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBt
YXhJdGVtczogMQ0KPj4+IMKgIMKgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPj4gQmVz
dCByZWdhcmRzLA0KPj4gS3J6eXN6dG9mDQo+Pg==

