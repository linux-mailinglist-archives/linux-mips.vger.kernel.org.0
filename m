Return-Path: <linux-mips+bounces-3960-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A70491998E
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2024 23:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB2B8B20FF5
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2024 21:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD513193060;
	Wed, 26 Jun 2024 21:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="wQfDhx4b"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097A614D6EB
	for <linux-mips@vger.kernel.org>; Wed, 26 Jun 2024 21:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719435722; cv=none; b=HhrjC29krn3D6msdDg+PcljRsTRNAF2FKkwaF4KamFsFUR4/SzlOTO8axB58148Eo/yw6y70B5OCEiFEYC+qCnOG533ltGpo+is4FBz6jtjoxUdQ65SqrmcAu+SD3nOlDZU5EhnIASQGVC6NOR/u09EqTS1Ne87dlflsb++TX7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719435722; c=relaxed/simple;
	bh=RuIuyy7XCrSnU37wPkziNaMBuPKw2bHWmxGd8XK1xHI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QIkrOcuJReZz0mJT0ptYwU7G40T1hxE+VU8jDOt2XuyuKC5cyaxR/pGi5OIaHCOqN6mRuHM9rfX58ZPyVn8bpzuVAMUZC7vgHGyF7Y4Q21EfXv9gjKJOEfJQ0A1FqJIwPkRRc4vu1hsYbibo/NE8aSwmc4Ynh2RJJ/TxpZLhzgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=wQfDhx4b; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CC5AD2C0241;
	Thu, 27 Jun 2024 09:01:51 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719435711;
	bh=RuIuyy7XCrSnU37wPkziNaMBuPKw2bHWmxGd8XK1xHI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=wQfDhx4b2L825eo7hlHWaee2V9FUXRWEPTN+o4tUse7h+2ksNZwAO4fmadxJS/69M
	 rJ9K29IqoZ1qx+7CNdVFdORl5enDVC3YAyQQ9NUYISDjDTdgayTB9UhDzNoY5/5NgB
	 fZr1Od1w1p9wPGR/SCRY1d7dC+pdaPxPL89Ae9Ntycok1TTg+8ADAZUmViScOk8HXQ
	 1WbfUg8VnxcZbbmXMcMDt744I1rIVRIflzUOGH4LqlEFL/LzrLMeCHGYkcIqceifks
	 9PJfSz80O6rV8pgOSX1Ok/515+uf/czwLeUjOkbei0JlPU+IoyMML5J4AQAk+hnWz4
	 Xe0LZa8gqlWFw==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B667c81bf0001>; Thu, 27 Jun 2024 09:01:51 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 27 Jun 2024 09:01:51 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Thu, 27 Jun 2024 09:01:51 +1200
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
Thread-Index: AQHaxdUTfhj+IoBSAkG+XrxufOOZIbHVjqYAgAADSgCAA0mCgIAA59oA
Date: Wed, 26 Jun 2024 21:01:51 +0000
Message-ID: <5267bf22-0b95-48ab-b207-ead4a697c263@alliedtelesis.co.nz>
References: <20240624012300.1713290-1-chris.packham@alliedtelesis.co.nz>
 <20240624012300.1713290-4-chris.packham@alliedtelesis.co.nz>
 <e71780a1-8d53-44ae-ac0f-d406de7e26e8@kernel.org>
 <2b33e7d2-24e5-48c3-a2e3-f128f5d7e39b@alliedtelesis.co.nz>
 <365fcddb-095d-4907-97bf-0810818c8265@kernel.org>
In-Reply-To: <365fcddb-095d-4907-97bf-0810818c8265@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <D408E81AC8E45849871C47152307CA11@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=667c81bf a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=T1WGqf2p2xoA:10 a=k_WA3fX4g_cc9GZlkBwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

