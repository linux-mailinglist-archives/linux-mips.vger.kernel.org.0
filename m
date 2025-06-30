Return-Path: <linux-mips+bounces-9545-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B46D6AED5C6
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 09:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9F2116334D
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 07:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C0B226188;
	Mon, 30 Jun 2025 07:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JdlmFbng"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1E9224B15;
	Mon, 30 Jun 2025 07:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751268882; cv=none; b=Q5C2v1ACYvbL+h7bUp3ZDs4DzMLCjGYdYS89/xKVsyL9kLOTtlPeJUPQ1fUS1wRKzSQexXm/palxzoQHQDzDn4se41o++7juHw6UkhnIfdZF/yhwC/Tk28kvoLwhpSfl1QoHNRbmEtkqazt90iX5W4jG1C/luTr08oB+rUrZg9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751268882; c=relaxed/simple;
	bh=cq0TMxJ3EwL84orND8hizsjELXr99Jz9NecvDComcQ0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dp/n/jeBNykOh7IuDGKDRbEkOGTU874gyrDZStT3jIr3J8BgNG/HC1G2UxiWmWFzvnbW3BRuq+vvEvAR7nbJUVlu4fTku21jRtIAf8VQHaRNa4yJyESOxr2zSuS1CB8HPLmfsgNpli1e3tX970+NRmyXUSgC2P8kG/K3btWCcKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JdlmFbng; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76355442C7;
	Mon, 30 Jun 2025 07:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751268872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lQ/1/usiML+wTkt+xJkKBp0vdtZhlpz0B2eqJDeOyKs=;
	b=JdlmFbngS0KEje/uuqHNw9engIUyun0NTP3C6TOgPS64vw+u0DqBdRTk6DhdJYceE42xgd
	/+o9l7u5E7xZ3a/uJdMG8vHt8NSxZVU7iEiZo3AZIZFhjaPHZvsnxYASEYqENXmkM9Xn1l
	YPuXV5JjujNMHxeI42jNbPwYH7gLxuCnVyke3k7NVVJeuNZ/G7q9CYOwQ8X8KCPzt0NffN
	dgW/ZGEZsHKXagE0JuBICHjN19gXG+bKfndkQ6PocMuS+Vlyvvl15Q5w2h4bbayRWHxpfT
	EecWhfQmK6KLfp9OFwcDnOmxHT1V3wR2TjEnXpSqPW9DXnyfBkePOMVK3q4E9g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Th?=
 =?utf-8?Q?=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Adrian Hunter <adrian.hunter@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>,
 linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 4/6] MIPS: eyeq6_defconfig: add cadence MMC/SDHCI driver
In-Reply-To: <4deef2c41a8b7d41259db291a6a1401588bb8752.1750156323.git.benoit.monin@bootlin.com>
References: <cover.1750156323.git.benoit.monin@bootlin.com>
 <4deef2c41a8b7d41259db291a6a1401588bb8752.1750156323.git.benoit.monin@bootlin.com>
Date: Mon, 30 Jun 2025 09:34:31 +0200
Message-ID: <87ecv1isxk.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffffkgggtgfesthhqredttddtjeenucfhrhhomhepifhrvghgohhrhicuvefngffogffpvfcuoehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefghfegvdehgfdtjedvtefhvdeikefgteeuhfeukeettefgvdeuueettddtkeegveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffeekieemsgdvtgdvmegstghfjeemlegurgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffeekieemsgdvtgdvmegstghfjeemlegurgejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduhedprhgtphhtthhopegsvghnohhithdrmhhonhhinhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehulhhfrdhhrghnshhsohhnsehlihhnrghrohdrohhrghdprhgtphhtthhopehrohgshhesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvg
X-GND-Sasl: gregory.clement@bootlin.com

Hello Beno=C3=AEt,

> Enable MMC support on eyeQ6 platform so it can be used as the root
> partition.
>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory

> ---
>  arch/mips/configs/eyeq6_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/mips/configs/eyeq6_defconfig b/arch/mips/configs/eyeq6_=
defconfig
> index 0afbb45a78e8..0a00a201937b 100644
> --- a/arch/mips/configs/eyeq6_defconfig
> +++ b/arch/mips/configs/eyeq6_defconfig
> @@ -82,6 +82,8 @@ CONFIG_HID_MICROSOFT=3Dy
>  CONFIG_HID_MONTEREY=3Dy
>  CONFIG_MMC=3Dy
>  CONFIG_MMC_SDHCI=3Dy
> +CONFIG_MMC_SDHCI_PLTFM=3Dy
> +CONFIG_MMC_SDHCI_CADENCE=3Dy
>  # CONFIG_IOMMU_SUPPORT is not set
>  CONFIG_RESET_CONTROLLER=3Dy
>  # CONFIG_NVMEM is not set

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

