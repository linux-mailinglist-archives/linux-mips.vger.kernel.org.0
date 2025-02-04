Return-Path: <linux-mips+bounces-7700-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1053A27C96
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2025 21:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A72B7A1F2C
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2025 20:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB27219A66;
	Tue,  4 Feb 2025 20:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="j+bv7sTF"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D271218AC3
	for <linux-mips@vger.kernel.org>; Tue,  4 Feb 2025 20:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738700095; cv=none; b=WYTgPYGE3nrA+sSgbPL1dBrEAUWlOmPCiVsQIQlbC5vrNlQX6yP7CUZtTnwJ9I7X1To9uQwDxMhh22gQ99AxvwwQXC8C3GwzWB5c7tR7iamd9Aax4BhIIP/+QaDs3pR2f1DMX6SjZ9n9lipeqDnQXGoCwYuv4AYX8nhthoA++MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738700095; c=relaxed/simple;
	bh=nurUDXp2o4MyvC3A0GkMdYpyppUckZpuZWdZNoV48dk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YM9jRVEyiUP7v8tUwiEvGcpUKKlUXLL50Y7GuTtQqHpmXhZf7Xm+PDo6F4zRLeAUeh7QhrvMRc+2lDX0OxBFFzAXGJGmPBSgldShFYONwuuzYZlucxABOmBimXhZFqUc0a0zjECn0j7JNRF+jXb/HOvPrZyzRGdaPWJkDEgdMjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=j+bv7sTF; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 97F032C0504;
	Wed,  5 Feb 2025 09:14:50 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1738700090;
	bh=nurUDXp2o4MyvC3A0GkMdYpyppUckZpuZWdZNoV48dk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=j+bv7sTFl3xyS2iPOJ7LZgGQavE8W4YOZZ2LwjJH7D7kFAI/WWY1ktWFn6VSJk/6q
	 RcUAiOjKwH6gmtF0R9lxPOtmRP3+eFnVdZP5FxmJSnPQYZP4sjtIIvULwefJuB6Dv3
	 zOTGDYxbDZMPfYtnqq4DDJw2wSbYGJ6zyGumXzOErgPIxVDNOHRoNU4F1DrIyMcQbe
	 EsClpNdJKP5d5wT1Rexjy1jLrh6/UN29vqDpTzcM+xo8/R7W3PPfimtp2ojX+e5dkR
	 JbOGjSxfLf6px3NwLcs82dS6B1tWgWqXfp3Qrd1kRDeU1SxxaPoFqdd1R+AI39MXvE
	 hQa1gv8hU5xcA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67a2753a0001>; Wed, 05 Feb 2025 09:14:50 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Feb 2025 09:14:50 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Wed, 5 Feb 2025 09:14:50 +1300
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
	<sander@svanheule.net>, "daniel@makrotopia.org" <daniel@makrotopia.org>,
	"markus.stockhausen@gmx.de" <markus.stockhausen@gmx.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH net-next v6 1/6] dt-bindings: mfd: Add switch to RTL9300
Thread-Topic: [PATCH net-next v6 1/6] dt-bindings: mfd: Add switch to RTL9300
Thread-Index: AQHbdrFNdM+zCo+02kyxGj8ZSMB8nrM18P+AgADKkoA=
Date: Tue, 4 Feb 2025 20:14:50 +0000
Message-ID: <3087ea19-8c2a-47c8-adbe-d05009c6f07b@alliedtelesis.co.nz>
References: <20250204030249.1965444-1-chris.packham@alliedtelesis.co.nz>
 <20250204030249.1965444-2-chris.packham@alliedtelesis.co.nz>
 <20250204-eccentric-deer-of-felicity-02b7ee@krzk-bin>