DQpPbiAyNi8wNi8yNCAxOToxMiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gMjQv
MDYvMjAyNCAwNzowMCwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4+IEhpIEtyenlzenRvZiwNCj4+
DQo+PiBPbiAyNC8wNi8yNCAxNjo0OCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4+PiBP
biAyNC8wNi8yMDI0IDAzOjIyLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPj4+PiBBZGQgdGhlIHJ0
bDkzMHgtc29jIGFuZCBSVEw5MzAyQyBib2FyZCB0byB0aGUgbGlzdCBvZiBSZWFsdGVrIGNvbXBh
dGlibGUNCj4+PiA5MzB4IG9yIDkzMDI/DQo+PiBPb3BzLiBXaWxsIGZpeC4NCj4+DQo+Pj4+IHN0
cmluZ3MuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBh
Y2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCj4+Pj4gLS0tDQo+Pj4+DQo+Pj4+IE5vdGVzOg0K
Pj4+PiAgICAgICBDaGFuZ2VzIGluIHYyOg0KPj4+PiAgICAgICAtIFVzZSBzcGVjaWZpYyBjb21w
YXRpYmxlIGZvciBydGw5MzAyLXNvYw0KPj4+PiAgICAgICAtIEZpeCB0byBhbGxvdyBjb3JyZWN0
IGJvYXJkLCBzb2MgY29tcGF0aWJsZQ0KPj4+Pg0KPj4+PiAgICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWlwcy9yZWFsdGVrLXJ0bC55YW1sIHwgNCArKysrDQo+Pj4+ICAgIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9taXBzL3JlYWx0ZWstcnRsLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWlwcy9yZWFsdGVrLXJ0bC55YW1sDQo+
Pj4+IGluZGV4IGY4YWMzMDlkMjk5NC4uMDVkYWE1MzQxN2U1IDEwMDY0NA0KPj4+PiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWlwcy9yZWFsdGVrLXJ0bC55YW1sDQo+
Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9taXBzL3JlYWx0ZWst
cnRsLnlhbWwNCj4+Pj4gQEAgLTIwLDUgKzIwLDkgQEAgcHJvcGVydGllczoNCj4+Pj4gICAgICAg
ICAgICAgIC0gZW51bToNCj4+Pj4gICAgICAgICAgICAgICAgICAtIGNpc2NvLHNnMjIwLTI2DQo+
Pj4+ICAgICAgICAgICAgICAtIGNvbnN0OiByZWFsdGVrLHJ0bDgzODItc29jDQo+Pj4+ICsgICAg
ICAtIGl0ZW1zOg0KPj4+PiArICAgICAgICAgIC0gZW51bToNCj4+Pj4gKyAgICAgICAgICAgICAg
LSByZWFsdGVrLHJ0bDkzMDJjDQo+Pj4gV2h5IGJvYXJkIGhhcyB0aGUgbmFtZSBvZiBTb0M/DQo+
PiBXaGF0IEkgaGF2ZSBpcyBhY3R1YWxseSBhIHJlZmVyZW5jZSBib2FyZCB3aXRoIHRoZSBuYW1l
DQo+PiBSVEw5MzAyQ18yeFJUTDgyMjRfMlhHRS4gSWYgZm91bmQgdGhhdCBhIGJpdCBpbmNvbXBy
ZWhlbnNpYmxlIHNvIEkNCj4+IChvdmVyKSBzaG9ydGVuZWQgaXQuIFRlY2huaWNhbGx5IGl0IHdv
dWxkIGJlIHNvbWV0aGluZyBsaWtlDQo+PiBjYW1lbyxydGw5MzAyYy0yeC1ydGw4MjI0LTJ4Z2Ug
d2hpY2ggSSBjYW4gaW5jbHVkZSBpbiB0aGUgbmV4dCByb3VuZC4NCj4gTG9va3MgZmluZSB0byBt
ZS4NCj4NCj4+Pj4gKyAgICAgICAgICAtIGNvbnN0OiByZWFsdGVrLHJ0bDkzMDItc29jDQo+Pj4g
RHJvcCB0aGUgLXNvYyBzdWZmaXguIFRoZSBydGw5MzAyIGlzIHRoZSBzb2MuDQo+PiBPbiB0aGF0
LiBJIGhvcGUgdG8gZXZlbnR1YWxseSBhZGQgInJlYWx0ZWsscnRsOTMwMi1zd2l0Y2giIGZvciB0
aGUgRFNBDQo+PiBzd2l0Y2ggYmxvY2sgaW4gdGhlIHNhbWUgY2hpcC4gU28ga2VlcGluZyB0aGUg
LXNvYyBzdWZmaXggd2FzDQo+PiBpbnRlbnRpb25hbCB0byB0cnkgdG8gZGlzYW1iaWd1YXRlIHRo
aW5ncy4gSSBjYW4gZHJvcCB0aGUgLXNvYyBpZiB0aGUNCj4+IGNvbnNlbnN1cyBpcyB0aGF0IHRo
ZXJlIGlzIG5vIG5lZWQgdG8gZGlzYW1iaWd1YXRlIHRoZSB0d28uDQo+IFRoYW5rcyBmb3IgZXhw
bGFuYXRpb24sIGtpbmQgb2YgZGVwZW5kcyBvbiB3aGF0IGV4YWN0bHkgaXMgdGhpcy4gTW9zdCBv
Zg0KPiBTb0NzIGNvbXByaXNlIG9mIHNldmVyYWwgaXRlbXMuIFRoZSBlbnRpcmUgY2hpcCBpcyB0
aGUgc29jLCBlLmcuDQo+ICJxY29tLGZvbzEyMzQiLiBJdCBtaWdodCBoYXZlIE1BQy9FdGhlcm5l
dC93aGF0ZXZlciBpbnNpZGUsIGNvbnRyb2xsYWJsZQ0KPiBieSB0aGUgU29DIChMaW51eCwgYm9v
dGxvYWRlciwgVEYsIGh5cGVydmlzb3IsIG90aGVyIFZNIGd1ZXN0KSBhbmQgdGhhdA0KPiBwYXJ0
IGlzICJxY29tLGZvbzEyMzQtZXRoZXJuZXQiLiBSZWdhcmRsZXNzIHdoZXRoZXIgTGludXggT1Mg
YWN0dWFsbHkNCj4gY29udHJvbHMgaXQgb3Igbm90Lg0KPg0KPiBUaGUgcXVlc3Rpb24gaXMgd2hl
dGhlciBEU0Egc3dpdGNoIGlzIHBhcnQgb2YgdGhlIFNvQyBvciBub3QuDQoNClRoZSBSVEw5MzAy
QyBpcyBhIHNpbmdsZSBwYWNrYWdlIGJ1dCBJJ2QgYXNzdW1lIGludGVybmFsbHkgaXQgaGFzIA0K
bXVsdGlwbGUgZGllcy4NCg0KIEZyb20gdGhlIGJsb2NrIGRpYWdyYW0gaW4gdGhlIGRhdGFzaGVl
dCB0aGV5IGRvIGhhdmUgYSBwb3J0aW9uIHRoZXkgDQpjYWxsIHRoZSAiU29DIiB3aGljaCBoYXMg
dGhlIENQVSBhbmQgcGVyaXBoZXJhbHMgbGlrZSBVQVJUcywgR1BJT3MsIFNQSSANCmV0Yy4gVGhh
dCBpcyBzZXBhcmF0ZSBmcm9tIHRoZSBzd2l0Y2ggYmxvY2sgd2hpY2ggaGFzIGEgYnVuY2ggb2Yg
TUFDcywgDQpTRVJERVMgYW5kIHZhcmlvdXMgbmV0d29yayBzd2l0Y2ggdGFibGVzLiBTbyBiYXNl
ZCBvbiB0aGF0IA0KInJlYWx0ZWsscnRsOTMwMi1zb2MiIGFuZCAicmVhbHRlayxydGw5MzAyLXN3
aXRjaCIgYXMgdHdvIHNlcGFyYXRlIA0KdGhpbmdzIG1ha2Ugc2Vuc2UgdG8gbWUuDQoNCkknbSBz
dGlsbCB0cnlpbmcgdG8gZmlndXJlIG91dCBhIGJpdCBtb3JlIG9mIHRoZSBkZXRhaWxzLiBUaGUg
YmxvY2sgDQpkaWFncmFtIGxvb2tzIGEgbG90IGxpa2UgeW91J2QgZXhwZWN0IHRvIHNlZSB3aXRo
IGEgdHJhZGl0aW9uYWwgRFNBIA0Kc3dpdGNoIHdoZXJlIHlvdSBoYXZlIGEgU29DIEV0aGVybmV0
IE5JQy9NQUMgY29ubmVjdGVkIHRvIG9uZSBwb3J0IG9mIGEgDQpzd2l0Y2guIEJ1dCBnZXR0aW5n
IGludG8gdGhlIGRhdGFzaGVldCBpdCBsb29rcyBsaWtlIHdoYXQgdGhleSBjYWxsIHRoZSANCk5J
QyBpcyBhY3R1YWxseSBqdXN0IHRoZSBETUEgcG9ydGlvbiBvZiB0aGUgc3dpdGNoIGFzIHRoZSBy
ZWdpc3RlcnMgYXJlIA0KYWxsIGluIHRoYXQgc2Vjb25kIGJsb2NrLiBBcyBpcyB0aGUgTURJTyBp
bnRlcmZhY2UuIEknbSBjb25zaWRlcmluZyB0aGF0IA0KbWF5YmUgdGhlIERTQSBtb2RlbCBpc24n
dCByaWdodCBmb3IgdGhpcyBhbmQgSSBzaG91bGQgYmUgbG9va2luZyBhdCANCnN3aXRjaGRldiBp
bnN0ZWFkLg0KDQo+DQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+

