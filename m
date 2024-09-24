Return-Path: <linux-mips+bounces-5633-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E463984C78
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2024 22:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2015D28324E
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2024 20:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2060613C3D3;
	Tue, 24 Sep 2024 20:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="gMTjTzBe"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B31E12FF72
	for <linux-mips@vger.kernel.org>; Tue, 24 Sep 2024 20:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727211421; cv=none; b=u2F5cXQAC0jSj+V436FcnO63pwJHBJg7NlQ3aKmjnS314UVaE2sWY93ypruPm1s6A5jEZZxhui3Ufc45tIDVFDxl5GnOZsi69Kv57VLpgmqzH9brHKI+9vIQXbqRodMN7FDiIIiTVtK/DyLtWHnaVj4cc4q3oncBbOX+9byergM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727211421; c=relaxed/simple;
	bh=5LECSNW6fv1cDVKhCeoMBVMTuSrSAgRgVc4bmYLHtoU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eY+CEuyGpXdSq905JsIO73/UMm7BfyWRGIR3gbPHSTvVhANfZxMU3AkvVGQ6urgRGmmORxU4kE6eSk0wg7LfJXB1kKQ7+CBxp499qA6SAdLuSqMPn6jvNZZkSS1OZJYh4VHUcQbrKVeaxr+HAOK9mLW5kzKEOGwI+UCMSq9e8nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=gMTjTzBe; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CA3282C05DB;
	Wed, 25 Sep 2024 08:56:55 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727211415;
	bh=5LECSNW6fv1cDVKhCeoMBVMTuSrSAgRgVc4bmYLHtoU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=gMTjTzBeRorMr1krJHUFp2F+T0mrKeF3/kle2FKELegRpE0wwFyLCx4NQFNFVEQ8x
	 whVnmn0UihhHAXSyBhhQfG3Z67C2Gv3g6DQuwZ4XzG7KKkg0AITVS4BLtAjGEZnBWY
	 JNnA7/aWVPgt88E8J1bhAgaFlvPoo+8+5XV/zR3Dl20B0zSE4abu1yiBc0u3nfE2oZ
	 Tuon8/P0yKPoYjPUwSpn8fMoePl3rVCFj3RXfr12y94nCFf5f4XFMRZherA7Nzk/BB
	 OFNc6rJQDSkbtqqayffleGL2NEXBBMox0pXT7+hssIeDY47R1KpttdCADVdMu1OnI/
	 EnBr428+qLIpw==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f327970001>; Wed, 25 Sep 2024 08:56:55 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Wed, 25 Sep 2024 08:56:55 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Wed, 25 Sep 2024 08:56:55 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Wed, 25 Sep 2024 08:56:55 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "lee@kernel.org" <lee@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "tsbogend@alpha.franken.de"
	<tsbogend@alpha.franken.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: mfd: Add Realtek switch
Thread-Topic: [PATCH v4 1/3] dt-bindings: mfd: Add Realtek switch
Thread-Index: AQHbDgvzhbdNFG2sg0ehrCGDVMn7d7Jl1V+AgAADPQCAAMqzAA==
Date: Tue, 24 Sep 2024 20:56:55 +0000
Message-ID: <9abd5e65-da40-4283-b60e-46be5f89e858@alliedtelesis.co.nz>
References: <20240923225719.2999821-1-chris.packham@alliedtelesis.co.nz>
 <20240923225719.2999821-2-chris.packham@alliedtelesis.co.nz>
 <jdqmrbjngrcmxtow2khhplvhhv6oh4msts4lggogfbgjj7fyfn@dve6dxeijywz>
 <1c19de70-abab-469b-afd0-f585cc807e04@kernel.org>
