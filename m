Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAFDA5E8B1F
	for <lists+linux-mips@lfdr.de>; Sat, 24 Sep 2022 11:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbiIXJtl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Sep 2022 05:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233342AbiIXJtj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Sep 2022 05:49:39 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0E35912088
        for <linux-mips@vger.kernel.org>; Sat, 24 Sep 2022 02:49:36 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1oc1mw-0006pY-01; Sat, 24 Sep 2022 11:49:34 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 34036C053E; Sat, 24 Sep 2022 11:45:33 +0200 (CEST)
Date:   Sat, 24 Sep 2022 11:45:33 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     ralf@linux-mips.org, paul.burton@mips.com,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: IRQ: remove orphan allocate_irqno() declaration
Message-ID: <20220924094533.GB10288@alpha.franken.de>
References: <20220920130711.1107018-1-cuigaosheng1@huawei.com>
 <20220920130711.1107018-3-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920130711.1107018-3-cuigaosheng1@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 20, 2022 at 09:07:11PM +0800, Gaosheng Cui wrote:
> All uses of allocate_irqno() have been removed by
> commit 69a07a41d908 ("MIPS: SGI-IP27: rework HUB interrupts"),
> so remove the orphan declaration.
> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  arch/mips/include/asm/irq.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/irq.h b/arch/mips/include/asm/irq.h
> index 57561e0e6e8d..2f47f56fca82 100644
> --- a/arch/mips/include/asm/irq.h
> +++ b/arch/mips/include/asm/irq.h
> @@ -63,7 +63,6 @@ extern void do_domain_IRQ(struct irq_domain *domain, unsigned int irq);
>  extern void arch_init_irq(void);
>  extern void spurious_interrupt(void);
>  
> -extern int allocate_irqno(void);
>  extern void alloc_legacy_irqno(void);
>  extern void free_irqno(unsigned int irq);
>  
> -- 
> 2.25.1

applied to mips-next. The patch didn't apply, because you alread removed
alloc_legacy_irqno/free_irqno in your previous patch. I've fixed that
while applying, but please you latest mips-next branch for creating
patches next time.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
