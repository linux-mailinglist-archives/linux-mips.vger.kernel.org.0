Return-Path: <linux-mips+bounces-7579-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B4DA19D69
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 04:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4DF418893B5
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 03:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1106C13212A;
	Thu, 23 Jan 2025 03:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="15TTNsVb"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240DA41C94
	for <linux-mips@vger.kernel.org>; Thu, 23 Jan 2025 03:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737604040; cv=none; b=b9cgcXnHAE3TF8D20rWmp75Wg0kgVmiTq/gJu7AODRmUvJVN2OXcyCNVBws7Wup2VDxfTa/Bq6MEOCRSY2Y1wUYF6Lutd4sTYHwCE+krjQJxAfWZv6IP/A19wuwkXrqmbaQijj4K74BGAKCxgcSyLW5tHIRckqAdztplr9UCXvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737604040; c=relaxed/simple;
	bh=lx3tK0Wp1P/B3968du95L/hIoWqTCa1PDtwwXPi5uYQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kE6cNs63UYqFypFLHf3CRJ6+Q+uieqFLot08a50Kn48dBy9gFFIgVut/SfWRoC4/o7qQSkRzsMmmmg3kujNiYNd3v5ZOKJcmEnUsEp68K58EXv76NEdDTxEFDb3SXY+pkXAPIRmAlWd7ousEu/Bm5U3FOxb+dWiuBqgWhQOkvPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=15TTNsVb; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A9E5F2C0AC1;
	Thu, 23 Jan 2025 16:47:14 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1737604034;
	bh=lx3tK0Wp1P/B3968du95L/hIoWqTCa1PDtwwXPi5uYQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=15TTNsVbladkQRGOamtcptJ9NvqtuJnLpu9B9AwSUjRufGAx972YJNcKOFimUcUmf
	 SlrdRMLOGAyTR8t5yq9dbzjdD7RwZ6sHLlzItohfc7ebT/TVfykxyiy98kCkH3S9eJ
	 8FTZAIwmy2j3JsLl83ckkJelf2Iqy7d8WiXRIZ9PbhZk2ZC956wrVgPxg/ekVi5I3E
	 Jpvh2XffRWzUlI5+n2Y1rzittP4p7L4KcISbMjkm41iBse/uGt/Thv+rroMtQECVVg
	 hE+6MgHkUIvSCgFCqVZ5z/y0JDd9bXZq47BtsEyc3VaRvuxPkrSWWqFf2R6887KAwG
	 q/q7JwTaqeZhA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6791bbc20001>; Thu, 23 Jan 2025 16:47:14 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 23 Jan 2025 16:47:14 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Thu, 23 Jan 2025 16:47:14 +1300
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
Thread-Index: AQHbavAahUdhqEy5FEu2vKOQZxZljLMenFsAgACoywCAAzmNAIAAFNeAgABOEQCAAAGQgA==
Date: Thu, 23 Jan 2025 03:47:14 +0000
Message-ID: <b9f68f90-7c30-46b5-aed9-2ca1994494cf@alliedtelesis.co.nz>
References: <20250120040214.2538839-1-chris.packham@alliedtelesis.co.nz>
 <20250120040214.2538839-5-chris.packham@alliedtelesis.co.nz>
 <d4194a1560ff297e5ab3e6eae6d51b7c9d469381.camel@svanheule.net>
 <63d6cf16-9581-4736-8592-bc5836fa51af@alliedtelesis.co.nz>
 <faa4cf6e-40eb-4509-b3f0-198a9a45ccbd@lunn.ch>
 <09bd2f04-96d6-4dba-92ee-22ccbd7f584f@alliedtelesis.co.nz>
 <11d7fe78-958d-409f-a979-25cc1bc933a2@lunn.ch>
In-Reply-To: <11d7fe78-958d-409f-a979-25cc1bc933a2@lunn.ch>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <C0F6EEC7549A094FBB7581A820C3E48A@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=6791bbc2 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=WLJjwHfe7vk9cptKtRgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

