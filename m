Return-Path: <linux-mips+bounces-4055-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 444FC91D5FE
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 04:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 741921C2028E
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 02:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2BF4A3F;
	Mon,  1 Jul 2024 02:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="hZ6WQhm+"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AD7847C
	for <linux-mips@vger.kernel.org>; Mon,  1 Jul 2024 02:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719800111; cv=none; b=Z02tRxL+S/BRoJ2rLBu82hLf6ZHFlwFL84fHdQj4q1HLUoiiulcRn61WiYLlYfC+0YEw4V3n8843KyPhr5iOooGTke4pAE+DII6kg1ARMbE+D/nA4Hjnwr4wY38TN+EePAMZXmP9GlgAOLBteGmGAvI4CzSedtqI+zvzUzfqV20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719800111; c=relaxed/simple;
	bh=sTn+JRe8OjJEGmoFpxzdsdjcYV03ufKlwF8LnEtjCFI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p/VujnOpczV+AynCOW+jqBaqg9zBV/xqkSZQDh4T5cp6Bofjx8me8kUinYNauW+FCi/00pR+NgNDdUu4zSaWaHiIDzopBXI4EMssO/B/nC5ssMv+Jv4ln24MViFKaW9UymBor4NwbPagdEQ8DR3vtbJ/vr6mkpVZ4lH8IcFEPE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=hZ6WQhm+; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A98D12C02D1;
	Mon,  1 Jul 2024 14:15:06 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719800106;
	bh=sTn+JRe8OjJEGmoFpxzdsdjcYV03ufKlwF8LnEtjCFI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=hZ6WQhm+1ze9ok90ApePK128ppmRw3daK20fnAjnTkYzCaQkmGDUcx1yew5FDQyLU
	 SkW9ZYn469RdLorRH2xhbkTWBP8q7DQiCJewoMj7lWQhsiI2mkU6YRh2X/XD1gz15R
	 Dmpco6ypdaeb3rs+UIcA3cRGCBe3q0c6iRarRD6OW/NRO9rf+PEAizxyiZK35r0MYt
	 1h4mlqMgfSy8LUI0zvPLr0TBACH6hyGbZXeCQt/VZIgxVj3dyFYp5Hx5jgzUchrW5y
	 YbvJpWfhjd/G9V/NaMZbbsieW5x28Z5Oy9Qp1JorAt1g1Pl7fLc7dLW9P0v0KmDIsb
	 jRhBpPjPOZPoQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6682112a0001>; Mon, 01 Jul 2024 14:15:06 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Mon, 1 Jul 2024 14:15:06 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Mon, 1 Jul 2024 14:15:05 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Mon, 1 Jul 2024 14:15:05 +1200
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
	<kabel@kernel.org>, "ericwouds@gmail.com" <ericwouds@gmail.com>
Subject: Re: [PATCH v3 5/9] dt-bindings: timer: Add schema for
 realtek,otto-timer
Thread-Topic: [PATCH v3 5/9] dt-bindings: timer: Add schema for
 realtek,otto-timer
Thread-Index: AQHayEsl8GnXYY8zTU+Md7x16GlfGbHeb1wAgAHv3IA=
Date: Mon, 1 Jul 2024 02:15:05 +0000
Message-ID: <0bfba91e-95ee-4814-b9a4-f1d615e70cb5@alliedtelesis.co.nz>
References: <20240627043317.3751996-1-chris.packham@alliedtelesis.co.nz>
 <20240627043317.3751996-6-chris.packham@alliedtelesis.co.nz>
 <4427a46483d9b7d122ce6923c2fc8cf0d470c6dd.camel@svanheule.net>
In-Reply-To: <4427a46483d9b7d122ce6923c2fc8cf0d470c6dd.camel@svanheule.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9FC0B077AEF0A43869C95472B4DB51E@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=6682112a a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=4kmOji7k6h8A:10 a=VrYmFv2w5z1s7npZ_2gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

