Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 862C56D2EDA
	for <lists+linux-mips@lfdr.de>; Sat,  1 Apr 2023 09:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233257AbjDAHSD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Apr 2023 03:18:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbjDAHSD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Apr 2023 03:18:03 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EE866A27B
        for <linux-mips@vger.kernel.org>; Sat,  1 Apr 2023 00:18:01 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1piVUo-0007gx-00; Sat, 01 Apr 2023 09:17:54 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 40B2EC1F8B; Sat,  1 Apr 2023 09:17:08 +0200 (CEST)
Date:   Sat, 1 Apr 2023 09:17:08 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Enze Li <lienze@kylinos.cn>
Cc:     rppt@kernel.org, akpm@linux-foundation.org, nathan@kernel.org,
        linux-mips@vger.kernel.org, enze.li@gmx.com
Subject: Re: [PATCH] MIPS: tlbex: undefine pr_define macro when appropriate
Message-ID: <20230401071708.GA4262@alpha.franken.de>
References: <20230401061025.3556622-1-lienze@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230401061025.3556622-1-lienze@kylinos.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Apr 01, 2023 at 02:10:25PM +0800, Enze Li wrote:
> The pr_define macro is used only within the output_pgtable_bits_defines
> function, and it hasn't been used anywhere else so far.  Therefore, it
> should be undefined when appropriate.
> 
> Signed-off-by: Enze Li <lienze@kylinos.cn>
> ---
>  arch/mips/mm/tlbex.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
> index 80e05ee98d62..510a7e316eb6 100644
> --- a/arch/mips/mm/tlbex.c
> +++ b/arch/mips/mm/tlbex.c
> @@ -255,6 +255,8 @@ static void output_pgtable_bits_defines(void)
>  	pr_define("_PAGE_DIRTY_SHIFT %d\n", _PAGE_DIRTY_SHIFT);
>  	pr_define("_PFN_SHIFT %d\n", _PFN_SHIFT);
>  	pr_debug("\n");
> +
> +#undef pr_define

I'm probably missing something... what problem are you fixing here ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
