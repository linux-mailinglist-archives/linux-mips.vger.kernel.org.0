Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8631573B892
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jun 2023 15:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231757AbjFWNQq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 23 Jun 2023 09:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbjFWNQm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 23 Jun 2023 09:16:42 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 22CCC2684;
        Fri, 23 Jun 2023 06:16:41 -0700 (PDT)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
        id 1qCgeU-0002sh-00; Fri, 23 Jun 2023 15:16:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 32743C0301; Fri, 23 Jun 2023 15:09:23 +0200 (CEST)
Date:   Fri, 23 Jun 2023 15:09:23 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     sergio.paracuellos@gmail.com, sboyd@kernel.org,
        ndesaulniers@google.com, trix@redhat.com,
        linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        patches@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH] clk: ralink: mtmips: Fix uninitialized use of ret in
 mtmips_register_{fixed,factor}_clocks()
Message-ID: <20230623130923.GB11636@alpha.franken.de>
References: <20230622-mips-ralink-clk-wuninitialized-v1-1-ea9041240d10@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622-mips-ralink-clk-wuninitialized-v1-1-ea9041240d10@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 22, 2023 at 03:56:19PM +0000, Nathan Chancellor wrote:
> Clang warns:
> 
>   drivers/clk/ralink/clk-mtmips.c:309:9: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>     309 |         return ret;
>         |                ^~~
>   drivers/clk/ralink/clk-mtmips.c:285:9: note: initialize the variable 'ret' to silence this warning
>     285 |         int ret, i;
>         |                ^
>         |                 = 0
>   drivers/clk/ralink/clk-mtmips.c:359:9: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>     359 |         return ret;
>         |                ^~~
>   drivers/clk/ralink/clk-mtmips.c:335:9: note: initialize the variable 'ret' to silence this warning
>     335 |         int ret, i;
>         |                ^
>         |                 = 0
>   2 errors generated.
> 
> Set ret to the return value of clk_hw_register_fixed_rate() using the
> PTR_ERR() macro, which ensures ret is not used uninitialized, clearing
> up the warning.
> 
> Fixes: 6f3b15586eef ("clk: ralink: add clock and reset driver for MTMIPS SoCs")
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1879
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/clk/ralink/clk-mtmips.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/ralink/clk-mtmips.c b/drivers/clk/ralink/clk-mtmips.c
> index 9322c6210a33..1e7991439527 100644
> --- a/drivers/clk/ralink/clk-mtmips.c
> +++ b/drivers/clk/ralink/clk-mtmips.c
> @@ -292,6 +292,7 @@ static int mtmips_register_fixed_clocks(struct clk_hw_onecell_data *clk_data,
>  						      sclk->parent, 0,
>  						      sclk->rate);
>  		if (IS_ERR(sclk->hw)) {
> +			ret = PTR_ERR(sclk->hw);
>  			pr_err("Couldn't register fixed clock %d\n", idx);
>  			goto err_clk_unreg;
>  		}
> @@ -342,6 +343,7 @@ static int mtmips_register_factor_clocks(struct clk_hw_onecell_data *clk_data,
>  						  sclk->parent, sclk->flags,
>  						  sclk->mult, sclk->div);
>  		if (IS_ERR(sclk->hw)) {
> +			ret = PTR_ERR(sclk->hw);
>  			pr_err("Couldn't register factor clock %d\n", idx);
>  			goto err_clk_unreg;
>  		}
> 
> ---
> base-commit: fd99ac5055d4705e91c73d1adba18bc71c8511a8
> change-id: 20230622-mips-ralink-clk-wuninitialized-150bd0336187

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
