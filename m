Return-Path: <linux-mips+bounces-3885-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F71D9141E6
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 07:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 906AA1F2330B
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 05:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4630C17BCC;
	Mon, 24 Jun 2024 05:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="YPVRZZfy"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9FD11CAF
	for <linux-mips@vger.kernel.org>; Mon, 24 Jun 2024 05:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719206502; cv=none; b=aunxaJhDj8Y+JpOacq7XcnVew+PahqxOqaVb7G4Zf4nXvW52s1PncGGR3wPXCdgGTIZrXW2ZImRI6tD7wl5F6CwyWuhBAXYCHDMzVQR3lfkC+xM7r43+Estmklk9BWACaFAABgMgukMCkAP7b3/LQNdhAXMD+pO3eSE8qnXH8tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719206502; c=relaxed/simple;
	bh=OY5b1Ggd3joKj5pX4/idm+tD9G3lsLgLiaGEWIKtYz8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XX8x9yrFZ+g+yxu4QIt+gK38fBja01aCnNufP71BK04RcugmikwISIdpDP1JmyCm2/qXHD3YjK28L+WodhhVv6E8YNCoIN5y+2eKi8AKz835khnJyk6fIh6uTkvqHrAxRTE8ZTExWL/jDVnTRU44HdhQ3IL6KRQNIAwrIMZ7XOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=YPVRZZfy; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 137302C0A5C;
	Mon, 24 Jun 2024 17:21:37 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719206497;
	bh=OY5b1Ggd3joKj5pX4/idm+tD9G3lsLgLiaGEWIKtYz8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=YPVRZZfyU5Rx07BO6sGyiceubU5pqHmOjzEsHt3/aUpfkvOMmVCmbfQzNRD35wNGf
	 mRlWaLzy72VktAu2YadYR4e3ea8YNhMBJh+h7XsE0j9SF9awSKMimGXTwhuQIA+D/O
	 GAjgmLdSa4xHRN0NCCFf7L0vcxus7iYo11s6cvAAHJvyGHh3tlT++f8TpZKFRvI6ee
	 7S2KQQozAUDhWy49Zgoptw3QA4+tN1e1EzOt5fyBLOlM5LNq2QXvaDZtVvW5GY6LlF
	 hh2cJ/jbRRC2tlnsNtDNaj0RNmMgxhYQqoKFAdnqxWx1M/mfV5SB+TEYZIzoKYCGWH
	 yMOCq3UNIKnDw==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B667902610000>; Mon, 24 Jun 2024 17:21:37 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Mon, 24 Jun 2024 17:21:36 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Mon, 24 Jun 2024 17:21:36 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Mon, 24 Jun 2024 17:21:36 +1200
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
Subject: Re: [PATCH v2 4/8] dt-bindings: timer: Add schema for
 realtek,otto-timer
Thread-Topic: [PATCH v2 4/8] dt-bindings: timer: Add schema for
 realtek,otto-timer
Thread-Index: AQHaxdUT70y18GNyjU2Cd/YSeK4JbLHVjweAgAAI6AA=
Date: Mon, 24 Jun 2024 05:21:36 +0000
Message-ID: <052a4bdb-88fe-4891-a69c-0d90c610d816@alliedtelesis.co.nz>
References: <20240624012300.1713290-1-chris.packham@alliedtelesis.co.nz>
 <20240624012300.1713290-5-chris.packham@alliedtelesis.co.nz>
 <d65648d6-4e2b-4009-b0e0-7d1f9a926eb7@kernel.org>
In-Reply-To: <d65648d6-4e2b-4009-b0e0-7d1f9a926eb7@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <9386FAE2B7F22D438C9101F4D379748F@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=66790261 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=T1WGqf2p2xoA:10 a=gEfo2CItAAAA:8 a=OqrPyMiAPZdSGt2y27EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0

