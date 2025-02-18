Return-Path: <linux-mips+bounces-7839-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24518A3A7E6
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 20:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 258F23AA7DC
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 19:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B371EB5C1;
	Tue, 18 Feb 2025 19:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="nFB1wImg"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E41C1E8338
	for <linux-mips@vger.kernel.org>; Tue, 18 Feb 2025 19:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739907828; cv=none; b=k0HPqrvZugDNYIrQnuiHakzk8nIzLXINVuGWhAJDWe79tzoV7OeRfoZLGwBr3Wz6JngmpL9ObinBi8RFxtVqDDfmDOcvApvS+r7pY8XOa+dmHlNCCqg2xLmwUwhLBTmTCORm6/Dg5wp1d6rRZgSgbSeGYdG1DAQkRDwtVP2Kbrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739907828; c=relaxed/simple;
	bh=LpAAQoUNk3/39b+DDE7ghJY0MayIzXSvCJY+PvaQz7w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=euGSXf2U/FWE9ZfuYPALyntYRnt7vQPa6bvrh2tm5pO98PDZwW46eT3iTdbzQHZSajQdKVTQXJhYTf3S0gAyTA/tr8C3lwBmD2un43jbm6X7CTy7XlJAd2SlSJkXMDaYQ3eQaIIcoOMyRoH4aDajmtm1WE6Dmj3HABEKClfSzek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=nFB1wImg; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7FF312C045C;
	Wed, 19 Feb 2025 08:43:38 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1739907818;
	bh=LpAAQoUNk3/39b+DDE7ghJY0MayIzXSvCJY+PvaQz7w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=nFB1wImg9SRRglJ+kgHaveyaJI3LEsrDRzLeMdCzHcxTMc9kQZwo0dBg6OOJvrZ10
	 INu+ZvuSk2e9qnTQZjeDMkWJUXaOVUwn+9tXL7DDGuCZQ4br0V0aw2E7nGJfK8zt0/
	 40xHh7rK9sLFNJi3hPtEDoWP4mIbY4QQYLm0epRu9/FzexrLtTz2JcdV/omSCJq0qQ
	 KPrbnihqYGHA+0jB2pNeiglPvNfqhVJbnFLZg+279fS+hH0E96jEtca7EGt9XKOyzN
	 tzeDAbyJe+c9PvsebgusRM9x0/rdSO3+vGLt/YSf2N5uc+7r0Mi1F6ynKfR+LM/8HQ
	 WaLx1AQxg8fUQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67b4e2ea0001>; Wed, 19 Feb 2025 08:43:38 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 19 Feb 2025 08:43:38 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Wed, 19 Feb 2025 08:43:38 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Jakub Kicinski <kuba@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"lee@kernel.org" <lee@kernel.org>, "andrew+netdev@lunn.ch"
	<andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH net-next 0/5] dt-bindings: net: realtek,rtl9301-switch
Thread-Topic: [PATCH net-next 0/5] dt-bindings: net: realtek,rtl9301-switch
Thread-Index: AQHbe00LR12J3rc01k2nBSeLzVaK0LNGgv4AgAXW2oCAAFBtgA==
Date: Tue, 18 Feb 2025 19:43:38 +0000
Message-ID: <afecbb81-da65-4da3-a97a-8ae4beca410f@alliedtelesis.co.nz>
References: <20250209234751.460404-1-chris.packham@alliedtelesis.co.nz>
 <20250214134528.4630b6b2@kernel.org> <20250218065545.533bab5f@kernel.org>
In-Reply-To: <20250218065545.533bab5f@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8D506536F748D46BC21760B7E4536B5@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ccpxrWDM c=1 sm=1 tr=0 ts=67b4e2ea a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=1BCOp0UO-uXOSZf1QVgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgSmFrdWIsDQoNCk9uIDE5LzAyLzIwMjUgMDM6NTUsIEpha3ViIEtpY2luc2tpIHdyb3RlOg0K
PiBPbiBGcmksIDE0IEZlYiAyMDI1IDEzOjQ1OjI4IC0wODAwIEpha3ViIEtpY2luc2tpIHdyb3Rl
Og0KPj4gT24gTW9uLCAxMCBGZWIgMjAyNSAxMjo0Nzo0NiArMTMwMCBDaHJpcyBQYWNraGFtIHdy
b3RlOg0KPj4+ICAgIGR0LWJpbmRpbmdzOiBuZXQ6IE1vdmUgcmVhbHRlayxydGw5MzAxLXN3aXRj
aCB0byBuZXQNCj4+PiAgICBkdC1iaW5kaW5nczogbmV0OiBBZGQgc3dpdGNoIHBvcnRzIGFuZCBp
bnRlcnJ1cHRzIHRvIFJUTDkzMDANCj4+PiAgICBkdC1iaW5kaW5nczogbmV0OiBBZGQgUmVhbHRl
ayBNRElPIGNvbnRyb2xsZXINCj4+IEFGQUlVIHdlJ3JlIHdhaXRpbmcgZm9yIGEgcmV2aWV3IGZy
b20gRFQgbWFpbnRhaW5lcnMgb24gdGhpcyBvbmUsDQo+PiBpcyB0aGlzIHNlcmllcyBvbiB5b3Vy
IHJhZGFyPw0KPiBOb3Qgc3VyZSB3aHkgd2UncmUgZ2V0dGluZyBubyByZXZpZXdzIGhlcmUuDQo+
IENocmlzLCBjb3VsZCB5b3UgcmVwb3N0PyBNYXliZSB3ZSdsbCBnZXQgdGhpcyBiYWNrIGludG8g
cGVvcGxlJ3MgcmV2aWV3DQo+IHF1ZXVlcyB0aGF0IHdheS4uDQoNCkkga25vdyB0aGVyZSBoYXZl
IGJlZW4gc29tZSBpc3N1ZXMgd2l0aCBnbWFpbCByZWplY3Rpbmcgc3R1ZmYgY29taW5nIA0KZnJv
bSBvdXIgZG9tYWluLiBJIHdhc24ndCBzdXJlIGlmIGl0IHdhcyB0aGF0IG9yIGlmIEknZCBqdXN0
IGV4aGF1c3RlZCANCnRoZSBEVCBtYWludGFpbmVycy4gUG9zc2libHkgYm90aC4NCg0KSSdsbCBz
ZW5kIG91dCB0aGUgc2VyaWVzIGFnYWluIHdpdGggYSBSRVNFTkQgdGFnLg0K

