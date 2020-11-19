Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF4B12B8C25
	for <lists+linux-mips@lfdr.de>; Thu, 19 Nov 2020 08:19:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbgKSHPQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Nov 2020 02:15:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgKSHPQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 Nov 2020 02:15:16 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF1EAC0613D4
        for <linux-mips@vger.kernel.org>; Wed, 18 Nov 2020 23:15:15 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id 10so6120604wml.2
        for <linux-mips@vger.kernel.org>; Wed, 18 Nov 2020 23:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=k7uEfvSHML1JaHMmEPt3KGkQ/dYF1TtfljbJMmsf+xI=;
        b=KCDtR2u2mDd7nxgmdhWwk7S5ZSrc/5CB09m7rkQERHVmC92ct/EylO8ApzQMiGTqAK
         /Uh2TcW3aOqMigTALtysrckOrupJAsGku1Bh7uFbKWFzRNQ7MfePXs7d8T+2ebGLyiWF
         qCT2x0wkRCTT+bVU+BcjgXzRxH8RkqgnQ7vOmiHKVsGLnWKxWqN1T7w3YJRBGuff2jV6
         nosT+A3Y4kda5zu6m79pPKFP1PIF55tI3aG/VCsFFDq4yFCjn5syBeHbQ8FJtOW4vfCR
         fOOJ43A5kjT86MzYK5CYayQUyTOQgVaFlUKGGD9max67ePVSPveCM2yBaZr2gWil6y4q
         Z+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k7uEfvSHML1JaHMmEPt3KGkQ/dYF1TtfljbJMmsf+xI=;
        b=cV+JP8y2YsNwEK+a64foJDlcVuLxTBhsprzA607zhlYQwtm6aS/fDmpkAUu1QRdor9
         kaOadc5Phtd6n0uBUZVMt1CTFZhsbAvxtwhu4j6NLfy0tDc4WxPoOcafNhXQQ0Og5F2b
         eGzMDo86BJZVWOpwrWDQHLZrgaDJzB7XDDnmdQakOgpsJE5TuguLRqLIcEcAs+jkVUjo
         9DUx4wFLtgxD0IKCqiJILtOXhmQQpJ4HJEZnG/Zd+fW2DOsp6VZRvfEtAOJcSV/0WPzd
         zZeMyK51g5zVB/ESwcTsBOku5k0KI/3N2BZ5S8TCnzzePE8mgR5lEYmeCFTB70igMrrf
         QgpQ==
X-Gm-Message-State: AOAM530KdnOz0ZL4VZKAalYTSMEpTalPjICzxLD0JizoNzNi5fryjOqD
        mNxe8//P91ZpOZ3Xf4+k+kw=
X-Google-Smtp-Source: ABdhPJzuq/4mXzvKYLeVDVVyGqPodEQqMzU14K+M8W0C2sXdn/RM3cjjiY8AplvE2XENMHc+d1DEUg==
X-Received: by 2002:a1c:b304:: with SMTP id c4mr2933702wmf.20.1605770114315;
        Wed, 18 Nov 2020 23:15:14 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.234])
        by smtp.gmail.com with ESMTPSA id e1sm7377105wmd.16.2020.11.18.23.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2020 23:15:12 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= 
        <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 002/120] MIPS: R5900: Trap the RDHWR instruction as an SQ
 address exception
To:     Fredrik Noring <noring@nocrew.org>, linux-mips@vger.kernel.org
References: <cover.1567326213.git.noring@nocrew.org>
 <4f856a5ea2c039c6639df875d11b5bff1bf7ecd2.1567326213.git.noring@nocrew.org>
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Andreas Jaeger <aj@suse.de>, Nick Clifton <nickc@redhat.com>,
        =?UTF-8?Q?J=c3=bcrgen_Urban?= <JuergenUrban@gmx.de>,
        libc-help@sourceware.org
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2767f5c3-4e89-6543-34f7-6cd1a1be8c23@amsat.org>
Date:   Thu, 19 Nov 2020 08:15:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4f856a5ea2c039c6639df875d11b5bff1bf7ecd2.1567326213.git.noring@nocrew.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Fredrik,

Cc'ing glibc folks in case...

On 9/1/19 5:36 PM, Fredrik Noring wrote:
> On the R5900, the RDHWR instruction is interpreted as the R5900 specific
> SQ instruction[1] that traps into a zero page address exception. Hence
> RDHWR can be emulated by emulate_load_store_insn().

Please bare with me because this is not my area, but this does
not look the correct way to fix this problem to me.

The R5900 is a MIPS-III, so I don't understand why we have to care
about RDHWR.

IIRC MIPS TLS support has been added in glibc with MIPS32 ISA in
mind in 2005:
https://sourceware.org/git/?p=glibc.git;a=commit;h=f850220be6

MIPS16 is handled differently:
https://sourceware.org/git/?p=glibc.git;a=blobdiff;f=ports/sysdeps/mips/tls-macros.h;h=3e87e42ea;hp=8fe2e4a150d;hb=43301bd3c2;hpb=85bd816a60

Shouldn't we have a similar set of macros for the R5900?

