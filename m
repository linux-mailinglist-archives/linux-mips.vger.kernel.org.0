Return-Path: <linux-mips+bounces-7993-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9163BA46B2A
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 20:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86E4916E23D
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 19:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690CD242908;
	Wed, 26 Feb 2025 19:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="dlWusk4Z"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C65241688
	for <linux-mips@vger.kernel.org>; Wed, 26 Feb 2025 19:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740598506; cv=none; b=bVcTI7L5yOqrywwhiuZ404GEqIas1SGO4a+/5hggDzhE82TxQhN/wC49vlhl3qFyIOYKGXGqw0BzRob92aztfEUlWdUFyrZ9N0YmZNaXeR1a5euHLFOsSVvaM5adLpIt+6ag5ATIGt2zAhcB36T4paFITliGf52xkFKjjeY59XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740598506; c=relaxed/simple;
	bh=bvEh2cJJ8fQdCKZqF4/MHgwher79PNLHTe2wORKT3qI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JEtEvJrH/mo9sRCbQyR10ptbBbGP+GscNkX2t4lbxhsdm+ELyuP2yNth91g2jgQmd8P7YDQUOrCYpHvQN3qiq+cGGZcfiQOxf5+ZxfdSf/Sb5EefFI6gfvGW1+VvhyoHTbulb8RR1bZQEkrzP2IfWajH9acnZFw5FZKsVnvYj2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=dlWusk4Z; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 359C02C041E;
	Thu, 27 Feb 2025 08:35:01 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1740598501;
	bh=bvEh2cJJ8fQdCKZqF4/MHgwher79PNLHTe2wORKT3qI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=dlWusk4Z8rr/xuuuGKE7FB4vkMzOYJGFxd4ZxxK8/XdTeP4EYsOUU97Zag4JB3t/0
	 qSOp+848SX3CKtUdHh97rJVgEUJ6s/H2JMhV7gshtC2j0yPGAoSMQedEi981ymutrY
	 GYTIyEYOMS4Tj6NHJgMjqp78gsiiF3glMNtBwYMlbTwHinSer/s7Ra8xpcO/nSoRP0
	 AuYAslN5oFhQ89oMcFuQBGt+UhjB93xlND/plC8gKdfWenTu2TGCXvyRdz/4dfQNfr
	 beHREWjyT0jXfZP8e5GMBWPOHKwzHpU6BFAmnqXNg7J0tesAgNauMUremESfofrxye
	 Qf/UDvQJb9pGQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67bf6ce50001>; Thu, 27 Feb 2025 08:35:01 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Feb 2025 08:35:00 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Thu, 27 Feb 2025 08:35:00 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "andrew@lunn.ch"
	<andrew@lunn.ch>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"sander@svanheule.net" <sander@svanheule.net>, "markus.stockhausen@gmx.de"
	<markus.stockhausen@gmx.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
Subject: Re: [PATCH net-next v7 1/2] net: mdio: Add RTL9300 MDIO driver
Thread-Topic: [PATCH net-next v7 1/2] net: mdio: Add RTL9300 MDIO driver
Thread-Index: AQHbh+J8lt76RIU/40yozHOVVg4xD7NYWweAgADGUgA=
Date: Wed, 26 Feb 2025 19:35:00 +0000
Message-ID: <121f35fc-f151-4c5e-a644-87485acf2eda@alliedtelesis.co.nz>
References: <20250226000748.3979148-1-chris.packham@alliedtelesis.co.nz>
 <20250226000748.3979148-2-chris.packham@alliedtelesis.co.nz>
 <20250226084511.5f8f4c62@fedora.home>
