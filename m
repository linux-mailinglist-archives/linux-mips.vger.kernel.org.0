Return-Path: <linux-mips+bounces-5634-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C0D984C7D
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2024 23:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C69C284A4D
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2024 21:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FD513C9A9;
	Tue, 24 Sep 2024 20:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="0Nd38scR"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC5A126BE2
	for <linux-mips@vger.kernel.org>; Tue, 24 Sep 2024 20:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727211597; cv=none; b=vE7E4InFZX/MTzqSWMTN8f1RhV7Qie5sdWN/rmILQC9zqH1Eqjb+Vp/szxcwnZkD/2snVilvN9uO7IDKkKBBS5haCw2aWE9yZUvv32uVR+kKKv/E+SUsLajLwUCE18+O1ArDVTXHzcJOlSCYkn7NDyQIeL8io3V6Yz85QESjAwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727211597; c=relaxed/simple;
	bh=F0NySuw+1Mi/zwOeNou5xptnOdfV09UdfSmITN7TqXw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i+5db1OFuQjC8rIl7I7EzPPw/QfZht3xYhrwP7poNAKFsHRYC5MyKuZtk1SHAeSx6sSWVqeki4uUPHEiiWbSlrXGAzb7of/sh9Ci1/Rar3QCDcdD/RmDziwiYcf0ejm6skpJXUX4+2uIj+XfkDVnxbcC0Tf4HPuGXj+go1vMHX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=0Nd38scR; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id ABF532C05DB;
	Wed, 25 Sep 2024 08:59:51 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727211591;
	bh=F0NySuw+1Mi/zwOeNou5xptnOdfV09UdfSmITN7TqXw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=0Nd38scRInGDpkjSvIiLokGjRONFeBZbx/lh03liIYmV3Bp3mFEmd1jeM6RW0fPI+
	 PSeIX/IuIJXcBgyFKkeqCt8f9IyURosXixRk2EWAPYDF4mYER2C7FJLcJds3w5AeIQ
	 LQjBKFiE+UOp525ZRq7NX+tcTxwtuJZwcUHiB3ek/ARBePvD8dRu16iTiYxzYTlBRD
	 GSrh+/2j2zw3IHKDtFNfaURehEVc3gl5BWK5nvSJh/KpIIjuTDloWlGb5yOjygzxig
	 K/dMVSzcN4kaA1k+Cc4W4PjsGAZIiXFtxqQdcmfzn1yGTjfZLwuKkOur/FNU6/Zx0r
	 ++WOQ4N4itkJg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f328470001>; Wed, 25 Sep 2024 08:59:51 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Wed, 25 Sep 2024 08:59:51 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Wed, 25 Sep 2024 08:59:51 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Wed, 25 Sep 2024 08:59:51 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "lee@kernel.org" <lee@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "tsbogend@alpha.franken.de"
	<tsbogend@alpha.franken.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] dt-bindings: mfd: Add more RTL9300 variants
Thread-Topic: [PATCH v4 3/3] dt-bindings: mfd: Add more RTL9300 variants
Thread-Index: AQHbDgvzHsRZE1+bAU2/6OUmALaMF7Jl1ZaAgADOiwA=
Date: Tue, 24 Sep 2024 20:59:50 +0000
Message-ID: <0886f3fb-4e05-4787-aecc-5a5b8a3b8d73@alliedtelesis.co.nz>
References: <20240923225719.2999821-1-chris.packham@alliedtelesis.co.nz>
 <20240923225719.2999821-4-chris.packham@alliedtelesis.co.nz>
 <zir7rpbrq3c6kyn2guanmfnkbw6e36qb5r4onzwv7qgytt64if@jurnymcbgx2k>
In-Reply-To: <zir7rpbrq3c6kyn2guanmfnkbw6e36qb5r4onzwv7qgytt64if@jurnymcbgx2k>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <2EB0FB5711EDED4287C2EC06293DE693@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f32847 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=fVmL-KQr-q2pSxy-RWIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

