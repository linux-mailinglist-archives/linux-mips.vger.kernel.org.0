Return-Path: <linux-mips+bounces-9030-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 155D5ABCFF3
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 08:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F5B01B6369A
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 06:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A458625DB15;
	Tue, 20 May 2025 06:56:54 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C427D25CC69;
	Tue, 20 May 2025 06:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747724214; cv=none; b=K1d05LhW42BoWopj7HNnCdPtTtE6aU89uiE/neQlzkNsg4JHWp1Sh6xC2COWr3t9BPDYmNp0DqHx3iUrOtxYyzyjNkAjWJprsDfjenPUv/Z90uJwM3TH/oW8TarW8vC0jFTcx1zQ/eeSLligG766iDy+x7SOosIFKMNnmTs9nto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747724214; c=relaxed/simple;
	bh=Y14PCFj43DbhJGJ4iFsgQIVQHaLzrwZZci/lnH1yV4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmeKCppJMy9fcbCb89FepxAUi2cM8gyz+AUCTWmq226q3ZUbQuym3zdK4ZZ1WytbxqxJYTQoDT4tUNHbdTqNJTPcaTDpuTomnvf9cFrHp+gLiUpFXVBAq3FYJke18VIcxhVv20lUTtLX+d7RkK9Rt+/ZpQW7yATD8K11/PTjrmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uHGu1-0006iN-00; Tue, 20 May 2025 08:56:41 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 35693C00EF; Tue, 20 May 2025 08:49:30 +0200 (CEST)
Date: Tue, 20 May 2025 08:49:30 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 0/7] Add EcoNet EN751221 MIPS platform support
Message-ID: <aCwl-nAMxjqjxRM6@alpha.franken.de>
References: <20250507134500.390547-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507134500.390547-1-cjd@cjdns.fr>

