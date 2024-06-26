Return-Path: <linux-mips+bounces-3961-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E95391999D
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2024 23:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF8911C21D78
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2024 21:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F1E193072;
	Wed, 26 Jun 2024 21:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="InvD1YI4"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4748614D6EB
	for <linux-mips@vger.kernel.org>; Wed, 26 Jun 2024 21:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719436028; cv=none; b=gqyaYDl/1JhAwiH8LeFXlVWGT9HWCKVyrjGfD42qB2GOYiXsoFGB+pUmfgTH6LZznUPFmocIZ/h4TlSYmqD4gDZ87foxkW0GidkTRHEyfFtD1bTi2h4BJs8FyrifbFb4Z8NAeD5MHI+hv0yfogIAzbfCRWA9bphWokKZCNMRDi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719436028; c=relaxed/simple;
	bh=6rozKt0gfvrsNRqJXzjfPzDzoukPahDrXQLci6geBTU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JpwTa5IuWlzHUQN43PNZLcnUv7r6NA4G+ocBGHPSRGxjML0I3WnGwHqdHH3n/ZRJmfTVuhN0lurYLiOER8ZCXXkb2YSvR+jPa/vMYp1CMsnFYbJtQ1mEIeM92KPHu8ANBVsIDMYJeSl22ZfLjUzpkmW2DQM4b+pvYKCGFO+URrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=InvD1YI4; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 34D182C01F6;
	Thu, 27 Jun 2024 09:07:03 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719436023;
	bh=6rozKt0gfvrsNRqJXzjfPzDzoukPahDrXQLci6geBTU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=InvD1YI4aIM3YLbcCIUgBDMe4GO64PmttEkHz+6w+5WerdQ1dwFHAY02eG4r+DoU1
	 jXzZvzs9ERBEwWnxEjqtB+kSWh6KGSaiQgtKla+LdHbw5x/YO5DgKMlGJbD3ZL/LDy
	 TFPuliO9WJTBXURD674MtFu17rkO2a3Z1Qlm8Pey3uI/RXdX8+tZhVZAqQSa2yLcUN
	 oUDp5KW5ZJpY8XclyyOPPNZcuSaO9U8bGKODb5B84pXityWIuRNWeq0Ihj24U98THL
	 r2h+ma5pyE4ifnTmxwNxKPnfWFyjn96NLbHDmn3FXyWOWgqzfpYyirvHQz2Ec+VPLQ
	 fREkkrYJ4oZ0w==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B667c82f70001>; Thu, 27 Jun 2024 09:07:03 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 27 Jun 2024 09:07:02 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Thu, 27 Jun 2024 09:07:02 +1200
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
Thread-Index: AQHaxdUT70y18GNyjU2Cd/YSeK4JbLHVjweAgAAI6ACAA0QFAIAA6MwA
Date: Wed, 26 Jun 2024 21:07:02 +0000
Message-ID: <533ba27e-a286-4b2e-8560-07148796e1d5@alliedtelesis.co.nz>
References: <20240624012300.1713290-1-chris.packham@alliedtelesis.co.nz>
 <20240624012300.1713290-5-chris.packham@alliedtelesis.co.nz>
 <d65648d6-4e2b-4009-b0e0-7d1f9a926eb7@kernel.org>
 <052a4bdb-88fe-4891-a69c-0d90c610d816@alliedtelesis.co.nz>
 <8676afd3-8a95-4517-ae38-0f8539e81f19@kernel.org>
In-Reply-To: <8676afd3-8a95-4517-ae38-0f8539e81f19@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8C1D46C0CA9BB4E902C483BCC2AB9EA@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=667c82f7 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=T1WGqf2p2xoA:10 a=gEfo2CItAAAA:8 a=pVNfCJjWaEiOd-6bYA8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0

