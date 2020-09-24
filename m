Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12AFF276C67
	for <lists+linux-mips@lfdr.de>; Thu, 24 Sep 2020 10:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbgIXIva (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Sep 2020 04:51:30 -0400
Received: from elvis.franken.de ([193.175.24.41]:54784 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727289AbgIXIv2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 24 Sep 2020 04:51:28 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kLMyM-0003LM-00; Thu, 24 Sep 2020 10:51:26 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B79BEC1009; Thu, 24 Sep 2020 10:20:08 +0200 (CEST)
Date:   Thu, 24 Sep 2020 10:20:08 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] MIPS: OCTEON: fix error - use 'ret' after remove it
Message-ID: <20200924082008.GA7822@alpha.franken.de>
References: <20200924064142.90491-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924064142.90491-1-miaoqinglang@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 24, 2020 at 02:41:42PM +0800, Qinglang Miao wrote:
> Variable ret was removed in commit 0ee69c589ec("MIPS: OCTEON:
> use devm_platform_ioremap_resource") but still being used in
> devm_release_mem_region which is unneeded. So remove this
> line to fix error.
> 
> Fixes: 0ee69c589ec("MIPS: OCTEON: use devm_platform_ioremap_resource")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>  arch/mips/cavium-octeon/octeon-usb.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/arch/mips/cavium-octeon/octeon-usb.c
> index 97f6dc31e1b4..987a94cbf3d0 100644
> --- a/arch/mips/cavium-octeon/octeon-usb.c
> +++ b/arch/mips/cavium-octeon/octeon-usb.c
> @@ -534,8 +534,6 @@ static int __init dwc3_octeon_device_init(void)
>  			dev_info(&pdev->dev, "clocks initialized.\n");
>  			mutex_unlock(&dwc3_octeon_clocks_mutex);
>  			devm_iounmap(&pdev->dev, base);
> -			devm_release_mem_region(&pdev->dev, res->start,
> -						resource_size(res));
>  		}
>  	} while (node != NULL);

I've reverted the orginal fix as IMHO the whole change is wrong.
The code maps/unmaps the io region to setup clocks and phy and
releases everything so the real driver can pick it up later.
The devm_release_mem_region is important and since the device
continues to exists, there is not auto-cleanup.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
