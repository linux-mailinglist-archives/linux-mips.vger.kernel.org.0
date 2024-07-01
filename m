Return-Path: <linux-mips+bounces-4057-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 284B291D697
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 05:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEF9CB203B6
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 03:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0E1111AD;
	Mon,  1 Jul 2024 03:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="jYzcWiuD"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA398F45
	for <linux-mips@vger.kernel.org>; Mon,  1 Jul 2024 03:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719804395; cv=none; b=oDmuPRcLJgp15mwluDjixo06zwJrJHEA9vfEYMG2rJClkQ1RME49tHEetNvfo4nLbyyuFF59emmLXDRtSrwOSfzWOIyCNQ+XhX6SSyK2YfuXdD4Pl5ftUt1ti7YHC8TD+zrORjJnJrrTNpco77ud5Dz7H0x7ein4r275coKqZO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719804395; c=relaxed/simple;
	bh=AEmLr2tQkCAPVpAXVk+9MNfvUpBOX1ymc+H1nksJqs4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kYDAGHESC08G5N+Wv+GGSjKT36aoBV4d+y2yEoHDyvsguw8QXkuxhEWSNmK9zE9RC/WbRI5T5Iy2peTBlhsd0eihioCyR9gxt+f2XLZ9AWOMYbdIlEFB8Y+CmfFETqISwwNmfoVGguqU1wgG38eXR79ch+m7y7lYGaRROuCqr3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=jYzcWiuD; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 6FFB42C02E1;
	Mon,  1 Jul 2024 15:26:30 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719804390;
	bh=AEmLr2tQkCAPVpAXVk+9MNfvUpBOX1ymc+H1nksJqs4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=jYzcWiuDcTd2WwxtL0xb9CYTGbU29CZ1woCaxzk8zLC88vOJcX1U5dx4zhi1aSkYj
	 AtuHpL3vEpDm6HW7RJrpFVsgaFvjVrDR0JoRJdvW0biXlKDoPQ/oYfxZAm0N3E35W1
	 Ug6qhdL5RZWd6z7gW1vOHgyzCQG4jOEwmsCottjfRznmmW1UbPZSvcDn40ho+0hFOS
	 xdS/iNiO/T4qIixNBd3ZjL+6S4soYE+vkz4foocxrrriW6cAF/4frxHtUzO6BdxKuw
	 218YBWpIlpc3FpfvH6WfHB0BWPgzcUo3kXyaaxYvXbaLLT8qdb+1cs1PD+jMuQv/Bo
	 qAFpvAKlCljDw==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B668221e60001>; Mon, 01 Jul 2024 15:26:30 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Mon, 1 Jul 2024 15:26:30 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.48; Mon, 1 Jul 2024 15:26:29 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Mon, 1 Jul 2024 15:26:29 +1200
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
Thread-Index: AQHayEskNTyKeYqN80i0yhPI3N/Ix7Ha5qwAgAVOJYCAAD5agA==
Date: Mon, 1 Jul 2024 03:26:29 +0000
Message-ID: <0162b0b4-9c61-4311-ac39-31ed5f666420@alliedtelesis.co.nz>
References: <20240627043317.3751996-1-chris.packham@alliedtelesis.co.nz>
 <CAL_Jsq+1M47kRb5xELSqroPLbava4TJkiLjDT8er0=iiBmutfw@mail.gmail.com>
 <68a574c0-2775-4275-b590-b7f362ae3885@alliedtelesis.co.nz>
In-Reply-To: <68a574c0-2775-4275-b590-b7f362ae3885@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <857D64F2EF732A4E9D13C80B06675DC1@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=668221e6 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=4kmOji7k6h8A:10 a=VwQbUJbxAAAA:8 a=PjuYqXk4AAAA:8 a=GDtaOhZ4e366yHsMe1QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0