DQpPbiAyMy8wMS8yMDI1IDE2OjQxLCBBbmRyZXcgTHVubiB3cm90ZToNCj4gT24gV2VkLCBKYW4g
MjIsIDIwMjUgYXQgMTE6MDI6MTRQTSArMDAwMCwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4+IEhp
IEFuZHJldywNCj4+DQo+PiBPbiAyMy8wMS8yMDI1IDEwOjQ3LCBBbmRyZXcgTHVubiB3cm90ZToN
Cj4+Pj4gSSBiZWxpZXZlIHRoZSBQT0xMX1NFTCBjb25maWd1cmF0aW9uIGFjdHVhbGx5IGFmZmVj
dHMgYW4gaW50ZXJuYWwgcG9ydA0KPj4+PiBwb2xsaW5nIHVuaXQuIEZyb20gdGhlIGRhdGFzaGVl
dHMgSSBoYXZlIGl0IHNlZW1zIHByZXR0eSBjb25maWd1cmFibGUsIHlvdQ0KPj4+PiBjYW4gdGVs
bCBpdCB3aGljaCBwaHkgcmVnaXN0ZXJzIHRvIHBvbGwgYW5kIHdoYXQgdmFsdWVzIGluZGljYXRl
IGxpbmsNCj4+Pj4gdXAvZG93biAodGhlIGRlZmF1bHRzIGFyZSBjb252ZW5pZW50bHkgc2V0dXAg
dG8gbWF0Y2ggdGhlIFJlYWx0ZWsgUEhZcykuDQo+Pj4gWW91IG5lZWQgdG8gZGlzYWJsZSB0aGlz
LiBUaGUgbGludXggUEhZIGRyaXZlciBpcyBkcml2aW5nIHRoZSBQSFksIGFuZA0KPj4+IHRoZSBo
YXJkd2FyZSBoYXMgbm8gaWRlYSB3aGF0IExpbnV4IGlzIGRvaW5nLiBTYXkgdGhlIGRyaXZlciBo
YXMNCj4+PiBjaGFuZ2VkIHRoZSBwYWdlIHRvIHJlYWQgYSB0ZW1wZXJhdHVyZSBzZW5zb3IsIHdo
ZW4gdGhlIHN3aXRjaCBkb2VzIGENCj4+PiBwb2xsLiBSYXRoZXIgdGhhbiByZWFkaW5nIHRoZSBs
aW5rIHN0YXR1cywgaXQgZ2V0cyBzb21lIHJhbmRvbSB2YWx1ZQ0KPj4+IGZyb20gdGhlIHBhZ2Ug
Y29udGFpbmluZyB0aGUgdGVtcGVyYXR1cmUgc2Vuc29yLg0KPj4gVGhlcmUncyBhIG1hc2sgdGhh
dCBjYW4gYmUgc2V0IHZpYSBhIHJlZ2lzdGVyIHRoYXQgY2FuIGRpc2FibGUgcG9sbGluZw0KPj4g
Zm9yIGEgcG9ydC4gVGhlIHRyaWNrIHdpbGwgYmUgZGVjaWRpbmcgd2hlbiB0byBkbyBzby4NCj4g
T24gcHJvYmUuIEFuZCBsZWF2ZSBpcyBkaXNhYmxlZC4gcGh5bGluayB3aWxsIHByb3ZpZGUgeW91
IHdpdGggYWxsIHRoZQ0KPiBpbmZvcm1hdGlvbiB5b3UgbmVlZCBhYm91dCBsaW5rIHVwLCB3aGF0
IHRoZSBsaW5rIHNwZWVkIGlzIGV0Yy4gVGhlcmUNCj4gaXMgbm8gbmVlZCBmb3IgUFBVLg0KDQpX
b3JrcyBmb3IgbWUgOlAuDQo=

