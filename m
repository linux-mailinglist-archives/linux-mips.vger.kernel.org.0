Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66D63293B12
	for <lists+linux-mips@lfdr.de>; Tue, 20 Oct 2020 14:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394139AbgJTMRn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Oct 2020 08:17:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:39736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394138AbgJTMRn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 20 Oct 2020 08:17:43 -0400
Received: from quaco.ghostprotocols.net (unknown [179.97.37.151])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D1862177B;
        Tue, 20 Oct 2020 12:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603196262;
        bh=f7IB2+ijeosROCTKSkyRnXNgxMui2gLW/nBVzT94HZ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nvbgQwGibCXaQXS8iDJqr/RuJ5Ix4271YwDbnu1seAy2M9B1toa/M8slvCWYXgEfQ
         KxrHQqA0uYuIpKktMvFHerVknh19kWXmGBOjrS6g1VhQpWPdS7EAIF1us8sm+W1J+k
         t6v4RyU3zjDlpKO8IT5xBLzZDUNviV5emA2qVSlY=
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
        id 10062403C2; Tue, 20 Oct 2020 09:17:40 -0300 (-03)
Date:   Tue, 20 Oct 2020 09:17:40 -0300
From:   Arnaldo Carvalho de Melo <acme@kernel.org>
To:     Peng Fan <fanpeng@loongson.cn>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, linux-mips@vger.kernel.org,
        jiaxun.yang@flygoat.com, lixuefeng@loongson.cn,
        Dengcheng Zhu <dzhu@wavecomp.com>
Subject: Re: [PATCH] perf annotate mips: Add perf arch instructions annotate
 handlers
Message-ID: <20201020121740.GG2294271@kernel.org>
References: <1603092084-11125-1-git-send-email-fanpeng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603092084-11125-1-git-send-email-fanpeng@loongson.cn>
X-Url:  http://acmel.wordpress.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Em Mon, Oct 19, 2020 at 03:21:24PM +0800, Peng Fan escreveu:
> From: Dengcheng Zhu <dzhu@wavecomp.com>
> 
> Support the MIPS architecture using the ins_ops association
> method. With this patch, perf-annotate can work well on MIPS.
> 
> Testing it with a perf.data file collected on a mips machine:
> $./perf annotate -i perf.data
> 
>          :           Disassembly of section .text:
>          :
>          :           00000000000be6a0 <get_next_seq>:
>          :           get_next_seq():
>     0.00 :   be6a0:       lw      v0,0(a0)
>     0.00 :   be6a4:       daddiu  sp,sp,-128
>     0.00 :   be6a8:       ld      a7,72(a0)
>     0.00 :   be6ac:       gssq    s5,s4,80(sp)
>     0.00 :   be6b0:       gssq    s1,s0,48(sp)
>     0.00 :   be6b4:       gssq    s8,gp,112(sp)
>     0.00 :   be6b8:       gssq    s7,s6,96(sp)
>     0.00 :   be6bc:       gssq    s3,s2,64(sp)
>     0.00 :   be6c0:       sd      a3,0(sp)
>     0.00 :   be6c4:       move    s0,a0
>     0.00 :   be6c8:       sd      v0,32(sp)
>     0.00 :   be6cc:       sd      a5,8(sp)
>     0.00 :   be6d0:       sd      zero,8(a0)
>     0.00 :   be6d4:       sd      a6,16(sp)
>     0.00 :   be6d8:       ld      s2,48(a0)
>     8.53 :   be6dc:       ld      s1,40(a0)
>     9.42 :   be6e0:       ld      v1,32(a0)
>     0.00 :   be6e4:       nop
>     0.00 :   be6e8:       ld      s4,24(a0)
>     0.00 :   be6ec:       ld      s5,16(a0)
>     0.00 :   be6f0:       sd      a7,40(sp)
>    10.11 :   be6f4:       ld      s6,64(a0)
> 
> ...
> 
> The original patch link: 
> https://lore.kernel.org/patchwork/patch/1180480/

Thanks, applied.

