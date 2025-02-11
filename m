Return-Path: <linux-mips+bounces-7740-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F30A3172F
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 22:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F15093A2691
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 21:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65BC264F95;
	Tue, 11 Feb 2025 21:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="lIYAB+CH"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AADD2641CA
	for <linux-mips@vger.kernel.org>; Tue, 11 Feb 2025 21:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739308004; cv=none; b=Pl7kex1mBx+UjEgdBQcufpwUgjguEjcfHrPaGp3KRYQmAG5fzDMEYJb/n4e3tZWS/0n2NNYGwDkdGIiS4+yX8787SAVi+UIUSuEfJ2qQidg5/fUDsxAaQ/9yQfjXeWkQRv/uthJHJGR0+xS6q36lkVkUVADZS2hotrJz1djSmRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739308004; c=relaxed/simple;
	bh=J+hVs6e//vHFgi0b32SqEreWeRMT7ejhN0dTtr8MH1o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X+Mda52Hkl68NZlz+Cysx12PdBdxbWtk3eXDpQyKXjnG4QRzzjlsbWcKmDyn7/qmSH4Y/4wOAwZ7YbG6AQTK4BJFFIpCBFjCpOO0gukJphgb9QfYil40IHScu4TXiFFwbpY1Rl7Dgn3M4QleVomw7Dii0lCEu69RmOzNOlpSTWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=lIYAB+CH; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 942F72C02A8;
	Wed, 12 Feb 2025 10:06:34 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1739307994;
	bh=J+hVs6e//vHFgi0b32SqEreWeRMT7ejhN0dTtr8MH1o=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=lIYAB+CHbcZDmFuBg8DDXyAJrKEibG7KpIPj3siBkWC2vx6tKwIFBm7/U87cqoexT
	 2kqWC8geetfg+zKKopgBGdMrr3r3wADwnpYGBREWP8tXPI7kfT9ZLcKbKfwEPGK4pw
	 3kYnkxJQe6Sbl7KLE+MA59mX2Tgk6nTqdMf40Yap2f+i0k6FS+ePCjiA5HyCsr4/an
	 QGD14c9IiGjKBQHa4/hxgSG+hlH8gguLkCCeewtuFmqYuMTGJnE41k4GMlwtZcSWew
	 XS6eF7dXzcsFS8YM8mu103YK2+kfCISEqeBVaYv4dvpkof/6pF/XHtU45j+EeggGga
	 HARBcwefWR/EA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67abbbda0001>; Wed, 12 Feb 2025 10:06:34 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Feb 2025 10:06:34 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Wed, 12 Feb 2025 10:06:34 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Sander Vanheule <sander@svanheule.net>, "lee@kernel.org" <lee@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "daniel@makrotopia.org" <daniel@makrotopia.org>,
	"markus.stockhausen@gmx.de" <markus.stockhausen@gmx.de>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH net-next v6 4/6] net: mdio: Add RTL9300 MDIO driver
Thread-Topic: [PATCH net-next v6 4/6] net: mdio: Add RTL9300 MDIO driver
Thread-Index: AQHbdrFbzRDaB5FJKUWZObR7MHYqebM+M/KAgAOWZYA=
Date: Tue, 11 Feb 2025 21:06:34 +0000
Message-ID: <bdfe3418-19c0-4c1e-b5f0-9bbe07b1db2c@alliedtelesis.co.nz>
References: <20250204030249.1965444-1-chris.packham@alliedtelesis.co.nz>
 <20250204030249.1965444-5-chris.packham@alliedtelesis.co.nz>
 <091a2e9cc6fedd99f35da124f67a54b69478648f.camel@svanheule.net>
