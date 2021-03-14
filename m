Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA4533A80F
	for <lists+linux-mips@lfdr.de>; Sun, 14 Mar 2021 21:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233641AbhCNUtr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Mar 2021 16:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhCNUtX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Mar 2021 16:49:23 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 61D1BC061574;
        Sun, 14 Mar 2021 13:49:23 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id EC59192009C; Sun, 14 Mar 2021 21:49:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id DE19592009B;
        Sun, 14 Mar 2021 21:49:19 +0100 (CET)
Date:   Sun, 14 Mar 2021 21:49:19 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH v2] MIPS: Check __clang__ to avoid performance influence
 with GCC in csum_tcpudp_nofold()
In-Reply-To: <1615263493-10609-1-git-send-email-yangtiezhu@loongson.cn>
Message-ID: <alpine.DEB.2.21.2103142140000.33195@angie.orcam.me.uk>
References: <1615263493-10609-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 9 Mar 2021, Tiezhu Yang wrote:

> diff --git a/arch/mips/include/asm/checksum.h b/arch/mips/include/asm/checksum.h
> index 1e6c135..80eddd4 100644
> --- a/arch/mips/include/asm/checksum.h
> +++ b/arch/mips/include/asm/checksum.h
> @@ -128,9 +128,13 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
>  
>  static inline __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
>  					__u32 len, __u8 proto,
> -					__wsum sum)
> +					__wsum sum_in)
>  {
> -	unsigned long tmp = (__force unsigned long)sum;
> +#ifdef __clang__
> +	unsigned long sum = (__force unsigned long)sum_in;
> +#else
> +	__wsum sum = sum_in;
> +#endif

 This looks much better to me, but I'd keep the variable names unchanged 
as `sum_in' isn't used beyond the initial assignment anyway (you'll have 
to update the references with asm operands accordingly of course).

 Have you verified that code produced by GCC remains the same with your 
change in place as it used to be up to commit 198688edbf77?  I can see no
such information in the commit description whether here or in the said 
commit.

  Maciej
