Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2254FC2B3
	for <lists+linux-mips@lfdr.de>; Mon, 11 Apr 2022 18:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348695AbiDKQvp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Apr 2022 12:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348692AbiDKQvm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 Apr 2022 12:51:42 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1D5AB3525E
        for <linux-mips@vger.kernel.org>; Mon, 11 Apr 2022 09:49:27 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 7488592009C; Mon, 11 Apr 2022 18:49:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 6E34A92009B;
        Mon, 11 Apr 2022 17:49:26 +0100 (BST)
Date:   Mon, 11 Apr 2022 17:49:26 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Feiyang Chen <chris.chenfeiyang@gmail.com>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Feiyang Chen <chenfeiyang@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix inline assembly in uaccess.h
In-Reply-To: <19656f7bfbc17f90ca4e2f2d576171d7151d6684.1648178000.git.chenfeiyang@loongson.cn>
Message-ID: <alpine.DEB.2.21.2204061051320.47162@angie.orcam.me.uk>
References: <19656f7bfbc17f90ca4e2f2d576171d7151d6684.1648178000.git.chenfeiyang@loongson.cn>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 25 Mar 2022, Feiyang Chen wrote:

> The inline assembly of __put_data_asm() and __put_data_asm_ll32()
> treat memory addresses to be written as input operands, which may
> cause the compiler to incorrectly optimize.

 This part of the change seems conceptually right and qualifies as a bug 
fix.

> Treat these addresses as output operands. BTW, rewrite the inline
> assembly to improve readability.

 However combining it with improvements or clean-ups makes it impossible 
to accept.  We require that changes are self-contained and made one at a 
time.  So if you'd like to move forward with your proposal, then you need 
to split it into individual changes and post them as a patch series, with 
the bug fix first (so that it can be possibly backported as it is) with 
clean-ups following.

 Please have a look through Documentation/process/submitting-patches.rst 
for further details.

> diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
> index c0cede273c7c..dc5bca09f39a 100644
> --- a/arch/mips/include/asm/uaccess.h
> +++ b/arch/mips/include/asm/uaccess.h
> @@ -207,19 +207,19 @@ struct __large_struct { unsigned long buf[100]; };
>  	long __gu_tmp;							\
>  									\
>  	__asm__ __volatile__(						\
> -	"1:	"insn("%1", "%3")"				\n"	\
> +	"1:	"insn("%1", "%2")"				\n"	\
>  	"2:							\n"	\
>  	"	.insn						\n"	\
>  	"	.section .fixup,\"ax\"				\n"	\
> -	"3:	li	%0, %4					\n"	\
> +	"3:	li	%0, %3					\n"	\
>  	"	move	%1, $0					\n"	\
>  	"	j	2b					\n"	\
>  	"	.previous					\n"	\
>  	"	.section __ex_table,\"a\"			\n"	\
>  	"	"__UA_ADDR "\t1b, 3b				\n"	\
>  	"	.previous					\n"	\
> -	: "=r" (__gu_err), "=r" (__gu_tmp)				\
> -	: "0" (0), "o" (__m(addr)), "i" (-EFAULT));			\
> +	: "+r" (__gu_err), "=r" (__gu_tmp)				\
> +	: "m" (__m(addr)), "i" (-EFAULT));				\

 For example you remove input operand #2 by making operand #0 input/output 
one, which is just a syntactic change.  Many years ago GCC had issues with 
input/output operands, which is why we have a separate input and output 
operand here.  I am fairly sure we do not support versions of GCC anymore 
that had those issues, so it is a clean-up perhaps worth making, but such 
a change has to be made with a separate patch.

 You also change the `o' constraint here into `m'.  This actually changes 
the semantics, by permitting any memory reference to be used with `insn'.  
This change is probably invalid, as it could turn `insn' into an assembly 
macro.  Consequently the exception table won't work anymore as there will 
be no entry for the instruction at `1:', which could be a LUI in 32-bit 
code.

 However the use of the `o' constraint here isn't completely safe here 
either, because with the MIPS target it doesn't guarantee an assembly 
instruction will be used that produces a single machine instruction.  The 
reason for using `o' regardless is again GCC, which used not to provide 
better means or they were buggy.

 What we ought to use nowadays is `R' if non-EVA, and more problematically 
GCC doesn't actually provide a suitable constraint for the EVA case (where 
a 9-bit only offset is used in the regular MIPS instruction encoding; for 
microMIPS code `ZC would do), so we'd have to resort to a hack there until 
GCC has been improved.  Obviously our code has worked by chance and I find 
it rather interesting that nobody has noticed the lack of a suitable 
constraint for EVA operations in many years now.

 Overall given that these accesses, and certainly the user ones, will be 
made via pointers I think that for safety the change needs to go in the 
opposite direction and code the memory reference with an explicit base and 
offset like in `__get_data_asm_ll32'.

  Maciej
