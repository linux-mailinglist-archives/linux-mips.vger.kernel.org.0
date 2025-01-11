Return-Path: <linux-mips+bounces-7400-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4844A0A417
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 15:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDE4216A197
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 14:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962EF1B815;
	Sat, 11 Jan 2025 14:20:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00CD42770C;
	Sat, 11 Jan 2025 14:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736605214; cv=none; b=RZqqbGNAyI3wE++5fx5Deg9XbytRLeziZd8TM1x2VAC/YKjO7F7NAxDDH1BYXny6ji64yuA2eJxNU0zR8qSJaxHZTZ5mPGiNw5bQp39b2O19bx0GgmeQc390vzQjcYDnC0lZXLr29l2i60XIJyregyI30t5fJHZuaEKQMSD3Mgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736605214; c=relaxed/simple;
	bh=w7yexyLRd1FLXd94DFmYlZxC0e2unhO1Dq/ERUzYCgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQrx2NW0RQHpHKq5M19mglKBiRbqkD8BkN/k43u4dSLjXnTXFQjIVZ8j8YLYuovBYi35seirIt1CvoRCOnMciVAJfJRvgsPIk2yIZeamwovrUHqzbgvScqFOOv25lyDoVTxEBQteGAxsYErpEBMFpal6GZpMOd0FnP5Jn6Xmel8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tWcLH-00075Y-00; Sat, 11 Jan 2025 15:19:59 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E0F44C06A4; Sat, 11 Jan 2025 14:17:14 +0100 (CET)
Date: Sat, 11 Jan 2025 14:17:14 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh@kernel.org>,
	UNGLinuxDriver@microchip.com, devicetree@vger.kernel.org
Subject: Re: [PATCH] MIPS: migrate to generic rule for built-in DTBs
Message-ID: <Z4JvWqZQgsw6tZZ6@alpha.franken.de>
References: <20241222000416.2577633-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222000416.2577633-1-masahiroy@kernel.org>

On Sun, Dec 22, 2024 at 09:04:13AM +0900, Masahiro Yamada wrote:
> Commit 654102df2ac2 ("kbuild: add generic support for built-in boot
> DTBs") introduced generic support for built-in DTBs.
> 
> Select GENERIC_BUILTIN_DTB and BUILTIN_DTB_ALL when the built-in DTB
> support is enabled.
> 
> DTBs compiled under arch/mips/boot/dts/ will be wrapped by the generic
> rule in scripts/Makefile.vmlinux.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/mips/Kconfig                         | 2 ++
>  arch/mips/Makefile                        | 3 ---
>  arch/mips/boot/dts/Makefile               | 2 --
>  arch/mips/boot/dts/brcm/Makefile          | 2 --
>  arch/mips/boot/dts/cavium-octeon/Makefile | 2 --
>  arch/mips/boot/dts/ingenic/Makefile       | 2 --
>  arch/mips/boot/dts/lantiq/Makefile        | 2 --
>  arch/mips/boot/dts/loongson/Makefile      | 2 --
>  arch/mips/boot/dts/mscc/Makefile          | 3 ---
>  arch/mips/boot/dts/mti/Makefile           | 2 --
>  arch/mips/boot/dts/pic32/Makefile         | 2 --
>  arch/mips/boot/dts/ralink/Makefile        | 2 --
>  12 files changed, 2 insertions(+), 24 deletions(-)

applied to mips-next.

Thomas,

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

