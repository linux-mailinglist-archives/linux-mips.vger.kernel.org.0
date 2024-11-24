Return-Path: <linux-mips+bounces-6793-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6936F9D781F
	for <lists+linux-mips@lfdr.de>; Sun, 24 Nov 2024 21:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AADFE281E1D
	for <lists+linux-mips@lfdr.de>; Sun, 24 Nov 2024 20:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B109F1514CC;
	Sun, 24 Nov 2024 20:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="dD2S3Zmr"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BD15103F
	for <linux-mips@vger.kernel.org>; Sun, 24 Nov 2024 20:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732480821; cv=none; b=EFVC+TSCjaw3uxi/k+frPdk2iMoxflYyOgmTEhgryDjYZ9q7idzZvH6YP3az5aXDdOrD0TA4Thgp+YekyLsAD8S8dy/lrWQUPWqYE1by/ZAl3vN/G/A5zxU3DUYAociq65HH1k7P42ZrnKvqB5ts4+HUssedrKtL+9HkaLN+kUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732480821; c=relaxed/simple;
	bh=KUGC2HRqQUXTP5RgtQMi8H27nk8lrRe7gjUAR5lyybs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DFLNAF3TTzjL7MjzO5TzBjTIt0UrHcSt65wWbazdHoEG8WcoTnEAzRLnv3Ca/ILN8GLr9LzLt3l0fFLpW9mbISALCnxqYbCIhCg/Dtk373i7YxbNkEuGUAE6aMgOlKLR+yGkgb1PdTSqqyTjTMdoqcyRs6hNPeZNp7JRXey7kgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=dD2S3Zmr; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5E3F42C045C;
	Mon, 25 Nov 2024 09:40:10 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1732480810;
	bh=KUGC2HRqQUXTP5RgtQMi8H27nk8lrRe7gjUAR5lyybs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=dD2S3ZmroxJhECEGq8jBDzqldrMW+n1amKf98DT5XaAH/odenZTyIMzcu9xTZBuTc
	 E18VSIza8LEQUwcwR0YTxwWc9ttlcnqWW0eLYlXC5fZbPxvDAQ/WFdpc4jEYYp68gT
	 cynncBRvPDOcayJOTqO8af7OBPY5lmW8Dwqdl8WBBuft+LES8MTdJdD9/gY+U5goeB
	 GIvCoeHcclfmrV5aKRuDlVALc+WbOOrFBez1G6k+dNqbcVs71N0Qibam3vUaj9YHwM
	 JG57NgsQc+9KIm5GLqJJaaq8sUfgJODMYpWWA+I5wllNNKy+p8e85NYlmbkEB2yry3
	 Vf0sql9jCWANQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67438f2a0001>; Mon, 25 Nov 2024 09:40:10 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 25 Nov 2024 09:40:10 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Mon, 25 Nov 2024 09:40:10 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Rong Xu <xur@google.com>
CC: "Han Yao Yeo (atg)" <hanyao.yeo@alliedtelesis.com.sg>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>, Masahiro Gotoh <gotoh@allied-telesis.co.jp>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: RTL9300 (mips) fails to boot with commit d4a7f2510ff4
 ("vmlinux.lds.h: Adjust symbol ordering in text output section")
Thread-Topic: RTL9300 (mips) fails to boot with commit d4a7f2510ff4
 ("vmlinux.lds.h: Adjust symbol ordering in text output section")
Thread-Index: AQHbPIH7i71pZM/vO0CstDPfvIZ7vrLBuayAgAAqwQCABCq7gA==
Date: Sun, 24 Nov 2024 20:40:09 +0000
Message-ID: <c6719149-8531-4174-824e-a3caf4bc6d0e@alliedtelesis.co.nz>
References: <cd252b78-077b-441e-8371-106d71258ff3@alliedtelesis.co.nz>
 <84d9200e-25b4-4bd8-8eb5-c954ff92ac08@alliedtelesis.co.nz>
 <CAF1bQ=RU2dZU3ENy3MLM4FvrZNaZprgPAM5vbRtUVDixJNQ_zg@mail.gmail.com>
