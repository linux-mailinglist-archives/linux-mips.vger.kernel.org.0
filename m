Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 355626DF749
	for <lists+linux-mips@lfdr.de>; Wed, 12 Apr 2023 15:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbjDLNeW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Apr 2023 09:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjDLNeQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Apr 2023 09:34:16 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9B3FB93FE
        for <linux-mips@vger.kernel.org>; Wed, 12 Apr 2023 06:33:38 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pmabN-0000FF-02; Wed, 12 Apr 2023 15:33:33 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 51082C2458; Wed, 12 Apr 2023 15:31:35 +0200 (CEST)
Date:   Wed, 12 Apr 2023 15:31:35 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, llvm@lists.linux.dev,
        ndesaulniers@google.com, nathan@kernel.org
Subject: Re: [PATCH 3/8] MIPS: loongson2ef: Add missing break in cs5536_isa
Message-ID: <20230412133135.GC11717@alpha.franken.de>
References: <20230409104309.13887-1-jiaxun.yang@flygoat.com>
 <20230409104309.13887-4-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230409104309.13887-4-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Apr 09, 2023 at 11:43:04AM +0100, Jiaxun Yang wrote:
> Fixes build error:
> 
> arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:217:2: error:
> unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>         default:
>         ^
> arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:217:2:
> note: insert 'break;' to avoid fall-through
>         default:
>         ^
>         break;
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/loongson2ef/common/cs5536/cs5536_isa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/loongson2ef/common/cs5536/cs5536_isa.c b/arch/mips/loongson2ef/common/cs5536/cs5536_isa.c
> index 5ad38f86ee62..d60dd9992377 100644
> --- a/arch/mips/loongson2ef/common/cs5536/cs5536_isa.c
> +++ b/arch/mips/loongson2ef/common/cs5536/cs5536_isa.c
> @@ -213,7 +213,7 @@ void pci_isa_write_reg(int reg, u32 value)
>  			lo |= 0x00000063;
>  			_wrmsr(SB_MSR_REG(SB_ERROR), hi, lo);
>  		}
> -
> +		break;
>  	default:
>  		/* ALL OTHER PCI CONFIG SPACE HEADER IS NOT IMPLEMENTED. */
>  		break;
> -- 
> 2.39.2 (Apple Git-143)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
