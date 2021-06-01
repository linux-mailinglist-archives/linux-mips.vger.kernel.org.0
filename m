Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75F8339740A
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jun 2021 15:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234009AbhFANZR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Jun 2021 09:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233584AbhFANZO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Jun 2021 09:25:14 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0EEDC061574;
        Tue,  1 Jun 2021 06:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=/dtiXdp0eZ6e655MRel5Bn3jci0kO9BH3UelOiZFbg0=; b=V9z+tNnh+pFSora35MQeQ/f+k
        4BbXZCK9lVijgJNIoUV+jZW+fP1TbSFK+AuKliHz+Zp6jUP7h/6BbzC/0zDpen3lUh0UnV+5vrKze
        clZDiwxsp8+/bnaKS1BfKZyVkDpBAzCdNsy4vEORxsPcE/H7ROqL8HvzfAqjfpIvhiq3AWMSXXM9E
        Toa73mV2/aWqgRwRoXlLl9dBpLwtvfOkmeQlCBfYLo8w5L2OB5xGQAq/YACvYrj2TDf/K3urOpyEw
        BlyBFeAeu5UHGgQH5uLg0/+JxWEnk3xV5V25ameB+ETmj5haIGNBR4scMap1T06pvqJ6uHtIsy9ZI
        Ppk1TcSWQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44574)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1lo4Mj-00045a-7c; Tue, 01 Jun 2021 14:23:29 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1lo4Mh-00008v-EA; Tue, 01 Jun 2021 14:23:27 +0100
Date:   Tue, 1 Jun 2021 14:23:27 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Dmitry Osipenko <digetx@gmail.com>,
        Florian Fainelli <florian@openwrt.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Crispin <john@phrozen.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/7] mips: ar7: convert to clkdev_lookup
Message-ID: <20210601132327.GX30436@shell.armlinux.org.uk>
References: <20210531184749.2475868-1-arnd@kernel.org>
 <20210531184749.2475868-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210531184749.2475868-2-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 31, 2021 at 08:47:43PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> ar7 is one of only two platforms that provide the clock interface but
> implement a custom version of the clkdev_lookup code.
> 
> Change this to use the generic version instead.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/mips/Kconfig     |  1 +
>  arch/mips/ar7/clock.c | 32 ++++++++++++--------------------
>  2 files changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index ed51970c08e7..1cc03a7652a9 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -215,6 +215,7 @@ config AR7
>  	select SYS_SUPPORTS_ZBOOT_UART16550
>  	select GPIOLIB
>  	select VLYNQ
> +	select CLKDEV_LOOKUP
>  	select HAVE_LEGACY_CLK
>  	help
>  	  Support for the Texas Instruments AR7 System-on-a-Chip
> diff --git a/arch/mips/ar7/clock.c b/arch/mips/ar7/clock.c
> index 95def949c971..c614f254f370 100644
> --- a/arch/mips/ar7/clock.c
> +++ b/arch/mips/ar7/clock.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2009 Florian Fainelli <florian@openwrt.org>
>   */
>  
> +#include <linux/clkdev.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/types.h>
> @@ -14,6 +15,7 @@
>  #include <linux/io.h>
>  #include <linux/err.h>
>  #include <linux/clk.h>
> +#include <linux/clkdev.h>

Did you mean to include this twice?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
