Return-Path: <linux-mips+bounces-3867-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 760FF913E7F
	for <lists+linux-mips@lfdr.de>; Sun, 23 Jun 2024 23:24:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C86BCB20BFA
	for <lists+linux-mips@lfdr.de>; Sun, 23 Jun 2024 21:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841C55A10B;
	Sun, 23 Jun 2024 21:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="OEIoKafs"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8EA1836F5
	for <linux-mips@vger.kernel.org>; Sun, 23 Jun 2024 21:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719177840; cv=none; b=Umbd0R1R8+tvjIWMVKVVMlBgGYac4GOVfQio4DdjLdn0SXyJ8QLROVzNQ6yrd1Ct2z/+fbwzncS9xmoSrxGRjTxC0sXUUvmKyHMJCYZ+qo82v7FyGiCiZ/WSjDTZBU0ojBJh2/YRY/HLSA17CsYvmoHDf07HOc09iynUSNS8g8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719177840; c=relaxed/simple;
	bh=P5/LDY2lSChGXHtxsxQBRgjLva86IWbJ9vHnJ6Fa+O8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m3eMrtaOrPv2Tzv3tI8VquxpOGh/ulKRnRQHSuQNQVW51CFVLtyeLT+W9T+i/zakxTaqkZR2q31dCSoWokI89rStgHeViOaGZAqOgy1ukZe0V08Nop4ujZzeiHnsPlOlHSX1ZR+uibGvZn66lZm5Bw/ywvoYloYfKpT5BiP+/3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=OEIoKafs; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A16B22C047F;
	Mon, 24 Jun 2024 09:23:55 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719177835;
	bh=P5/LDY2lSChGXHtxsxQBRgjLva86IWbJ9vHnJ6Fa+O8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=OEIoKafs19mMsZteaXnTGIptdgqy2YZsE60kRv3GBSnGuKF++Z1a4otTA+1ZKHbme
	 lst6Z/regfyCmZJqbAQbbTd4sR8zI4AjA1VLObJCjyMGTKslgGXvfnlRJldLTbxG9s
	 sWNqM7ZT0Wo+IZiDHnlhqIGA/2Ink8tAHXxchOVRqGQSIPuwii3xW6AgiyHa+UQqim
	 T/XwRDX/V+v5sD8bs6htJG7YEJJmz/zNxC65NSdtaoeXbz3TyYo5cdptmCTfvWFxe/
	 aG1YEzm0W80teIVqG5ogpRBpRBs219Egl4j1F2zrZRy0IuZ58ayb44tiUz2vuZMwLq
	 cjgs2bKfPF9ig==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6678926b0001>; Mon, 24 Jun 2024 09:23:55 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Mon, 24 Jun 2024 09:23:55 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.48; Mon, 24 Jun 2024 09:23:55 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Mon, 24 Jun 2024 09:23:55 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Conor Dooley <conor@kernel.org>
CC: "tglx@linutronix.de" <tglx@linutronix.de>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "tsbogend@alpha.franken.de"
	<tsbogend@alpha.franken.de>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "paulburton@kernel.org" <paulburton@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "mail@birger-koblitz.de"
	<mail@birger-koblitz.de>, "bert@biot.com" <bert@biot.com>, "john@phrozen.org"
	<john@phrozen.org>, "sander@svanheule.net" <sander@svanheule.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "kabel@kernel.org"
	<kabel@kernel.org>, "ericwouds@gmail.com" <ericwouds@gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: timer: Add schema for realtek,otto-timer
Thread-Topic: [PATCH 2/6] dt-bindings: timer: Add schema for
 realtek,otto-timer
Thread-Index: AQHaw5NdrllVI4VYYUmEuhwD4yFu7rHS6kyAgAIsrwA=
Date: Sun, 23 Jun 2024 21:23:55 +0000
Message-ID: <2ed9ba19-ef0b-481c-b17a-5499cc0664ed@alliedtelesis.co.nz>
References: <20240621042737.674128-1-chris.packham@alliedtelesis.co.nz>
 <20240621042737.674128-3-chris.packham@alliedtelesis.co.nz>
 <20240622-dagger-willpower-8dc828553384@spud>
In-Reply-To: <20240622-dagger-willpower-8dc828553384@spud>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <AFAD0E1DA7A4244BA512F827143D8C9E@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=6678926b a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=T1WGqf2p2xoA:10 a=gEfo2CItAAAA:8 a=2MXqo-X63jkm6lQBtrsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TRDAMGBw1lysTYkqMS0v:22 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0