DQpPbiAzMC8wNi8yNCAwODo0MCwgU2FuZGVyIFZhbmhldWxlIHdyb3RlOg0KPiBIaSBDaHJpcywN
Cj4NCj4gVGhhbmtzIGZvciBzdWJtaXR0aW5nIHRoZXNlIHBhdGNoZXMhDQo+DQo+IE9uIFRodSwg
MjAyNC0wNi0yNyBhdCAxNjozMyArMTIwMCwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4+IEFkZCB0
aGUgZGV2aWNldHJlZSBzY2hlbWEgZm9yIHRoZSByZWFsdGVrLG90dG8tdGltZXIgcHJlc2VudCBv
biBhIG51bWJlcg0KPj4gb2YgUmVhbHRlayBTb0NzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENo
cmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCj4+IC0tLQ0K
PiBbLi4uXQ0KPg0KPj4gKw0KPj4gK8KgIHJlZzoNCj4+ICvCoMKgwqAgaXRlbXM6DQo+PiArwqDC
oMKgwqDCoCAtIGRlc2NyaXB0aW9uOiB0aW1lcjAgcmVnaXN0ZXJzDQo+PiArwqDCoMKgwqDCoCAt
IGRlc2NyaXB0aW9uOiB0aW1lcjEgcmVnaXN0ZXJzDQo+PiArwqDCoMKgwqDCoCAtIGRlc2NyaXB0
aW9uOiB0aW1lcjIgcmVnaXN0ZXJzDQo+PiArwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiB0aW1l
cjMgcmVnaXN0ZXJzDQo+PiArwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiB0aW1lcjQgcmVnaXN0
ZXJzDQo+PiArDQo+PiArwqAgY2xvY2tzOg0KPj4gK8KgwqDCoCBtYXhJdGVtczogMQ0KPj4gKw0K
Pj4gK8KgIGludGVycnVwdHM6DQo+PiArwqDCoMKgIGl0ZW1zOg0KPj4gK8KgwqDCoMKgwqAgLSBk
ZXNjcmlwdGlvbjogdGltZXIwIGludGVycnVwdA0KPj4gK8KgwqDCoMKgwqAgLSBkZXNjcmlwdGlv
bjogdGltZXIxIGludGVycnVwdA0KPj4gK8KgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogdGltZXIy
IGludGVycnVwdA0KPj4gK8KgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogdGltZXIzIGludGVycnVw
dA0KPj4gK8KgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogdGltZXI0IGludGVycnVwdA0KPiBJbnN0
ZWFkIG9mIHByb3ZpZGluZyBhIChTb0MgZGVwZW5kZW50KSBudW1iZXIgb2YgcmVnIGFuZCBpbnRl
cnJ1cHQgaXRlbXMsIGNhbid0IHdlIGp1c3QNCj4gcHJvdmlkZSBvbmUgcmVnK2ludGVycnVwdCBw
ZXIgdGltZXIgYW5kIGluc3RhbnRpYXRlIG9uZSBibG9jayBmb3IgaG93ZXZlciBtYW55IHRpbWVy
cyB0aGUNCj4gU29DIGhhcz8NCj4NCj4+ICsNCj4+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFs
c2UNCj4+ICsNCj4+ICtleGFtcGxlczoNCj4+ICvCoCAtIHwNCj4+ICvCoMKgwqAgdGltZXJAMzIw
MCB7DQo+PiArwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInJlYWx0ZWsscnRsOTMwMi10aW1lciIs
ICJyZWFsdGVrLG90dG8tdGltZXIiOw0KPj4gK8KgwqDCoMKgwqAgcmVnID0gPDB4MzIwMCAweDEw
PiwgPDB4MzIxMCAweDEwPiwgPDB4MzIyMCAweDEwPiwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDwweDMyMzAgMHgxMD4sIDwweDMyNDAgMHgxMD47DQo+PiArDQo+PiArwqDCoMKgwqDCoCBp
bnRlcnJ1cHQtcGFyZW50ID0gPCZpbnRjPjsNCj4+ICvCoMKgwqDCoMKgIGludGVycnVwdHMgPSA8
Nz4sIDw4PiwgPDk+LCA8MTA+LCA8MTE+Ow0KPj4gK8KgwqDCoMKgwqAgY2xvY2tzID0gPCZseF9j
bGs+Ow0KPj4gK8KgwqDCoCB9Ow0KPiBTbyB0aGlzIHdvdWxkIGJlY29tZToNCj4gCXRpbWVyQDMy
MDAgew0KPiAJCWNvbXBhdGlibGUgPSAuLi4NCj4gCQlyZWcgPSA8MHgzMjAwIDB4MTA+Ow0KPiAJ
CWludGVycnVwdC1wYXJlbnQgPSA8JmludGM+Ow0KPiAJCWludGVycnVwdHMgPSA8Nz47DQo+IAkJ
Li4uDQo+IAl9Ow0KPiAJdGltZXJAMzIxMCB7DQo+IAkJY29tcGF0aWJsZSA9IC4uLg0KPiAJCXJl
ZyA9IDwweDMyMTAgMHgxMD47DQo+IAkJaW50ZXJydXB0LXBhcmVudCA9IDwmaW50Yz47DQo+IAkJ
aW50ZXJydXB0cyA9IDw4PjsNCj4gCQkuLi4NCj4gCX07DQo+IAkuLi4NCj4NCj4gTW9yZSB2ZXJi
b3NlLCBidXQgaXQgYWxzbyBtYWtlcyB0aGUgYmluZGluZyBhIGJpdCBzaW1wbGVyLiBUaGUgZHJp
dmVyIGNhbiB0aGVuIHN0aWxsIGRvDQo+IHdoYXRldmVyIGl0IHdhbnRzIHdpdGggYWxsIHRoZSB0
aW1lcnMgdGhhdCBhcmUgcmVnaXN0ZXJlZCwgYWx0aG91Z2ggc29tZSBtb3JlIHJlc291cmNlDQo+
IGxvY2tpbmcgbWlnaHQgYmUgcmVxdWlyZWQuDQoNCkkga2luZCBvZiBwcmVmZXIgdGhlIHNpbmds
ZSBlbnRyeSBmb3IgdGhlIHdob2xlIFRDVS4gSWYgd2Ugd2VyZSB0byBmb2xkIA0KdGhlIHdhdGNo
ZG9nIGludG8gdGhpcyB0aGVuIHdlIGNvdWxkIGhhdmUgYSBzaW5nbGUgbGFyZ2VyIHJhbmdlIHRo
YXQgDQpjb3ZlcmVkIGFsbCB0aGUgdGltZXJzIHNpbWlsYXIgdG8gdGhlIGluZ2VuaWMsdGN1LiBC
dXQgdGhhdCB3b3VsZCANCnRlY2huaWNhbGx5IGJlIGEgYnJlYWtpbmcgY2hhbmdlIGF0IHRoaXMg
cG9pbnQuDQo=