In-Reply-To: <20250204-eccentric-deer-of-felicity-02b7ee@krzk-bin>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF262CAB6F67264C92EB4994F80E6A84@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=QNvLRRLL c=1 sm=1 tr=0 ts=67a2753a a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=0d4TXYnWXBS5P1Ol6EEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgS3J6eXN6dG9mLA0KDQpPbiAwNC8wMi8yMDI1IDIxOjA5LCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOg0KPiBPbiBUdWUsIEZlYiAwNCwgMjAyNSBhdCAwNDowMjo0NFBNICsxMzAwLCBDaHJp
cyBQYWNraGFtIHdyb3RlOg0KPj4gQWRkIGJpbmRpbmdzIGZvciB0aGUgZXRoZXJuZXQtc3dpdGNo
IHBvcnRpb24gb2YgdGhlIFJUTDkzMDAuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgUGFj
a2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KPj4gLS0tDQo+Pg0KPj4g
Tm90ZXM6DQo+PiAgICAgIENoYW5nZXMgaW4gdjY6DQo+PiAgICAgIC0gTmV3DQo+PiAgICAgIC0g
SSdkIGxpa2UgdG8gZW5mb3JjZSB0aGUgcHJvcGVydHkgYmVpbmcgImV0aGVybmV0LXBvcnRzIiBi
dXQgSSBzZWUgdGhlDQo+PiAgICAgICAgZ2VuZXJpYyBiaW5kaW5nIGFsbG93cyAicG9ydHMiIGFz
IHdlbGwuIENhbiBJIGp1c3QgYWRkIGV0aGVybmV0LXBvcnRzOg0KPj4gICAgICAgIHR5cGU6IG9i
amVjdCBoZXJlIG9yIGRvZXMgYnkgZHJpdmVyIG5lZWQgdG8gaGFuZGxlIGJvdGggInBvcnRzIiBh
bmQNCj4+ICAgICAgICAiZXRoZXJuZXQtcG9ydHMiIChJIHNlZSBzb21lIGRvIGFuZCBzb21lIGRv
bid0KS4NCj4+DQo+PiAgIC4uLi9iaW5kaW5ncy9tZmQvcmVhbHRlayxydGw5MzAxLXN3aXRjaC55
YW1sICAgICB8IDE2ICsrKysrKysrKysrKysrKy0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE1IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9yZWFsdGVrLHJ0bDkzMDEtc3dpdGNoLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3JlYWx0ZWsscnRsOTMwMS1z
d2l0Y2gueWFtbA0KPj4gaW5kZXggZjA1MzMwM2FiMWU2Li5jYjU0YWJkYTVlNmEgMTAwNjQ0DQo+
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3JlYWx0ZWsscnRs
OTMwMS1zd2l0Y2gueWFtbA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21mZC9yZWFsdGVrLHJ0bDkzMDEtc3dpdGNoLnlhbWwNCj4+IEBAIC0xNCw2ICsxNCw4IEBA
IGRlc2NyaXB0aW9uOg0KPj4gICAgIG51bWJlciBvZiBkaWZmZXJlbnQgcGVyaXBoZXJhbHMgYXJl
IGFjY2Vzc2VkIHRocm91Z2ggYSBjb21tb24gcmVnaXN0ZXIgYmxvY2ssDQo+PiAgICAgcmVwcmVz
ZW50ZWQgaGVyZSBhcyBhIHN5c2NvbiBub2RlLg0KPj4gICANCj4+ICskcmVmOiAvc2NoZW1hcy9u
ZXQvZXRoZXJuZXQtc3dpdGNoLnlhbWwjDQo+PiArDQo+PiAgIHByb3BlcnRpZXM6DQo+PiAgICAg
Y29tcGF0aWJsZToNCj4+ICAgICAgIGl0ZW1zOg0KPj4gQEAgLTQ1LDcgKzQ3LDcgQEAgcmVxdWly
ZWQ6DQo+PiAgICAgLSBjb21wYXRpYmxlDQo+PiAgICAgLSByZWcNCj4+ICAgDQo+IEkgZG9uJ3Qg
Z2V0IHdoeSB0aGlzIGRldmljZSByZWNlaXZlcyBub3cgY2hpbGRyZW4gd2l0aG91dCBhZGRyZXNz
ZXMuDQo+IEVpdGhlciB5b3VyIGNoaWxkcmVuIGhhdmUgJ3JlZycgb3IgdGhleSBkbyBub3QuIE1p
eGluZyBpcyBhIHNpZ24gb2YgYQ0KPiBtZXNzLCBsaWtlIHRoaXMgd2FzIG5ldmVyIGFjdHVhbGx5
IHNpbXBsZS1tZmQuDQo+DQo+IFlvdSB3b3VsZCBnZXQgdGhpcyBjb21tZW50IGlmIHlvdSBwb3N0
ZWQgY29tcGxldGUgc2NoZW1hIHRoZSBmaXJzdCB0aW1lLg0KDQpZZXMgZmFpciBlbm91Z2guIEkg
dGhpbmsgSSBlcnJlZCB0b28gZmFyIG9uIHRoZSBzaWRlIG9mIHRyeWluZyB0byBzZW5kIA0Kc21h
bGwgY2h1bmtzIChhbmQgYWxzbyBub3Qgd2FudGluZyB0byBjb21taXQgdG8gYSBiaW5kaW5nIGJl
Zm9yZSBJIGhhZCANCndvcmtpbmcgZHJpdmVycykuDQoNClNvIGhvdyBkbyB3ZSBtb3ZlIGZvcndh
cmQ/IFRoZXJlJ3Mgb25lIG1vcmUgcGF0Y2ggSSBoYXZlbid0IHNlbnQgeWV0IA0KdGhhdCBhZGRz
IGludGVycnVwdHMgZm9yIHRoZSBzd2l0Y2ggYmxvY2suIEJ1dCBvdGhlciB0aGFuIHRoYXQgSSB0
aGluayANCndoYXQgSSBoYXZlIG5vdyBjb3ZlcnMgYWxsIG9mIHRoZSBtYWpvciBjb21wb25lbnRz
IGluIHRoaXMgY2hpcC4NCg0KVGhlcmUncyBvbmx5IG9uZSBpbi10cmVlIGJvYXJkIHRoYXQgdXNl
cyB0aGlzIGFuZCBJJ20gdGhlIG1haW50YWluZXIgb2YgDQppdCBzbyB3aXRoZHJhd2luZyB0aGUg
bWZkIGJpbmRpbmcgYW5kIHJlcGxhY2luZyBpdCB3aXRoIHNvbWV0aGluZyBlbHNlIA0KaXMgbm90
IG91dCBvZiB0aGUgcXVlc3Rpb24uIFRoZXJlIG1heSBiZSBzb21lIGNvbXBsYWludHMgZnJvbSBt
YWtlIA0KZHRic19jaGVjayB3aGlsZSB3ZSBnZXQgdGhpcyBzb3J0ZWQgYnV0IGhvcGVmdWxseSB3
ZSBjYW4gZ2V0IHRoYXQgZG9uZSBzb29uLg0KDQo=

