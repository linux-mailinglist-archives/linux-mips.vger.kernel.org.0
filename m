Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7546F4384B0
	for <lists+linux-mips@lfdr.de>; Sat, 23 Oct 2021 20:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbhJWSeu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 Oct 2021 14:34:50 -0400
Received: from angie.orcam.me.uk ([78.133.224.34]:34350 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbhJWSeu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 23 Oct 2021 14:34:50 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 94E5592009C; Sat, 23 Oct 2021 20:32:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 85BB192009B;
        Sat, 23 Oct 2021 20:32:29 +0200 (CEST)
Date:   Sat, 23 Oct 2021 20:32:29 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Jinyang He <hejinyang@loongson.cn>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        Jun-Ru Chang <jrjang@realtek.com>
Subject: Re: [PATCH 4/4] MIPS: Add is_jr_ra_ins() to end the loop early
In-Reply-To: <1610454557-25867-5-git-send-email-hejinyang@loongson.cn>
Message-ID: <alpine.DEB.2.21.2110232023171.38243@angie.orcam.me.uk>
References: <1610454557-25867-1-git-send-email-hejinyang@loongson.cn> <1610454557-25867-5-git-send-email-hejinyang@loongson.cn>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 12 Jan 2021, Jinyang He wrote:

> For those leaf functions, they are likely to have no stack operations.
> Add is_jr_ra_ins() to determine whether jr ra has been touched before
> the frame_size is found. Without this patch, the get frame_size operation
> may be out of range and get the frame_size from the next nested function.
> 
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
>  arch/mips/kernel/process.c | 34 +++++++++++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
> index bef8f8d..9e6f194 100644
> --- a/arch/mips/kernel/process.c
> +++ b/arch/mips/kernel/process.c
> @@ -205,6 +205,36 @@ struct mips_frame_info {
>  #define J_TARGET(pc,target)	\
>  		(((unsigned long)(pc) & 0xf0000000) | ((target) << 2))
>  
> +static inline int is_jr_ra_ins(union mips_instruction *ip)
> +{
> +#ifdef CONFIG_CPU_MICROMIPS
> +	/*
> +	 * jr16 ra
> +	 * jr ra
> +	 */
> +	if (mm_insn_16bit(ip->word >> 16)) {
> +		if (ip->mm16_r5_format.opcode == mm_pool16c_op &&
> +		    ip->mm16_r5_format.rt == mm_jr16_op &&
> +		    ip->mm16_r5_format.imm == 31)
> +			return 1;
> +		return 0;
> +	}
> +
> +	if (ip->r_format.opcode == mm_pool32a_op &&
> +	    ip->r_format.func == mm_pool32axf_op &&
> +	    ((ip->u_format.uimmediate >> 6) & GENMASK(9,0)) == mm_jalr_op &&
> +            ip->r_format.rs == 31)
> +		return 1;
> +	return 0;
> +#else

 Without looking into it much, this is likely missing the point, because 
while technically inteed JR and JR16 can be used with $ra in microMIPS 
machine code (there's JRS too), in reality either JRC or JRADDIUSP will.

 [Wading through e-mail recovered from mid-Jan linux-mips.org crash.]

  Maciej
