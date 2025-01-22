Return-Path: <linux-mips+bounces-7576-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5969CA19B48
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 00:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 305593A34AE
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2025 23:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C471CB518;
	Wed, 22 Jan 2025 23:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="vlih1fPw"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8B21CAA6C
	for <linux-mips@vger.kernel.org>; Wed, 22 Jan 2025 23:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737586939; cv=none; b=vBWZ4rnN4puVABMlurbN9q2n0riO9hP4cpBhP49Mgpfkhzwz6OSz5kU89xvAOJ8c6vs7zp3ImXC9QWO7jKxgQbqKKpJw9O+e9KPat+/oEieOGYluNQ98etFI38NDg4Y+VZU1Jd7we/3qRqhr2CqwPPbbret2Ir43jZJpqcNaj/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737586939; c=relaxed/simple;
	bh=XMwm023H0sIBdpzqUJNYM4k4Mu+ELgEDanDBBQmExDk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=shvCWyl8h/7POSzzSY4UkGf/v0MprQhZXO8ThPRc1P2yXvLDD7ZK1fXuwa5biypVWtZfWkeQRpaVgfg7skXJjCWQEcuW50aYr6xKEEo5N1mCSNqKJtwPbkJnPLkX4KWmQRN53xTv65Lx50IGnixo3TmQL0GnMWORJBok7/mMT0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=vlih1fPw; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 8017B2C0C39;
	Thu, 23 Jan 2025 12:02:14 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1737586934;
	bh=XMwm023H0sIBdpzqUJNYM4k4Mu+ELgEDanDBBQmExDk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=vlih1fPwY/6VyD/DKpjBNvw4DRNwAgK65Vxsm+U7PNCQWq3TNL7MN6m/29I79C1Zu
	 KNVgahx0QlitIsLx/HQTQPmshBs7WDUgO5hIgOajJKIfmA0iT/O6vYxj7Vsf0/o0d9
	 ZtUd8L+37Lb/J9SJsVbLIarOIOTl3qGmIQ9ngTo1MzJR9OBhNnui93f1thRXF2sLDn
	 vzobQg94nGXvAxDa3s0Oo5uTuI4oogrlF6W5d3KDXAguMPdmrJKyWgiK0Ppcsn5K14
	 ZZxZ72iDb1RogyuxHxg/XAfEQ6vzan7QLQ5TGP7s+7F4f1zUXfmi69x/JvJJlTd/bW
	 rago5//toshSg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B679178f60001>; Thu, 23 Jan 2025 12:02:14 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 23 Jan 2025 12:02:14 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Thu, 23 Jan 2025 12:02:14 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Andrew Lunn <andrew@lunn.ch>
CC: Sander Vanheule <sander@svanheule.net>, "lee@kernel.org" <lee@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "markus.stockhausen@gmx.de"
	<markus.stockhausen@gmx.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>
Subject: Re: [PATCH v4 4/4] net: mdio: Add RTL9300 MDIO driver
Thread-Topic: [PATCH v4 4/4] net: mdio: Add RTL9300 MDIO driver
Thread-Index: AQHbavAahUdhqEy5FEu2vKOQZxZljLMenFsAgACoywCAAzmNAIAAFNeA
Date: Wed, 22 Jan 2025 23:02:14 +0000
Message-ID: <09bd2f04-96d6-4dba-92ee-22ccbd7f584f@alliedtelesis.co.nz>
References: <20250120040214.2538839-1-chris.packham@alliedtelesis.co.nz>
 <20250120040214.2538839-5-chris.packham@alliedtelesis.co.nz>
 <d4194a1560ff297e5ab3e6eae6d51b7c9d469381.camel@svanheule.net>
 <63d6cf16-9581-4736-8592-bc5836fa51af@alliedtelesis.co.nz>
 <faa4cf6e-40eb-4509-b3f0-198a9a45ccbd@lunn.ch>