On Wed, May 07, 2025 at 01:44:53PM +0000, Caleb James DeLisle wrote:
> EcoNet MIPS SoCs are big endian machines based on 34Kc and 1004Kc
> processors. They are found in xDSL and xPON modems, and contain PCM
> (VoIP), Ethernet, USB, GPIO, I2C, SPI (Flash), UART, and PCIe.
> 
> The EcoNet MIPS SoCs are divided broadly into two families, the
> EN751221 family based on the 34Kc, and the EN751627 family based on
> the 1004Kc. Individual SoCs within a family are very similar, only
> with different peripherals.
> 
> This patchset adds basic "boots to a console" support for the EN751221
> family and adds SmartFiber XP8421-B, a low cost commercially available
> board that is useful for testing and development.
> 
> Note that Airoha (AN7523, AN7581) is similar to EcoNet in terms of
> peripherals, and for historical reasons Airoha chips are sometimes
> referred to with the EN75xx prefix. However this is a different
> platform because Airoha chips are ARM based.
> 
> This patchset is against mips-next.
> 
> v4 -> v5
> * 2/7 clocksource/drivers: Add EcoNet Timer HPT driver:
>   * Improve explanation of HPT timer in changelog
>   * Move pr_info to pr_debug per recommendation
>   * Remove pointless debug on spurious interrupt
>   * Small code-style change
> 
> v3 -> v4
> * Rebase to 3b3704261e851e25983860e4c352f1f73786f4ab
> * Omit already accepted patches (thanks guys!):
>   - https://patchwork.kernel.org/project/linux-mips/patch/20250330170306.2584136-2-cjd@cjdns.fr/
>   - https://patchwork.kernel.org/project/linux-mips/patch/20250330170306.2584136-3-cjd@cjdns.fr/
>   - https://patchwork.kernel.org/project/linux-mips/patch/20250330170306.2584136-4-cjd@cjdns.fr/
> 
> v2 -> v3
> * econet,en751221-timer.yaml -> Improve code style
> * vendor-prefixes.yaml -> Correct alphabetic order
> * en751221.dtsi
>   - interrupt-controller code style
>   - serial: Explain reason for clock-frequency = <1843200>
> * v3->v3 diff provided for reference
>   - https://gist.github.com/cjdelisle/21c9f0cd225f499bdff3c574c7f185f2
> * CC: linux-mediatek@lists.infradead.org who may be interested.
> 
> v1 -> v2
> * Codestyle
>   - Apply codestyle from "The tip tree handbook" and recommendations
>   - Remove "_rai" and "_m" symbol suffixes which are not standard
> * irq-econet-en751221.c
>   - Use cleanup.h _guard() and _free()
>   - Separate irq_domain_ops from irq_chip, eliminating econet_intc struct
>   - Remove irqsave in econet_wreg, irqs are already disabled in mask/unmask
>   - Add explainatory comments
>   - Refactor shadow logic for clarity, e.g. INTC_NO_SHADOW -> NOT_PERCPU
>   - Improve error handling in case of invalid DTS
> * econet,timer-hpt.yaml
>   - Rename to econet,timer-en751221.yaml
>   - Impose rule: "reg" must have 1 item on EN751221 and 2 on EN751627
> * timer-econet-hpt.c
>   - Rename to timer-econet-en751221.c to follow naming scheme from DT
> * econet,en751221-intc.yaml
>   - Fix validation error from required: interrupt-parent
>   - shadow-interrupts -> switch to uint32-matrix for list of pairs
> * MAINTAINERS -> Fixed accidental F: MAINTAINERS
> * Replace "test image" with device SmartFiber-XP8421-B
> * Restructure arch/mips/econet/Kconfig per arch/mips/ralink example
> * v1->v2 diff is offered for reference:
>   - https://gist.github.com/cjdelisle/bb3acab78b5f70dcdfe5dd6338293efe
> 
> 
> Caleb James DeLisle (7):
>   dt-bindings: timer: Add EcoNet EN751221 "HPT" CPU Timer
>   clocksource/drivers: Add EcoNet Timer HPT driver
>   dt-bindings: mips: Add EcoNet platform binding
>   mips: Add EcoNet MIPS platform support
>   dt-bindings: vendor-prefixes: Add SmartFiber
>   mips: dts: Add EcoNet DTS with EN751221 and SmartFiber XP8421-B board
>   MAINTAINERS: Add entry for newly added EcoNet platform.
> 
>  .../devicetree/bindings/mips/econet.yaml      |  26 +++
>  .../bindings/timer/econet,en751221-timer.yaml |  80 +++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  MAINTAINERS                                   |  12 +
>  arch/mips/Kbuild.platforms                    |   1 +
>  arch/mips/Kconfig                             |  25 ++
>  arch/mips/boot/compressed/uart-16550.c        |   5 +
>  arch/mips/boot/dts/Makefile                   |   1 +
>  arch/mips/boot/dts/econet/Makefile            |   2 +
>  arch/mips/boot/dts/econet/en751221.dtsi       |  67 ++++++
>  .../econet/en751221_smartfiber_xp8421-b.dts   |  19 ++
>  arch/mips/econet/Kconfig                      |  48 ++++
>  arch/mips/econet/Makefile                     |   2 +
>  arch/mips/econet/Platform                     |   5 +
>  arch/mips/econet/init.c                       |  78 +++++++
>  drivers/clocksource/Kconfig                   |   8 +
>  drivers/clocksource/Makefile                  |   1 +
>  drivers/clocksource/timer-econet-en751221.c   | 216 ++++++++++++++++++
>  18 files changed, 598 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/econet.yaml
>  create mode 100644 Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
>  create mode 100644 arch/mips/boot/dts/econet/Makefile
>  create mode 100644 arch/mips/boot/dts/econet/en751221.dtsi
>  create mode 100644 arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts
>  create mode 100644 arch/mips/econet/Kconfig
>  create mode 100644 arch/mips/econet/Makefile
>  create mode 100644 arch/mips/econet/Platform
>  create mode 100644 arch/mips/econet/init.c
>  create mode 100644 drivers/clocksource/timer-econet-en751221.c

applied patches 3-7 to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