In-Reply-To: <CAF1bQ=RU2dZU3ENy3MLM4FvrZNaZprgPAM5vbRtUVDixJNQ_zg@mail.gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CABEC1A36C4794BAF26996E0931456E@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Gam0nhXL c=1 sm=1 tr=0 ts=67438f2a a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=PIBCEmLLjRJRdw3PA-0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgUm9uZywNCg0KT24gMjIvMTEvMjQgMTg6MDIsIFJvbmcgWHUgd3JvdGU6DQo+IERvZXMgdGhl
IGZvbGxvd2luZyBwYXRjaCBmaXggeW91ciBpc3N1ZT8NCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGttbC9DQUs3TE5BUVNwTTJoaDI9V2dyaWJiOTJuSEY1X3BlUmIrZ3hkTzFCdDFNa2VMOE4r
aHdAbWFpbC5nbWFpbC5jb20vdC8NCj4NCj4gTWFzYWhpcm8gWWFtYWRhIGFscmVhZHkgYXBwbGll
ZCB0aGUgcGF0Y2ggdG8ga2J1aWxkLXRyZWUuDQo+DQo+IEkgYWxzbyBwcm9wb3NlZCBhIHNpbWls
YXIgZml4IGFzIHlvdXJzLiBCdXQgd2UgYmVsaWV2ZSB0aGUgYWJvdmUgcGF0Y2gNCj4gc2hvdWxk
IGFsc28gd29yayAoYW5kIHByb2JhYmx5IGlzIGJldHRlcikuDQo+DQo+IFBsZWFzZSB0cnkgYW5k
IGxldCB1cyBrbm93Lg0KDQpMb29rcyBsaWtlIGxpbnV4LW5leHQgYWxyZWFkeSBoYXMgdGhhdCBw
YXRjaCBhbmQgbm8gaXQgZG9lc24ndCBmaXggbXkgDQppc3N1ZS4gRm9yIHRoZSByZWNvcmQgaGVy
ZSdzIHRoZSBzdGFydCBvZiBteSBTeXN0ZW0ubWFwDQoNCiQgaGVhZCBTeXN0ZW0ubWFwDQpmZmZm
ZmZmZjgwMTAwMDAwIFQgX19zcGxpdF90ZXh0X2VuZA0KZmZmZmZmZmY4MDEwMDAwMCBUIF9fc3Bs
aXRfdGV4dF9zdGFydA0KZmZmZmZmZmY4MDEwMDAwMCBUIF9fdW5saWtlbHlfdGV4dF9zdGFydA0K
ZmZmZmZmZmY4MDEwMDAwMCBUIF9zdGV4dA0KZmZmZmZmZmY4MDEwMDAwMCBUIF90ZXh0DQpmZmZm
ZmZmZjgwMTAwMDAwIHQgcnVuX2luaXRfcHJvY2Vzcw0KZmZmZmZmZmY4MDEwMDEzOCB0IHRyeV90
b19ydW5faW5pdF9wcm9jZXNzDQpmZmZmZmZmZjgwMTAwMThjIHQgcHV0X3BhZ2UNCmZmZmZmZmZm
ODAxMDAxZDAgdCBucl9ibG9ja3MuaXNyYS4wDQpmZmZmZmZmZjgwMTAwMjA4IFQgYWNrX2JhZF9p
cnENCg0KSXQgZG9lcyBsb29rIGxpa2Ugd2hhdGV2ZXIgaXMgc3VwcG9zZWQgdG8gcHV0IGhlYWQu
byBmaXJzdCBpc24ndCBraWNraW5nIA0KaW4gZm9yIG1lLg0KDQo+DQo+IFRoYW5rcyENCj4NCj4g
LVJvbmcNCj4NCj4gT24gVGh1LCBOb3YgMjEsIDIwMjQgYXQgNjoyOeKAr1BNIENocmlzIFBhY2to
YW0NCj4gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4gd3JvdGU6DQo+Pg0KPj4g
T24gMjIvMTEvMjQgMTQ6NTgsIENocmlzIFBhY2toYW0gd3JvdGU6DQo+Pj4gSGkgUm9uZywNCj4+
Pg0KPj4+IEkgd2FzIGp1c3QgdHJ5aW5nIHNvbWUgb2YgbXkgaW4tZmxpZ2h0IGNoYW5nZXMgYWdh
aW5zdCBsaW51eC1uZXh0IGFuZA0KPj4+IGZvdW5kIHRoYXQgbXkgUlRMOTMwMCogYmFzZWQgYm9h
cmQgbm8gbG9uZ2VyIGJvb3RzIChub3RoaW5nIG9uIHRoZQ0KPj4+IHNlcmlhbCBjb25zb2xlIGFm
dGVyIFUtQm9vdCBoYW5kcyBvZmYgdG8gdGhlIGtlcm5lbCkuDQo+Pj4NCj4+PiBBIGJpc2VjdCBi
ZXR3ZWVuIExpbnVzJ3MgdHJlZSBhbmQgbGludXgtbmV4dC9tYXN0ZXIgcG9pbnRzIHRvIGNvbW1p
dA0KPj4+IGQ0YTdmMjUxMGZmNCAoInZtbGludXgubGRzLmg6IEFkanVzdCBzeW1ib2wgb3JkZXJp
bmcgaW4gdGV4dCBvdXRwdXQNCj4+PiBzZWN0aW9uIikuIEEgYnVpbGQgb24gZDRhN2YyNTEwZmY0
XiBib290cyBzdWNjZXNzZnVsbHkuIFRoYXQgc2VyaWVzIGlzDQo+Pj4gd2VsbCBiZXlvbmQgbXkg
YXJlYSBvZiBrbm93bGVkZ2UsIHRoZXJlIG1heSBiZSBzb21ldGhpbmcgdGhhdCB0aGUgTUlQUw0K
Pj4+IFNvQ3MgYXJlIGRvaW5nIChvciBub3QgZG9pbmcpIHRoYXQgaXMgYmVpbmcgYWZmZWN0ZWQg
YnkgdGhlIHNlY3Rpb25zDQo+Pj4gbW92aW5nLg0KPj4gQmFzZWQgb24gdGhlIHNwYXJjIGNoYW5n
ZSB0aGF0IGFjY29tcGFuaWVkIHRoaXMgY29tbWl0IHRoZSBmb2xsb3dpbmcNCj4+IGRvZXMgc2Vl
bSB0byByZXN0b3JlIHdvcmtpbmcgb3JkZXIgZm9yIG1lOg0KPj4NCj4+IGRpZmYgLS1naXQgYS9h
cmNoL21pcHMva2VybmVsL3ZtbGludXgubGRzLlMgYi9hcmNoL21pcHMva2VybmVsL3ZtbGludXgu
bGRzLlMNCj4+IGluZGV4IGQ1NzVmOTQ1ZDQyMi4uZTkwYjBmNjgyOTBjIDEwMDY0NA0KPj4gLS0t
IGEvYXJjaC9taXBzL2tlcm5lbC92bWxpbnV4Lmxkcy5TDQo+PiArKysgYi9hcmNoL21pcHMva2Vy
bmVsL3ZtbGludXgubGRzLlMNCj4+IEBAIC02Miw2ICs2Miw4IEBAIFNFQ1RJT05TDQo+PiAgICAg
ICAgICAgX3RleHQgPSAuOyAgICAgIC8qIFRleHQgYW5kIHJlYWQtb25seSBkYXRhICovDQo+PiAg
ICAgICAgICAgX3N0ZXh0ID0gLjsNCj4+ICAgICAgICAgICAudGV4dCA6IHsNCj4+ICsgICAgICAg
ICAgICAgICAvKiBNYXRjaCB0ZXh0IHNlY3Rpb24gc3ltYm9scyBpbiBoZWFkLlMgZmlyc3QgKi8N
Cj4+ICsgICAgICAgICAgICAgICAqaGVhZC5vKC50ZXh0KQ0KPj4gICAgICAgICAgICAgICAgICAg
VEVYVF9URVhUDQo+PiAgICAgICAgICAgICAgICAgICBTQ0hFRF9URVhUDQo+PiAgICAgICAgICAg
ICAgICAgICBMT0NLX1RFWFQNCj4+DQo+PiBObyBpZGVhIGlmIHRoYXQncyBhcHByb3ByaWF0ZQ0K
Pj4=

