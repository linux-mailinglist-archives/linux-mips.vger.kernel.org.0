Return-Path: <linux-mips+bounces-4420-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB77938FD2
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2024 15:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F190283051
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2024 13:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13F016CD06;
	Mon, 22 Jul 2024 13:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VV/O/Ryk"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9EC16938C;
	Mon, 22 Jul 2024 13:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721654421; cv=none; b=ROOfwlV/TA5P7pt1inM8wqWbSehbqwYFBb23i62giIExAFqZBe7wjkdOQyRgBjBW/9ZQN8biB0YfWe2KXOZ3oX5Y631rs0pEI+DDI1If0eZuFz/6MImCn5rBaCvB+/qrsfmvaYuX0QRuSEv9z4+ux1CkAbbNx5iNHRjb4tcD9sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721654421; c=relaxed/simple;
	bh=y3Gx+WfjFQRIfL61Lgwl8Womf5PGQfiTOfwgOeMTPp0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cSEVdboTiowlo7RA2TpDZXIq6askWiCX0Hkajveqc8x8/Ib8JXbQE1RJ/Wy1M49o3dovrydmqC4wJ+CbRF72dZ/h1uomlK9N3HGhlYPzi75MoHOagNwzaKEt66r8mNnP5CYSg/Mez2+k0oeA/Aho6matts23KvHNTUMyCMY2gzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VV/O/Ryk; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10AF91BF203;
	Mon, 22 Jul 2024 13:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721654411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y3Gx+WfjFQRIfL61Lgwl8Womf5PGQfiTOfwgOeMTPp0=;
	b=VV/O/RykB4p0YBJhii1Db0yWjWo0upQV2+h4lwoCGzwkWOCXBpsF1oyBD0EXPqiLrVmydg
	ZbGBRo3OvriuefmCqweJLaO3FNvtLEiOs/t6ZchUNjT50mTl0k+OwiiuhKqWK3/zt5J4x9
	mcZj+6TfveDZpSx9aiam1X32cSMsHvEgQlrIJ7T587qiR0XjF7WKFAsbMKddQ3r45jgjkE
	P6AffzCppPdlH8Spag9R8t+ixOxf4MVuG/rlHcYJJ995gSMrDi6njWIvBwGN9LTxZ9yoyb
	KCXouIdbmmpFLsorgv2I33B8j5lixRlZqggWfocLKx/L9s3PpLbg4Xl1FcMtkg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, "paulburton@kernel.org"
 <paulburton@kernel.org>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Tawfik Bayouk
 <tawfik.bayouk@mobileye.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] MIPS: SMP-CPS: Fix address for GCR_ACCESS register for
 I6500
In-Reply-To: <302ca8fb-0185-4872-9d82-d472854e5a43@app.fastmail.com>
References: <20240719-smp_i6500-v1-1-8738e67d4802@bootlin.com>
 <302ca8fb-0185-4872-9d82-d472854e5a43@app.fastmail.com>
Date: Mon, 22 Jul 2024 15:20:10 +0200
Message-ID: <87bk2pk1h1.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

"Jiaxun Yang" <jiaxun.yang@flygoat.com> writes:

> =E5=9C=A82024=E5=B9=B47=E6=9C=8819=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=
=E5=8D=8810:14=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
>> Unlike most other MIPS CPUs, the I6500 CPUs have different address
>> offsets for the Global CSR Access Privilege register. In the "MIPS64
>> I6500 Multiprocessing System Programmer's Guide," it is stated that
>> "the Global CSR Access Privilege register is located at offset 0x0120"
>> in section 5.4.
>>
>> However, this is not the case for other MIPS64 CPUs such as the
>> P6600. In the "MIPS64=C2=AE P6600 Multiprocessing System Software User's
>> Guide," section 6.4.2.6 states that the GCR_ACCESS register has an
>> offset of 0x0020.
>
> Hi Gregory,
>
> I confirmed this is a CM3 feature rather than CPU core (Samruai) feature.
>
> Please use CM version to select register region.



> (And perhaps Cc stable for this patch?)

Actually, from my experience, the "Fixes:" tag is enough. The stable
teams (and their bots) extensively backport patches from the Linus tree.

Gregory

