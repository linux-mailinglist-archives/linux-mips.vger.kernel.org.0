Return-Path: <linux-mips+bounces-7102-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F929F8648
	for <lists+linux-mips@lfdr.de>; Thu, 19 Dec 2024 21:49:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB74E1890392
	for <lists+linux-mips@lfdr.de>; Thu, 19 Dec 2024 20:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B580B1B4253;
	Thu, 19 Dec 2024 20:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="oKQJ+oCK"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F8B16FF3B
	for <linux-mips@vger.kernel.org>; Thu, 19 Dec 2024 20:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734641378; cv=none; b=j0thM4cfZS5hpmrYFQgbc8g7jV+z8gg5qWk9otoHDJK8/1MnHJly0Lhs0RnMJyOor5eyv40sT7z1+t1z2FdrlJWa0fwb0xtQTuUpdIiTckVAYP33oih0eFVqZztgWuz7oNLLer4PJGTFApOlfbLhUiROQubj+Wb5qts2H6qLY5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734641378; c=relaxed/simple;
	bh=4tKzi++A1sL4pC9epbjagI3aaNpxy1vcAbItR8Bqcw8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PdHLLyMPA97iERiY5kBOppibiHG93WwT0K6qTqbYL4NtZoccvi0K3f6lGY9MQ2C824RxpALa9ZPX7ex85jA77nubJeMQRCd08k2hDofuzFmPMNhqaXJ11duAjTtz5yREBOeXFePSyaQPhesV0qeUeNamXUEFheaDN3bPlLtQFPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=oKQJ+oCK; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 86F5A2C0A03;
	Fri, 20 Dec 2024 09:49:34 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1734641374;
	bh=4tKzi++A1sL4pC9epbjagI3aaNpxy1vcAbItR8Bqcw8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=oKQJ+oCK9r0Ku2pR/FO7Eiw3Xrk1CzmDI0oEzbU7s+85DFoJLyxD3F68dWGJzv9zA
	 l6pW9abXOrfCmBw1IQ9bOAGEhaTw8GRStsuVDWZZTr2h3jYSh5n5Od7WATKpVWEHE8
	 CsHAUSVJ5Y8pMIfspaBT18kqLoDP53aq7is0Ml9ZgJTn6NgaR8jvV/awMA8qr51k7f
	 slPA4/Qyfa/84b58mAGJBVTEs8IGlwB2vHS3Eq5anQb9OTb1uyiBO/SBvTEMSA4SNa
	 JykgOZDZyGR2e4tYjC2kwBqDsoqGNEHZn5tTVUv1RY7C43hMUDNKImgjt71qu2WVw5
	 0mgpYa1EdKOJg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B676486de0001>; Fri, 20 Dec 2024 09:49:34 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Dec 2024 09:49:34 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Fri, 20 Dec 2024 09:49:34 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Lee Jones <lee@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "tsbogend@alpha.franken.de"
	<tsbogend@alpha.franken.de>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, "markus.stockhausen@gmx.de"
	<markus.stockhausen@gmx.de>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: (subset) [PATCH v2 2/4] dt-bindings: mfd: Add MDIO interface to
 rtl9301-switch
Thread-Topic: (subset) [PATCH v2 2/4] dt-bindings: mfd: Add MDIO interface to
 rtl9301-switch
Thread-Index: AQHbT2iGZoDuWdpZ9EmN1rv3T9V94bLpsfgAgAOETIA=
Date: Thu, 19 Dec 2024 20:49:34 +0000
Message-ID: <5f863db8-1c9b-4bed-ab14-f5aafbcc9378@alliedtelesis.co.nz>
References: <20241216031346.2626805-1-chris.packham@alliedtelesis.co.nz>
 <20241216031346.2626805-3-chris.packham@alliedtelesis.co.nz>
 <173444803631.1901572.15614847167551978147.b4-ty@kernel.org>
In-Reply-To: <173444803631.1901572.15614847167551978147.b4-ty@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <F38ED5C4AAB3574780642EC677AB3419@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=676486de a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=Zdc9iPH7IlzmfAnj6KIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgTGVlLA0KDQpPbiAxOC8xMi8yMDI0IDA0OjA3LCBMZWUgSm9uZXMgd3JvdGU6DQo+IE9uIE1v
biwgMTYgRGVjIDIwMjQgMTY6MTM6NDQgKzEzMDAsIENocmlzIFBhY2toYW0gd3JvdGU6DQo+PiBU
aGUgTURJTyBjb250cm9sbGVyIGlzIHBhcnQgb2YgdGhlIHN3aXRjaCBvbiB0aGUgUlRMOTMwMCBm
YW1pbHkgb2YNCj4+IGRldmljZXMuIEFkZCBhICRyZWYgdG8gdGhlIG1mZCBiaW5kaW5nIGZvciB0
aGVzZSBkZXZpY2VzLg0KPj4NCj4+DQo+IEFwcGxpZWQsIHRoYW5rcyENCj4NCj4gWzIvNF0gZHQt
YmluZGluZ3M6IG1mZDogQWRkIE1ESU8gaW50ZXJmYWNlIHRvIHJ0bDkzMDEtc3dpdGNoDQo+ICAg
ICAgICBjb21taXQ6IDEwNjEwODFjYmU5MzBmOTdhZDU0ZTgyMGFkMTk5NmY1NWQ5M2M1N2YNCj4N
Cj4gLS0NCj4gTGVlIEpvbmVzIFvmnY7nkLzmlq9dDQpJcyBpdCB0b28gbGF0ZSB0byBkcm9wIHRo
aXMgb3V0PyBJIHRoaW5rIEknbSBwcm9iYWJseSBnb2luZyB0byBjaGFuZ2UgDQp0aGUgTURJTyBi
aW5kaW5nIGEgbGl0dGxlIHdoaWNoIG1heSBjaGFuZ2UgaG93IGl0IGZpdHMgaW50byB0aGUgb3Zl
cmFsbCANCnN3aXRjaCBtZmQu