DQpPbiAxLzA3LzI0IDExOjQzLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPg0KPiBPbiAyOC8wNi8y
NCAwMjo0MiwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+PiBPbiBXZWQsIEp1biAyNiwgMjAyNCBhdCAx
MDozM+KAr1BNIENocmlzIFBhY2toYW0NCj4+IDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMu
Y28ubno+IHdyb3RlOg0KPj4+IFRoaXMgc2VyaWVzIGFkZHMgYmFzaWMgc3VwcG9ydCBmb3IgdGhl
IFJUTDkzMDJDIHJlZmVyZW5jZSBib2FyZC4gDQo+Pj4gQ3VycmVudGx5IHRoZQ0KPj4+IGZvY3Vz
IGlzIG9uIHRoZSBDUFUgYmxvY2sgc3R1ZmYuIEkgaG9wZSB0byBnZXQgYXJvdW5kIHRvIHRoZSBE
U0EgDQo+Pj4gc3dpdGNoIGRyaXZlcg0KPj4+IGV2ZW50dWFsbHkgYnV0IHRoaXMgaXMgYSBzbWFs
bCBzdGFydCB0aGF0IGxldHMgbWUgYm9vdCBhIG1haW5saW5lIA0KPj4+IGtlcm5lbCBvbiB0aGUN
Cj4+PiBib2FyZCBJIGhhdmUuIEkgaW5pdGlhbGl5IHN0YXJ0ZWQgd2l0aCBjb2RlIGZyb20gb3Bl
bndydCBidXQgaGF2ZSANCj4+PiBwYWlyZWQgaXQNCj4+PiBkb3duIHRvIGp1c3QgdGhlIGNsb2Nr
c291cmNlIGRyaXZlciBhbmQgZGV2aWNldHJlZS4NCj4+IFlvdXIgZW1haWxzIGFyZSBiZWluZyBz
ZW50IGFzIHF1b3RlZC1wcmludGFibGUgZW5jb2Rpbmcgd2hpY2ggaXMNCj4+IGdlbmVyYWxseSBw
cmVmZXJyZWQgdG8gYmUgYXZvaWRlZCBvbiBtYWlsbGlzdHMgKGFzIGlzIGJhc2U2NCkuDQo+PiBn
aXQtc2VuZC1lbWFpbCBzaG91bGQgbm9ybWFsbHkgdXNlIDgtYml0IGVuY29kaW5nLCBidXQgdGhl
IG1hbiBwYWdlDQo+PiBpbmRpY2F0ZXMgUVAgbWF5IGJlIHVzZWQgaWYgdGhlcmUgYXJlIGNhcnJp
YWdlIHJldHVybnMgKHRoZXJlDQo+PiBzaG91bGRuJ3QgYmUpLg0KPg0KPiBIbW0gaGVyZSdzIHRo
ZSBvdXRwdXQgZnJvbSB3aGVuIEkgc2VudCB0aGlzIHNlcmllcy4NCj4NCj4gU3ViamVjdDogW1BB
VENIIHYzIDAvOV0gbWlwczogU3VwcG9ydCBmb3IgUlRMOTMwMkMNCj4gRGF0ZTogVGh1LCAyNyBK
dW4gMjAyNCAxNjozMzowOCArMTIwMA0KPiBNZXNzYWdlLUlEOiA8MjAyNDA2MjcwNDMzMTcuMzc1
MTk5Ni0xLWNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCj4gWC1NYWlsZXI6IGdp
dC1zZW5kLWVtYWlsIDIuNDUuMg0KPiBNSU1FLVZlcnNpb246IDEuMA0KPiBDb250ZW50LVRyYW5z
ZmVyLUVuY29kaW5nOiA4Yml0DQo+DQo+IEFsbCB0aGUgcGF0Y2hlcyBhcmUgYWxzbyA4Yml0LiBT
byBJIHRoaW5rIGdpdCBjaG9zZSB0aGUgcmlnaHQgdGhpbmcuDQo+DQo+IEkgZG8ga2VlcCBuZWVk
aW5nIHRvIGNvbnZpbmNlIFRodW5kZXJiaXJkIHRvIHNlbmQgbXkgcmVwbGllcyBhcyBwbGFpbiAN
Cj4gdGV4dC4gT2NjYXNpb25hbGx5IEkgZm9yZ2V0IGFuZCB2Z2VyIGNvbXBsYWlucyBhdCBtZS4N
Cg0KSSBkaWQgYSBiaXQgb2YgZGlnZ2luZy4gTXkgcmVwbGllcyBhcmUgaW5kZWVkIGJlaW5nIHNl
bnQgYXMgDQpxdW90ZWQtcHJpbnRhYmxlIGFuZCBnZXQgYmFzZTY0IGVuY29kZWQgYnkgdGhlIHRp
bWUgdGhleSBoaXQgbG9yZSBlLmcuIA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzY4YTU3
NGMwLTI3NzUtNDI3NS1iNTkwLWI3ZjM2MmFlMzg4NUBhbGxpZWR0ZWxlc2lzLmNvLm56L3JhdyAN
Cihub3Qgc3VyZSB3aGVyZSB0aGF0J3MgaGFwcGVuaW5nKS4NCg0KVGhlcmUgYXJlIHNvbWUgc3Vn
Z2VzdGlvbnMgZm9yIG9sZGVyIHZlcnNpb25zIG9mIFRodW5kZXJiaXJkIGJ1dCBub25lIG9mIA0K
dGhlIG9wdGlvbnMgZXhpc3QgZm9yIG1lLiBJdCBzZWVtcyBJJ20gbm90IHRoZSBvbmx5IG9uZSB3
aXRoIGFuIGlzc3VlIA0KaHR0cHM6Ly93d3cucmVkZGl0LmNvbS9yL1RodW5kZXJiaXJkL2NvbW1l
bnRzLzE4ZHJkNHAvaG93X3RvX3NldF9jb250ZW50dHJhbnNmZXJlbmNvZGluZy8NCg0KSSdsbCBr
ZWVwIGxvb2tpbmcgYnV0IGlmIGFueW9uZSBrbm93cyBob3cgdG8gdGFtZSBUaHVuZGVyYmlyZCB0
aGF0J2QgYmUgDQphIGdyZWF0IGhlbHAuDQoNCg==

