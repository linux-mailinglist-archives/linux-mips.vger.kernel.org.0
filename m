Return-Path: <linux-mips+bounces-7598-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD04A1AB8E
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 21:45:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79ADE3AC955
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 20:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E73C1C5F2A;
	Thu, 23 Jan 2025 20:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="CEYqExAy"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09AF1C5D57
	for <linux-mips@vger.kernel.org>; Thu, 23 Jan 2025 20:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737665108; cv=none; b=uAHeeMhnmBU9Uul9ax1vU7y5d3BBFc2CegFVwPJHcae7VDoGQx1qZ8pL6TIl2m++dE5kG1tQOqpZDEwpwyG8PUdiZXZzlL/xVBCA9L59Gl1JyJ/56BvLrMATaYukfvVBMzd3xP6wLOpTKwmv/r+7yptnW3/ACOP7HuDcxJvumB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737665108; c=relaxed/simple;
	bh=kBIbSpr34EvuOR4+mjAlsB60W3wU/YdITOzcX8IILa0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Iz+4yCX0caKA9RTr3tvKag0nP4cautw5GxNNADGHX+otf7S5vMMvJxeweJuOiG6ZV6cdfkhDbXNyHnm+TB4ghC0dab4/AbxaSL5tPOeb6XiAXJ6erohGRL87+BvEI7HyaaQbpL3sK4FmMhvClpEO8JGE1NnXpc78RxgoxXaxqDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=CEYqExAy; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 571542C0504;
	Fri, 24 Jan 2025 09:45:03 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1737665103;
	bh=kBIbSpr34EvuOR4+mjAlsB60W3wU/YdITOzcX8IILa0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=CEYqExAy9cFmnon0fUfZbscL0SDYqKaWm+0JEamOC5caU4T1YWnOgg9YSfGLerreQ
	 SQmyO/cmCGrj1OcNCkk7odu1Ob/mNuaqiTMVd1GulqQTKyD1jQmCrCrTESKaWbzhYO
	 qp5i04+TKu+PNmOrOn/Wg8VVde/G17DlT4jrYK3ihptN2BipAEyXGJ7Gu7+tc5hdrA
	 Z5BTADMTSMUgPKvU9lm8TgJCEzHMQcnzmmJIBxGe0rBRyBRrIN8VdI6w7WMh7mlQGC
	 +2I/qvHACHYSARkmtSQgA5PKGcldU+I2IJvE/T32E0fv+gzazNgh1HjaCsD+LFlDMn
	 BhJw2njwQUpVQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6792aa4f0001>; Fri, 24 Jan 2025 09:45:03 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 24 Jan 2025 09:45:02 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Fri, 24 Jan 2025 09:45:02 +1300
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
Subject: Re: [PATCH v4 1/4] dt-bindings: net: Add Realtek MDIO controller
Thread-Topic: [PATCH v4 1/4] dt-bindings: net: Add Realtek MDIO controller
Thread-Index: AQHbavAadjwojqGz4UuNGuTShat73rMhmt0AgAJkrgA=
Date: Thu, 23 Jan 2025 20:45:02 +0000
Message-ID: <6b026af2-62bc-4b7d-abc7-d4c6a99bd848@alliedtelesis.co.nz>
References: <20250120040214.2538839-1-chris.packham@alliedtelesis.co.nz>
 <20250120040214.2538839-2-chris.packham@alliedtelesis.co.nz>
 <20250122-obedient-owl-from-ganymede-4a8343@krzk-bin>
In-Reply-To: <20250122-obedient-owl-from-ganymede-4a8343@krzk-bin>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EFF16B82EBD504DA86BB95ADCFEAB52@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=6792aa4f a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=gEfo2CItAAAA:8 a=FK2JfaFBxtI52moMaAYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0