KHJlc2VuZCBhcyBwbGFpbiB0ZXh0KQ0KDQpPbiAyMy8wNi8yNCAwMDoxMSwgQ29ub3IgRG9vbGV5
IHdyb3RlOg0KPiBPbiBGcmksIEp1biAyMSwgMjAyNCBhdCAwNDoyNzozM1BNICsxMjAwLCBDaHJp
cyBQYWNraGFtIHdyb3RlOg0KPj4gQWRkIHRoZSBkZXZpY2V0cmVlIHNjaGVtYSBmb3IgdGhlIHJl
YWx0ZWssb3R0by10aW1lciBwcmVzZW50IG9uIGEgbnVtYmVyDQo+PiBvZiBSZWFsdGVrIFNvQ3Mu
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgUGFja2hhbTxjaHJpcy5wYWNraGFtQGFsbGll
ZHRlbGVzaXMuY28ubno+DQo+PiAtLS0NCj4+ICAgLi4uL2JpbmRpbmdzL3RpbWVyL3JlYWx0ZWss
b3R0by10aW1lci55YW1sICAgIHwgNTQgKysrKysrKysrKysrKysrKysrKw0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3JlYWx0ZWssb3R0by10aW1lci55YW1s
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90
aW1lci9yZWFsdGVrLG90dG8tdGltZXIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy90aW1lci9yZWFsdGVrLG90dG8tdGltZXIueWFtbA0KPj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uYjZlODVhYWRiYzk5DQo+PiAtLS0gL2Rldi9u
dWxsDQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvcmVh
bHRlayxvdHRvLXRpbWVyLnlhbWwNCj4+IEBAIC0wLDAgKzEsNTQgQEANCj4+ICsjIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4+ICslWUFN
TCAxLjINCj4+ICstLS0NCj4+ICskaWQ6aHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvdGlt
ZXIvcmVhbHRlayxvdHRvLXRpbWVyLnlhbWwjDQo+PiArJHNjaGVtYTpodHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4+ICsNCj4+ICt0aXRsZTogUmVhbHRlayBP
dHRvIFNvQ3MgVGltZXIvQ291bnRlcg0KPj4gKw0KPj4gK2Rlc2NyaXB0aW9uOg0KPj4gKyAgUmVh
bHRlayBTb0NzIHN1cHBvcnQgYSBudW1iZXIgb2YgdGltZXJzL2NvdW50ZXJzLiBUaGVzZSBhcmUg
dXNlZA0KPj4gKyAgYXMgYSBwZXIgQ1BVIGNsb2NrIGV2ZW50IGdlbmVyYXRvciBhbmQgYW4gb3Zl
cmFsbCBDUFUgY2xvY2tzb3VyY2UuDQo+PiArDQo+PiArbWFpbnRhaW5lcnM6DQo+PiArICAtIENo
cmlzIFBhY2toYW08Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KPj4gKw0KPj4g
K3Byb3BlcnRpZXM6DQo+PiArICAkbm9kZW5hbWU6DQo+PiArICAgIHBhdHRlcm46ICJedGltZXJA
WzAtOWEtZl0rJCINCj4+ICsNCj4+ICsgIGNvbXBhdGlibGU6DQo+PiArICAgIGl0ZW1zOg0KPj4g
KyAgICAgIC0gZW51bToNCj4+ICsgICAgICAgICAgLSByZWFsdGVrLHJ0bDkzMHgtdGltZXINCg0K
SSdsbCBjaGFuZ2UgdGhpcyB0byBydGw5MzAyDQoNCj4+ICsgICAgICAtIGNvbnN0OiByZWFsdGVr
LG90dG8tdGltZXINCj4+ICsgIHJlZzoNCj4+ICsgICAgbWluSXRlbXM6IDUNCj4+ICsgICAgbWF4
SXRlbXM6IDUNCj4gU2luY2UgbWluaXRlbXMgPT0gbWF4aXRlbXMsIGNhbiB5b3UganVzdCBtYWtl
IHRoaXMgYSBsaXN0LCBhbmQgZGVmaW5lDQo+IHdoYXQgdGhleSBhbGwgYXJlPyBEaXR0byBpbnRl
cnJ1cHRzLg0KDQpUaGlzIGlzIHdoZXJlIG1vcmUgY29uZGl0aW9ucyBtaWdodCBuZWVkIHRvIGJl
IGFkZGVkLiBUaGUgcnRsOTMwMiBpcyBhIA0Kc2luZ2xlIGNvcmUgU29DLiBTbyB0ZWNobmljYWxs
eSBpdCBvbmx5IG5lZWRzIDIgdGltZXJzICh0aGUgaGFyZHdhcmUgDQpzdGlsbCBoYXMgNSBidXQg
MyB3b3VsZCBiZSB1bnVzZWQgYXQgdGhlIG1vbWVudCkuIFRoZSBydGw5MzEyIGlzIGEgZHVhbCAN
CmNvcmUgU29DIHNvIG5lZWRzIDMgdGltZXJzIChJIHdvbid0IGJlIGxvb2tpbmcgYXQgdGhhdCBw
bGF0Zm9ybSBmb3IgYSANCndoaWxlKS4gU28gSSB0aGluayBtYXliZSBtYXhJdGVtcyBzaG91bGQg
c3RheSBhdCA1IGJ1dCBtaW5JdGVtcyBzaG91bGQgDQpiZSBzZXQgYmFzZWQgb24gdGhlIGNvbXBh
dGlibGUuDQoNCj4gcmVnOg0KPiAgICBpdGVtczoNCj4gICAgICAtIGZvbw0KPiAgICAgIC0gYmFy
DQo+ICAgICAgLSBiYXoNCj4NCj4gZXRjLg0KDQpJIGNhbiBkby4gQnV0IHRoZXknZCBhbGwgYmUg
c29tZXRoaW5nIGxpa2UgY3B1Ti1ldmVudC4gVGhlIHdheSB0aGUgDQpkcml2ZXIgaXMgd3JpdHRl
biBpdCBncmFicyBhIHRpbWVyIGZvciBlYWNoIENQVSBhbmQgdXNlcyB0aGUgbmV4dCBvbmUgDQpm
b3IgYSBnbG9iYWwgdGltZXIuDQoNCj4+ICsNCj4+ICsgIGNsb2NrczoNCj4+ICsgICAgbWF4SXRl
bXM6IDENCj4+ICsNCj4+ICsgIGludGVycnVwdHM6DQo+PiArICAgIG1pbkl0ZW1zOiA1DQo+PiAr
ICAgIG1heEl0ZW1zOiA1DQo+PiArDQo+PiArcmVxdWlyZWQ6DQo+PiArICAtIGNvbXBhdGlibGUN
Cj4+ICsgIC0gcmVnDQo+PiArICAtIGNsb2Nrcw0KPj4gKyAgLSBpbnRlcnJ1cHRzDQo+PiArDQo+
PiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+PiArDQo+PiArZXhhbXBsZXM6DQo+PiAr
ICAtIHwNCj4+ICsgICAgdGltZXIwOiB0aW1lckAzMjAwIHsNCj4gVGhlIGxhYmVsIGhlcmUgaXNu
J3QgbmVlZGVkIEZZSS4NCg0KV2lsbCByZW1vdmUuDQoNCj4+ICsgICAgICBjb21wYXRpYmxlID0g
InJlYWx0ZWsscnRsOTMweC10aW1lciIsICJyZWFsdGVrLG90dG8tdGltZXIiOw0KPj4gKyAgICAg
IHJlZyA9IDwweDMyMDAgMHgxMD4sIDwweDMyMTAgMHgxMD4sIDwweDMyMjAgMHgxMD4sDQo+PiAr
ICAgICAgICAgICAgPDB4MzIzMCAweDEwPiwgPDB4MzI0MCAweDEwPjsNCj4+ICsNCj4+ICsgICAg
ICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZpbnRjPjsNCj4+ICsgICAgICBpbnRlcnJ1cHRzID0gPDcg
ND4sIDw4IDQ+LCA8OSA0PiwgPDEwIDQ+LCA8MTEgND47DQpXaWxsIHN3aXRjaCB0byB1c2luZyBw
cm9wZXIgSVJRIGZsYWdzLg0KPj4gKyAgICAgIGNsb2NrcyA9IDwmbHhfY2xrPjsNCj4+ICsgICAg
fTsNCj4+IC0tIA0KPj4gMi40NS4yDQo+Pg==

