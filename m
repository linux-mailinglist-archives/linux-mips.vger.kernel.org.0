Return-Path: <linux-mips+bounces-3824-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA43E911EAF
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 10:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4782B28294C
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 08:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BDA16D32F;
	Fri, 21 Jun 2024 08:27:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C672616D335;
	Fri, 21 Jun 2024 08:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718958423; cv=none; b=Six+8Ui5tDJS2nlIK4cGDH0eVBsu+YQRJfACz5L1Bw/jagx/UA4Uiuh2DX6AlWiVyB4vCs6588jiD8N3XYhg8boASmiHfbRbgf7h/VAxiFCScgy4x9P16ZeOdVqNDdj6XwLWym8DS3dG66/addusqOmP9Z+99D1ihYuGHAddcq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718958423; c=relaxed/simple;
	bh=1R7fiFnL/wVNkTfm6vdznU0RWqmiuV2jLlNdozZfQ/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZN8PHuRa62dqHjeJQQvi18QwcNM9P4F3D6zYskzixSkiQC5MsQCEXK4HoOQ6GXMCcNy1Hofq1jbmgl7d4z9lz4JuBk/IDZQROGQ5AqOR0D2XeZ8PrSQZGZYWjxeCE6YRhM76N3s9q3Y6yV+KwhyOMFKS1eRY1423AvovYtn0is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sKZbl-0001Sm-00; Fri, 21 Jun 2024 10:26:57 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 21BF8C0688; Fri, 21 Jun 2024 10:26:24 +0200 (CEST)
Date: Fri, 21 Jun 2024 10:26:24 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qing Zhang <zhangqing@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 00/10] MIPS: Loongson64: Loongson-2K1000 fixes
Message-ID: <ZnU5MCzS6zkBTHH3@alpha.franken.de>
References: <20240614-ls3k-mips-v1-0-7614340ace7d@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614-ls3k-mips-v1-0-7614340ace7d@flygoat.com>

On Fri, Jun 14, 2024 at 04:40:08PM +0100, Jiaxun Yang wrote:
> Hi all,
> 
> This series fixed various problems I meet when I was trying to
> boot kernel on my Loongson-2K PI2 system.
> 
> Although most of the series are taged for stable, please apply
> it to mips-next tree as it has dependency to commits in next
> and I'm not in rush to get them into linus tree. I have some
> future works planed based on this series that may get into this
> cycle.
> 
> Thanks
> - Jiaxun
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Jiaxun Yang (10):
>       MIPS: Loongson64: Remove memory node for builtin-dtb
>       MIPS: dts: loongson: Fix liointc IRQ polarity
>       MIPS: dts: loongson: Fix ls2k1000-rtc interrupt
>       MIPS: dts: loongson: Fix GMAC phy node
>       MIPS: dts: loongson: Add ISA node
>       MIPS: Loongson64: Test register availability before use
>       platform: mips: cpu_hwmon: Disable driver on unsupported hardware
>       MIPS: Loongson64: reset: Prioritise firmware service
>       MIPS: Loongson64: sleeper: Pass ra and sp as arguments
>       MIPS: Loongson64: env: Hook up Loongsson-2K
> 
>  arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 65 +++++++++++-----------
>  arch/mips/include/asm/mach-loongson64/boot_param.h |  2 +
>  arch/mips/loongson64/env.c                         |  8 +++
>  arch/mips/loongson64/reset.c                       | 38 ++++++-------
>  arch/mips/loongson64/sleeper.S                     |  8 ++-
>  arch/mips/loongson64/smp.c                         | 23 +++++++-
>  drivers/platform/mips/cpu_hwmon.c                  |  3 +
>  7 files changed, 89 insertions(+), 58 deletions(-)
> ---
> base-commit: 6906a84c482f098d31486df8dc98cead21cce2d0
> change-id: 20240613-ls3k-mips-52eb3fb3e917

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

