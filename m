Return-Path: <linux-mips+bounces-9547-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCA9AED674
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 10:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 041663AD106
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 08:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2F124889B;
	Mon, 30 Jun 2025 07:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BnBnVnDr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DF82475CB;
	Mon, 30 Jun 2025 07:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751270342; cv=none; b=IXOZ1bG0pFWbT/FXK5yvGTVSHW2J7GAmlGsQcCPLzovd5RyT6aI0wEkh4B4rSYyzMsV4H6W3n7MfrVLLZ4mXzySxoqHLPbGG4zAke5XEiOURMBrZ89HnKyGdzx6kQ3mcE2fyOPjiQJ9mofhjWgQm0JARe+0p3WmgEpF5mZn+53M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751270342; c=relaxed/simple;
	bh=Olm3v82XfixtpJ3flX0vWtJlr7MwsOBTenIQ1uoHrdg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AwbVUFpV16crh5mnncdvlpd8I4mjI0sLr2EF/AXVfSkUBqTHlG20EAJR0/vRhT32RQ1p4mt17JcSLUmuLmvhtPNMXqFUEZLXSy8xAAdb1sosf7QisyLknYXWsecfP08kPaif9ZC0pZ1fjazzigjCnPnJk3I65Y4ENrvfcjFsjsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BnBnVnDr; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id B09BC584F54;
	Mon, 30 Jun 2025 07:37:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5AB144505;
	Mon, 30 Jun 2025 07:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751269041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=glwRMX5XIwLAgjf/s/syIRQDA+/DawV/G778ACW1TE8=;
	b=BnBnVnDrS4mTZbEz8oQRFel1BWwpiF9M0U4Z1zPKZ1xHganlxJ2726FA7JEH5Pxsxy+MQ1
	5Upc9qMCM3YW8Fbx32dr5mFAX9NrMe0AI+ZXDVYWl/tm7GqxmKv9RQWKBXm/yw0AL8uoVZ
	NgMq7zmwPisUjpkR//WL1EcI/+j0cjrSvfZBOEZEN3lEf0EZPpqxfFWM0LAgSbDkmN4+h9
	YSprrTXwxzv4ZpUauSqQ5HfB02Wgpcn2Ixkw9SaevwLs9+FPGEK+KA5vSZxl2qdhW78gTJ
	PQy4mZqvC/X/mC/6DE0DuV0eoRW5bPyTK8pOo/y1xIyesNi9ZoXIIwcI4n8zpw==
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
Subject: Re: [PATCH 6/6] MIPS: eyeq5_defconfig: add cadence MMC/SDHCI driver
In-Reply-To: <51dcb9654b88972112f932059b3a52e0057b830a.1750156323.git.benoit.monin@bootlin.com>
References: <cover.1750156323.git.benoit.monin@bootlin.com>
 <51dcb9654b88972112f932059b3a52e0057b830a.1750156323.git.benoit.monin@bootlin.com>
Date: Mon, 30 Jun 2025 09:37:20 +0200
Message-ID: <878ql9issv.fsf@BLaptop.bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffffkgggtgfesthhqredttddtjeenucfhrhhomhepifhrvghgohhrhicuvefngffogffpvfcuoehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefghfegvdehgfdtjedvtefhvdeikefgteeuhfeukeettefgvdeuueettddtkeegveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffeekieemsgdvtgdvmegstghfjeemlegurgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffeekieemsgdvtgdvmegstghfjeemlegurgejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduhedprhgtphhtthhopegsvghnohhithdrmhhonhhinhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehulhhfrdhhrghnshhsohhnsehlihhnrghrohdrohhrghdprhgtphhtthhopehrohgshhesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvg
X-GND-Sasl: gregory.clement@bootlin.com

Helo Beno=C3=AEt,

> Enable MMC support on eyeQ5 platform so it can be used as the root
> partition.
>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>


Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory

> ---
>  arch/mips/configs/eyeq5_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/mips/configs/eyeq5_defconfig b/arch/mips/configs/eyeq5_=
defconfig
> index ff7af5dc6d9d..328016c1c6f4 100644
> --- a/arch/mips/configs/eyeq5_defconfig
> +++ b/arch/mips/configs/eyeq5_defconfig
> @@ -79,6 +79,8 @@ CONFIG_HID_MICROSOFT=3Dy
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

