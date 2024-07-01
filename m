Return-Path: <linux-mips+bounces-4058-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2690391D724
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 06:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A87FCB2173E
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 04:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B9622071;
	Mon,  1 Jul 2024 04:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="oxfjPuNa"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3181366
	for <linux-mips@vger.kernel.org>; Mon,  1 Jul 2024 04:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719808916; cv=none; b=C5OWPzLtwdOP7DrCdTGIfBUF9Sjgv/H67f5xJeCdJSNqUJb0PVlSIWwv7XFLmL93EcY/CmHZLOmSKRr39THx4UQp4QELXuSIgrhxDAjOUMOCQqWDeVJsaWYqXp7BzWQKY/E99vD65UHJpfF1coshMPfj2hTtX2Kx1yuEmql+u7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719808916; c=relaxed/simple;
	bh=06YkxrgCoIoGvHH9fxP45rR9QuR+rPkZTVRF1V+qI1U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ONZ6446GsSObag1emwzfDtGOw3Yk/HpWHwT+HwSfo/BGnhbZ3HgKVY1OPGdvrnsUf/5RdQwYHxTug6EQpHwJqpXg5K3zs1UkEb4I8xTCW6yRfLlQ7XJX2yCaFhfBt9YJSQ8vI9a5FY66dSMC9/giQIyLjhynNjqtDpMUzLgrCr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=oxfjPuNa; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 797962C09B5;
	Mon,  1 Jul 2024 16:41:52 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719808912;
	bh=06YkxrgCoIoGvHH9fxP45rR9QuR+rPkZTVRF1V+qI1U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=oxfjPuNa6qhNgUYSREKuvo8rZvUJEnKh9UKCWa66Gq6xOHBpVBoE9KRyTKjEXIX+P
	 RA5ewvtD8Co72K/4rBdufVzrzPOL0+L+m9YAcNokT3hwWIkJW7gAjfkELuk0RtKSoR
	 O8EB0qLitMfs8Ga2Pz36jYEP5ycgLRW67r8sIvaaOu2wzCVYm0DlKbG0TDifIzQTV4
	 OatG9zIHSxTs6K57UMr2wYkDn0G5wpTkDJApmavTaFXFPq72bv7AYIAULU7RBLmk3g
	 v/0Y/ShAJnUeBTPZ7nSejTRMYyDzNv41N2ImT2nKBwJSnXQvCFQRpURCjdFgRNJtn2
	 Czl+HYF02q1TA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B668233900001>; Mon, 01 Jul 2024 16:41:52 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 1 Jul 2024 16:41:52 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Mon, 1 Jul 2024 16:41:52 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: =?utf-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
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
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"ericwouds@gmail.com" <ericwouds@gmail.com>, Markus Stockhausen
	<markus.stockhausen@gmx.de>
Subject: Re: [PATCH v3 7/9] clocksource: realtek: Add timer driver for
 rtl-otto platforms
Thread-Topic: [PATCH v3 7/9] clocksource: realtek: Add timer driver for
 rtl-otto platforms
Thread-Index: AQHayEslEo613VNYNk2gJ1HCuf0QnrHarVaAgAXa5IA=
Date: Mon, 1 Jul 2024 04:41:52 +0000
Message-ID: <3520a743-2962-43ee-83f5-3e9384fe4c42@alliedtelesis.co.nz>
References: <20240627043317.3751996-1-chris.packham@alliedtelesis.co.nz>
 <20240627043317.3751996-8-chris.packham@alliedtelesis.co.nz>
 <20240627131707.3410b4d3@dellmb>
In-Reply-To: <20240627131707.3410b4d3@dellmb>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A25C4C26E9A7643B660717A75A50263@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=66823390 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=4kmOji7k6h8A:10 a=otBbUuXHAfLwFJZbIYsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