The problem I have is this break running the binaries built
by the Sony Linux Toolkit for Playstation 2 which use the
LQ/SQ instruction:

 1b00d5c:       0c6c00d4        jal     0x1b00350
 1b00d60:       7fa90020        sq      t1,32(sp)
 1b00d64:       a2710000        sb      s1,0(s3)
 1b00d68:       26730001        addiu   s3,s3,1
 1b00d6c:       10000004        b       0x1b00d80
 1b00d70:       7ba90020        lq      t1,32(sp)
 1b00d74:       00000000        nop
 1b00d78:       2617ffff        addiu   s7,s0,-1
 1b00d7c:       25360001        addiu   s6,t1,1
 1b00d80:       91220000        lbu     v0,0(t1)
 1b00d84:       02e0802d        move    s0,s7
 1b00d88:       02c0482d        move    t1,s6
 1b00d8c:       a2620000        sb      v0,0(s3)
 1b00d90:       1600fff9        bnez    s0,0x1b00d78
 1b00d94:       26730001        addiu   s3,s3,1
 1b00d98:       10000003        b       0x1b00da8
 1b00d9c:       01342026        xor     a0,t1,s4
 1b00da0:       253e0003        addiu   s8,t1,3
 1b00da4:       01342026        xor     a0,t1,s4
 1b00da8:       7fa90020        sq      t1,32(sp)
 1b00dac:       2c840001        sltiu   a0,a0,1
 1b00db0:       0c6c00d4        jal     0x1b00350

What do you think?

Regards,

Phil.

> CONFIG_DEFAULT_MMAP_MIN_ADDR must not be less than PAGE_SIZE to reliably
> trap and emulate RDHWR, so this is made a BUILD_BUG_ON for the R5900.
> 
> References:
> 
> [1] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
>     Toshiba Corporation, p. B-162, https://wiki.qemu.org/File:C790.pdf
> 
> Signed-off-by: Fredrik Noring <noring@nocrew.org>
> ---
>  arch/mips/include/asm/traps.h |  2 ++
>  arch/mips/kernel/traps.c      |  2 +-
>  arch/mips/kernel/unaligned.c  | 36 ++++++++++++++++++++++++++++++++++-
>  3 files changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/include/asm/traps.h b/arch/mips/include/asm/traps.h
> index 6a0864bb604d..ed6449f2967b 100644
> --- a/arch/mips/include/asm/traps.h
> +++ b/arch/mips/include/asm/traps.h
> @@ -35,4 +35,6 @@ extern int register_nmi_notifier(struct notifier_block *nb);
>  	register_nmi_notifier(&fn##_nb);				\
>  })
>  
> +int simulate_rdhwr(struct pt_regs *regs, int rd, int rt);
> +
>  #endif /* _ASM_TRAPS_H */
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 342e41de9d64..9423b9a2eb67 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -625,7 +625,7 @@ static int simulate_llsc(struct pt_regs *regs, unsigned int opcode)
>   * Simulate trapping 'rdhwr' instructions to provide user accessible
>   * registers not implemented in hardware.
>   */
> -static int simulate_rdhwr(struct pt_regs *regs, int rd, int rt)
> +int simulate_rdhwr(struct pt_regs *regs, int rd, int rt)
>  {
>  	struct thread_info *ti = task_thread_info(current);
>  
> diff --git a/arch/mips/kernel/unaligned.c b/arch/mips/kernel/unaligned.c
> index 92bd2b0f0548..f490944d73cf 100644
> --- a/arch/mips/kernel/unaligned.c
> +++ b/arch/mips/kernel/unaligned.c
> @@ -90,6 +90,7 @@
>  #include <asm/fpu_emulator.h>
>  #include <asm/inst.h>
>  #include <asm/mmu_context.h>
> +#include <asm/traps.h>
>  #include <linux/uaccess.h>
>  
>  #define STR(x)	__STR(x)
> @@ -934,7 +935,39 @@ static void emulate_load_store_insn(struct pt_regs *regs,
>  		 * interest.
>  		 */
>  	case spec3_op:
> -		if (insn.dsp_format.func == lx_op) {
> +		if (IS_ENABLED(CONFIG_CPU_R5900)) {
> +			/*
> +			 * On the R5900, the RDHWR instruction
> +			 *
> +			 *     +--------+-------+----+----+-------+--------+
> +			 *     | 011111 | 00000 | rt | rd | 00000 | 111011 |
> +			 *     +--------+-------+----+----+-------+--------+
> +			 *          6       5      5    5     5        6
> +			 *
> +			 * is interpreted as the R5900 specific SQ instruction
> +			 *
> +			 *     +--------+-------+----+---------------------+
> +			 *     | 011111 |  base | rt |        offset       |
> +			 *     +--------+-------+----+---------------------+
> +			 *          6       5      5            16
> +			 *
> +			 * that asserts a zero page address exception. Hence
> +			 * RDHWR can be trapped and emulated here, provided
> +			 * DEFAULT_MMAP_MIN_ADDR isn't zero.
> +			 */
> +			BUILD_BUG_ON(IS_ENABLED(CONFIG_CPU_R5900) &&
> +				CONFIG_DEFAULT_MMAP_MIN_ADDR < PAGE_SIZE);
> +			if (insn.r_format.func == rdhwr_op &&
> +			    insn.r_format.rs == 0 &&
> +			    insn.r_format.re == 0) {
> +				if (compute_return_epc(regs) < 0 ||
> +				    simulate_rdhwr(regs, insn.r_format.rd,
> +						   insn.r_format.rt) < 0)
> +					goto sigill;
> +				return;
> +			}
> +			goto sigbus;
> +		} else if (insn.dsp_format.func == lx_op) {
>  			switch (insn.dsp_format.op) {
>  			case lwx_op:
>  				if (!access_ok(addr, 4))
> @@ -1342,6 +1375,7 @@ static void emulate_load_store_insn(struct pt_regs *regs,
>  		cu2_notifier_call_chain(CU2_SDC2_OP, regs);
>  		break;
>  #endif
> +
>  	default:
>  		/*
>  		 * Pheeee...  We encountered an yet unknown instruction or
> 

