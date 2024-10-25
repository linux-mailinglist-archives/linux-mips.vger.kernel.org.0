Return-Path: <linux-mips+bounces-6440-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD9A9B08FB
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2024 17:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03AD71C21438
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2024 15:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B483415D5A1;
	Fri, 25 Oct 2024 15:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="c7JdvuDe"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC6221A4AA;
	Fri, 25 Oct 2024 15:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729871894; cv=none; b=rk1MzV0PLDd3Dr1L+t3HF481aZBM102BYD4LNgAukWAaVhFFLYurQbjXjwsd8qoFekuK5ZduIw7cAzH6EU2VJhXP4qHvgbGdrc5VGo9Vg125DawQjiEea9NFBvmI9UV8B7GhMIJ8hbBJ5oa9ean+Ni+2fRtDuphtxXUmjbLhun0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729871894; c=relaxed/simple;
	bh=utSRbGiJSI1rH8t1Nq6oMWDqisqOLMjOCQleWIvPc+k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PP7Pw54jzdaQLFQQJXf1VQy59fTSkDrwWF9DRpLuTqYNDy2MGqg8pMirDNiiOC/V2YMPlTTPfaW9yhb3bCZD3McZZwsTb0Jaf9eq30u9cdX9xwBHD42Z8RzHkb97pTlg4hilTh4OXJ2YrSu7EkjjxG5IkHQIugjrlt6dA1D9PV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=c7JdvuDe; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 616B0FF803;
	Fri, 25 Oct 2024 15:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729871889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=utSRbGiJSI1rH8t1Nq6oMWDqisqOLMjOCQleWIvPc+k=;
	b=c7JdvuDe/kR0oAGeK0EjQH4OvEr4rV+7Vvz8yVBH2GmLuVqnMSH0C85md9IqJyoEc0iYyr
	sVgFSSA1Wby3MLRtHbyXAox1/VY1TgMVY7R3a5bb98JidDtKNQc+wQ0vniBu71dAwMIhuB
	oMcc2H8E+VGjTkRfDtgZS/7u9zsGz0wrehEtLakP2hP4CDXNWpYyCg6d3v43IkrdYN0KHu
	vslbkS0/7ZF3voS6fKgJCWMNZTQsAJGvKNmz3Bg5704m2B1DaOoAoTgcf6TVBa9BJJI12F
	bse2SoO6ic2vwjyw4IE+wrbYUytzY4CKwPSdarCn4M+Tif+LLoHrF+uhAzNlhg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Aleksandar Rikalo <arikalo@gmail.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <arikalo@gmail.com>, Chao-ying Fu <cfu@wavecomp.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Greg Ungerer <gerg@kernel.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Paul Burton
 <paulburton@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Serge
 Semin <fancer.lancer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v7 00/12] MIPS: Support I6500 multi-cluster configuration
In-Reply-To: <87plnob4qq.fsf@BLaptop.bootlin.com>
References: <20241019071037.145314-1-arikalo@gmail.com>
 <87plnob4qq.fsf@BLaptop.bootlin.com>
Date: Fri, 25 Oct 2024 17:58:08 +0200
Message-ID: <87msisb2en.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

[...]
>
> Then I also tested it on an EyeQ5, where the VP topology is
> {2,2,2,2},{}. In this case there is no CPU core in the second
> cluster. While some part of your series seems to support this case, it
> was not complete. I am about to send a new patch for it

I wanted to send it as a follow-up email, but I didn't manage to do so
previously. So, here is the link to this patch:

https://lore.kernel.org/lkml/20241025-no-cpu-cluster-support-v1-1-5e81fcf9f25c@bootlin.com/#t

Thanks,

Gregory