DQpPbiAyNy8wNi8yNCAyMzoxNywgTWFyZWsgQmVow7puIHdyb3RlOg0KPiBPbiBUaHUsIDI3IEp1
biAyMDI0IDE2OjMzOjE1ICsxMjAwDQo+IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxs
aWVkdGVsZXNpcy5jby5uej4gd3JvdGU6DQo+DQo+PiArLyogU2ltcGxlIGludGVybmFsIHJlZ2lz
dGVyIGZ1bmN0aW9ucyAqLw0KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBydHRtX3NldF9jb3VudGVy
KHZvaWQgX19pb21lbSAqYmFzZSwgdW5zaWduZWQgaW50IGNvdW50ZXIpDQo+PiArew0KPj4gKwlp
b3dyaXRlMzIoY291bnRlciwgYmFzZSArIFJUVE1fQ05UKTsNCj4gVGhlc2UgcmVxdWlyZSAjaW5j
bHVkZSA8YXNtL2lvLmg+DQpsaW51eC9pby5oIEknbSBndWVzc2luZy4NCj4+ICsvKiBBZ2dyZWdh
dGVkIGNvbnRyb2wgZnVuY3Rpb25zIGZvciBrZXJuZWwgY2xvY2sgZnJhbWV3b3JrICovDQo+PiAr
I2RlZmluZSBSVFRNX0RFQlVHKGJhc2UpCQkJXA0KPj4gKwlwcl9kZWJ1ZygiLS0tLS0tLS0tLS0t
LSAlZCAlcFxuIiwJXA0KPj4gKwkJIHNtcF9wcm9jZXNzb3JfaWQoKSwgYmFzZSkNCj4gI2luY2x1
ZGUgPGxpbnV4L3ByaW50ay5oPg0KYWNrDQo+PiArc3RhdGljIGlycXJldHVybl90IHJ0dG1fdGlt
ZXJfaW50ZXJydXB0KGludCBpcnEsIHZvaWQgKmRldl9pZCkNCj4+ICt7DQo+PiArCXN0cnVjdCBj
bG9ja19ldmVudF9kZXZpY2UgKmNsa2V2dCA9IGRldl9pZDsNCj4+ICsJc3RydWN0IHRpbWVyX29m
ICp0byA9IHRvX3RpbWVyX29mKGNsa2V2dCk7DQo+PiArDQo+PiArCXJ0dG1fYWNrX2lycSh0by0+
b2ZfYmFzZS5iYXNlKTsNCj4+ICsJUlRUTV9ERUJVRyh0by0+b2ZfYmFzZS5iYXNlKTsNCj4+ICsJ
Y2xrZXZ0LT5ldmVudF9oYW5kbGVyKGNsa2V2dCk7DQo+IEFsdGhvdWdoIHlvdSBpbmNsdWRlICJ0
aW1lci1vZi5oIiwgd2hpY2ggaW5jbHVkZXMgY2xvY2tjaGlwcy5oLCBwbGVhc2UNCj4gZG8gYWxz
byBleHBsaWNpdCAjaW5jbHVkZSA8bGludXgvY2xvY2tjaGlwcy5oPg0KPg0KPj4gKwlydHRtX3Nl
dF9wZXJpb2QodG8tPm9mX2Jhc2UuYmFzZSwgUlRUTV9USUNLU19QRVJfU0VDIC8gSFopOw0KPiBI
WiAtPiBsaW51eC9qaWZmaWVzLmgsIG9yIG1heWJlIGFzbS9wYXJhbS5oDQphY2sNCj4+ICtzdGF0
aWMgdTY0IHJ0dG1fcmVhZF9jbG9ja3NvdXJjZShzdHJ1Y3QgY2xvY2tzb3VyY2UgKmNzKQ0KPj4g
K3sNCj4+ICsJc3RydWN0IHJ0dG1fY3MgKnJjcyA9IGNvbnRhaW5lcl9vZihjcywgc3RydWN0IHJ0
dG1fY3MsIGNzKTsNCj4+ICsNCj4+ICsJcmV0dXJuICh1NjQpcnR0bV9nZXRfY291bnRlcihyY3Mt
PnRvLm9mX2Jhc2UuYmFzZSk7DQo+IFJlZHVuZGFudCBjYXN0IHRvIHU2NC4NCmFjaw0KPj4gKwly
dHRtX2VuYWJsZV90aW1lcihyY3MtPnRvLm9mX2Jhc2UuYmFzZSwgUlRUTV9DVFJMX1RJTUVSLA0K
Pj4gKwkJCSAgcmNzLT50by5vZl9jbGsucmF0ZSAvIFJUVE1fVElDS1NfUEVSX1NFQyk7DQo+IElz
IHRoaXMgY29ycmVjdD8gU29tZXRpbWVzIGl0IG1ha2VzIHNlbnNlIHRvIHVzZSBESVZfUk9VTkRf
Q0xPU0VTVCwgYnV0DQo+IG1heWJlIG5vdCBoZXJlLg0KDQpJdCdzIE9LIGZvciBtZSBiZWNhdXNl
IHRoZSBMZXhyYSBidXMgY2xvY2sgaXMgMTc1bWh6IHNvIHBsYWluIGRpdmlzaW9uIA0Kd29ya3Mg
ZmluZS4gVGhlIGRvY3MgZG8gc2F5IHNvbWV0aGluZyBhYm91dCBhIGNvbmZpZ3VyYWJsZSBkaXZp
c29yIGJ1dCANCnRoZSByYW5nZSBzZWVtcyBmYWlybHkgbGltaXRlZCBzbyBJIGRvbid0IHRoaW5r
IHRoZXJlJ3MgYSBzcGVjaWZpYyBuZWVkIA0KdG8gdXNlIERJVl9ST1VORF9DTE9TRVNULg0KDQo+
DQo+PiArc3RhdGljIHU2NCBub3RyYWNlIHJ0dG1fcmVhZF9jbG9jayh2b2lkKQ0KPj4gK3sNCj4+
ICsJcmV0dXJuICh1NjQpcnR0bV9nZXRfY291bnRlcihydHRtX2NzLnRvLm9mX2Jhc2UuYmFzZSk7
DQo+IFJlZHVuZGFudCBjYXN0IHRvIHU2NC4NCmFjaw0KPj4gK3N0YXRpYyBpbnQgX19pbml0IHJ0
dG1fcHJvYmUoc3RydWN0IGRldmljZV9ub2RlICpucCkNCj4+ICt7DQo+PiArCWludCBjcHUsIGNw
dV9yb2xsYmFjazsNCj4gdW5zaWduZWQgaW50Pw0KYWNrDQo+PiArCXN0cnVjdCB0aW1lcl9vZiAq
dG87DQo+PiArCWludCBjbGtpZHggPSBudW1fcG9zc2libGVfY3B1cygpOw0KPiBsaW51eC9jcHVt
YXNrLmgsIHVuc2lnbmVkIGludA0KYWNrDQo+IE1hcmVr

