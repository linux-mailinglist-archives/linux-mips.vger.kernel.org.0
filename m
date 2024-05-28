Return-Path: <linux-mips+bounces-3359-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 320638D2478
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 21:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C878C1F2705B
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 19:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF04A171E5D;
	Tue, 28 May 2024 19:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4Q0uIKf0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dlDZNGS9"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5956DD0D;
	Tue, 28 May 2024 19:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716923842; cv=none; b=ddxNC53wXVGY0vk9YeffR9lJ//NgC/qEarCL9E4l31Bkz8TcoKXFNXNB2W6mZA/3oev1E9jcSz+SRQxipI/GXyZ8ZF/CmJkdIeE8U4x0kEvjbAqSwB4V7Ve9JVH7B60SRC+fiSuxwDMyTOkUU0C1YAyo9SQ79aWHMOgF2M8vnBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716923842; c=relaxed/simple;
	bh=CnnAhhfLz0yuidAHDeeEXBYwXWBSYSxgEY9NZ458gW0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PbpYEen+ChoF39TpGpm0l+hnl71vmGqxlaEke+afHsc8EQh0fCTxGAzoPtgfI98FyUv6/yYLJmMwNGQ/ougwNtjqUastpY4iYN70h23UhK1aFs3oIjGeclys4GMHBOHpobuGRRoqMoOuYRQm+VtPGcwbIPq+XJLuz+K10Jsm2Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4Q0uIKf0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dlDZNGS9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1716923839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJ1hwXGxp5OziMITpimO5gMUZCDRn1KBiPlKiBihrWA=;
	b=4Q0uIKf0G8CeKyw1PtsLVCbUOOC9UuZaDRd3Kl9M7VLtjJsA8bmbOw26giQO8UW4MO2dG3
	Gfwm7SS/uF+VkocqhAr0TR57SDovXB9WMan8RGB9vefJKqBSbeaMZ861oHFSoQPO2X1V3e
	QYSPBMCYroAILOusV9zsslgjKzv8f6DG/cgdqJaIO1YVt/ckZPiap++MNv4HIi4yIo4Dy5
	CxOEUKQKmb6U5kuCLsdmGpwrEcAhwKCt+28G8toQTtRtPhYGNcUXSHWh+z8eUX71ZKGVLJ
	hd8gvOb+O9IYhOpIr/C2P8sDSIbDGvwvQMxIszldpcWSLOap31jmVo5fl6DF7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1716923839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJ1hwXGxp5OziMITpimO5gMUZCDRn1KBiPlKiBihrWA=;
	b=dlDZNGS9j37CdmsfrI+XNgAf9uk8CeaU3aUHLYh+8UhnM4BeOT90CsmTSpQJ3nlzgV4tEI
	jdRGc/Ee4nS5K9Bg==
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen
 <chenhuacai@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-kernel@vger.kernel.org, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2] clocksource: Add node counter timer driver for
 MIPS/Loongson64
In-Reply-To: <558b1d58-08a5-410d-97b8-e77def7c1cf8@app.fastmail.com>
References: <20240517-loongson_nodecnt-v2-1-5bd0bb20ff5f@flygoat.com>
 <87sey3b6de.ffs@tglx>
 <9947f7a5-1a95-48f2-b0eb-0385eb2b3d55@app.fastmail.com>
 <558b1d58-08a5-410d-97b8-e77def7c1cf8@app.fastmail.com>
Date: Tue, 28 May 2024 21:17:19 +0200
Message-ID: <878qztbvb4.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 28 2024 at 15:31, Jiaxun Yang wrote:
> =E5=9C=A82024=E5=B9=B45=E6=9C=8827=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8B=
=E5=8D=885:32=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
>> =E5=9C=A82024=E5=B9=B45=E6=9C=8827=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8B=
=E5=8D=884:51=EF=BC=8CThomas Gleixner=E5=86=99=E9=81=93=EF=BC=9A
>>> Jiaxun!
>>>
>> Hi Thomas,
>> [...]
>>>
>>> What's this indirection for? Why dont you update=20
>> [...]
>>>
>>>> +static struct clocksource nodecnt_clocksource =3D {
>>>> +	.name	=3D "nodecnt",
>>>> +	.read	=3D nodecnt_clocksource_read,
>>>
>>> the read function pointer here and spare the indirection?
>> Smart! sched_clock takes slightly different function pointer argument ty=
pe
>> but as we don't use the argument anyway, it should be safe to relax this
>> indirection.
>
> Sadly, I'm unable to remove it with force type catsing :-/
>
> drivers/clocksource/loongson-nodecnt.c: In function =E2=80=98nodecnt_cloc=
ksource_init=E2=80=99:
> drivers/clocksource/loongson-nodecnt.c:89:36: warning: cast between incom=
patible function types from =E2=80=98u64 (*)(void)=E2=80=99 {aka =E2=80=98l=
ong long unsigned int (*)(void)=E2=80=99} to =E2=80=98u64 (*)(struct clocks=
ource *)=E2=80=99 {aka =E2=80=98long long unsigned int (*)(struct clocksour=
ce *)=E2=80=99} [-Wcast-function-type]
>    89 |         nodecnt_clocksource.read =3D (u64 (*)(struct clocksource =
*))nodecnt_read_fn;
>

What about making the actual read functions have the required function
signature? The clocksource argument is not used in those real functions.

Thanks,

        tglx

