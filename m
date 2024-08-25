Return-Path: <linux-mips+bounces-5058-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDB195E07B
	for <lists+linux-mips@lfdr.de>; Sun, 25 Aug 2024 02:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A77E71F21957
	for <lists+linux-mips@lfdr.de>; Sun, 25 Aug 2024 00:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B362119;
	Sun, 25 Aug 2024 00:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yQ2A40ew";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ou/fUlKR"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B42F1C14;
	Sun, 25 Aug 2024 00:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724545081; cv=none; b=HI3DzKwQ7Dq/iDnDx9neC7NbQOWN5T4SFFKwVk1tN3FXcp5vdRSrDVQz77BAVyODIvKygpgq7enSIdeDGEwqabTHfWkcqPHY4pO5op8ei/4PQgNspDx+1fgsgsfgIv8TOYzJG+7HV7GNXO6Z+qaOf5Od+Wee92NYZ6xKk3PneZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724545081; c=relaxed/simple;
	bh=Uym0//grMeFTF8qkNOf0cvKtoGvRXJRZlTldV77ebRQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YOODSzSf/io4B0rca+evcOQhmfZuQxi+h2Ph6XcyGZRBujGkTs/bC4aZnDLZQ4R9BTRCTtTyZYLMbUpuxq9/wAO/8kgMyKXou4cWp6w2ZuBLl5vjpRDZNDqwtN+8+S1+bBO6Rver0EqxDa/WhHOIxIkM8BMZ1tTwomYdoMK381g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yQ2A40ew; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ou/fUlKR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724545077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uym0//grMeFTF8qkNOf0cvKtoGvRXJRZlTldV77ebRQ=;
	b=yQ2A40ewCNN2mn+g+mdB0r0yV6jJJoyoRFyIrWs0uZ5CiMV5rbB9K1AtjPN4nukdCgxBiR
	wuJSmSfp/EGaafn/DfK4Kpiceej4l+gad5Dp4QblFWzXTB6pKfskwejp4QeEkhFFRvIftu
	CRciHzdCHW6AtSurf40gJ/a9KeFGZSZZJHDHiDPEx5aTz0N0+uo4wzJrkwxrlhmTIOIwIo
	TCCxXiLHwUp78446mGT1mbSTrwwD6gWRazVbSpJyGozR2jqmUGRUlKHZ62PfCiYp0VZXnB
	4bdIZVBs5TGe1dp3p/dks7OFODfvz7/7jDt9oAW4WhJCDy6bURJgwFUjP1Us0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724545077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uym0//grMeFTF8qkNOf0cvKtoGvRXJRZlTldV77ebRQ=;
	b=ou/fUlKReofzC9V64wER2JZvy86mxujTWXMKgAZM4GRiXfapsh9sMpAbEeU4m9OY5JSHGh
	2ry8Zht9P9sx15AA==
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Huacai Chen
 <chenhuacai@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 "paulburton@kernel.org" <paulburton@kernel.org>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/10] irqchip: irq-mips-cpu: Rework software IRQ
 handling flow
In-Reply-To: <802e542a-234e-456e-87e6-391375068fc7@app.fastmail.com>
References: <20240810-b4-mips-ipi-improvements-v3-0-1224fd7c4096@flygoat.com>
 <20240810-b4-mips-ipi-improvements-v3-9-1224fd7c4096@flygoat.com>
 <87y14nf2u2.ffs@tglx>
 <802e542a-234e-456e-87e6-391375068fc7@app.fastmail.com>
Date: Sun, 25 Aug 2024 02:17:56 +0200
Message-ID: <87o75hfoaz.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 24 2024 at 10:52, Jiaxun Yang wrote:

> =E5=9C=A82024=E5=B9=B48=E6=9C=8823=E6=97=A5=E5=85=AB=E6=9C=88 =E4=B8=8B=
=E5=8D=888:37=EF=BC=8CThomas Gleixner=E5=86=99=E9=81=93=EF=BC=9A
>> On Sat, Aug 10 2024 at 13:39, Jiaxun Yang wrote:
>>
>> Please fix the subsystem prefix.
>>
>
> Sorry, what do you ment by subsystem prefix?

I gave you the answer in the previous reply, but here is a link to
documentation:

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-su=
bject

