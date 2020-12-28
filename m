Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 085402E3619
	for <lists+linux-mips@lfdr.de>; Mon, 28 Dec 2020 11:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgL1Kwx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Dec 2020 05:52:53 -0500
Received: from elvis.franken.de ([193.175.24.41]:43077 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727085AbgL1Kwx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 28 Dec 2020 05:52:53 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1ktq8K-00054l-01; Mon, 28 Dec 2020 11:52:12 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E06CDC0565; Mon, 28 Dec 2020 11:50:34 +0100 (CET)
Date:   Mon, 28 Dec 2020 11:50:34 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 3/6] fbdev: Add n64rdp driver
Message-ID: <20201228105034.GB3606@alpha.franken.de>
References: <20201225190048.776de55443fd4c953e797d8e@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201225190048.776de55443fd4c953e797d8e@gmx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Dec 25, 2020 at 07:00:48PM +0200, Lauri Kasanen wrote:
> I'm aware of the drm-fbdev resolution, but CONFIG_DRM adds 100kb, which
> is a complete blocker on a system with 8mb RAM.
> 
> Signed-off-by: Lauri Kasanen <cand@gmx.com>
> ---
>  arch/mips/n64/init.c         |  10 +++
>  drivers/video/fbdev/Kconfig  |   9 ++
>  drivers/video/fbdev/Makefile |   1 +
>  drivers/video/fbdev/n64rdp.c | 190 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 210 insertions(+)
>  create mode 100644 drivers/video/fbdev/n64rdp.c
> 
> diff --git a/arch/mips/n64/init.c b/arch/mips/n64/init.c
> index 6fb622d..635e9ef 100644
> --- a/arch/mips/n64/init.c
> +++ b/arch/mips/n64/init.c
> @@ -8,6 +8,7 @@
>  #include <linux/ioport.h>
>  #include <linux/irq.h>
>  #include <linux/memblock.h>
> +#include <linux/platform_device.h>
>  #include <linux/string.h>
> 
>  #include <asm/bootinfo.h>
> @@ -46,6 +47,15 @@ void __init prom_free_prom_memory(void)
>  {
>  }
> 
> +static int __init n64_platform_init(void)
> +{
> +	platform_device_register_simple("n64rdp", -1, NULL, 0);
> +
> +	return 0;
> +}
> +
> +arch_initcall(n64_platform_init);
> +
>  void __init plat_mem_setup(void)
>  {
>  	iomem_resource_init();

IMHO it would be better to add the platform device creatioasn to the
MIPS patch. This way there is no dependeny when applying patches by
different maintainers.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