In-Reply-To: <20250226084511.5f8f4c62@fedora.home>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAA606CD114D8C44959722D921238B9D@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ccpxrWDM c=1 sm=1 tr=0 ts=67bf6ce5 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=p39UaIAQFBWNGi97qX4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgTWF4aW1lLA0KDQpPbiAyNi8wMi8yMDI1IDIwOjQ1LCBNYXhpbWUgQ2hldmFsbGllciB3cm90
ZToNCj4gSGkgQ2hyaXMsDQo+DQo+IE9uIFdlZCwgMjYgRmViIDIwMjUgMTM6MDc6NDcgKzEzMDAN
Cj4gQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56PiB3cm90
ZToNCj4NCj4+IEFkZCBhIGRyaXZlciBmb3IgdGhlIE1ESU8gY29udHJvbGxlciBvbiB0aGUgUlRM
OTMwMCBmYW1pbHkgb2YgRXRoZXJuZXQNCj4+IHN3aXRjaGVzIHdpdGggaW50ZWdyYXRlZCBTb0Mu
IFRoZXJlIGFyZSA0IHBoeXNpY2FsIFNNSSBpbnRlcmZhY2VzIG9uIHRoZQ0KPj4gUlRMOTMwMCBo
b3dldmVyIGFjY2VzcyBpcyBkb25lIHVzaW5nIHRoZSBzd2l0Y2ggcG9ydHMuIFRoZSBkcml2ZXIg
dGFrZXMNCj4+IHRoZSBNRElPIGJ1cyBoaWVyYXJjaHkgZnJvbSB0aGUgRFRTIGFuZCB1c2VzIHRo
aXMgdG8gY29uZmlndXJlIHRoZQ0KPj4gc3dpdGNoIHBvcnRzIHNvIHRoZXkgYXJlIGFzc29jaWF0
ZWQgd2l0aCB0aGUgY29ycmVjdCBQSFkuIFRoaXMgbWFwcGluZw0KPj4gaXMgYWxzbyB1c2VkIHdo
ZW4gZGVhbGluZyB3aXRoIHNvZnR3YXJlIHJlcXVlc3RzIGZyb20gcGh5bGliLg0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5j
by5uej4NCj4gSXQgYWxsIG1vc3RseSBsb29rcyBnb29kIHRvIG1lLCB0aGVyZSdzIG9uZSB0eXBv
IHRob3VnaCBhbmQgYXMgaXQgbWF5DQo+IGJlIHVzZXIgdmlzaWJsZSwgSSB0aGluayBpdCdzIHdv
cnRoIGZpeGluZy4uLg0KPg0KPiBbLi4uXQ0KPg0KPj4gK3N0YXRpYyBpbnQgcnRsOTMwMF9tZGlv
YnVzX3Byb2JlX29uZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBydGw5MzAwX21kaW9fcHJp
diAqcHJpdiwNCj4+ICsJCQkJICAgICBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqbm9kZSkNCj4+ICt7
DQo+PiArCXN0cnVjdCBydGw5MzAwX21kaW9fY2hhbiAqY2hhbjsNCj4+ICsJc3RydWN0IGZ3bm9k
ZV9oYW5kbGUgKmNoaWxkOw0KPj4gKwlzdHJ1Y3QgbWlpX2J1cyAqYnVzOw0KPj4gKwl1MzIgbWRp
b19idXM7DQo+PiArCWludCBlcnI7DQo+PiArDQo+PiArCWVyciA9IGZ3bm9kZV9wcm9wZXJ0eV9y
ZWFkX3UzMihub2RlLCAicmVnIiwgJm1kaW9fYnVzKTsNCj4+ICsJaWYgKGVycikNCj4+ICsJCXJl
dHVybiBlcnI7DQo+PiArDQo+PiArCWZ3bm9kZV9mb3JfZWFjaF9jaGlsZF9ub2RlKG5vZGUsIGNo
aWxkKQ0KPj4gKwkJaWYgKGZ3bm9kZV9kZXZpY2VfaXNfY29tcGF0aWJsZShjaGlsZCwgImV0aGVy
bmV0LXBoeS1pZWVlODAyLjMtYzQ1IikpDQo+PiArCQkJcHJpdi0+c21pX2J1c19pc19jNDVbbWRp
b19idXNdID0gdHJ1ZTsNCj4+ICsNCj4+ICsJYnVzID0gZGV2bV9tZGlvYnVzX2FsbG9jX3NpemUo
ZGV2LCBzaXplb2YoKmNoYW4pKTsNCj4+ICsJaWYgKCFidXMpDQo+PiArCQlyZXR1cm4gLUVOT01F
TTsNCj4+ICsNCj4+ICsJYnVzLT5uYW1lID0gIlJlYWt0ZWsgU3dpdGNoIE1ESU8gQnVzIjsNCj4g
WW91IHByb2JhYmx5IG1lYW4gUmVhbHRlayA/IDopDQoNCkdvb2QgY2F0Y2ggdGhhbmtzLiBJJ3Zl
IGZpeGVkIHRoZSB0eXBvIGxvY2FsbHkgYW5kIEknbGwgc2VuZCBvdXQgYSB2OCANCnRvbW9ycm93
IGlmIHRoZXJlIGFyZW4ndCBhbnkgb3RoZXIgY29tbWVudHMuDQo=

