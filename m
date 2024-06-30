Return-Path: <linux-mips+bounces-4047-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C0E91D4C8
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 01:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9F3C1F21150
	for <lists+linux-mips@lfdr.de>; Sun, 30 Jun 2024 23:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6EBB6EB4A;
	Sun, 30 Jun 2024 23:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="s2LYvG3D"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F1446436
	for <linux-mips@vger.kernel.org>; Sun, 30 Jun 2024 23:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719791004; cv=none; b=rKuwj9jKr2vvvn6mHLfnkts315sGAIJCqvKpE3Au4+/a7Zp9yjRG7/V1YrH7nvRsOW27kLj70m3n/9ypETLpYpW4WTF4q2oN9gciLlr8x6ID/3u5d88A/YAr6Ttgs6CU//DaBOlQaGfSq8Ba0zOVTz5XJMFufbMj0f9VrPafbpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719791004; c=relaxed/simple;
	bh=dQeSb5HUW7PzZSG5/RZUjMe9QcWragkoEU+5VJR1etM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C5/ztayWBaNXTD23QYu82hdSrDVYBk+R9VGupQBI9ZTxcMX5d+I6SlFgTyg//byo6kR34hCuBKfcsSxLzN+eBnZ7TFWX6aqpGt/8WA3nS+d5raVoZisHfkjk92FmkgjgxRG5xMIXbn7lYHg13/ISO3nllrGuROnMk/IQcpCVqDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=s2LYvG3D; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 567BE2C0659;
	Mon,  1 Jul 2024 11:43:20 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719791000;
	bh=dQeSb5HUW7PzZSG5/RZUjMe9QcWragkoEU+5VJR1etM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=s2LYvG3DxXDJNGnpVBFlQtZLkYk6CA7WvsT5RILhx4q7J/I55IAPtXIk8YAhptnU3
	 +VQ6XqBBx+bHgckvO+KBcFOfXDtrabcxl9RlK8k2ivXZQ4KutxslSH3HA49ZWhEE0O
	 sl7mJ5M/RsrCHdjQbZrbpdNk1mvDCFcSFJbDJhEeKKkn/iIluNxIekS10wqUdIgGTR
	 TAdGxi0AfG5JRPgC56rUdta3NwpDHtFagTS+eqBqS9onm+WA76syDDXosyyGR42TDQ
	 6OmdXUAjWPaiiasG+ui9NYQXTVx94Z9wUSigMopLYhZuIsePJKbNGjE+3ZuAHpZzaK
	 q+me/VUGvRw0w==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6681ed980001>; Mon, 01 Jul 2024 11:43:20 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Mon, 1 Jul 2024 11:43:20 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Mon, 1 Jul 2024 11:43:19 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Mon, 1 Jul 2024 11:43:19 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Rob Herring <robh@kernel.org>
CC: "tglx@linutronix.de" <tglx@linutronix.de>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"paulburton@kernel.org" <paulburton@kernel.org>, "peterz@infradead.org"
	<peterz@infradead.org>, "mail@birger-koblitz.de" <mail@birger-koblitz.de>,
	"bert@biot.com" <bert@biot.com>, "john@phrozen.org" <john@phrozen.org>,
	"sander@svanheule.net" <sander@svanheule.net>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "kabel@kernel.org" <kabel@kernel.org>,
	"ericwouds@gmail.com" <ericwouds@gmail.com>
Subject: Re: [PATCH v3 0/9] mips: Support for RTL9302C
Thread-Topic: [PATCH v3 0/9] mips: Support for RTL9302C
Thread-Index: AQHayEskNTyKeYqN80i0yhPI3N/Ix7Ha5qwAgAVOJYA=
Date: Sun, 30 Jun 2024 23:43:19 +0000
Message-ID: <68a574c0-2775-4275-b590-b7f362ae3885@alliedtelesis.co.nz>
References: <20240627043317.3751996-1-chris.packham@alliedtelesis.co.nz>
 <CAL_Jsq+1M47kRb5xELSqroPLbava4TJkiLjDT8er0=iiBmutfw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+1M47kRb5xELSqroPLbava4TJkiLjDT8er0=iiBmutfw@mail.gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <2409619D9F17424C9145CE4DA7C6D3F2@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=6681ed98 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=4kmOji7k6h8A:10 a=JeTaMc2W5e4oDVImXegA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

