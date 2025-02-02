Return-Path: <linux-mips+bounces-7660-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4042A24FE5
	for <lists+linux-mips@lfdr.de>; Sun,  2 Feb 2025 21:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 187E516262E
	for <lists+linux-mips@lfdr.de>; Sun,  2 Feb 2025 20:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885831F55EB;
	Sun,  2 Feb 2025 20:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="EvptNIst"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127251FBEAD
	for <linux-mips@vger.kernel.org>; Sun,  2 Feb 2025 20:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738527255; cv=none; b=rbT6P4WRSPu10UpD3HTbO48L15toiCwn+fT3Ry82/re2xWSBjelIWg2gJWNWapjyfCw+25Me/dc+xb5GgRPjiLtyX/WaUhpXQxjpw2gfHIApW6GodSBC255VjkfdK21Aq6K3hflcr4MbZc/VgpDZoln+fV4Tg5D6BUvPrNqZJ3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738527255; c=relaxed/simple;
	bh=GYufQkqTiTECrqGCQmTSKsEG0Ku/If3VyLLM9ZA1yhE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PbAuULtoL+URRxrcqxFjyX3RowzjN6FhsDE4B0vZ+pN2EoSaHVMdlKQ0u22brux9F/1BQVOu9BVVG+Ab6zpR17Gwqn1Z5rNsCELE+cBBbsI0FvEkdbQYBgi0Q5Yvalrn6tuzgSY6uTGLVbKQdXoryIl0E837tzWsyFhoO9JdsG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=EvptNIst; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C99322C047F;
	Mon,  3 Feb 2025 09:14:03 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1738527243;
	bh=GYufQkqTiTECrqGCQmTSKsEG0Ku/If3VyLLM9ZA1yhE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=EvptNIstz2ur+XzRfRfZVMBudL3bDQsOIbIC9cRb98bSHgBnM4JPp4T0WsFA8wgUO
	 Z6uriwqlbCHVfrjDKCwULocuOp8vGYUx8aYVvepR/2jb45DqFPn5T6a6iLmSd/TrX2
	 /jTx+n6Pe2KVQF6SSptBuOYd1SMRGJltLdX+PdwccjhoxXAlGwRsbNWJcB+AUdc0vP
	 Yhv6CZZdQBWrVUw7ObRDcj0KXMpTi3csZ5yCYGTz3nGAnzRvkyamvEc5wGHxkT5p6w
	 k2KqItX2bVz51ajgshlu9i0IFvQewDfDWOg+Kj7/I9FtFYBR8lDf4PSVGXHlzabtbF
	 RKyqhkyCti4DA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B679fd20b0001>; Mon, 03 Feb 2025 09:14:03 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 3 Feb 2025 09:14:03 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Mon, 3 Feb 2025 09:14:03 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Daniel Golle <daniel@makrotopia.org>
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
Subject: Re: [PATCH v5 2/4] dt-bindings: mfd: Add MDIO interface to
 rtl9301-switch
Thread-Topic: [PATCH v5 2/4] dt-bindings: mfd: Add MDIO interface to
 rtl9301-switch
Thread-Index: AQHbc3vG5KHQA0uNBUSEQ1g/rFr6ULMvk9YAgAQJRoA=
Date: Sun, 2 Feb 2025 20:14:03 +0000
Message-ID: <fe2be62e-d293-47fe-960b-175345b849bd@alliedtelesis.co.nz>
References: <20250131010151.2527688-1-chris.packham@alliedtelesis.co.nz>
 <20250131010151.2527688-3-chris.packham@alliedtelesis.co.nz>
 <Z5xvRlKQiQ5cm0gl@makrotopia.org>
In-Reply-To: <Z5xvRlKQiQ5cm0gl@makrotopia.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C365841610C094CAEF7768761D64CE5@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=QNvLRRLL c=1 sm=1 tr=0 ts=679fd20b a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=VwQbUJbxAAAA:8 a=8kqDT8k5iAwiibSX_GUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ZXyCFCArYtab_KRsxF7a:22
X-SEG-SpamProfiler-Score: 0

