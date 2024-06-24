Return-Path: <linux-mips+bounces-3884-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE680914195
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 07:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A37732841AA
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 05:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693E915E96;
	Mon, 24 Jun 2024 05:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="NYgtBQdE"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0DDDDBE
	for <linux-mips@vger.kernel.org>; Mon, 24 Jun 2024 05:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719205214; cv=none; b=bY69GrXuuru13T4T5jKA5S90Ma2yOXVN1k1kkT4VIvwAFG9DWYgpzQI3AyjzTV+H8Fh2InyGQ5IrFlhAFyO055c7pHoOLJ7heyFf1UZSj6qSshdSCZpX6x0yiME9B8h5dZ9MRYplunHRYePmLL4ghORGEVRhkuKe5IOUxMEnwIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719205214; c=relaxed/simple;
	bh=feU1vQkEuHiyw1lRryidwrh5EGDGJSNocdkW27RJV+c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jrLOtVLxsIsFcVpZx6Ky90i1zh/2N8eSLckTidP2x75sUNGp17FJSnHc7qYakFJvv6AHuC+S1V0ncP+XlQ5O17au2geyzx2z3QpYXn9cC8wYVGaSHxVf6rqoxCy7Vk5BoNMGyR5PWFPZPudCXEqM06+pjMOKm/w1FKGq6YbcpEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=NYgtBQdE; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E9BCD2C09B5;
	Mon, 24 Jun 2024 17:00:08 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719205208;
	bh=feU1vQkEuHiyw1lRryidwrh5EGDGJSNocdkW27RJV+c=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=NYgtBQdE2A26d3W5kv7LTwIBYvg+nZsWI+4LZ+SaMyqebvllBOqjpRHxF+DQL/fCU
	 VElq58sq4PupcdpRRLRmev+OMgFPAiaeDaO6DKQMB6RB7KOdtBc1JWAbeE2urBeuGd
	 OhO/mZ/+4By89ch+ldeFcciFyzX4m6GQUXBhpcSB8sQMkDCFjVvsDvjNVLAXGa1ERJ
	 e1BTELQzZvqh+JKD9jYxVR9tg4Y6GmmNEH5BvEdGIhF06AtSZt+XfLEgbwP/laSTe4
	 HPMH/1IHev5eJgZs+A/edeYvmEqJ1KklwE2vlhTaChK7ij9bQKlv94RrVHcSyLm1k3
	 oCIJd843If6IA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6678fd580001>; Mon, 24 Jun 2024 17:00:08 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Mon, 24 Jun 2024 17:00:08 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.48; Mon, 24 Jun 2024 17:00:08 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Mon, 24 Jun 2024 17:00:08 +1200
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
Subject: Re: [PATCH v2 3/8] dt-bindings: mips: realtek: Add rtl930x-soc
 compatible
Thread-Topic: [PATCH v2 3/8] dt-bindings: mips: realtek: Add rtl930x-soc
 compatible
Thread-Index: AQHaxdUTfhj+IoBSAkG+XrxufOOZIbHVjqYAgAADSgA=
Date: Mon, 24 Jun 2024 05:00:08 +0000
Message-ID: <2b33e7d2-24e5-48c3-a2e3-f128f5d7e39b@alliedtelesis.co.nz>
References: <20240624012300.1713290-1-chris.packham@alliedtelesis.co.nz>
 <20240624012300.1713290-4-chris.packham@alliedtelesis.co.nz>
 <e71780a1-8d53-44ae-ac0f-d406de7e26e8@kernel.org>