SGkgS3J6eXp0b2YsDQoNClNvcnJ5IG1lYW50IHRvIHJlcGx5IHRvIHRoaXMgeWVzdGVyZGF5IGJ1
dCByYW4gb3V0IG9mIHRpbWUNCg0KT24gMjIvMDEvMjAyNSAyMToxMiwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToNCj4gT24gTW9uLCBKYW4gMjAsIDIwMjUgYXQgMDU6MDI6MTFQTSArMTMwMCwg
Q2hyaXMgUGFja2hhbSB3cm90ZToNCj4+IEFkZCBkdHNjaGVtYSBmb3IgdGhlIE1ESU8gY29udHJv
bGxlciBmb3VuZCBpbiB0aGUgUlRMOTMwMCBTb0NzLiBUaGUNCj4+IGNvbnRyb2xsZXIgaXMgc2xp
Z2h0bHkgdW51c3VhbCBpbiB0aGF0IGRpcmVjdCBNRElPIGNvbW11bmljYXRpb24gaXMgbm90DQo+
PiBwb3NzaWJsZS4gV2UgbW9kZWwgdGhlIE1ESU8gY29udHJvbGxlciB3aXRoIHRoZSBNRElPIGJ1
c2VzIGFzIGNoaWxkDQo+PiBub2RlcyBhbmQgdGhlIFBIWXMgYXMgY2hpbGRyZW4gb2YgdGhlIGJ1
c2VzLiBCZWNhdXNlIHdlIGRvIG5lZWQgdGhlDQo+PiBzd2l0Y2ggcG9ydCBudW1iZXIgdG8gYWN0
dWFsbHkgY29tbXVuaWNhdGUgb3ZlciB0aGUgTURJTyBidXMgdGhpcyBuZWVkcw0KPj4gdG8gYmUg
c3VwcGxpZWQgdmlhIHRoZSAicmVhbHRlayxwb3J0IiBwcm9wZXJ0eS4NCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+
DQo+PiAtLS0NCj4+DQo+PiBOb3RlczoNCj4+ICAgICAgQ2hhbmdlcyBpbiB2NDoNCj4+ICAgICAg
LSBNb2RlbCB0aGUgTURJTyBjb250cm9sbGVyIHdpdGggdGhlIGJ1c2VzIGFzIGNoaWxkIG5vZGVz
LiBXZSBzdGlsbCBuZWVkDQo+PiAgICAgICAgdG8gZGVhbCB3aXRoIHRoZSBzd2l0Y2ggcG9ydCBu
dW1iZXIgc28gdGhpcyBpcyByZXByZXNlbnRlZCB3aXRoIHRoZQ0KPj4gICAgICAgICJyZWFsdGVr
LHBvcnQiIHByb3BlcnR5IHdoaWNoIG5lZWRzIHRvIGJlIGFkZGVkIHRvIHRoZSBNRElPIGJ1cw0K
Pj4gICAgICAgIGNoaWxkcmVuIChpLmUuIHRoZSBQSFlzKQ0KPj4gICAgICAtIEJlY2F1c2UgdGhl
IGFib3ZlIGlzIHF1aXRlIGEgZGVwYXJ0dXJlIGZyb20gZWFybGllciBJJ3ZlIGRyb3BwZWQgdGhl
DQo+PiAgICAgICAgci1ieQ0KPj4gICAgICBDaGFuZ2VzIGluIHYzOg0KPj4gICAgICAtIEFkZCBy
LWJ5IGZyb20gQ29ubm9yDQo+PiAgICAgIENoYW5nZXMgaW4gdjI6DQo+PiAgICAgIC0gTm9uZQ0K
Pj4NCj4+ICAgLi4uL2JpbmRpbmdzL25ldC9yZWFsdGVrLHJ0bDkzMDEtbWRpby55YW1sICAgIHwg
OTMgKysrKysrKysrKysrKysrKysrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgOTMgaW5zZXJ0aW9u
cygrKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL25ldC9yZWFsdGVrLHJ0bDkzMDEtbWRpby55YW1sDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvcmVhbHRlayxydGw5MzAxLW1k
aW8ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvcmVhbHRlayxy
dGw5MzAxLW1kaW8ueWFtbA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAw
MDAwMDAwMC4uZTNlY2IxYjRhZmQzDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3JlYWx0ZWsscnRsOTMwMS1tZGlvLnlhbWwN
Cj4+IEBAIC0wLDAgKzEsOTMgQEANCj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4+ICslWUFNTCAxLjINCj4+ICstLS0NCj4+ICsk
aWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL25ldC9yZWFsdGVrLHJ0bDkzMDEtbWRp
by55YW1sIw0KPj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMv
Y29yZS55YW1sIw0KPj4gKw0KPj4gK3RpdGxlOiBSZWFsdGVrIFJUTDkzMDAgTURJTyBDb250cm9s
bGVyDQo+PiArDQo+PiArbWFpbnRhaW5lcnM6DQo+PiArICAtIENocmlzIFBhY2toYW0gPGNocmlz
LnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCj4+ICsNCj4+ICtwcm9wZXJ0aWVzOg0KPj4g
KyAgY29tcGF0aWJsZToNCj4+ICsgICAgb25lT2Y6DQo+PiArICAgICAgLSBpdGVtczoNCj4+ICsg
ICAgICAgICAgLSBlbnVtOg0KPj4gKyAgICAgICAgICAgICAgLSByZWFsdGVrLHJ0bDkzMDJiLW1k
aW8NCj4+ICsgICAgICAgICAgICAgIC0gcmVhbHRlayxydGw5MzAyYy1tZGlvDQo+PiArICAgICAg
ICAgICAgICAtIHJlYWx0ZWsscnRsOTMwMy1tZGlvDQo+PiArICAgICAgICAgIC0gY29uc3Q6IHJl
YWx0ZWsscnRsOTMwMS1tZGlvDQo+PiArICAgICAgLSBjb25zdDogcmVhbHRlayxydGw5MzAxLW1k
aW8NCj4+ICsNCj4+ICsgICcjYWRkcmVzcy1jZWxscyc6DQo+PiArICAgIGNvbnN0OiAxDQo+PiAr
DQo+PiArICAnI3NpemUtY2VsbHMnOg0KPj4gKyAgICBjb25zdDogMA0KPj4gKw0KPj4gK3BhdHRl
cm5Qcm9wZXJ0aWVzOg0KPj4gKyAgJ15tZGlvLWJ1c0BbMC00XSQnOg0KPj4gKyAgICAkcmVmOiBt
ZGlvLnlhbWwjDQo+PiArDQo+PiArICAgIHByb3BlcnRpZXM6DQo+PiArICAgICAgcmVnOg0KPj4g
KyAgICAgICAgbWF4SXRlbXM6IDENCj4+ICsNCj4+ICsgICAgcmVxdWlyZWQ6DQo+PiArICAgICAg
LSByZWcNCj4+ICsNCj4+ICsgICAgcGF0dGVyblByb3BlcnRpZXM6DQo+PiArICAgICAgJ15ldGhl
cm5ldC1waHkoQFthLWYwLTldKyk/JzoNCj4gV2h5IGlzIHRoZSB1bml0IGFkZHJlc3Mgb3B0aW9u
YWw/DQoNCk5vIHNwZWNpZmljIHJlYXNvbi4gSSBjYW4gbWFrZSBpdCBtYW5kYXRvcnksIGluIGFs
bCBsaWtlbGlob29kIGFueSBib2FyZCANCnVzaW5nIHRoaXMgY2hpcCB3aWxsIGhhdmUgbW9yZSB0
aGFuIG9uZSBQSFkgY29ubmVjdGVkIHNvIGl0IHdvdWxkIGhhdmUgDQpiZWVuIGRlZmFjdG8gcmVx
dWlyZWQgYW55d2F5Lg0KDQo+PiArICAgICAgICB0eXBlOiBvYmplY3QNCj4+ICsgICAgICAgICRy
ZWY6IGV0aGVybmV0LXBoeS55YW1sIw0KPj4gKw0KPj4gKyAgICAgICAgcHJvcGVydGllczoNCj4+
ICsgICAgICAgICAgcmVhbHRlayxwb3J0Og0KPj4gKyAgICAgICAgICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPj4gKyAgICAgICAgICAgIGRlc2NyaXB0
aW9uOg0KPj4gKyAgICAgICAgICAgICAgVGhlIE1ESU8gY29tbXVuaWNhdGlvbiBvbiB0aGUgUlRM
OTMwMCBpcyBhYnN0cmFjdGVkIGJ5IHRoZSBzd2l0Y2guIEF0DQo+PiArICAgICAgICAgICAgICB0
aGUgc29mdHdhcmUgbGV2ZWwgY29tbXVuaWNhdGlvbiB1c2VzIHRoZSBzd2l0Y2ggcG9ydCB0byBh
ZGRyZXNzIHRoZQ0KPj4gKyAgICAgICAgICAgICAgUEhZIHdpdGggdGhlIGFjdHVhbCBNRElPIGJ1
cyBhbmQgYWRkcmVzcyBoYXZpbmcgYmVlbiBzZXR1cCB2aWEgdGhlDQo+PiArICAgICAgICAgICAg
ICBwYXJlbnQgbWRpby1idXMgYW5kIHJlZyBwcm9wZXJ0eS4NCj4gSSBkb24ndCBxdWl0ZSBnZXQg
d2h5IHRoaXMgY2Fubm90IGJlIHRoZSAncmVnJyBwcm9wZXJ0eS4gSSB1bmRlcnN0b29kIHRoYXQN
Cj4gJ3JlZycgb2YgdGhpcyBub2RlIGlzIG5vdCByZWFsbHkgdXNlZD8gT3IgeW91IG1lYW50IGhl
cmUgdGhpcyAncmVnJywgbm90DQo+IHBhcmVudCdzICdyZWcnPw0KDQpJdCdzIGlzIGEgYml0IGNv
bmZ1c2luZyAoYW55IHN1Z2dlc3Rpb25zIGZvciBpbXByb3ZpbmcgdGhlIGRlc2NyaXB0aW9uIA0K
YW5kL29yIGNvbW1pdCBtZXNzYWdlIGFyZSB3ZWxjb21lKS4NCg0KVGhlICdyZWcnIHByb3BlcnR5
IGhlcmUgaXMgdGhlIE1ESU8gYWRkcmVzcyBvZiB0aGUgUEhZLCB0aGUgcGFyZW50ICdyZWcnIA0K
aXMgdGhlIE1ESU8gYnVzIG51bWJlci4gVGhhdCdzIHRoZSBpbmZvcm1hdGlvbiB0aGUgIm5vcm1h
bCIgYmluZGluZ3MgZm9yIA0KRXRoZXJuZXQgUEhZcyB1c2UuIFRoZSBNRElPIChhLmsuYS4gU01J
KSBhY2Nlc3NlcyB2aWEgdGhlIFJUTDkzMDAgdXNlIA0KdGhlIHN3aXRjaCBwb3J0IHNvIHdlIG5l
ZWQgdG8ga25vdyB0aGUgc3dpdGNoIHBvcnQgbnVtYmVyLg0KDQpBbiBlYXJsaWVyIGluY2FybmF0
aW9uIG9mIHRoaXMgcGF0Y2hzZXQgaGFkIHRoZSBzd2l0Y2ggcG9ydCBudW1iZXIgDQptYXNxdWVy
YWRpbmcgYXMgdGhlIE1ESU8gYWRkcmVzcyBidXQgdGhhdCB3b3VsZCBoYXZlIGFsbG93ZWQgbm9u
c2Vuc2ljYWwgDQphZGRyZXNzZXMgPjB4MWYgYW5kIG1lYW50IHRoYXQgYXNwZWN0cyBvZiB0aGUg
aGFyZHdhcmUgZGVzaWduIHdlcmUgDQp0dWNrZWQgYXdheSBpbiBzcGVjaWFsIHZlbmRvciBzcGVj
aWZpYyBwcm9wZXJ0aWVzLiBUaGUgTURJTyBidXMvYWRkcmVzcyANCmlzIHN0aWxsIHVzZWQgaXQn
cyBqdXN0IHNldHVwIG9uY2UgYXQgcHJvYmUgdGltZSBhbmQgbm93IG15IGRyaXZlciBtYXBzIA0K
dGhlIE1ESU8gYnVzL2FkZHJlc3MgdG8gdGhlIHN3aXRjaCBwb3J0IG51bWJlciB0aGF0IHRoZSBo
YXJkd2FyZSANCnVsdGltYXRlbHkgdXNlcy4NCg==