In-Reply-To: <1c19de70-abab-469b-afd0-f585cc807e04@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <1309A5C53DC05F46BA21FE841CC085FF@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f32797 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=VwQbUJbxAAAA:8 a=BiIpO-xpuzJpd5a7trwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgS3J6eXN6dG9mLA0KDQpPbiAyNC8wOS8yNCAyMDo1MSwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToNCj4gT24gMjQvMDkvMjAyNCAxMDozOSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToN
Cj4+IE9uIFR1ZSwgU2VwIDI0LCAyMDI0IGF0IDEwOjU3OjE3QU0gKzEyMDAsIENocmlzIFBhY2to
YW0gd3JvdGU6DQo+Pj4gQWRkIGRldmljZSB0cmVlIHNjaGVtYSBmb3IgdGhlIFJlYWx0ZWsgc3dp
dGNoLiBDdXJyZW50bHkgdGhlIG9ubHkNCj4+PiBzdXBwb3J0ZWQgZmVhdHVyZSBpcyB0aGUgc3lz
Y29uLXJlYm9vdCB3aGljaCBpcyBuZWVkZWQgdG8gYmUgYWJsZSB0bw0KPj4+IHJlYm9vdCB0aGUg
Ym9hcmQuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNr
aGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+Pj4gLS0tDQo+PiBSZXZpZXdlZC1ieTogS3J6eXN6
dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPj4NCj4gVW5yZXZpZXdlZCAtIGl0IGlz
IGluY29tcGxldGUhDQo+DQo+IE5vLCB3ZSBzYWlkIG11bHRpcGxlIHRpbWVzLCB5b3UgbXVzdCBz
ZW5kIGNvbXBsZXRlIGJpbmRpbmcuIFNlbmRpbmcNCj4gcGllY2VzIGZvciByZXZpZXcgZG9lcyBu
b3QgZ2l2ZSB1cyBmdWxsIHBpY3R1cmUgYW5kIGhpZGVzIHBhcnRzIG9mIHRoZQ0KPiBjb250cm92
ZXJzaWFsIGRlY2lzaW9ucy4gSWYgeW91IHdhbnQgdG8gZ28gdGhpcyB3YXksIG5leHQgdGltZSB5
b3Ugd2lsbA0KPiBnZXQgTkFLIHdoZW4gYWRkaW5nIGkyY0AwLTcgdG8gcGFyZW50IGJpbmRpbmcu
DQo+DQpGYWlyIGVub3VnaC4NCg0KSSBkaWQgYWxyZWFkeSBnZXQgbXlzZWxmIHRpZWQgaW4ga25v
dHMgdHJ5aW5nIHRvIGp1Z2dsZSB0d28gZGVwZW5kZW50IA0Kc2VyaWVzLiBJIHRob3VnaHQgSSB3
YXMgbWFraW5nIHRoaW5ncyBlYXNpZXIgdG8gcmV2aWV3IGJ5IHNlbmRpbmcgdGhlbSANCmluIHNt
YWxsZXIgY2h1bmtzIGJ1dCBvYnZpb3VzbHkgSSdtIGhvbGRpbmcgdGhpbmdzIGJhY2sgdGhhdCBh
cmUgDQpyZWxldmFudCBmb3IgY29udGV4dC4NCg0KU28ganVzdCB0byBiZSBjbGVhciwgb25lIGJp
bmRpbmcgaW4gbWZkIHRoYXQgY292ZXJzIHRoZSByZWJvb3QgYW5kIGkyYyANCmZvciB0aGUgNCB2
YXJpYW50cz8gVGhhdCdzIGFib3V0IGFzIG11Y2ggYXMgSSBjYW4gYWN0dWFsbHkgdGVzdCBkcml2
ZXIgd2lzZS4NCg0KSSBjb3VsZCBhZGQgdGhlIG1kaW8gYW5kIHN3aXRjaCBwb3J0cyBidXQgSSdt
IG5vdCBhdCBhIHBvaW50IHdoZXJlIEkgDQpjb3VsZCByZWFsbHkgdGVzdCB0aGVtIHByb3Blcmx5
LiBJIGtub3cgdGhlIGJpbmRpbmcgZG9lc24ndCBuZWNlc3NhcmlseSANCm5lZWQgY29kZSB0byBi
ZSBhYmxlIHRvIGRlc2NyaWJlIHRoZSBoYXJkd2FyZSBidXQgaXQgZG9lcyBydW4gdGhlIHJpc2sg
DQp0aGF0IEkgbWlnaHQgbWlzcyBzb21ldGhpbmcgaW4gdGhlIGJpbmRpbmcgdGhhdCBJIG5lZWQg
d2hlbiBJIGRvIGdldCB0byANCnRoZSBkcml2ZXIgY29kZS4NCg0KSSBhbHNvIGRpZCB3YW50IHRv
IHNheSB0aGFua3MgZm9yIHlvdXIgcGF0aWVuY2UuIEl0IG1heSBub3Qgc2VlbSBsaWtlIGl0IA0K
YnV0IEkgcmVhbGx5IGRvIGFwcHJlY2lhdGUgeW91ciBmZWVkYmFjayBhbmQgSSBkbyB0cnkgdG8g
dGFrZSBpdCBhbGwgb24gDQpib2FyZC4NCg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K
Pg==

