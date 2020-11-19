Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89F032B93A5
	for <lists+linux-mips@lfdr.de>; Thu, 19 Nov 2020 14:28:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbgKSNZz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Nov 2020 08:25:55 -0500
Received: from elvis.franken.de ([193.175.24.41]:43206 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727288AbgKSNZy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Nov 2020 08:25:54 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kfjK0-0004vb-00; Thu, 19 Nov 2020 13:45:56 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id EB989C01DD; Thu, 19 Nov 2020 13:36:36 +0100 (CET)
Date:   Thu, 19 Nov 2020 13:36:36 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] MIPS: KASLR: Correcte valid bits in
 apply_r_mips_26_rel
Message-ID: <20201119123636.GA4936@alpha.franken.de>
References: <1605752954-10368-1-git-send-email-hejinyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605752954-10368-1-git-send-email-hejinyang@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 19, 2020 at 10:29:12AM +0800, Jinyang He wrote:
> Apply_r_mips_26_rel() relocates instructions like j, jal and etc. These
> instructions consist of 6bits function field and 26bits address field.
> The value of target_addr as follows,
> =================================================================
> |     high 4bits           |            low 28bits              |
> =================================================================
> |the high 4bits of this PC | the low 26bits of instructions << 2|
> =================================================================
> Thus, loc_orig and log_new both need high 4bits ranther than high 6bits.
						  rather

> Replace 0x3ffffff with 0xfffffff.
> 
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
>  arch/mips/kernel/relocate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
> index 3d80a51..709cfa0 100644
> --- a/arch/mips/kernel/relocate.c
> +++ b/arch/mips/kernel/relocate.c
> @@ -95,7 +95,7 @@ static int __init apply_r_mips_26_rel(u32 *loc_orig, u32 *loc_new, long offset)
>  
>  	/* Original target address */
>  	target_addr <<= 2;
> -	target_addr += (unsigned long)loc_orig & ~0x03ffffff;
> +	target_addr += (unsigned long)loc_orig & ~0x0fffffff;

how about using 

	target_addr += (unsigned long)log_orig & 0xf0000000;

which makes it IMHO even clearer what this does ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