In-Reply-To: <e71780a1-8d53-44ae-ac0f-d406de7e26e8@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <457F463D62A2D241AFB208579E6EAA02@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=6678fd58 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=T1WGqf2p2xoA:10 a=_dVCr4l2Sx0L4Mgb7Q8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgS3J6eXN6dG9mLA0KDQpPbiAyNC8wNi8yNCAxNjo0OCwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToNCj4gT24gMjQvMDYvMjAyNCAwMzoyMiwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4+IEFk
ZCB0aGUgcnRsOTMweC1zb2MgYW5kIFJUTDkzMDJDIGJvYXJkIHRvIHRoZSBsaXN0IG9mIFJlYWx0
ZWsgY29tcGF0aWJsZQ0KPiA5MzB4IG9yIDkzMDI/DQoNCk9vcHMuIFdpbGwgZml4Lg0KDQo+PiBz
dHJpbmdzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2to
YW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCj4+IC0tLQ0KPj4NCj4+IE5vdGVzOg0KPj4gICAgICBD
aGFuZ2VzIGluIHYyOg0KPj4gICAgICAtIFVzZSBzcGVjaWZpYyBjb21wYXRpYmxlIGZvciBydGw5
MzAyLXNvYw0KPj4gICAgICAtIEZpeCB0byBhbGxvdyBjb3JyZWN0IGJvYXJkLCBzb2MgY29tcGF0
aWJsZQ0KPj4NCj4+ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21pcHMvcmVh
bHRlay1ydGwueWFtbCB8IDQgKysrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9taXBzL3JlYWx0ZWstcnRsLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWlwcy9yZWFsdGVrLXJ0bC55YW1sDQo+PiBpbmRleCBmOGFjMzA5ZDI5OTQuLjA1ZGFhNTM0
MTdlNSAxMDA2NDQNCj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
aXBzL3JlYWx0ZWstcnRsLnlhbWwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9taXBzL3JlYWx0ZWstcnRsLnlhbWwNCj4+IEBAIC0yMCw1ICsyMCw5IEBAIHByb3Bl
cnRpZXM6DQo+PiAgICAgICAgICAgICAtIGVudW06DQo+PiAgICAgICAgICAgICAgICAgLSBjaXNj
byxzZzIyMC0yNg0KPj4gICAgICAgICAgICAgLSBjb25zdDogcmVhbHRlayxydGw4MzgyLXNvYw0K
Pj4gKyAgICAgIC0gaXRlbXM6DQo+PiArICAgICAgICAgIC0gZW51bToNCj4+ICsgICAgICAgICAg
ICAgIC0gcmVhbHRlayxydGw5MzAyYw0KPiBXaHkgYm9hcmQgaGFzIHRoZSBuYW1lIG9mIFNvQz8N
Cg0KV2hhdCBJIGhhdmUgaXMgYWN0dWFsbHkgYSByZWZlcmVuY2UgYm9hcmQgd2l0aCB0aGUgbmFt
ZSANClJUTDkzMDJDXzJ4UlRMODIyNF8yWEdFLiBJZiBmb3VuZCB0aGF0IGEgYml0IGluY29tcHJl
aGVuc2libGUgc28gSSANCihvdmVyKSBzaG9ydGVuZWQgaXQuIFRlY2huaWNhbGx5IGl0IHdvdWxk
IGJlIHNvbWV0aGluZyBsaWtlIA0KY2FtZW8scnRsOTMwMmMtMngtcnRsODIyNC0yeGdlIHdoaWNo
IEkgY2FuIGluY2x1ZGUgaW4gdGhlIG5leHQgcm91bmQuDQoNCj4+ICsgICAgICAgICAgLSBjb25z
dDogcmVhbHRlayxydGw5MzAyLXNvYw0KPiBEcm9wIHRoZSAtc29jIHN1ZmZpeC4gVGhlIHJ0bDkz
MDIgaXMgdGhlIHNvYy4NCg0KT24gdGhhdC4gSSBob3BlIHRvIGV2ZW50dWFsbHkgYWRkICJyZWFs
dGVrLHJ0bDkzMDItc3dpdGNoIiBmb3IgdGhlIERTQSANCnN3aXRjaCBibG9jayBpbiB0aGUgc2Ft
ZSBjaGlwLiBTbyBrZWVwaW5nIHRoZSAtc29jIHN1ZmZpeCB3YXMgDQppbnRlbnRpb25hbCB0byB0
cnkgdG8gZGlzYW1iaWd1YXRlIHRoaW5ncy4gSSBjYW4gZHJvcCB0aGUgLXNvYyBpZiB0aGUgDQpj
b25zZW5zdXMgaXMgdGhhdCB0aGVyZSBpcyBubyBuZWVkIHRvIGRpc2FtYmlndWF0ZSB0aGUgdHdv
Lg0KDQo+PiAgIA0KPj4gICBhZGRpdGlvbmFsUHJvcGVydGllczogdHJ1ZQ0KPiBCZXN0IHJlZ2Fy
ZHMsDQo+IEtyenlzenRvZg0KPg==

