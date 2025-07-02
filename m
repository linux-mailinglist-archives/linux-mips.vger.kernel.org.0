Return-Path: <linux-mips+bounces-9606-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0762DAF5872
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jul 2025 15:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B4F7178344
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jul 2025 13:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3EB27FD75;
	Wed,  2 Jul 2025 13:19:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C0827EFE7;
	Wed,  2 Jul 2025 13:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462354; cv=none; b=jYHCRxi9MwMYnBHA2LlNmElHx350NnZ8pzFR7AyVu8kNlt77neG+1kimPhcw6MCf7ru8N3yh2PVkkhAmLed2oS9Xm76DinME/XqHdj33p/iz7j1LmqbFgtGTTKJL93rdj4+H4IC8NwE+4q7DrMDnSSh2BsAiXQLJWrNEYUNuXB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462354; c=relaxed/simple;
	bh=HCL76lN8kEgT5tcyLaPHtOnXtULRZcRok0S4LNq5Y2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EpBlJscI0R3r/RZ0rJqY/zL2bbhZ8eVNCkIHrQ0/W/oR+v6aqMpzRJZfsbyj156M6vfP/ygP71hWF7/bYpvY92BF55JVsZIzKQed/668xdDrFFUZxemu2Q2yQUh3cucm/Y+6akFeCIpxx4MNuui2RytCviL9gJ7W6Kb9yku/1XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uWwaa-00058E-00; Wed, 02 Jul 2025 14:29:24 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 9A587C0176; Wed,  2 Jul 2025 14:01:45 +0200 (CEST)
Date: Wed, 2 Jul 2025 14:01:45 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/6] Add MMC support for Mobileye EyeQ5 and EyeQ6 SoCs
Message-ID: <aGUfqcbUxvE27Um1@alpha.franken.de>
References: <cover.1750156323.git.benoit.monin@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1750156323.git.benoit.monin@bootlin.com>

On Tue, Jun 17, 2025 at 03:25:50PM +0200, Benoît Monin wrote:
> The MMC/SDHCI controller found in Mobileye EyeQ5 and EyeQ6 SoCs is 
> based on Cadence cdns sd4hc IP. It supports up to HS400HS mode. The 
> only peculiarity of the hardware is that it needs the preset value
> quirk to configure the clock properly at speed slower than HS200.
> 
> This patchset adds a compatible device tree binding to cdns sdhci for 
> mobileye then uses it in the sdhci-cadence driver.
> 
> It also adds an emmc entry in the dtsi of each SoC and the config 
> options in each defconfig to allow using an eMMC for the rootfs.
> 
> Benoît Monin (6):
>   dt-bindings: mmc: cdns: add Mobileye EyeQ MMC/SDHCI controller
>   mmc: sdhci-cadence: add Mobileye eyeQ support
>   MIPS: mobileye: dts: eyeq6h: add the emmc controller
>   MIPS: eyeq6_defconfig: add cadence MMC/SDHCI driver
>   MIPS: mobileye: dts: eyeq5: add the emmc controller
>   MIPS: eyeq5_defconfig: add cadence MMC/SDHCI driver
> 
>  .../devicetree/bindings/mmc/cdns,sdhci.yaml   |  1 +
>  arch/mips/boot/dts/mobileye/eyeq5.dtsi        | 22 +++++++++++++++++++
>  arch/mips/boot/dts/mobileye/eyeq6h.dtsi       | 22 +++++++++++++++++++
>  arch/mips/configs/eyeq5_defconfig             |  2 ++
>  arch/mips/configs/eyeq6_defconfig             |  2 ++
>  drivers/mmc/host/sdhci-cadence.c              | 11 ++++++++++
>  6 files changed, 60 insertions(+)

applied patches 3-6 to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