DQpPbiAyNC8wOS8yNCAyMDo0MCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gVHVl
LCBTZXAgMjQsIDIwMjQgYXQgMTA6NTc6MTlBTSArMTIwMCwgQ2hyaXMgUGFja2hhbSB3cm90ZToN
Cj4+IEFkZCB0aGUgUlRMOTMwMSwgUlRMOTMwMEIgYW5kIFJUTDkzMDMuIFRoZXNlIGhhdmUgdGhl
IHNhbWUgU29DIGFzIHRoZQ0KPj4gUlRMOTMwMkMgYnV0IGRpZmZlciBpbiB0aGUgRXRoZXJuZXQg
c3dpdGNoL1NFUkRFUyBhcnJhbmdlbWVudC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBQ
YWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+PiAtLS0NCj4+DQo+
PiBOb3RlczoNCj4+ICAgICAgQ2hhbmdlcyBpbiB2NDoNCj4+ICAgICAgLSBOZXcNCj4+DQo+PiAg
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9yZWFsdGVrLHJ0bDkzMDJjLXN3aXRjaC55YW1s
ICAgICAgIHwgMyArKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPj4N
Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3Jl
YWx0ZWsscnRsOTMwMmMtc3dpdGNoLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWZkL3JlYWx0ZWsscnRsOTMwMmMtc3dpdGNoLnlhbWwNCj4+IGluZGV4IDJkMjBkZDA3
YTdlOS4uYTNiYTZkOWJhY2FhIDEwMDY0NA0KPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21mZC9yZWFsdGVrLHJ0bDkzMDJjLXN3aXRjaC55YW1sDQo+PiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3JlYWx0ZWsscnRsOTMwMmMtc3dp
dGNoLnlhbWwNCj4+IEBAIC0xOCw3ICsxOCwxMCBAQCBwcm9wZXJ0aWVzOg0KPj4gICAgIGNvbXBh
dGlibGU6DQo+PiAgICAgICBpdGVtczoNCj4+ICAgICAgICAgLSBlbnVtOg0KPj4gKyAgICAgICAg
ICAtIHJlYWx0ZWsscnRsOTMwMS1zd2l0Y2gNCj4+ICsgICAgICAgICAgLSByZWFsdGVrLHJ0bDkz
MDJiLXN3aXRjaA0KPj4gICAgICAgICAgICAgLSByZWFsdGVrLHJ0bDkzMDJjLXN3aXRjaA0KPj4g
KyAgICAgICAgICAtIHJlYWx0ZWsscnRsOTMwMy1zd2l0Y2gNCj4gVGhpcyBzaG91bGQgYmUgc3F1
YXNoZWQuIE9uZSBsb2dpY2FsIGNoYW5nZSBpcyB0byBhZGQgYSBuZXcgYmluZGluZyBmb3INCj4g
ZW50aXJlIGZhbWlseSwgbm90IGRldmljZS1ieS1kZXZpY2UuDQpZZXMgSSBkaWQgY29uc2lkZXIg
dGhhdC4gVGhlIG1haW4gdGhpbmcgdGhhdCBnYXZlIG1lIHBhdXNlIGZvciB0aG91Z2h0IA0Kd2Fz
IHRoZSBmaWxlIG5hbWluZyB0aGluZy4gSWYgSSBzcXVhc2ggdGhpcyBzaG91bGQgSSBzd2l0Y2gg
YmFjayB0byB0aGUgDQpyZWFsdGVrLHJ0bDkzMDAtc3dpdGNoIGZpbGVuYW1lPyBJJ2xsIHByb2Jh
Ymx5IGFkZCB0aGUgDQpyZWFsdGVrLHJ0bDkzMDAtc3dpdGNoIGZhbGxiYWNrIGFzIHdlbGwgKGFu
ZCBhZGQgdGhlIGNoaXAgc3BlY2lmaWMgDQpjb21wYXRpYmxlcyBmb3IgdGhlIGkyYykuDQo+DQo+
IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+