In-Reply-To: <faa4cf6e-40eb-4509-b3f0-198a9a45ccbd@lunn.ch>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C9CD53DCDF4DB4987A75CD73F667264@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=679178f6 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=yb9UF-SkSRlBYHEdGwAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgQW5kcmV3LA0KDQpPbiAyMy8wMS8yMDI1IDEwOjQ3LCBBbmRyZXcgTHVubiB3cm90ZToNCj4+
IEkgYmVsaWV2ZSB0aGUgUE9MTF9TRUwgY29uZmlndXJhdGlvbiBhY3R1YWxseSBhZmZlY3RzIGFu
IGludGVybmFsIHBvcnQNCj4+IHBvbGxpbmcgdW5pdC4gRnJvbSB0aGUgZGF0YXNoZWV0cyBJIGhh
dmUgaXQgc2VlbXMgcHJldHR5IGNvbmZpZ3VyYWJsZSwgeW91DQo+PiBjYW4gdGVsbCBpdCB3aGlj
aCBwaHkgcmVnaXN0ZXJzIHRvIHBvbGwgYW5kIHdoYXQgdmFsdWVzIGluZGljYXRlIGxpbmsNCj4+
IHVwL2Rvd24gKHRoZSBkZWZhdWx0cyBhcmUgY29udmVuaWVudGx5IHNldHVwIHRvIG1hdGNoIHRo
ZSBSZWFsdGVrIFBIWXMpLg0KPiBZb3UgbmVlZCB0byBkaXNhYmxlIHRoaXMuIFRoZSBsaW51eCBQ
SFkgZHJpdmVyIGlzIGRyaXZpbmcgdGhlIFBIWSwgYW5kDQo+IHRoZSBoYXJkd2FyZSBoYXMgbm8g
aWRlYSB3aGF0IExpbnV4IGlzIGRvaW5nLiBTYXkgdGhlIGRyaXZlciBoYXMNCj4gY2hhbmdlZCB0
aGUgcGFnZSB0byByZWFkIGEgdGVtcGVyYXR1cmUgc2Vuc29yLCB3aGVuIHRoZSBzd2l0Y2ggZG9l
cyBhDQo+IHBvbGwuIFJhdGhlciB0aGFuIHJlYWRpbmcgdGhlIGxpbmsgc3RhdHVzLCBpdCBnZXRz
IHNvbWUgcmFuZG9tIHZhbHVlDQo+IGZyb20gdGhlIHBhZ2UgY29udGFpbmluZyB0aGUgdGVtcGVy
YXR1cmUgc2Vuc29yLg0KDQpUaGVyZSdzIGEgbWFzayB0aGF0IGNhbiBiZSBzZXQgdmlhIGEgcmVn
aXN0ZXIgdGhhdCBjYW4gZGlzYWJsZSBwb2xsaW5nIA0KZm9yIGEgcG9ydC4gVGhlIHRyaWNrIHdp
bGwgYmUgZGVjaWRpbmcgd2hlbiB0byBkbyBzby4NCg0KRm9yIEM0NSBQSFlzIEkgdGhpbmsgaXQn
cyBmaW5lIGFzIHRoZSByZWdpc3RlciBzcGFjZSBpcyBzbyBsYXJnZSB0aGF0IA0KcGFnaW5nIGlz
bid0IHJlYWxseSB1c2VkICh0aGUgb25seSB0aW1lIEkndmUgc2VlbiBpdCBpcyBpbiB0aGUgdmVu
ZG9yIA0KTU1EKS4gVGhlIFBQVSBkb2VzIHNlZW0gdG8gaGF2ZSBzb21lIGtub3dsZWRnZSBvZiBw
YWdpbmcgZm9yIEMyMiBidXQgYXMgDQpmYXIgYXMgSSB1bmRlcnN0YW5kIHRoZSBwYWdlIHNlbGVj
dCByZWdpc3RlciB2YXJpZXMgdmVuZG9yIHRvIHZlbmRvciBhbmQgDQpJIGNhbid0IHNlZSBhbnkg
d2F5IG9mIHRlbGxpbmcgaXQgc28gaXQgcHJvYmFibHkganVzdCB1c2VzIHdoYXRldmVyIHBhZ2Ug
DQpzZWxlY3QgcmVnaXN0ZXIgdGhhdCByZWFsdGVrIHVzZSBpbiB0aGVpciBQSFlzLg0KDQpTbyBJ
IF90aGlua18gdGhlIFBQVSBpcyBPSy4gV2hhdCBtaWdodCBiZSBhIGJpdCBtb3JlIHRyaWNreSBp
cyB0aGUgb3RoZXIgDQp3YXkgcm91bmQgd2hlcmUgTGludXggaXMgZG9pbmcgc29tZXRoaW5nIGlu
dm9sdmluZyBjaGFuZ2luZyBwYWdlcyBhbmQgDQpyZWFkaW5nIHJlZ2lzdGVycywgdGhlcmUgd291
bGQgbmVlZCB0byBiZSBzb21lIGtpbmQgbWVjaGFuaXNtIHRoYXQgbWFza3MgDQp0aGUgcG9ydCBv
dXQgb2YgdGhlIFBQVSBmb3IgdGhlIGR1cmF0aW9uIG9mIHRoZSB3aG9sZSB0cmFuc2FjdGlvbi4N
Cg0KDQo+DQo+IAlBbmRyZXc=