DQpPbiAyNC8wNi8yNCAxNjo0OSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gMjQv
MDYvMjAyNCAwMzoyMiwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4+IEFkZCB0aGUgZGV2aWNldHJl
ZSBzY2hlbWEgZm9yIHRoZSByZWFsdGVrLG90dG8tdGltZXIgcHJlc2VudCBvbiBhIG51bWJlcg0K
Pj4gb2YgUmVhbHRlayBTb0NzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzIFBhY2toYW0g
PGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCj4+IC0tLQ0KPj4NCj4+IE5vdGVz
Og0KPj4gICAgICBDaGFuZ2VzIGluIHYyOg0KPj4gICAgICAtIFVzZSBzcGVjaWZpYyBjb21wYXRp
YmxlDQo+IFdoZXJlPyBJIGRvIG5vdCBzZWUgY2hhbmdlcy4NCg0KSW4gdjEgaXQgd2FzIHJ0bDkz
MHgtdGltZXIsIEkndmUgdXBkYXRlZCBpdCB0byBydGw5MzAyLXRpbWVyDQoNCj4+ICAgICAgLSBS
ZW1vdmUgdW5uZWNlc3NhcnkgbGFiZWwNCj4+ICAgICAgLSBSZW1vdmUgdW51c2VkIGlycSBmbGFn
cyAoaW50ZXJydXB0IGNvbnRyb2xsZXIgaXMgb25lLWNlbGwpDQo+PiAgICAgIC0gU2V0IG1pbkl0
ZW1zIGZvciByZWcgYW5kIGludGVycnVwdHMgYmFzZWQgb24gY29tcGF0aWJsZQ0KPj4NCj4+ICAg
Li4uL2JpbmRpbmdzL3RpbWVyL3JlYWx0ZWssb3R0by10aW1lci55YW1sICAgIHwgNjYgKysrKysr
KysrKysrKysrKysrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQ0KPj4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Rp
bWVyL3JlYWx0ZWssb3R0by10aW1lci55YW1sDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9yZWFsdGVrLG90dG8tdGltZXIueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9yZWFsdGVrLG90dG8tdGlt
ZXIueWFtbA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4u
MTNlYTdhYTk0NmZlDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdGltZXIvcmVhbHRlayxvdHRvLXRpbWVyLnlhbWwNCj4+IEBAIC0w
LDAgKzEsNjYgQEANCj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5
IE9SIEJTRC0yLUNsYXVzZSkNCj4+ICslWUFNTCAxLjINCj4+ICstLS0NCj4+ICskaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3RpbWVyL3JlYWx0ZWssb3R0by10aW1lci55YW1sIw0K
Pj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1s
Iw0KPj4gKw0KPj4gK3RpdGxlOiBSZWFsdGVrIE90dG8gU29DcyBUaW1lci9Db3VudGVyDQo+PiAr
DQo+PiArZGVzY3JpcHRpb246DQo+PiArICBSZWFsdGVrIFNvQ3Mgc3VwcG9ydCBhIG51bWJlciBv
ZiB0aW1lcnMvY291bnRlcnMuIFRoZXNlIGFyZSB1c2VkDQo+PiArICBhcyBhIHBlciBDUFUgY2xv
Y2sgZXZlbnQgZ2VuZXJhdG9yIGFuZCBhbiBvdmVyYWxsIENQVSBjbG9ja3NvdXJjZS4NCj4+ICsN
Cj4+ICttYWludGFpbmVyczoNCj4+ICsgIC0gQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBh
bGxpZWR0ZWxlc2lzLmNvLm56Pg0KPj4gKw0KPj4gK3Byb3BlcnRpZXM6DQo+PiArICAkbm9kZW5h
bWU6DQo+PiArICAgIHBhdHRlcm46ICJedGltZXJAWzAtOWEtZl0rJCINCj4+ICsNCj4+ICsgIGNv
bXBhdGlibGU6DQo+PiArICAgIGl0ZW1zOg0KPj4gKyAgICAgIC0gZW51bToNCj4+ICsgICAgICAg
ICAgLSByZWFsdGVrLHJ0bDkzMDItdGltZXINCj4+ICsgICAgICAtIGNvbnN0OiByZWFsdGVrLG90
dG8tdGltZXINCj4+ICsNCj4+ICsgIHJlZzoNCj4+ICsgICAgbWF4SXRlbXM6IDUNCj4gTm90aGlu
ZyBpbXByb3ZlZC4NCj4NCj4+ICsNCj4+ICsgIGNsb2NrczoNCj4+ICsgICAgbWF4SXRlbXM6IDEN
Cj4+ICsNCj4+ICsgIGludGVycnVwdHM6DQo+PiArICAgIG1heEl0ZW1zOiA1DQo+IE5vdGhpbmcg
aW1wcm92ZWQuDQo+DQo+PiArDQo+PiArYWxsT2Y6DQo+PiArICAtIGlmOg0KPj4gKyAgICAgIHBy
b3BlcnRpZXM6DQo+PiArICAgICAgICBjb21wYXRpYmxlOg0KPj4gKyAgICAgICAgICBjb250YWlu
czoNCj4+ICsgICAgICAgICAgICBjb25zdDogcmVhbHRlayxydGw5MzAyLXRpbWVyDQo+PiArICAg
IHRoZW46DQo+PiArICAgICAgcHJvcGVydGllczoNCj4+ICsgICAgICAgIHJlZzoNCj4+ICsgICAg
ICAgICAgbWluSXRlbXM6IDINCj4+ICsgICAgICAgIGludGVycnVwdHM6DQo+PiArICAgICAgICAg
IG1pbkl0ZW1zOiAyDQo+IE5vLCB0aGF0J3MganVzdCBpbmNvcnJlY3QuIFlvdSBkbyBub3QgaGF2
ZSBtb3JlIHRoYW4gb25lIHZhcmlhbnQsIHNvIGl0DQo+IGlzIGp1c3QgMiBpdGVtcy4gT3IgNSBp
dGVtcywgbm90IDItNS4NCg0KSSd2ZSBiZWVuIHRvbGQgaW4gdGhlIHBhc3QgdGhhdCB0aGUgZGV2
aWNlLXRyZWUgc2hvdWxkIGRlc2NyaWJlIHRoZSANCmhhcmR3YXJlLiBXaGljaCBpbiB0aGlzIGNh
c2UgaGFzIDUgdGltZXJzLiBCdXQgSSdtIGFsc28gdG9sZCB0byBnaXZlIA0KdGhlbSBuYW1lcyB3
aGljaCBJIHN0cnVnZ2xlIHRvIGRvIGJlY2F1c2Ugc29tZSBvZiB0aGVtIGFyZW4ndCB1c2VkLg0K
DQpTbyBkbyB5b3Ugd2FudCBzb21ldGhpbmcgbGlrZSB0aGlzOg0KDQpjbG9ja3M6DQogwqDCoMKg
IGl0ZW1zOg0KIMKgwqDCoCDCoMKgwqAgLSBkZXNjcmlwdGlvbjogQ1BVMCBldmVudCBjbG9jaw0K
IMKgwqDCoCDCoMKgwqAgLSBkZXNjcmlwdGlvbjogc3lzdGVtIGNsb2NrIHNvdXJjZQ0KIMKgwqDC
oCDCoMKgwqAgLSBkZXNjcmlwdGlvbjogdW51c2VkDQogwqDCoMKgIMKgwqDCoCAtIGRlc2NyaXB0
aW9uOiB1bnVzZWQNCiDCoMKgwqAgwqDCoMKgIC0gZGVzY3JpcHRpb246IHVudXNlZA0KDQppbnRl
cnJ1cHRzOg0KIMKgwqDCoCBpdGVtczoNCiDCoMKgwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBD
UFUwIGV2ZW50IGNsb2NrIGludGVycnVwdA0KIMKgwqDCoMKgwqDCoMKgIC0gZGVzY3JpcHRpb246
IHN5c3RlbSBjbG9jayBzb3VyY2UgaW50ZXJydXB0DQogwqDCoMKgwqDCoMKgwqAgLSBkZXNjcmlw
dGlvbjogdW51c2VkDQogwqDCoMKgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogdW51c2VkDQogwqDC
oMKgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogdW51c2VkDQoNCj4NCj4NCj4gQmVzdCByZWdhcmRz
LA0KPiBLcnp5c3p0b2YNCj4NCj4=

