Return-Path: <linux-mips+bounces-6493-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF059B31D9
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 14:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65B411F21C59
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 13:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B471DB92A;
	Mon, 28 Oct 2024 13:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hGOAgT/i"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DD91D5178;
	Mon, 28 Oct 2024 13:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730122749; cv=none; b=iNducZNfxm322ZCdcoNWbGy0RDUzK2keK/oyNqovrLKDaOe0r16BXR2zHpFkqbEzE3GYQogJeMkw5EacMUVPZFh1DpcfV0vf6BNg0N2t4KRVnn3F/uc5Qb8wxOVk5tq86wyfYmXvEkoDeKwsnZbqPDBHLis3OL3/ctrOoiwc6VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730122749; c=relaxed/simple;
	bh=J6TygS9PS/UbaVj4c/knKhqWU5qE1QtSevjNgC5vI7E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GGYQYkyTo0wFqB4QF00qfazqUQQ2pynysXMJVYnFqRVfMpio64e9e6Zr6iBwB3ge3VDPbWB+6fuJsdoYliHGeNuMCSOlWPP9D4E1p0/QFnFcM8n08DOfWYIKtoHvsrGYALf662kikUt+uRvsk36GAZ5Ep2q+vxaM52/ILdVFUnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hGOAgT/i; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE5F324000D;
	Mon, 28 Oct 2024 13:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730122745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J6TygS9PS/UbaVj4c/knKhqWU5qE1QtSevjNgC5vI7E=;
	b=hGOAgT/iQxsWL1uStdCNwfhUTRbMQXtpmTXqUoeJLFB26KR/yQ5OmibLA+MliAaZATzpOE
	K109JGcBrWxYgELGMSgrz5+J90iLjVeB8TYARbMMrOgzOSZqu+bLLmGRraCVWhgBkxLgE6
	D51igWNDdIzO0OFMgDiXVB2Cqchl+keSf6kwuIP1/Zosh5vzsJhhPWr2bQl/bFYvnl625A
	ccwEZCb2wGEnuPC/9WtXshEfHKmXWUFwC7BGU/KBa0uQAAdV5uxPzPPmukv5GYO1afyNWS
	jaw5yuWtmcXJxit/7n6aDm45i5UN0HsZf1bldWIpBbL7SY9Wixbxa8ESQymfpw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Aleksandar Rikalo <arikalo@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Chao-ying Fu
 <cfu@wavecomp.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@kernel.org>, Hauke
 Mehrtens <hauke@hauke-m.de>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Paul Burton
 <paulburton@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Serge
 Semin <fancer.lancer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v7 00/12] MIPS: Support I6500 multi-cluster configuration
In-Reply-To: <CAGQJe6pywUi8dnhxFopkMfP2U1PceHjTPX-CysT0bajSk_AKKg@mail.gmail.com>
References: <20241019071037.145314-1-arikalo@gmail.com>
 <87plnob4qq.fsf@BLaptop.bootlin.com>
 <CAGQJe6pywUi8dnhxFopkMfP2U1PceHjTPX-CysT0bajSk_AKKg@mail.gmail.com>
Date: Mon, 28 Oct 2024 14:39:01 +0100
Message-ID: <87cyjkbb4a.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hello Aleksandar,

> Hello Gregory,
>
> Thank you!
> Just to be clear, which patches can I put your "tested-by" on?

Good question ! :)

I've tested the entire series of patches together, rather than applying
each individual patch separately. Although I'm not entirely certain, my
best guess would be that you can safely put my 'tested-by' tag on each
one.

>
> I'm preparing series v8.

You could also include the other patches I sent on Friday in this
series, as suggested by Thomas.

Thanks,

Gregory

>
> --
> Aleksandar
>
> On Fri, Oct 25, 2024 at 5:07=E2=80=AFPM Gregory CLEMENT <gregory.clement@=
bootlin.com>
> wrote:
>
>> Hello Aleksandar,
>>
>>
>> I successfully tested it on an EyeQ6H SoC. On top of v6.12-rc4 I also
>> added only one patch needed for EyeQ6H:
>>
>> https://lore.kernel.org/lkml/20241011-eyeq6h-smp-v2-1-8381edf8a5c6@bootl=
in.com/#t
>>
>> So for EyeQ6H, you can then add my
>> Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>>
>> Then I also tested it on an EyeQ5, where the VP topology is
>> {2,2,2,2},{}. In this case there is no CPU core in the second
>> cluster. While some part of your series seems to support this case, it
>> was not complete. I am about to send a new patch for it
>>
>> Thanks,
>> Gregory
>>

