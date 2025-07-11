Return-Path: <linux-mips+bounces-9745-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 549F6B01FED
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 16:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B23A41CC203A
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 14:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4772EA472;
	Fri, 11 Jul 2025 14:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GJxzBmTD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E8D2E975D;
	Fri, 11 Jul 2025 14:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752245853; cv=none; b=KlFbwNgDDiNewoA0jgJyqg8kcTt+rllvZOMTUKpr+HWneM/EUMLhyBfZm3x9Ej4zG2FpBz3pRWrA+V9M4jB8nGi3ZLwylYPvIB9n78Eq5aOHzp8YSG4TPhmOMLAcLz3IAQocAm4gVxALsyigRAEcR5DgVx/esmSEJgkJrZeXtuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752245853; c=relaxed/simple;
	bh=dgFxUWSU/0k+fhTcgvNbABFmxmbJUDUWueQBoCVe3Zc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LjvBL70Ej8qk08Se6YIrxfdoqnFyN+cwXmwGJMM/9fi52Zu8onRD39/ksurCM+ld0WzfCeikQ0VRLqZnIdVH8OYg4g6ud3yyv6UbAAHPUHqq2mHuPSxchIwfpYVVFqR36jm2bSmZnWqN9E5uZdUuHR3MF34crnO+HTGPJq2u9iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GJxzBmTD; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [IPv6:2001:4b98:dc4:8::236])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id E5B23580FBE;
	Fri, 11 Jul 2025 14:19:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 654EB44A17;
	Fri, 11 Jul 2025 14:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752243568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YdmLOGVNfZNQHoKUvEySqniB+4Cljg2Hu4rWIVAWMOg=;
	b=GJxzBmTDM7u/q6HsFlLRv7f1r8F4PZU3y0KwePAPk7lS6CuTbZ3GO5LdAQ5fOC1UJdutix
	cHVbEKUKFcuQW621mQxjHT1capEaShCr6RyRKHImu6YgG5e58HO8c/Rq5/UdTooTm/vIWw
	T+De/TONeRvcXnI3LRNIf5nBkjfeCJ5uHTQMesN61AXDL4zw2uhTLbkgcz/MevYWEcyasr
	txBPDBTv8wKS8Lg4Mar7vkX+LlBXQqfGbUPQczG4ALR38NGwf+RUjf+Q8g2n7ATXdq3uqi
	h9zQXlcyxdHK3gW30q2svV5nTuC8AVN7uTXHs2cpK6zGxeieNScEHHKJFstimg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: =?utf-8?Q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Thomas
 Bogendoerfer
 <tsbogend@alpha.franken.de>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk
 <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, =?utf-8?Q?Th?=
 =?utf-8?Q?=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 1/6] MIPS: eyeq5_defconfig: Update for v6.16-rc1
In-Reply-To: <20250704-of-commits-v1-1-dc2006bf2846@bootlin.com>
References: <20250704-of-commits-v1-0-dc2006bf2846@bootlin.com>
 <20250704-of-commits-v1-1-dc2006bf2846@bootlin.com>
Date: Fri, 11 Jul 2025 16:19:27 +0200
Message-ID: <87ldouzu6o.fsf@BLaptop.bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfeehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffffkgggtgfesthhqredttddtjeenucfhrhhomhepifhrvghgohhrhicuvefngffogffpvfcuoehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefghfegvdehgfdtjedvtefhvdeikefgteeuhfeukeettefgvdeuueettddtkeegveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeegtgejkeemvdektggvmeeftgejgeemfeeggegtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeegtgejkeemvdektggvmeeftgejgeemfeeggegtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehvlhgru
 ghimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtrgiffhhikhdrsggrhihouhhksehmohgsihhlvgihvgdrtghomh

Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> writes:

>  - Sort by moving CONFIG_PAGE_SIZE_16KB=3Dy.
>
>  - Drop CONFIG_MACH_EYEQ5=3Dy because it is the default:
>
>       # arch/mips/mobileye/Kconfig
>       choice
>          prompt "Mobileye EyeQ SoC selection"
>          default MACH_EYEQ5
>
>  - Drop CONFIG_SPARSEMEM_MANUAL=3Dy because:
>
>       # mm/Kconfig
>       choice
>          prompt "Memory model"
>          depends on SELECT_MEMORY_MODEL
>          default SPARSEMEM_MANUAL if ARCH_SPARSEMEM_DEFAULT
>          default FLATMEM_MANUAL
>
>       # arch/mips/Kconfig
>       config EYEQ
>          select ARCH_SPARSEMEM_DEFAULT if 64BIT
>

Thaks for the clean-up

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory


> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---
>  arch/mips/configs/eyeq5_defconfig | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/mips/configs/eyeq5_defconfig b/arch/mips/configs/eyeq5_=
defconfig
> index ff7af5dc6d9d353cd84a5532c6f1de43c6983dfd..e2d6ad7c3006b037ae370a68c=
09e7aacab61d083 100644
> --- a/arch/mips/configs/eyeq5_defconfig
> +++ b/arch/mips/configs/eyeq5_defconfig
> @@ -19,20 +19,18 @@ CONFIG_SCHED_AUTOGROUP=3Dy
>  CONFIG_BLK_DEV_INITRD=3Dy
>  CONFIG_EXPERT=3Dy
>  CONFIG_EYEQ=3Dy
> -CONFIG_MACH_EYEQ5=3Dy
>  CONFIG_FIT_IMAGE_FDT_EPM5=3Dy
> -CONFIG_PAGE_SIZE_16KB=3Dy
>  CONFIG_MIPS_CPS=3Dy
>  CONFIG_CPU_HAS_MSA=3Dy
>  CONFIG_NR_CPUS=3D16
>  CONFIG_MIPS_RAW_APPENDED_DTB=3Dy
>  CONFIG_JUMP_LABEL=3Dy
> +CONFIG_PAGE_SIZE_16KB=3Dy
>  CONFIG_COMPAT_32BIT_TIME=3Dy
>  CONFIG_MODULES=3Dy
>  CONFIG_MODULE_UNLOAD=3Dy
>  CONFIG_TRIM_UNUSED_KSYMS=3Dy
>  # CONFIG_COMPAT_BRK is not set
> -CONFIG_SPARSEMEM_MANUAL=3Dy
>  CONFIG_USERFAULTFD=3Dy
>  CONFIG_NET=3Dy
>  CONFIG_PACKET=3Dy
>
> --=20
> 2.50.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