DQpPbiAyOC8wNi8yNCAwMjo0MiwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IE9uIFdlZCwgSnVuIDI2
LCAyMDI0IGF0IDEwOjMz4oCvUE0gQ2hyaXMgUGFja2hhbQ0KPiA8Y2hyaXMucGFja2hhbUBhbGxp
ZWR0ZWxlc2lzLmNvLm56PiB3cm90ZToNCj4+IFRoaXMgc2VyaWVzIGFkZHMgYmFzaWMgc3VwcG9y
dCBmb3IgdGhlIFJUTDkzMDJDIHJlZmVyZW5jZSBib2FyZC4gQ3VycmVudGx5IHRoZQ0KPj4gZm9j
dXMgaXMgb24gdGhlIENQVSBibG9jayBzdHVmZi4gSSBob3BlIHRvIGdldCBhcm91bmQgdG8gdGhl
IERTQSBzd2l0Y2ggZHJpdmVyDQo+PiBldmVudHVhbGx5IGJ1dCB0aGlzIGlzIGEgc21hbGwgc3Rh
cnQgdGhhdCBsZXRzIG1lIGJvb3QgYSBtYWlubGluZSBrZXJuZWwgb24gdGhlDQo+PiBib2FyZCBJ
IGhhdmUuIEkgaW5pdGlhbGl5IHN0YXJ0ZWQgd2l0aCBjb2RlIGZyb20gb3BlbndydCBidXQgaGF2
ZSBwYWlyZWQgaXQNCj4+IGRvd24gdG8ganVzdCB0aGUgY2xvY2tzb3VyY2UgZHJpdmVyIGFuZCBk
ZXZpY2V0cmVlLg0KPiBZb3VyIGVtYWlscyBhcmUgYmVpbmcgc2VudCBhcyBxdW90ZWQtcHJpbnRh
YmxlIGVuY29kaW5nIHdoaWNoIGlzDQo+IGdlbmVyYWxseSBwcmVmZXJyZWQgdG8gYmUgYXZvaWRl
ZCBvbiBtYWlsbGlzdHMgKGFzIGlzIGJhc2U2NCkuDQo+IGdpdC1zZW5kLWVtYWlsIHNob3VsZCBu
b3JtYWxseSB1c2UgOC1iaXQgZW5jb2RpbmcsIGJ1dCB0aGUgbWFuIHBhZ2UNCj4gaW5kaWNhdGVz
IFFQIG1heSBiZSB1c2VkIGlmIHRoZXJlIGFyZSBjYXJyaWFnZSByZXR1cm5zICh0aGVyZQ0KPiBz
aG91bGRuJ3QgYmUpLg0KDQpIbW0gaGVyZSdzIHRoZSBvdXRwdXQgZnJvbSB3aGVuIEkgc2VudCB0
aGlzIHNlcmllcy4NCg0KU3ViamVjdDogW1BBVENIIHYzIDAvOV0gbWlwczogU3VwcG9ydCBmb3Ig
UlRMOTMwMkMNCkRhdGU6IFRodSwgMjcgSnVuIDIwMjQgMTY6MzM6MDggKzEyMDANCk1lc3NhZ2Ut
SUQ6IDwyMDI0MDYyNzA0MzMxNy4zNzUxOTk2LTEtY2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lz
LmNvLm56Pg0KWC1NYWlsZXI6IGdpdC1zZW5kLWVtYWlsIDIuNDUuMg0KTUlNRS1WZXJzaW9uOiAx
LjANCkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQNCg0KQWxsIHRoZSBwYXRjaGVzIGFy
ZSBhbHNvIDhiaXQuIFNvIEkgdGhpbmsgZ2l0IGNob3NlIHRoZSByaWdodCB0aGluZy4NCg0KSSBk
byBrZWVwIG5lZWRpbmcgdG8gY29udmluY2UgVGh1bmRlcmJpcmQgdG8gc2VuZCBteSByZXBsaWVz
IGFzIHBsYWluIA0KdGV4dC4gT2NjYXNpb25hbGx5IEkgZm9yZ2V0IGFuZCB2Z2VyIGNvbXBsYWlu
cyBhdCBtZS4NCg==

