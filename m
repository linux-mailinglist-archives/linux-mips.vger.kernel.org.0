Return-Path: <linux-mips+bounces-8737-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90037A9B37D
	for <lists+linux-mips@lfdr.de>; Thu, 24 Apr 2025 18:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEEA51BA0D39
	for <lists+linux-mips@lfdr.de>; Thu, 24 Apr 2025 16:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C278227FD64;
	Thu, 24 Apr 2025 16:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="lkcNnvNv"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B29119E7F9;
	Thu, 24 Apr 2025 16:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745511029; cv=none; b=ZAfkm2hX1BxCv7OB9X7z50F4JKOQr7eDiSZKOPbmKoDbc7WQfp3C5Sfg74BTknYYHDqlr+W8P8hfRUgegIVlP/9aBECmyiBDRAtMV9Pdurh3Ga2GY8UAzra4Q+a9IBwpcwr3pIofB+d3JPVfhJ4okjKRwVDxo4FSs0yaxXifduw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745511029; c=relaxed/simple;
	bh=xS/c2OWjF/odcrpnrmcuWM+KrdapIB6JqW1w7ffcSTM=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DA5kX1cDd87AbsDvUwBgcADgRNmYZaVjIaOUF5SeB6u5knrI+bdVSMV4pU544os3LWCi8mBZbiJSg5k8Xe1xL4kAQQSdO1SrguxiGXqLtngq1/JJGHPk3Wkc3eaQRSob0frZi5c+C+Kj59gPyDafmpj3P7cL9IXNo8wG37PeJiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=lkcNnvNv; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OCIEXH002237;
	Thu, 24 Apr 2025 18:09:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	xS/c2OWjF/odcrpnrmcuWM+KrdapIB6JqW1w7ffcSTM=; b=lkcNnvNvH3Y4ByzV
	2xdkf8jvnuqm2xAX5NncjVhbS9sPbbWDkWN+8PNPuw1Jb2yDcLBl5/X1OBw+Gbi+
	yL6UK0ojK5xWIg9O67qKpFOrIBH+lL7wj73r0lpR+2nzoedKVwqlTOV3+4AAqM1t
	XH2yszQ9E985pznh7VRPbuKcl4HTWPceHELiyEs8oLieQdwI1TwLKR8/PlI4B24a
	bKkm8tK7+aTLc7lVPrgkW6PdrBrW/C7kZwntzuRuy2CWDHXgDtXoa2D5b2ukbpG6
	BheCKxuJtGgK+iY9E9wtURIBQXlCSfy5jlpxKF6/oxTsti3RrWTOMazcJUHQTCuf
	k45zIQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jjygjeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 18:09:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5168940082;
	Thu, 24 Apr 2025 18:07:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 345169D0185;
	Thu, 24 Apr 2025 18:04:50 +0200 (CEST)
Received: from [192.168.8.15] (10.48.86.132) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 18:04:48 +0200
Message-ID: <b768bd1b6bfe3bef28278b85ace87230a67b904e.camel@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH 05/12] pinctrl: stm32: use new GPIO line
 value setter callbacks
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Andreas =?ISO-8859-1?Q?F=E4rber?=
	<afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Steen Hegelund
	<Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        <UNGLinuxDriver@microchip.com>,
        "Ludovic Desroches"
	<ludovic.desroches@microchip.com>,
        Nicolas Ferre
	<nicolas.ferre@microchip.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar
	<alim.akhtar@samsung.com>
CC: <linux-samsung-soc@vger.kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        <linux-actions@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Date: Thu, 24 Apr 2025 18:04:47 +0200
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-5-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
	 <20250424-gpiochip-set-rv-pinctrl-part2-v1-5-504f91120b99@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_07,2025-04-24_01,2025-02-21_01

