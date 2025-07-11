Return-Path: <linux-mips+bounces-9743-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D630B01F10
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 16:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4B493AE63A
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 14:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D742E7174;
	Fri, 11 Jul 2025 14:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="djQznpcH"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6736D2E6D36;
	Fri, 11 Jul 2025 14:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752243860; cv=none; b=ZvAkpdY6U2eL/qVI7gA6IupeUXaaw6GQePNkqQuVo2c7IsjP/ZiATDnn4gIoe7jFjg/Ix88/QFDHweWFYYfAkTFf+iYtTkhfcDGVjiFJqLCwgAXSUUJ6lC0fZle8CVYWWpRyYBxMm6Ce5P3NnTp8fcRoK8T9y+f00jsbxsrnwFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752243860; c=relaxed/simple;
	bh=p4rqAzyj+ZKLFxVmGJ7/+Wdomqe/SAVkDlrxmMOe9yE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Oitc6R75UzpmotmgBNtEyLnf5cxcucy59yllkIxYyJw0u/cuwj3CBAP6MrPm02PB+RaRZMbNIw4yGgSBHK3vIez8pglk8nH/GIxBUQ5bx8sZA25fG8UAk8coGmwAL5MCHX7fCiDT1oljuVuOA7IFNM//UPUYF/mIZkVrt1Swyq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=djQznpcH; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D15044453;
	Fri, 11 Jul 2025 14:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752243850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lsq28usefTU8lWSZ4ebvtK4hw63qRClWM5zLslTV3uU=;
	b=djQznpcHj3tvngGdKDWbjkhGbdXEZKViiDthmKMlfstft9n/A5fTGPttGDN8c3EGHRzyD+
	Hv7vonGR+nm3g05NF3QuAxHFML2Dx6hUjhHbwbU8lcTr8ConkBj56t80/feNWjOOuL7Bw7
	Ah5gtew9Ae/c/QpOdcb4G++/n4PmmTpQtovUwSb2NV0raF2fOI2DiABtXZ9bzKRg5ILTZ2
	Pc6A2fiXz0l8rtXu2ACuP2fbY6bbUtE9HhIur93MlLrzzBMazFD6/+TYO9Qd9T2moH5wrg
	PMamPw9Be0z5jKYfvm9CKA8ER+mkVmAnWxvd0X9t8u+nCtjMBSPFGvmkxdZ6jQ==
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
Subject: Re: [PATCH 5/6] MIPS: eyeq5_defconfig: add GPIO subsystem & driver
In-Reply-To: <20250704-of-commits-v1-5-dc2006bf2846@bootlin.com>
References: <20250704-of-commits-v1-0-dc2006bf2846@bootlin.com>
 <20250704-of-commits-v1-5-dc2006bf2846@bootlin.com>
Date: Fri, 11 Jul 2025 16:24:09 +0200
Message-ID: <878qkuztyu.fsf@BLaptop.bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfeehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffffkgggtgfesthhqredttddtjeenucfhrhhomhepifhrvghgohhrhicuvefngffogffpvfcuoehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefghfegvdehgfdtjedvtefhvdeikefgteeuhfeukeettefgvdeuueettddtkeegveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeegtgejkeemvdektggvmeeftgejgeemfeeggegtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeegtgejkeemvdektggvmeeftgejgeemfeeggegtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehvlhgru
 ghimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtrgiffhhikhdrsggrhihouhhksehmohgsihhlvgihvgdrtghomh
X-GND-Sasl: gregory.clement@bootlin.com

Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> writes:

> Enable GPIO support on the EyeQ5 platform.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>


Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory

> ---
>  arch/mips/configs/eyeq5_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/mips/configs/eyeq5_defconfig b/arch/mips/configs/eyeq5_=
defconfig
> index e2d6ad7c3006b037ae370a68c09e7aacab61d083..05a579e21970eed203d96bd4b=
8103d030e39f262 100644
> --- a/arch/mips/configs/eyeq5_defconfig
> +++ b/arch/mips/configs/eyeq5_defconfig
> @@ -64,6 +64,8 @@ CONFIG_SERIAL_AMBA_PL011_CONSOLE=3Dy
>  CONFIG_HW_RANDOM=3Dy
>  # CONFIG_PTP_1588_CLOCK is not set
>  CONFIG_PINCTRL=3Dy
> +CONFIG_GPIOLIB=3Dy
> +CONFIG_GPIO_NOMADIK=3Dy
>  CONFIG_MFD_SYSCON=3Dy
>  CONFIG_HID_A4TECH=3Dy
>  CONFIG_HID_BELKIN=3Dy
>
> --=20
> 2.50.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

