Return-Path: <linux-mips+bounces-7596-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CED45A1A724
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 16:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 975A53A883A
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 15:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEB43F9D5;
	Thu, 23 Jan 2025 15:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lXpzLkBG"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E06F4F1;
	Thu, 23 Jan 2025 15:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737646529; cv=none; b=rE+Eijqk3UbLxmkPtnrJi6FOfeGBvVgpSImJ1Env9LwBB6eq6Rfql2nd7ACHXAYjcnHCY1F5t2BZt7Nbv8nePdGLp5/YvJ0GZuRmY6OTjg9HwVKvTNhleAJrmCTMinaDo+FMXkAkaa3prl8XdWdyJFU6XFDu8GQbi+jYEtOcFjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737646529; c=relaxed/simple;
	bh=w9SZ7HUYSlo0eJUNl5wTyCKYp8PXHdw4bohPhRTsshY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ldQNlGaidmqS4LZeWX5pfhUsiKT2oYBMG2Zz7CQ6PYlLq4wAzF/OapPlmBUepNhFWULrQ5Qor36MKgsZVhe+BgQwynn8otzhqh/BVFpvFtToGaRBnk+oye8LnHYpILU4tmSpOF47FapGWzN9ci7sZszTqfzZKOpAmCFbGHA30fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lXpzLkBG; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BCD021BF20B;
	Thu, 23 Jan 2025 15:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737646525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w9SZ7HUYSlo0eJUNl5wTyCKYp8PXHdw4bohPhRTsshY=;
	b=lXpzLkBG3Rff9P5hfTkWyIDlDr35xdzmvGVJxpHkFxkfLNaCw2BC+WcjoSu6PKBPkPT7X+
	oxyB7G15RoZIc77/dK6xY0TYfoJG6LRL23UggKPx95dEtpqUiciKJwm3qxSvdeW4mIhLrx
	z6DQ3k4YQ2Dv9DiAvVLBCvXU6U3rjyc4kx7RAZ+6slMb54vxCcTdoBSkzxA3ATJfeVfpVf
	x5VjUT1F6wUnr07ZH7tpT7TW4x6fUiVVEfAVL73FaAhTZQNNkxQ3MFHIW+rHCIYMrBnJxZ
	HPaJMFAvZAK2AXtp4xuQkEnKp1RTwlMu1BJcqEcV3hSMEdFvvj+97bBngI3RXQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Aleksandar Rikalo <arikalo@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, Theo Lebrun <theo.lebrun@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Djordje
 Todorovic <djordje.todorovic@htecgroup.com>, Chao-ying Fu
 <cfu@wavecomp.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@kernel.org>, Hauke
 Mehrtens <hauke@hauke-m.de>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Paul Burton
 <paulburton@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Serge
 Semin <fancer.lancer@gmail.com>, Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v8 00/13] MIPS: Support I6500 multi-cluster configuration
In-Reply-To: <CAGQJe6qBpQhBwhoLss8Y4MRurRs2p6_vym5XAiMmnHqd=nQC8w@mail.gmail.com>
References: <20241028175935.51250-1-arikalo@gmail.com>
 <87ed0uvqf7.fsf@BLaptop.bootlin.com>
 <CAGQJe6qBpQhBwhoLss8Y4MRurRs2p6_vym5XAiMmnHqd=nQC8w@mail.gmail.com>
Date: Thu, 23 Jan 2025 16:35:23 +0100
Message-ID: <877c6lv8zo.fsf@BLaptop.bootlin.com>
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

> On Wed, Jan 22, 2025 at 4:06=E2=80=AFPM Gregory CLEMENT
> <gregory.clement@bootlin.com> wrote:
>>
>> Hello Aleksandar,
>>
>> > Taken from Paul Burton MIPS repo with minor changes from Chao-ying Fu.
>> > Tested with 64r6el_defconfig on Boston board in 2 cluster/2 VPU and
>> > 1 cluster/4 VPU configurations.
>>
>> I tested your series on top of v6.13, with some patches already
>> merged. Only the patch "[PATCH v8 09/13] MIPS: CPS: Boot CPUs in
>> secondary clusters" encountered a merge issue. You can review the fixed
>> version I created as an attachment.
>>
>> With the v2 series I sent a few days ago, cluster support continued to
>> work on EyeQ5 and EyeQ6. However, for specific needs requiring support
>> of EyeQ6, I will send a new version that takes into account the feedback
>> received.
>>
>> Gregory
>
> Hello Gregory,
>
> Thank you for your time.
>
> I agree with the change in the attachment. Will you send it to the
> list or should I do it as a v9 version of the series?

I will let you send a v9 version. Feel free to merge my series [1] with
yours, as some of my patches depend on your series.

[1]: https://lore.kernel.org/lkml/20250123-cluster-hci-broken-v3-0-8a7ec57c=
bf68@bootlin.com/

Thanks,

Gregory

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

