Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D30B244522
	for <lists+linux-mips@lfdr.de>; Fri, 14 Aug 2020 08:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgHNG5T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Aug 2020 02:57:19 -0400
Received: from elvis.franken.de ([193.175.24.41]:46521 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726006AbgHNG5T (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 14 Aug 2020 02:57:19 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k6TeP-0005la-00; Fri, 14 Aug 2020 08:57:17 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2EF53C0D54; Fri, 14 Aug 2020 08:53:10 +0200 (CEST)
Date:   Fri, 14 Aug 2020 08:53:10 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: Loongson: Set CONFIG_FRAME_WARN=2048 in
 loongson3_defconfig to fix build warning
Message-ID: <20200814065310.GA4751@alpha.franken.de>
References: <1597373793-8482-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597373793-8482-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 14, 2020 at 10:56:33AM +0800, Tiezhu Yang wrote:
> Fixes: 70b838292bef ("MIPS: Update default config file for Loongson-3")

I'm not so sure whether this warrants a fixes tag.

>  arch/mips/configs/loongson3_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
> index a65b08d..2b356d9 100644
> --- a/arch/mips/configs/loongson3_defconfig
> +++ b/arch/mips/configs/loongson3_defconfig
> @@ -403,7 +403,7 @@ CONFIG_CRYPTO_TEA=m
>  CONFIG_CRYPTO_TWOFISH=m
>  CONFIG_CRYPTO_DEFLATE=m
>  CONFIG_PRINTK_TIME=y
> -CONFIG_FRAME_WARN=1024
> +CONFIG_FRAME_WARN=2048

what about just dropping it ? Default for 64bit is 2048. Leaving it out
of the config has the advantage that you will get a change of the default
for free.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
