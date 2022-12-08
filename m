Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06EC6646DAD
	for <lists+linux-mips@lfdr.de>; Thu,  8 Dec 2022 12:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbiLHLAJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Dec 2022 06:00:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbiLHK7v (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Dec 2022 05:59:51 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0AE9862D8
        for <linux-mips@vger.kernel.org>; Thu,  8 Dec 2022 02:52:39 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1p3EW2-0002wy-02; Thu, 08 Dec 2022 11:52:34 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 57CBDC2487; Thu,  8 Dec 2022 11:52:22 +0100 (CET)
Date:   Thu, 8 Dec 2022 11:52:22 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhuacai@loongson.cn>
Cc:     linux-mips@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/mips: Adjust Kconfig to keep consistency
Message-ID: <20221208105222.GC8388@alpha.franken.de>
References: <20220918101206.2381321-1-chenhuacai@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220918101206.2381321-1-chenhuacai@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Sep 18, 2022 at 06:12:06PM +0800, Huacai Chen wrote:
> Drop the "if MIPS" and "endif" drivers/platform/Kconfig. Instead add
> a "depends on MIPS" to "menuconfig MIPS_PLATFORM_DEVICES" in drivers/
> platform/mips/Kconfig, like all the other subdirs are doing.
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  drivers/platform/Kconfig      | 2 --
>  drivers/platform/mips/Kconfig | 1 +
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
> index b437847b6237..8ddfe5ce153f 100644
> --- a/drivers/platform/Kconfig
> +++ b/drivers/platform/Kconfig
> @@ -1,7 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -if MIPS
>  source "drivers/platform/mips/Kconfig"
> -endif
>  
>  source "drivers/platform/goldfish/Kconfig"
>  
> diff --git a/drivers/platform/mips/Kconfig b/drivers/platform/mips/Kconfig
> index 6b51ad01f791..fb4ac4b08e89 100644
> --- a/drivers/platform/mips/Kconfig
> +++ b/drivers/platform/mips/Kconfig
> @@ -6,6 +6,7 @@
>  menuconfig MIPS_PLATFORM_DEVICES
>  	bool "MIPS Platform Specific Device Drivers"
>  	default y
> +	depends on MIPS
>  	help
>  	  Say Y here to get to see options for device drivers of various
>  	  MIPS platforms, including vendor-specific netbook/laptop/desktop
> -- 
> 2.31.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
