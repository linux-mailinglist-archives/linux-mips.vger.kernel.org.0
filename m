Return-Path: <linux-mips+bounces-10803-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1834AB3B8C0
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 12:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F9911C85259
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 10:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFF330ACED;
	Fri, 29 Aug 2025 10:31:24 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEF53081B8;
	Fri, 29 Aug 2025 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463484; cv=none; b=IvKexR6wzyff0/5IkDTz/SzA9G46OpoU/KYPh/hxZE9I7QoT/G/cit1Erh7rZp6B7gtyeRbT+wE/1XCUetvIJGJrwbuX6weHGYZPjwMHBpbfAJGYmQp5ypi8X+HeOCweGUVZYl6puwoqdcVUlkTezJHpA3si3eiON1GUCVuCx0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463484; c=relaxed/simple;
	bh=v6j5gIxyOYuyK4xSV1ZCVMRo3rpHZVW2elwuuj5tzoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtM+5njIFWd8+ic1BF4AS6HTNTVsxQpmdFr6GB2DVGIze8EwGkQ1WnqBVfzSsiYGGJmiZMjFTvxR2H09AeYc4Vbe6yyLy6KizNe4FfAj90rzJHGecwdTTxkx6OHxMDdkRUL3GOFNgrUzqdhrJHTOWOZo++y6MPcJa2UdFwdD6TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1urwO1-0004FQ-00; Fri, 29 Aug 2025 12:31:13 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 3B495C04FD; Fri, 29 Aug 2025 12:20:10 +0200 (CEST)
Date: Fri, 29 Aug 2025 12:20:10 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: keguang.zhang@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 0/9] MIPS: loongson32: Convert all platform devices to
 DT
Message-ID: <aLF-2sxq3mw4hx2s@alpha.franken.de>
References: <20250716-loongson1-arch-v3-0-d160974d696b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716-loongson1-arch-v3-0-d160974d696b@gmail.com>

On Wed, Jul 16, 2025 at 07:25:09PM +0800, Keguang Zhang via B4 Relay wrote:
> Convert all platform devices to Device Tree.
> Remove all obsolete platform device code.
> Switch to the generic MIPS core.
> Add built-in DTB support.
> Update Kconfig and Makefile accordingly.
> Update and rename the defconfig.
> 
> Changes in v3:
> - Squash two previous changes that documented DT bindings for the
>   LS1B-DEMO and CQ-T300B into a single patch.
> - Separate the built-in DTB support into a single patch.
> - Move the timer node under the APB bus.
> - Remove redundant console bootargs since it is covered by stdout-path.
> - Replace mtdparts bootargs with a "partitions" node.
> - Link to v2: https://lore.kernel.org/r/20250709-loongson1-arch-v2-0-bcff6e518c09@gmail.com
> 
> Changes in v2:
> - Document two new boards: loongson,ls1b-demo and loongson,cq-t300b.
> - Submit complete DTS files for each board.
> - Switch to the generic MIPS kernel.
> - Consolidate Loongson1 defconfigs.
> - Link to v1: https://lore.kernel.org/all/20230729134318.1694467-1-keguang.zhang@gmail.com/
> 
> ---
> Keguang Zhang (9):
>       dt-bindings: mips: loongson: Add LS1B-DEMO and CQ-T300B
>       MIPS: dts: loongson: Add LS1B-DEMO board
>       MIPS: dts: loongson: Add LSGZ_1B_DEV board
>       MIPS: dts: loongson: Add Smartloong-1C board
>       MIPS: dts: loongson: Add CQ-T300B board
>       MIPS: loongson: Add built-in DTB support
>       MIPS: loongson32: Switch to generic core
>       MIPS: Unify Loongson1 PRID_REV
>       MIPS: configs: Consolidate Loongson1 defconfigs
> 
>  .../devicetree/bindings/mips/loongson/devices.yaml |   2 +
>  MAINTAINERS                                        |   3 +-
>  arch/mips/Kconfig                                  |  64 ++---
>  arch/mips/boot/dts/Makefile                        |   1 +
>  arch/mips/boot/dts/loongson/Makefile               |  10 +
>  arch/mips/boot/dts/loongson/cq-t300b.dts           | 110 ++++++++
>  arch/mips/boot/dts/loongson/loongson1.dtsi         | 136 ++++++++++
>  arch/mips/boot/dts/loongson/loongson1b.dtsi        | 198 ++++++++++++++
>  arch/mips/boot/dts/loongson/loongson1c.dtsi        | 141 ++++++++++
>  arch/mips/boot/dts/loongson/ls1b-demo.dts          | 125 +++++++++
>  arch/mips/boot/dts/loongson/lsgz_1b_dev.dts        | 162 ++++++++++++
>  arch/mips/boot/dts/loongson/smartloong-1c.dts      | 110 ++++++++
>  .../{loongson1b_defconfig => loongson1_defconfig}  |  94 +++++--
>  arch/mips/configs/loongson1c_defconfig             | 121 ---------
>  arch/mips/include/asm/cpu-type.h                   |   3 +-
>  arch/mips/include/asm/cpu.h                        |   3 +-
>  arch/mips/include/asm/mach-loongson32/irq.h        | 107 --------
>  arch/mips/include/asm/mach-loongson32/loongson1.h  |  50 ----
>  arch/mips/include/asm/mach-loongson32/platform.h   |  23 --
>  arch/mips/include/asm/mach-loongson32/regs-mux.h   | 124 ---------
>  arch/mips/kernel/cpu-probe.c                       |   6 +-
>  arch/mips/loongson32/Kconfig                       |  43 +---
>  arch/mips/loongson32/Makefile                      |  17 --
>  arch/mips/loongson32/Platform                      |   1 -
>  arch/mips/loongson32/common/Makefile               |   6 -
>  arch/mips/loongson32/common/irq.c                  | 191 --------------
>  arch/mips/loongson32/common/platform.c             | 285 ---------------------
>  arch/mips/loongson32/common/prom.c                 |  42 ---
>  arch/mips/loongson32/common/setup.c                |  26 --
>  arch/mips/loongson32/common/time.c                 |  23 --
>  arch/mips/loongson32/ls1b/Makefile                 |   6 -
>  arch/mips/loongson32/ls1b/board.c                  |  55 ----
>  arch/mips/loongson32/ls1c/Makefile                 |   6 -
>  arch/mips/loongson32/ls1c/board.c                  |  23 --
>  34 files changed, 1118 insertions(+), 1199 deletions(-)
> ---
> base-commit: b5a1f9870f9828bd6625d6c946c66be4983d56f6
> change-id: 20250414-loongson1-arch-5ea8ced4c9a9

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