DQpPbiAyNi8wNi8yNCAxOToxMywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gMjQv
MDYvMjAyNCAwNzoyMSwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4+IE9uIDI0LzA2LzI0IDE2OjQ5
LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPj4+IE9uIDI0LzA2LzIwMjQgMDM6MjIsIENo
cmlzIFBhY2toYW0gd3JvdGU6DQo+Pj4+IEFkZCB0aGUgZGV2aWNldHJlZSBzY2hlbWEgZm9yIHRo
ZSByZWFsdGVrLG90dG8tdGltZXIgcHJlc2VudCBvbiBhIG51bWJlcg0KPj4+PiBvZiBSZWFsdGVr
IFNvQ3MuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBh
Y2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCj4+Pj4gLS0tDQo+Pj4+DQo+Pj4+IE5vdGVzOg0K
Pj4+PiAgICAgICBDaGFuZ2VzIGluIHYyOg0KPj4+PiAgICAgICAtIFVzZSBzcGVjaWZpYyBjb21w
YXRpYmxlDQo+Pj4gV2hlcmU/IEkgZG8gbm90IHNlZSBjaGFuZ2VzLg0KPj4gSW4gdjEgaXQgd2Fz
IHJ0bDkzMHgtdGltZXIsIEkndmUgdXBkYXRlZCBpdCB0byBydGw5MzAyLXRpbWVyDQo+IEFoLCBJ
IHRob3VnaHQgeW91IHdhbnRlZCB0byBzd2l0Y2ggZnJvbSBnZW5lcmljIGZhbGxiYWNrIHRvIHNw
ZWNpZmljDQo+IGNvbXBhdGlibGUuLi4gZmluZS4NCj4NCj4+Pj4gICAgICAgLSBSZW1vdmUgdW5u
ZWNlc3NhcnkgbGFiZWwNCj4+Pj4gICAgICAgLSBSZW1vdmUgdW51c2VkIGlycSBmbGFncyAoaW50
ZXJydXB0IGNvbnRyb2xsZXIgaXMgb25lLWNlbGwpDQo+Pj4+ICAgICAgIC0gU2V0IG1pbkl0ZW1z
IGZvciByZWcgYW5kIGludGVycnVwdHMgYmFzZWQgb24gY29tcGF0aWJsZQ0KPj4+Pg0KPj4+PiAg
ICAuLi4vYmluZGluZ3MvdGltZXIvcmVhbHRlayxvdHRvLXRpbWVyLnlhbWwgICAgfCA2NiArKysr
KysrKysrKysrKysrKysrDQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCsp
DQo+Pj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdGltZXIvcmVhbHRlayxvdHRvLXRpbWVyLnlhbWwNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9yZWFsdGVrLG90dG8t
dGltZXIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9yZWFs
dGVrLG90dG8tdGltZXIueWFtbA0KPj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4+PiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjEzZWE3YWE5NDZmZQ0KPj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9yZWFsdGVrLG90dG8t
dGltZXIueWFtbA0KPj4+PiBAQCAtMCwwICsxLDY2IEBADQo+Pj4+ICsjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4+Pj4gKyVZQU1MIDEu
Mg0KPj4+PiArLS0tDQo+Pj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3Rp
bWVyL3JlYWx0ZWssb3R0by10aW1lci55YW1sIw0KPj4+PiArJHNjaGVtYTogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+Pj4+ICsNCj4+Pj4gK3RpdGxlOiBS
ZWFsdGVrIE90dG8gU29DcyBUaW1lci9Db3VudGVyDQo+Pj4+ICsNCj4+Pj4gK2Rlc2NyaXB0aW9u
Og0KPj4+PiArICBSZWFsdGVrIFNvQ3Mgc3VwcG9ydCBhIG51bWJlciBvZiB0aW1lcnMvY291bnRl
cnMuIFRoZXNlIGFyZSB1c2VkDQo+Pj4+ICsgIGFzIGEgcGVyIENQVSBjbG9jayBldmVudCBnZW5l
cmF0b3IgYW5kIGFuIG92ZXJhbGwgQ1BVIGNsb2Nrc291cmNlLg0KPj4+PiArDQo+Pj4+ICttYWlu
dGFpbmVyczoNCj4+Pj4gKyAgLSBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRl
bGVzaXMuY28ubno+DQo+Pj4+ICsNCj4+Pj4gK3Byb3BlcnRpZXM6DQo+Pj4+ICsgICRub2RlbmFt
ZToNCj4+Pj4gKyAgICBwYXR0ZXJuOiAiXnRpbWVyQFswLTlhLWZdKyQiDQo+Pj4+ICsNCj4+Pj4g
KyAgY29tcGF0aWJsZToNCj4+Pj4gKyAgICBpdGVtczoNCj4+Pj4gKyAgICAgIC0gZW51bToNCj4+
Pj4gKyAgICAgICAgICAtIHJlYWx0ZWsscnRsOTMwMi10aW1lcg0KPj4+PiArICAgICAgLSBjb25z
dDogcmVhbHRlayxvdHRvLXRpbWVyDQo+Pj4+ICsNCj4+Pj4gKyAgcmVnOg0KPj4+PiArICAgIG1h
eEl0ZW1zOiA1DQo+Pj4gTm90aGluZyBpbXByb3ZlZC4NCj4+Pg0KPj4+PiArDQo+Pj4+ICsgIGNs
b2NrczoNCj4+Pj4gKyAgICBtYXhJdGVtczogMQ0KPj4+PiArDQo+Pj4+ICsgIGludGVycnVwdHM6
DQo+Pj4+ICsgICAgbWF4SXRlbXM6IDUNCj4+PiBOb3RoaW5nIGltcHJvdmVkLg0KPj4+DQo+Pj4+
ICsNCj4+Pj4gK2FsbE9mOg0KPj4+PiArICAtIGlmOg0KPj4+PiArICAgICAgcHJvcGVydGllczoN
Cj4+Pj4gKyAgICAgICAgY29tcGF0aWJsZToNCj4+Pj4gKyAgICAgICAgICBjb250YWluczoNCj4+
Pj4gKyAgICAgICAgICAgIGNvbnN0OiByZWFsdGVrLHJ0bDkzMDItdGltZXINCj4+Pj4gKyAgICB0
aGVuOg0KPj4+PiArICAgICAgcHJvcGVydGllczoNCj4+Pj4gKyAgICAgICAgcmVnOg0KPj4+PiAr
ICAgICAgICAgIG1pbkl0ZW1zOiAyDQo+Pj4+ICsgICAgICAgIGludGVycnVwdHM6DQo+Pj4+ICsg
ICAgICAgICAgbWluSXRlbXM6IDINCj4+PiBObywgdGhhdCdzIGp1c3QgaW5jb3JyZWN0LiBZb3Ug
ZG8gbm90IGhhdmUgbW9yZSB0aGFuIG9uZSB2YXJpYW50LCBzbyBpdA0KPj4+IGlzIGp1c3QgMiBp
dGVtcy4gT3IgNSBpdGVtcywgbm90IDItNS4NCj4+IEkndmUgYmVlbiB0b2xkIGluIHRoZSBwYXN0
IHRoYXQgdGhlIGRldmljZS10cmVlIHNob3VsZCBkZXNjcmliZSB0aGUNCj4+IGhhcmR3YXJlLiBX
aGljaCBpbiB0aGlzIGNhc2UgaGFzIDUgdGltZXJzLiBCdXQgSSdtIGFsc28gdG9sZCB0byBnaXZl
DQo+PiB0aGVtIG5hbWVzIHdoaWNoIEkgc3RydWdnbGUgdG8gZG8gYmVjYXVzZSBzb21lIG9mIHRo
ZW0gYXJlbid0IHVzZWQuDQo+IFVzZWQgYXMgaW4gTGludXggZHJpdmVyPyBEb2VzIG5vdCBtYXR0
ZXIuDQo+DQo+PiBTbyBkbyB5b3Ugd2FudCBzb21ldGhpbmcgbGlrZSB0aGlzOg0KPj4NCj4+IGNs
b2NrczoNCj4+ICAgwqDCoMKgIGl0ZW1zOg0KPj4gICDCoMKgwqAgwqDCoMKgIC0gZGVzY3JpcHRp
b246IENQVTAgZXZlbnQgY2xvY2sNCj4+ICAgwqDCoMKgIMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBz
eXN0ZW0gY2xvY2sgc291cmNlDQo+PiAgIMKgwqDCoCDCoMKgwqAgLSBkZXNjcmlwdGlvbjogdW51
c2VkDQo+PiAgIMKgwqDCoCDCoMKgwqAgLSBkZXNjcmlwdGlvbjogdW51c2VkDQo+PiAgIMKgwqDC
oCDCoMKgwqAgLSBkZXNjcmlwdGlvbjogdW51c2VkDQo+IE5vLCBpZiB5b3VyIGRhdGFzaGVldCBv
ciBhbnkgb3RoZXIgc291cmNlIG9mIGluZm9ybWF0aW9uIChlLmcuDQo+IGRvd25zdHJlYW0gc291
cmNlcykgbWVudGlvbiA1IGl0ZW1zLCB0aGVuIG5hbWUgcHJvcGVybHkgNSBpdGVtcy4NCj4gT3Ro
ZXJ3aXNlIGhvdyBkbyB5b3Uga25vdyB0aGF0IHRoZXJlIGFyZSA1LCBub3QgMiwgY2xvY2tzL2lu
dGVycnVwdHMvcmVnPw0KDQpTbyBqdXN0IHRpbWVyMCwgdGltZXIyLCAuLi4gdGltZXI1Pw0KDQo=

