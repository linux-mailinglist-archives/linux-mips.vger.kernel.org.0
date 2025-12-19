Return-Path: <linux-mips+bounces-12528-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 566C1CD0E24
	for <lists+linux-mips@lfdr.de>; Fri, 19 Dec 2025 17:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3EC530534E9
	for <lists+linux-mips@lfdr.de>; Fri, 19 Dec 2025 16:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9025034E748;
	Fri, 19 Dec 2025 16:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NHScTI3Z"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F183C3446B7;
	Fri, 19 Dec 2025 16:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766161351; cv=none; b=RrnjiWhyq666wntd5cQdFBQZe8GQANHyqf46iF8H3B52P17bI6kiFLjEojoVm6CtQDHK7Hn8yD3bAekRS6t9Iv8I+NwZeAxoy04XSSQba+iVl5bSFUREqmrr374HY1OXzlTxmAiYmeX5/h0pWypilj61zx0P+3z2Zp4JpRa5xW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766161351; c=relaxed/simple;
	bh=kWk+pXBcalQXDvhxIVNBuiBNANtQKCOAczIv9hY4rpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dkcaupGY6NfG2fCqUY6M0ymyp8Plf4z0dQ2sGkFJclZFEj5qa7n7ok9N/tWESLtkjBMY3lLajq3IKRk2DrMLsvZWlHSfa0tuvNvv39ItekeLndl0JWGpDU0CtCRxHQ2nTaLXpHW50/GcrZISYxfIA73KPLEQQe5npZCRMRyNUEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NHScTI3Z; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8227FC1B20B;
	Fri, 19 Dec 2025 16:22:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A2386071D;
	Fri, 19 Dec 2025 16:22:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 54B9E10AA9550;
	Fri, 19 Dec 2025 17:22:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766161345; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=W1aMCMFga/z0MWKyRotJid2cvKBRYRsjFBjUE4pfxHY=;
	b=NHScTI3ZFWbuV+N2kVIw0ksvnuSYGtcitFI8P4Mu/lRTMkbSmDOc6EdDo+tnOOtRqc5aXP
	q2Czo+T5UJ6NexX462m/NOv3CdMmTkzW6Ji8aQyM/hM7vdK36hqwrUks9lAKfFHN1Y0r0N
	lzlDMQPslsmkgUN3yO4HhZZap0E9dhlHeRImB0tGFrE7Pj9kqq5mQz4QeHhSu9y30FlRJQ
	CrPsQLz8h+GBH0MwaccR0p7fNLAebOCJxxfGNGsTfzebLPvM/H7FuBtLJPWYcKEj202fYK
	CGT9B3rp4IinUhoLohutKeFeTGW2L8moi7s5574EhV9h8mz8E6ObB9mohFS9DA==
Message-ID: <11e76904-51e1-4270-aa11-a854d3143516@bootlin.com>
Date: Fri, 19 Dec 2025 17:22:22 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] Introducing the Mobileye EyeQ6Lplus SoC
To: Linus Walleij <linusw@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com>
 <CAD++jL=D7uGC8u+EHyxW437crM7Qfd0HHdzNhtvFmEzJyoaNvQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
In-Reply-To: <CAD++jL=D7uGC8u+EHyxW437crM7Qfd0HHdzNhtvFmEzJyoaNvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Linus,

On 12/19/25 13:03, Linus Walleij wrote:
> Hi Benoit,
> 
> thanks for your patches!
> 
> On Wed, Dec 17, 2025 at 2:36 PM Benoît Monin <benoit.monin@bootlin.com> wrote:
> 
>> The Eyeq6Lplus is a new system-on-chip part of Mobileye's EyeQ family
> 
> I don't know if this is "new" since it was announced in 2022.
> 
The EyeQ6L family was announced in 2024[1] and this particular variant,
the EyeQ6Lplus, is from this year I guess.

>> of SoC aimed at Advanced Driver Assistance Systems (ADAS). It is built
>> around a multicore MIPS I6500 with 2 cores and 8 threads and integrates
>> controllers and accelerators dedicated to driving assistance.
> 
> I think a question on everyone's lips is how much new MIPS hardware
> MobilEye are going to be churning out? Is there *more* coming?
> 
I cannot say for sure what are Mobileye plans but the next platform
we are working on is based on RISC-V, with MIPS P8700 cores[2]. 

> Don't get me wrong - I think it is pretty cool. But as these systems have
> long support cycles, this will have direct consequences for the MIPS arch
> maintenance and longevity.
> 
> Yours,
> Linus Walleij

[1]: https://www.mobileye.com/news/mobileye-eyeq6-lite-launches-to-speed-adas-upgrades-worldwide/
[2]: https://mips.com/products/hardware/p8700/


