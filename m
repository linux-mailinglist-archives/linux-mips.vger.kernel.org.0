Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC684181CD
	for <lists+linux-mips@lfdr.de>; Sat, 25 Sep 2021 14:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237399AbhIYMLT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Sep 2021 08:11:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:43860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236977AbhIYMLT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 25 Sep 2021 08:11:19 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BCC8E61260;
        Sat, 25 Sep 2021 12:09:44 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mU6Uw-00CvjL-Mv; Sat, 25 Sep 2021 13:09:42 +0100
Date:   Sat, 25 Sep 2021 13:09:42 +0100
Message-ID: <87sfxsua9l.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT),
        linux-sh@vger.kernel.org (open list:SUPERH),
        linux-mips@vger.kernel.org (open list:BROADCOM BMIPS MIPS ARCHITECTURE),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE)
Subject: Re: [PATCH 10/11] arm64: broadcom: Removed forced select of interrupt controllers
In-Reply-To: <20210924170546.805663-11-f.fainelli@gmail.com>
References: <20210924170546.805663-1-f.fainelli@gmail.com>
        <20210924170546.805663-11-f.fainelli@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: f.fainelli@gmail.com, linux-kernel@vger.kernel.org, linux@armlinux.org.uk, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, catalin.marinas@arm.com, will@kernel.org, ysato@users.sourceforge.jp, dalias@libc.org, tglx@linutronix.de, robh+dt@kernel.org, frowand.list@gmail.com, ardb@kernel.org, rppt@kernel.org, linus.walleij@linaro.org, akpm@linux-foundation.org, geert+renesas@glider.be, arnd@arndb.de, linux@roeck-us.net, wangkefeng.wang@huawei.com, mark.rutland@arm.com, andreyknvl@gmail.com, anshuman.khandual@arm.com, valentin.schneider@arm.com, mingo@kernel.org, peterz@infradead.org, linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org, linux-mips@vger.kernel.org, devicetree@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 24 Sep 2021 18:05:45 +0100,
Florian Fainelli <f.fainelli@gmail.com> wrote:
> 
> Now that the various second level interrupt controllers have been moved
> to IRQCHIP_PLATFORM_DRIVER and they do default to ARCH_BRCMSTB and
> ARCH_BCM2835 where relevant, remove their forced selection from the
> machine entry to allow an user to build them as modules.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  arch/arm64/Kconfig.platforms | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index b0ce18d4cc98..2e9440f2da22 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -44,7 +44,6 @@ config ARCH_BCM2835
>  	select ARM_AMBA
>  	select ARM_GIC
>  	select ARM_TIMER_SP804
> -	select BRCMSTB_L2_IRQ
>  	help
>  	  This enables support for the Broadcom BCM2837 and BCM2711 SoC.
>  	  These SoCs are used in the Raspberry Pi 3 and 4 devices.
> @@ -82,8 +81,6 @@ config ARCH_BITMAIN
>  config ARCH_BRCMSTB
>  	bool "Broadcom Set-Top-Box SoCs"
>  	select ARCH_HAS_RESET_CONTROLLER
> -	select BCM7038_L1_IRQ
> -	select BRCMSTB_L2_IRQ
>  	select GENERIC_IRQ_CHIP
>  	select PINCTRL
>  	help

How does the user know about that? People will build a kernel
selecting their platform, and find out it doesn't work. This seems
terribly counter-productive to me.

	M.

-- 
Without deviation from the norm, progress is not possible.