T24gVGh1LCAyMDI1LTA0LTI0IGF0IDEwOjM1ICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdy
b3RlOgo+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGlu
YXJvLm9yZz4KPiAKPiBzdHJ1Y3QgZ3Bpb19jaGlwIG5vdyBoYXMgY2FsbGJhY2tzIGZvciBzZXR0
aW5nIGxpbmUgdmFsdWVzIHRoYXQgcmV0dXJuCj4gYW4gaW50ZWdlciwgYWxsb3dpbmcgdG8gaW5k
aWNhdGUgZmFpbHVyZXMuIENvbnZlcnQgdGhlIGRyaXZlciB0byB1c2luZwo+IHRoZW0uCj4gCj4g
U2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBs
aW5hcm8ub3JnPgoKUmV2aWV3ZWQtYnk6IEFudG9uaW8gQm9ybmVvIDxhbnRvbmlvLmJvcm5lb0Bm
b3NzLnN0LmNvbT4KCj4gLS0tCj4gwqBkcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0z
Mi5jIHwgNyArKysrKy0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3Ry
bC1zdG0zMi5jIGIvZHJpdmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzIuYwo+IGluZGV4
IGNjMGI0ZDFkN2NmZi4uYmE0OWQ0OGMzYTFkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGluY3Ry
bC9zdG0zMi9waW5jdHJsLXN0bTMyLmMKPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGlu
Y3RybC1zdG0zMi5jCj4gQEAgLTIyOCwxMSArMjI4LDE0IEBAIHN0YXRpYyBpbnQgc3RtMzJfZ3Bp
b19nZXQoc3RydWN0IGdwaW9fY2hpcCAqY2hpcCwgdW5zaWduZWQgb2Zmc2V0KQo+IMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gISEocmVhZGxfcmVsYXhlZChiYW5rLT5iYXNlICsgU1RNMzJfR1BJT19J
RFIpICYgQklUKG9mZnNldCkpOwo+IMKgfQo+IMKgCj4gLXN0YXRpYyB2b2lkIHN0bTMyX2dwaW9f
c2V0KHN0cnVjdCBncGlvX2NoaXAgKmNoaXAsIHVuc2lnbmVkIG9mZnNldCwgaW50IHZhbHVlKQo+
ICtzdGF0aWMgaW50IHN0bTMyX2dwaW9fc2V0KHN0cnVjdCBncGlvX2NoaXAgKmNoaXAsIHVuc2ln
bmVkIGludCBvZmZzZXQsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpbnQgdmFsdWUpCj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBzdG0z
Ml9ncGlvX2JhbmsgKmJhbmsgPSBncGlvY2hpcF9nZXRfZGF0YShjaGlwKTsKPiDCoAo+IMKgwqDC
oMKgwqDCoMKgwqBfX3N0bTMyX2dwaW9fc2V0KGJhbmssIG9mZnNldCwgdmFsdWUpOwo+ICsKPiAr
wqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiDCoH0KPiDCoAo+IMKgc3RhdGljIGludCBzdG0zMl9n
cGlvX2RpcmVjdGlvbl9vdXRwdXQoc3RydWN0IGdwaW9fY2hpcCAqY2hpcCwKPiBAQCAtMzA4LDcg
KzMxMSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZ3Bpb19jaGlwIHN0bTMyX2dwaW9fdGVtcGxh
dGUgPSB7Cj4gwqDCoMKgwqDCoMKgwqDCoC5yZXF1ZXN0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqA9IHN0bTMyX2dwaW9fcmVxdWVzdCwKPiDCoMKgwqDCoMKgwqDCoMKgLmZyZWXCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoD0gcGluY3RybF9ncGlvX2ZyZWUsCj4g
wqDCoMKgwqDCoMKgwqDCoC5nZXTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgPSBzdG0zMl9ncGlvX2dldCwKPiAtwqDCoMKgwqDCoMKgwqAuc2V0wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoD0gc3RtMzJfZ3Bpb19zZXQsCj4gK8KgwqDCoMKgwqDC
oMKgLnNldF9ydsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqA9IHN0bTMyX2dwaW9f
c2V0LAo+IMKgwqDCoMKgwqDCoMKgwqAuZGlyZWN0aW9uX2lucHV0wqDCoMKgwqDCoMKgwqDCoD0g
cGluY3RybF9ncGlvX2RpcmVjdGlvbl9pbnB1dCwKPiDCoMKgwqDCoMKgwqDCoMKgLmRpcmVjdGlv
bl9vdXRwdXTCoMKgwqDCoMKgwqDCoD0gc3RtMzJfZ3Bpb19kaXJlY3Rpb25fb3V0cHV0LAo+IMKg
wqDCoMKgwqDCoMKgwqAudG9faXJxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoD0g
c3RtMzJfZ3Bpb190b19pcnEsCj4gCgo=