- Arnaldo

 
> Signed-off-by: Dengcheng Zhu <dzhu@wavecomp.com>
> Signed-off-by: Peng Fan <fanpeng@loongson.cn>
> 
> [fanpeng@loongson.cn: Add missing "bgtzl", "bltzl",
> "bgezl", "blezl", "beql" and "bnel" for pre-R6processors]
> ---
>  tools/perf/arch/mips/Build                   |  2 +-
>  tools/perf/arch/mips/annotate/instructions.c | 46 ++++++++++++++++++++++++++++
>  tools/perf/util/annotate.c                   |  8 +++++
>  3 files changed, 55 insertions(+), 1 deletion(-)
>  create mode 100644 tools/perf/arch/mips/annotate/instructions.c
> 
> diff --git a/tools/perf/arch/mips/Build b/tools/perf/arch/mips/Build
> index 1bb8bf6..e4e5f33 100644
> --- a/tools/perf/arch/mips/Build
> +++ b/tools/perf/arch/mips/Build
> @@ -1 +1 @@
> -# empty
> +perf-y += util/
> diff --git a/tools/perf/arch/mips/annotate/instructions.c b/tools/perf/arch/mips/annotate/instructions.c
> new file mode 100644
> index 0000000..340993f
> --- /dev/null
> +++ b/tools/perf/arch/mips/annotate/instructions.c
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +static
> +struct ins_ops *mips__associate_ins_ops(struct arch *arch, const char *name)
> +{
> +	struct ins_ops *ops = NULL;
> +
> +	if (!strncmp(name, "bal", 3) ||
> +	    !strncmp(name, "bgezal", 6) ||
> +	    !strncmp(name, "bltzal", 6) ||
> +	    !strncmp(name, "bgtzal", 6) ||
> +	    !strncmp(name, "blezal", 6) ||
> +	    !strncmp(name, "beqzal", 6) ||
> +	    !strncmp(name, "bnezal", 6) ||
> +	    !strncmp(name, "bgtzl", 5) ||
> +	    !strncmp(name, "bltzl", 5) ||
> +	    !strncmp(name, "bgezl", 5) ||
> +	    !strncmp(name, "blezl", 5) ||
> +	    !strncmp(name, "jialc", 5) ||
> +	    !strncmp(name, "beql", 4) ||
> +	    !strncmp(name, "bnel", 4) ||
> +	    !strncmp(name, "jal", 3))
> +		ops = &call_ops;
> +	else if (!strncmp(name, "jr", 2))
> +		ops = &ret_ops;
> +	else if (name[0] == 'j' || name[0] == 'b')
> +		ops = &jump_ops;
> +	else
> +		return NULL;
> +
> +	arch__associate_ins_ops(arch, name, ops);
> +
> +	return ops;
> +}
> +
> +static
> +int mips__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
> +{
> +	if (!arch->initialized) {
> +		arch->associate_instruction_ops = mips__associate_ins_ops;
> +		arch->initialized = true;
> +		arch->objdump.comment_char = '#';
> +	}
> +
> +	return 0;
> +}
> diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
> index 6c8575e..e52053a 100644
> --- a/tools/perf/util/annotate.c
> +++ b/tools/perf/util/annotate.c
> @@ -152,6 +152,7 @@ static int arch__associate_ins_ops(struct arch* arch, const char *name, struct i
>  #include "arch/arm/annotate/instructions.c"
>  #include "arch/arm64/annotate/instructions.c"
>  #include "arch/csky/annotate/instructions.c"
> +#include "arch/mips/annotate/instructions.c"
>  #include "arch/x86/annotate/instructions.c"
>  #include "arch/powerpc/annotate/instructions.c"
>  #include "arch/s390/annotate/instructions.c"
> @@ -175,6 +176,13 @@ static struct arch architectures[] = {
>  		.init = csky__annotate_init,
>  	},
>  	{
> +		.name = "mips",
> +		.init = mips__annotate_init,
> +		.objdump = {
> +			.comment_char = '#',
> +		},
> +	},
> +	{
>  		.name = "x86",
>  		.init = x86__annotate_init,
>  		.instructions = x86__instructions,
> -- 
> 2.1.0
> 

-- 

- Arnaldo