In-Reply-To: <091a2e9cc6fedd99f35da124f67a54b69478648f.camel@svanheule.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <50E13F01366D854B9E2AAF0631479E51@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=QNvLRRLL c=1 sm=1 tr=0 ts=67abbbda a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=VwQbUJbxAAAA:8 a=JlFAmtSrY9ouPlbKkEYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgU2FuZGVyLA0KDQpJJ2xsIGhvbGQgb2ZmIG9uIHNlbmRpbmcgdjcgdW50aWwgSSBzb3J0IG91
dCB0aGUgbWVzcyBJJ3ZlIG1hZGUgd2l0aCB0aGUgDQpkdC1iaW5kaW5ncyAoc3B1biBvZmYgaW50
byBhIGRpZmZlcmVudCBzZXJpZXMgWzFdKQ0KDQpbMV0gLSANCmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xrbWwvMjAyNTAyMDkyMzQ3NTEuNDYwNDA0LTEtY2hyaXMucGFja2hhbUBhbGxpZWR0ZWxl
c2lzLmNvLm56Lw0KDQpPbiAxMC8wMi8yMDI1IDAzOjE5LCBTYW5kZXIgVmFuaGV1bGUgd3JvdGU6
DQo+IEhpIENocmlzLA0KPg0KPiBPbiBUdWUsIDIwMjUtMDItMDQgYXQgMTY6MDIgKzEzMDAsIENo
cmlzIFBhY2toYW0gd3JvdGU6DQo+PiBBZGQgYSBkcml2ZXIgZm9yIHRoZSBNRElPIGNvbnRyb2xs
ZXIgb24gdGhlIFJUTDkzMDAgZmFtaWx5IG9mIEV0aGVybmV0DQo+PiBzd2l0Y2hlcyB3aXRoIGlu
dGVncmF0ZWQgU29DLiBUaGVyZSBhcmUgNCBwaHlzaWNhbCBTTUkgaW50ZXJmYWNlcyBvbiB0aGUN
Cj4+IFJUTDkzMDAgaG93ZXZlciBhY2Nlc3MgaXMgZG9uZSB1c2luZyB0aGUgc3dpdGNoIHBvcnRz
LiBUaGUgZHJpdmVyIHRha2VzDQo+PiB0aGUgTURJTyBidXMgaGllcmFyY2h5IGZyb20gdGhlIERU
UyBhbmQgdXNlcyB0aGlzIHRvIGNvbmZpZ3VyZSB0aGUNCj4+IHN3aXRjaCBwb3J0cyBzbyB0aGV5
IGFyZSBhc3NvY2lhdGVkIHdpdGggdGhlIGNvcnJlY3QgUEhZLiBUaGlzIG1hcHBpbmcNCj4+IGlz
IGFsc28gdXNlZCB3aGVuIGRlYWxpbmcgd2l0aCBzb2Z0d2FyZSByZXF1ZXN0cyBmcm9tIHBoeWxp
Yi4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFs
bGllZHRlbGVzaXMuY28ubno+DQo+PiAtLS0NCj4+DQo+PiBOb3RlczoNCj4+ICDCoMKgwqAgQ2hh
bmdlcyBpbiB2NjoNCj4+ICDCoMKgwqAgLSBQYXJzZSBwb3J0LT5waHkgbWFwcGluZyBmcm9tIGRl
dmljZXRyZWUgcmVtb3ZpbmcgdGhlIG5lZWQgZm9yIHRoZQ0KPj4gIMKgwqDCoMKgwqAgcmVhbHRl
ayxwb3J0IHByb3BlcnR5DQo+IEdvb2QgdG8gc2VlIHlvdSBmb3VuZCBhIHdheSB0byBkbyB0aGlz
IQ0KPg0KPg0KPj4gKy8qDQo+PiArICogTURJTyBjb250cm9sbGVyIGZvciBSVEw5MzAwIHN3aXRj
aGVzIHdpdGggaW50ZWdyYXRlZCBTb0MuDQo+PiArICoNCj4+ICsgKiBUaGUgTURJTyBjb21tdW5p
Y2F0aW9uIGlzIGFic3RyYWN0ZWQgYnkgdGhlIHN3aXRjaC4gQXQgdGhlIHNvZnR3YXJlIGxldmVs
DQo+PiArICogY29tbXVuaWNhdGlvbiB1c2VzIHRoZSBzd2l0Y2ggcG9ydCB0byBhZGRyZXNzIHRo
ZSBQSFkuIFdlIHdvcmsgb3V0IHRoZQ0KPj4gKyAqIG1hcHBpbmcgYmFzZWQgb24gdGhlIE1ESU8g
YnVzIGRlc2NyaWJlZCBpbiBkZXZpY2UgdHJlZSBhbmQgdGhlIHJlYWx0ZWsscG9ydA0KPj4gKyAq
IHByb3BlcnR5Lg0KPj4gKyAqLw0KPiBOZWVkcyBhbiB1cGRhdGUgYWdhaW4gOy0pDQpZZXAgd2ls
bCBkby4NCj4+ICtzdGF0aWMgaW50IHJ0bDkzMDBfbWRpb19waHlfdG9fcG9ydChzdHJ1Y3QgbWlp
X2J1cyAqYnVzLCBpbnQgcGh5X2lkKQ0KPj4gK3sNCj4+ICsJc3RydWN0IHJ0bDkzMDBfbWRpb19j
aGFuICpjaGFuID0gYnVzLT5wcml2Ow0KPj4gKwlzdHJ1Y3QgcnRsOTMwMF9tZGlvX3ByaXYgKnBy
aXYgPSBjaGFuLT5wcml2Ow0KPj4gKwlpbnQgaTsNCj4+ICsNCj4+ICsJZm9yIChpID0gZmluZF9m
aXJzdF9iaXQocHJpdi0+dmFsaWRfcG9ydHMsIE1BWF9QT1JUUyk7DQo+PiArCcKgwqDCoMKgIGkg
PCBNQVhfUE9SVFM7DQo+PiArCcKgwqDCoMKgIGkgPSBmaW5kX25leHRfYml0KHByaXYtPnZhbGlk
X3BvcnRzLCBNQVhfUE9SVFMsIGkgKyAxKSkNCj4gWW91IGNvdWxkIHVzZSB0aGUgZm9yX2VhY2hf
c2V0X2JpdChpLCBwcml2LT52YWxpZF9wb3J0cywgTUFYX1BPUlRTKSBsb29wIG1hY3JvLg0KDQpJ
IGZpZ3VyZWQgdGhlcmUgbXVzdCBiZSBhIHdyYXBwZXIgZm9yIHRoaXMgaWRpb20gYnV0IEkgY291
bGRuJ3QgZmluZCBpdCANCmZvciBsb29raW5nLg0KDQo+PiArc3RhdGljIGludCBydGw5MzAwX21k
aW9fcmVhZF9jMjIoc3RydWN0IG1paV9idXMgKmJ1cywgaW50IHBoeV9pZCwgaW50IHJlZ251bSkN
Cj4+ICt7DQo+IFsuLi5dDQo+PiArDQo+PiArCWVyciA9IHJlZ21hcF93cml0ZShyZWdtYXAsIFNN
SV9BQ0NFU1NfUEhZX0NUUkxfMiwgcG9ydCA8PCAxNik7DQo+IEFub3RoZXIgY2FuZGlkYXRlIGZv
ciBGSUVMRF9QUkVQKCkNClllcC4gVGhlcmUncyBhIGNvdXBsZSBtb3JlIHRvby4NCj4NCj4+ICsJ
aWYgKGVycikNCj4+ICsJCXJldHVybiBlcnI7DQo+PiArDQo+PiArCXZhbCA9IEZJRUxEX1BSRVAo
R0VOTUFTSygyNCwgMjApLCByZWdudW0pIHwNCj4+ICsJwqDCoMKgwqDCoCBGSUVMRF9QUkVQKEdF
Tk1BU0soMTksIDE1KSwgMHgxZikgfA0KPj4gKwnCoMKgwqDCoMKgIEZJRUxEX1BSRVAoR0VOTUFT
SygxNCwgMyksIDB4ZmZmKSB8DQo+IFlvdSBjb3VsZCB1c2UgI2RlZmluZS1zIGZvciB0aGUgR0VO
TUFTSygpIGZpZWxkIG1hc2tzIHRvbywgc2ltaWxhciB0byBQSFlfQ1RSTF8qLiBUaGF0DQo+IHdv
dWxkIG1ha2Ugd2hhdCB5b3UncmUgc2V0dGluZyBhIGJpdCBjbGVhcmVyLCBjb21wYXJlZCB0byB0
aGVzZSBsaXRlcmFsIHZhbHVlcy4NClN1cmUgd2lsbCBkby4NCj4gTml0OiBZb3UncmUgYWxzbyBz
ZXR0aW5nIGFsbC1vbmUgdmFsdWVzLCBzbyBHRU5NQVNLKDE5LCAxNSkgYW5kIEdFTk1BU0soMTQs
IDMpIGJ5DQo+IHRoZW1zZWx2ZXMgYXJlIHN1ZmZpY2llbnQuIEUuZy4gUEhZX0NUUkxfTk9fUEFH
RV9QQVJLIGFuZCBQSFlfQ1RSTF9OT19QQUdFX1NFTEVDVC4NCg0KVGhpcyBwYXJ0IEknbSBub3Qg
cGxhbm5pbmcgb24gZG9pbmcuIFJpZ2h0IG5vdyBJIGFtIGp1c3Qgc2V0dGluZyB0aGVtIHRvIA0K
YWxsLW9uZXMgYnV0IHRoZSBzYW1lIGNvZGUgbWF5IGVuZCB1cCBuZWVkaW5nIHRvIGdyb3cgcGFn
ZSBsb2dpYyANCihSZWFsdGVrJ3MgU0RLIGhhcyBjb2RlIHRoYXQgYWRkcyBwYWdlIHJlYWQvd3Jp
dGUgZnVuY3Rpb25zIHRvIHBoeWxpYikuDQoNCj4+ICtzdGF0aWMgaW50IHJ0bDkzMDBfbWRpb2J1
c19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPj4gK3sNCj4gWy4uLl0NCj4+
ICsNCj4+ICsJZGV2aWNlX2Zvcl9lYWNoX2NoaWxkX25vZGUoZGV2LCBjaGlsZCkgew0KPj4gKwkJ
ZXJyID0gcnRsOTMwMF9tZGlvYnVzX3Byb2JlX29uZShkZXYsIHByaXYsIGNoaWxkKTsNCj4gSW4g
eW91ciBuZXh0IHBhdGNoIHlvdSB1c2UgJ3N0YXR1cyA9ICJkaXNhYmxlZCInIGZvciB0aGUgYmFz
ZSBkdHNpLiBZb3UgbWF5IHdhbnQgdG8gdXNlDQo+IGZ3bm9kZV9mb3JfZWFjaF9hdmFpbGFibGVf
Y2hpbGRfbm9kZSgpIGluIHRoYXQgY2FzZSwgc28gdW51c2VkIGJ1c3NlcyBhcmUgbm90IHByb2Jl
ZC4NCg0KSG1tLCB0aGUgZXhpc3RpbmcgY29kZSBpcyBvbmx5IHJlZ2lzdGVyaW5nIHR3byBtZGlv
IGJ1c2VzLiBBbHRob3VnaCBJIA0KY2FuJ3Qgc2VlIHdoeSBpdCdzIG5vdCBhdHRlbXB0aW5nIHRv
IHRvIHJlZ2lzdGVyIHRoZSBvdGhlciB0d28uDQoNCkFoIE9LLiBJdCdzIGJlY2F1c2UgZGV2aWNl
X2Zvcl9lYWNoX2NoaWxkX25vZGUoKSB3cmFwcyANCmRldmljZV9nZXRfbmV4dF9jaGlsZF9ub2Rl
KCkgd2hpY2ggY2FsbHMgZndub2RlX2dldF9uZXh0X2NoaWxkX25vZGUoKSANCndoaWNoIGNhbGxz
IG9mX2Z3bm9kZV9nZXRfbmV4dF9jaGlsZF9ub2RlKCkgd2hpY2ggZG9lcyB0aGUgYXZhaWxhYmxl
IA0KY2hlY2sgd2l0aCBvZl9nZXRfbmV4dF9hdmFpbGFibGVfY2hpbGQoKS4NCg0KU28gSSBkb24n
dCB0aGluayB0aGVyZSdzIGFueSBjaGFuZ2UgdG8gYmUgbWFkZSBoZXJlLg0K

