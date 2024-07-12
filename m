Return-Path: <linux-mips+bounces-4300-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FB492F983
	for <lists+linux-mips@lfdr.de>; Fri, 12 Jul 2024 13:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19D971F2213D
	for <lists+linux-mips@lfdr.de>; Fri, 12 Jul 2024 11:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619C315E5CF;
	Fri, 12 Jul 2024 11:23:21 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09AE624;
	Fri, 12 Jul 2024 11:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720783401; cv=none; b=Q8thfUzgCvDCLfwD+dAu77H0aRjOLyAZ3rjtD28g7PBZvsvfMSw14Q95IbHMBJJIuSqyFW2ERxshKHPiFvR2nlx9wpqx4VkKy89gB40l0PlZO/RIN5NCK7JYNZ64/ZZx/bIaVwcccpc4SqBuzK1GG1M5gjPlWXI8ZCT0TEnr42Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720783401; c=relaxed/simple;
	bh=wb/37Rnyi2RsZUtH3sbD46Do0fPo09ABddJTvcslUVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pL+wDJeYNyaLc8JUW03VEimrndedyaRrvKMB5cuhusKJCaWcPrIx8jzICTETFXmHJSvJxsS8EhAJEqbwyVyBVZ6oCOZqN9zQ8Tbfik4yZSUBnUCGLlB2jAbYP1sLaZVcqRRMWvsfxuzBFvTY1PaG4iJ5rXd6lAUbPmGlgNDCulc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sSEMM-0003FX-00; Fri, 12 Jul 2024 13:22:42 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 3996BC0120; Fri, 12 Jul 2024 13:20:56 +0200 (CEST)
Date: Fri, 12 Jul 2024 13:20:56 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, daniel.lezcano@linaro.org,
	paulburton@kernel.org, peterz@infradead.org, mail@birger-koblitz.de,
	bert@biot.com, john@phrozen.org, sander@svanheule.net,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org, kabel@kernel.org, ericwouds@gmail.com
Subject: Re: [PATCH v5 00/10] mips: Support for RTL9302C
Message-ID: <ZpERmHxcqF/gQRTi@alpha.franken.de>
References: <20240710043524.1535151-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710043524.1535151-1-chris.packham@alliedtelesis.co.nz>

On Wed, Jul 10, 2024 at 04:35:14PM +1200, Chris Packham wrote:
> This series adds basic support for the RTL9302C reference board. Currently the
> focus is on the CPU block stuff. I hope to get around to the DSA switch driver
> eventually but this is a small start that lets me boot a mainline kernel on the
> board I have. I initialiy started with code from openwrt but have paired it
> down to just the clocksource driver and devicetree.
> 
> The first two patches in this series are fixing some complaints from make
> dtbs_check for some existing realtek dts files. They can be applied on their
> own if desired.
> 
> Chris Packham (10):
>   mips: dts: realtek: use "serial" instead of "uart" in node name
>   mips: dts: realtek: add device_type property to cpu node
>   dt-bindings: vendor-prefixes: Add Cameo Communications
>   dt-bindings: mips: realtek: Add rtl930x-soc compatible
>   dt-bindings: timer: Add schema for realtek,otto-timer
>   dt-bindings: interrupt-controller: realtek,rtl-intc: Add rtl9300-intc
>   clocksource: realtek: Add timer driver for rtl-otto platforms
>   mips: select REALTEK_OTTO_TIMER for Realtek platforms
>   mips: generic: add fdt fixup for Realtek reference board
>   mips: dts: realtek: Add RTL9302C board
> 
>  .../realtek,rtl-intc.yaml                     |  20 +-
>  .../devicetree/bindings/mips/realtek-rtl.yaml |   4 +
>  .../bindings/timer/realtek,otto-timer.yaml    |  63 ++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/mips/Kconfig                             |   1 +
>  arch/mips/boot/dts/realtek/Makefile           |   1 +
>  .../cameo-rtl9302c-2x-rtl8224-2xge.dts        |  73 +++++
>  arch/mips/boot/dts/realtek/rtl838x.dtsi       |   1 +
>  arch/mips/boot/dts/realtek/rtl83xx.dtsi       |   4 +-
>  arch/mips/boot/dts/realtek/rtl930x.dtsi       |  79 +++++
>  arch/mips/generic/Makefile                    |   1 +
>  arch/mips/generic/board-realtek.c             |  79 +++++
>  drivers/clocksource/Kconfig                   |  10 +
>  drivers/clocksource/Makefile                  |   1 +
>  drivers/clocksource/timer-rtl-otto.c          | 291 ++++++++++++++++++
>  include/linux/cpuhotplug.h                    |   1 +
>  16 files changed, 628 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/timer/realtek,otto-timer.yaml
>  create mode 100644 arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dts
>  create mode 100644 arch/mips/boot/dts/realtek/rtl930x.dtsi
>  create mode 100644 arch/mips/generic/board-realtek.c
>  create mode 100644 drivers/clocksource/timer-rtl-otto.c

applied patch 1-4, 6 and 8-10 to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

