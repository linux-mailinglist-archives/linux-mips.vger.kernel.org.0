Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29BE13CD0D9
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jul 2021 11:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235578AbhGSIuP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 19 Jul 2021 04:50:15 -0400
Received: from aposti.net ([89.234.176.197]:43596 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235034AbhGSIuO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 19 Jul 2021 04:50:14 -0400
Date:   Mon, 19 Jul 2021 09:15:04 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/6] mmc: JZ4740: remove the flush_kernel_dcache_page call
 in jz4740_mmc_read_data
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Russell King <linux@armlinux.org.uk>,
        Guo Ren <guoren@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Geoff Levand <geoff@infradead.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Alex Shi <alexs@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org
Message-Id: <49GHWQ.K50TS8ZL6H1N1@crapouillou.net>
In-Reply-To: <20210712060928.4161649-2-hch@lst.de>
References: <20210712060928.4161649-1-hch@lst.de>
        <20210712060928.4161649-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Christoph,

Le lun., juil. 12 2021 at 08:09:23 +0200, Christoph Hellwig 
<hch@lst.de> a écrit :
> MIPS now implements flush_kernel_dcache_page (as an alias to
> flush_dcache_page).
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Tested-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  drivers/mmc/host/jz4740_mmc.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/mmc/host/jz4740_mmc.c 
> b/drivers/mmc/host/jz4740_mmc.c
> index 0db17bcc9c16..aa2240c83510 100644
> --- a/drivers/mmc/host/jz4740_mmc.c
> +++ b/drivers/mmc/host/jz4740_mmc.c
> @@ -578,10 +578,6 @@ static bool jz4740_mmc_read_data(struct 
> jz4740_mmc_host *host,
>  			}
>  		}
>  		data->bytes_xfered += miter->length;
> -
> -		/* This can go away once MIPS implements
> -		 * flush_kernel_dcache_page */
> -		flush_dcache_page(miter->page);
>  	}
>  	sg_miter_stop(miter);
> 
> --
> 2.30.2
> 