DQpPbiAzMS8wMS8yMDI1IDE5OjM1LCBEYW5pZWwgR29sbGUgd3JvdGU6DQo+IEhpIENocmlzLA0K
Pg0KPiBhZmFpayBuZXQtbmV4dCBpcyBzdGlsbCBjbG9zZWQgcmlnaHQgbm93LCBidXQgbGV0cyBk
aXNjdXNzIHRoZSBzZXJpZXMgYXMgUkZDDQo+IGluIHRoZSBtZWFudGltZSBtYXliZSwgcmlnaHQ/
DQoNClllcyBzdXJlLiBJIHByb2JhYmx5IHNob3VsZCBoYXZlIHRhZ2dlZCB0aGVzZSBhcyBuZXQt
bmV4dCBldmVuIHdpdGggb3IgDQp3aXRob3V0IFJGQy4NCg0KPiBPbiBGcmksIEphbiAzMSwgMjAy
NSBhdCAwMjowMTo0OVBNICsxMzAwLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPj4gVGhlIE1ESU8g
Y29udHJvbGxlciBpcyBwYXJ0IG9mIHRoZSBzd2l0Y2ggb24gdGhlIFJUTDkzMDAgZmFtaWx5IG9m
DQo+PiBkZXZpY2VzLiBBZGQgYSAkcmVmIHRvIHRoZSBtZmQgYmluZGluZyBmb3IgdGhlc2UgZGV2
aWNlcy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFt
QGFsbGllZHRlbGVzaXMuY28ubno+DQo+PiAtLS0NCj4+DQo+PiBOb3RlczoNCj4+ICAgICAgVGhp
cyBwYXRjaCBpcyBkZXBlbmRlbnQgb24gImR0LWJpbmRpbmdzOiBuZXQ6IEFkZCBSZWFsdGVrIE1E
SU8NCj4+ICAgICAgY29udHJvbGxlciIgd2hpY2ggYWRkcyB0aGUgcmVhbHRlayxydGw5MzAxLW1k
aW8ueWFtbCBiaW5kaW5nLg0KPj4gICAgICANCj4+ICAgICAgQ2hhbmdlcyBpbiB2NToNCj4+ICAg
ICAgLSBOb3RlIGRlcGVuZGVuY3kgb24gcmVhbHRlayxydGw5MzAxLW1kaW8ueWFtbCBwYXRjaA0K
Pj4gICAgICAtIEFkZCBiYWNrIHJlZyBwcm9wZXJ0eSB0byB0aGUgbWRpby1jb250cm9sbGVyIG5v
ZGUuDQo+PiAgICAgIENoYW5nZXMgaW4gdjQ6DQo+PiAgICAgIC0gVGhlcmUgaXMgYSBzaW5nbGUg
TURJTyBjb250cm9sbGVyIHRoYXQgaGFzIE1ESU8gYnVzZXMgYXMgY2hpbGRyZW4NCj4+ICAgICAg
Q2hhbmdlcyBpbiB2MzoNCj4+ICAgICAgLSBOb25lDQo+PiAgICAgIENoYW5nZXMgaW4gdjI6DQo+
PiAgICAgIC0gTm9uZQ0KPj4NCj4+ICAgLi4uL2JpbmRpbmdzL21mZC9yZWFsdGVrLHJ0bDkzMDEt
c3dpdGNoLnlhbWwgIHwgMjkgKysrKysrKysrKysrKysrKysrKw0KPj4gICAxIGZpbGUgY2hhbmdl
ZCwgMjkgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWZkL3JlYWx0ZWsscnRsOTMwMS1zd2l0Y2gueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvcmVhbHRlayxydGw5MzAxLXN3aXRjaC55
YW1sDQo+PiBpbmRleCBmMDUzMzAzYWIxZTYuLjg5ZTEwMjEzYTRlZSAxMDA2NDQNCj4+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvcmVhbHRlayxydGw5MzAxLXN3
aXRjaC55YW1sDQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZk
L3JlYWx0ZWsscnRsOTMwMS1zd2l0Y2gueWFtbA0KPj4gQEAgLTI4LDYgKzI4LDkgQEAgcHJvcGVy
dGllczoNCj4+ICAgICByZWc6DQo+PiAgICAgICBtYXhJdGVtczogMQ0KPj4gICANCj4+ICsgIG1k
aW8tY29udHJvbGxlcjoNCj4+ICsgICAgJHJlZjogL3NjaGVtYXMvbmV0L3JlYWx0ZWsscnRsOTMw
MS1tZGlvLnlhbWwjDQo+PiArDQo+PiAgICAgJyNhZGRyZXNzLWNlbGxzJzoNCj4+ICAgICAgIGNv
bnN0OiAxDQo+PiAgIA0KPj4gQEAgLTQxLDYgKzQ0LDEwIEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOg0K
Pj4gICAgICdpMmNAWzAtOWEtZl0rJCc6DQo+PiAgICAgICAkcmVmOiAvc2NoZW1hcy9pMmMvcmVh
bHRlayxydGw5MzAxLWkyYy55YW1sIw0KPj4gICANCj4+ICsgICdtZGlvLWNvbnRyb2xsZXJAWzAt
OWEtZl0rJCc6DQo+PiArICAgICRyZWY6IC9zY2hlbWFzL25ldC9yZWFsdGVrLHJ0bDkzMDEtbWRp
by55YW1sIw0KPj4gKw0KPj4gKw0KPj4gICByZXF1aXJlZDoNCj4+ICAgICAtIGNvbXBhdGlibGUN
Cj4+ICAgICAtIHJlZw0KPj4gQEAgLTExMCw1ICsxMTcsMjcgQEAgZXhhbXBsZXM6DQo+PiAgICAg
ICAgICAgICB9Ow0KPj4gICAgICAgICAgIH07DQo+PiAgICAgICAgIH07DQo+PiArDQo+PiArICAg
ICAgbWRpby1jb250cm9sbGVyQGNhMDAgew0KPj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJyZWFs
dGVrLHJ0bDkzMDEtbWRpbyI7DQo+PiArICAgICAgICByZWcgPSA8MHhjYTAwIDB4MjAwPjsNCj4+
ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPj4gKyAgICAgICAgI3NpemUtY2VsbHMg
PSA8MD47DQo+PiArDQo+PiArICAgICAgICBtZGlvLWJ1c0AwIHsNCj4+ICsgICAgICAgICAgcmVn
ID0gPDA+Ow0KPj4gKyAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4+ICsgICAgICAg
ICAgI3NpemUtY2VsbHMgPSA8MD47DQo+PiArDQo+PiArICAgICAgICAgIGV0aGVybmV0LXBoeUAw
IHsNCj4+ICsgICAgICAgICAgICByZWcgPSA8MD47DQo+PiArICAgICAgICAgICAgcmVhbHRlayxw
b3J0ID0gPDE+Ow0KPiBBcmVuJ3QgYWxsIHRob3NlIFBIWXMgcmVmZXJlbmNlZCBhcyBwaGFuZGxl
cyBieSBEU0Egc3dpdGNoIHBvcnRzPw0KDQpJJ20gc3RpbGwgdGlwdG9laW5nIGFyb3VuZCB3aGV0
aGVyIHRoaXMgdGhpbmcgd2lsbCBiZSBEU0Egb3IgDQpzd2l0Y2hkZXZbMV0uIEluIHRoZW9yeSB0
aGUgUlRMOTMwMCBjb3VsZCBiZSBlaXRoZXIgYWx0aG91Z2ggdGhlIA0Kc3BlY2lmaWMgZGVzaWdu
IEknbSB3b3JraW5nIHVzZXMgdGhlIGludGVybmFsIENQVSBjb3JlIHNvIGl0J3MgbW9yZSANCnN3
aXRjaGRldiBsaWtlLiBCaW5kaW5nIHdpc2UgdGhlIG1kaW8tYnVzIGFycmFuZ2VtZW50IHdvdWxk
IGJlIGZhaXJseSANCnNpbWlsYXIgaW4gZWl0aGVyIGNhc2UuDQoNCj4gSW1obyBpdCB3b3VsZCBi
ZSBiZXR0ZXIgdG8gbm90IGludHJvZHVjZSBhIG5ldyBwcm9wZXJ0eSBidXQgaW5zdGVhZA0KPiBs
ZXQgdGhlIGRyaXZlciBvZiB0aGUgbWRpby1jb250cm9sbGVyIHBhcnNlIHRoZSBEU0Egc3dpdGNo
IGRlc2NyaXB0aW9uDQo+IGFuZCBmb2xsb3cgdGhlIGV4aXN0aW5nICdwaHktaGFuZGxlJyBwcm9w
ZXJ0aWVzIGluIG9yZGVyIHRvIGluZmVyIHRoZQ0KPiBtYXBwaW5nIG9mIGFsbCBwb3J0cyB0byBh
bGwgUEhZcywgYW5kIGJ5IHRoYXQgdGhlbiBiZSBhYmxlIHRvIGFsc28NCj4ga25vdyB0aGUgcmV2
ZXJzZSBtYXBwaW5nLg0KPiBZb3UgY291bGQgcmVmZXJlbmNlIHRoZSBzd2l0Y2ggbm9kZSBpbiB0
aGUgbWRpby1jb250cm9sbGVyIG5vZGUuDQoNCkFzIGl0IHN0YW5kcyB0aGUgc3dpdGNoIG5vZGUg
aXMgdGhlIHBhcmVudCBvZiB0aGUgbWRpby1jb250cm9sbGVyICh0aGF0IA0KbWF5IGFjdHVhbGx5
IGhlbHAgYXMgcHJlc3VtYWJseSBJIGNhbiBnbyB2aWEgdGhlIHBhcmVudCByYXRoZXIgdGhhbiBh
IA0KcGhhbmRsZSkuIEkndmUga2luZCBvZiBhdm9pZGVkIGRvaW5nIGFueXRoaW5nIGludm9sdmlu
ZyB0b28gbXVjaCBvZiB0aGUgDQpzd2l0Y2ggYmVjYXVzZSBJIHdhcyBob3BpbmcgdG8gbGFuZCB0
aGUgbWRpbyBkcml2ZXIgaW5kZXBlbmRlbnRseS4gTWF5YmUgDQpJIHN0aWxsIGNhbiBhcyBsb25n
IGFzIEkgZGVmaW5lIHRoZSBiaW5kaW5nIGZvciB0aGUgc3dpdGNoIGJsb2NrIG5vdy4gSXMgDQpp
cyB0aGUgZG9uZSB0aGluZyBmb3Igb25lIG5vZGUgaW4gdGhlIGR0cyB0byBwYXJzZSBpbmZvcm1h
dGlvbiBmcm9tIGEgDQpzZWNvbmQ/DQoNCj4NCj4gVGhhdCB3b3VsZCBhdm9pZCByZWR1bmRhbnQg
aW5mb3JtYXRpb24gaW4gdGhlIGRldmljZSB0cmVlLCBhcyB3ZQ0KPiB3b3VsZCB0aGVuIG9ubHkg
aGF2ZSBvbmUgbWFwcGluZyBpbnN0ZWFkIG9mIGhhdmluZyBpdCB0d28gdGltZXMNCj4gKG9uY2Ug
YnkgdGhlIHVzdWFsICdwaHktaGFuZGxlJyBwcm9wZXJ0eSBvZiB0aGUgRFNBIHVzZXIgcG9ydCBh
bmQNCj4gYW5vdGhlciB0aW1lIHJldmVyc2UgdXNpbmcgeW91ciBuZXdseSBpbnRyb2R1Y2UgJ3Jl
YWx0ZWsscG9ydCcNCj4gcHJvcGVydHkgb2YgZWFjaCBldGhlcm5ldC1waHkpLg0KDQpZZXMgdGhh
dCBtYWtlcyBzZW5zZS4gSXQgZG9lcyBtZWFuIEkgbmVlZCB0byBzdGFydCBkZWZpbmluZyB0aGUg
YmluZGluZyANCmZvciB0aGUgYWN0dWFsIHN3aXRjaCBwb3J0aW9uIHdoaWNoIEkndmUgYmVlbiBw
dXR0aW5nIG9mZi4gVGltZSB0byByb2xsIA0KdXAgdGhvc2Ugc2xlZXZlcy4NCg0KPg0KPj4gKyAg
ICAgICAgICB9Ow0KPj4gKyAgICAgICAgICBldGhlcm5ldC1waHlAMSB7DQo+PiArICAgICAgICAg
ICAgcmVnID0gPDE+Ow0KPj4gKyAgICAgICAgICAgIHJlYWx0ZWsscG9ydCA9IDwwPjsNCj4+ICsg
ICAgICAgICAgfTsNCj4+ICsgICAgICAgIH07DQo+PiArICAgICAgfTsNCj4+ICAgICAgIH07DQo+
PiAgIA0KPj4gLS0gDQo+PiAyLjQ4LjENCj4+DQo+Pg0KWzFdIC0gDQpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sL2IxNWIxNWNlLWFlMjQtNGUwNC04M2FiLTg3MDE3MjI2ZjU1OEBhbGxpZWR0
ZWxlc2lzLmNvLm56LyANCg==

