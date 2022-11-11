Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3F7B625DEC
	for <lists+linux-mips@lfdr.de>; Fri, 11 Nov 2022 16:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234872AbiKKPJD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Nov 2022 10:09:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234923AbiKKPIF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Nov 2022 10:08:05 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DDA376B211;
        Fri, 11 Nov 2022 07:06:50 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1otVcD-00037d-05; Fri, 11 Nov 2022 16:06:45 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D998FC11F2; Fri, 11 Nov 2022 16:05:51 +0100 (CET)
Date:   Fri, 11 Nov 2022 16:05:51 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     John Thomson <git@johnthomson.fastmail.com.au>
Cc:     keescook@chromium.org, linux-mips@vger.kernel.org,
        linux-hardening@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] mips: boot/compressed: use __NO_FORTIFY
Message-ID: <20221111150551.GF13465@alpha.franken.de>
References: <20221031170749.2159430-1-git@johnthomson.fastmail.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031170749.2159430-1-git@johnthomson.fastmail.com.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 01, 2022 at 03:07:49AM +1000, John Thomson wrote:
> In the mips CONFIG_SYS_SUPPORTS_ZBOOT kernel, fix the compile error
> when using CONFIG_FORTIFY_SOURCE=y
> 
> LD      vmlinuz
> mipsel-openwrt-linux-musl-ld: arch/mips/boot/compressed/decompress.o: in
> function `decompress_kernel':
> ./include/linux/decompress/mm.h:(.text.decompress_kernel+0x177c):
> undefined reference to `warn_slowpath_fmt'
> 
> kernel test robot helped identify this as related to fortify. The error
> appeared with commit 54d9469bc515 ("fortify: Add run-time WARN for
> cross-field memcpy()")
> Link: https://lore.kernel.org/r/202209161144.x9xSqNQZ-lkp@intel.com/
> 
> Resolve this in the same style as commit cfecea6ead5f ("lib/string:
> Move helper functions out of string.c")
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 54d9469bc515 ("fortify: Add run-time WARN for cross-field memcpy()")
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: John Thomson <git@johnthomson.fastmail.com.au>
> ---
> v2:
> fix subject typo: FORITFY->FORTIFY
> ---
>  arch/mips/boot/compressed/decompress.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/boot/compressed/decompress.c b/arch/mips/boot/compressed/decompress.c
> index 5b38a802e101..c5dd415254d3 100644
> --- a/arch/mips/boot/compressed/decompress.c
> +++ b/arch/mips/boot/compressed/decompress.c
> @@ -9,6 +9,7 @@
>  
>  #define DISABLE_BRANCH_PROFILING
>  
> +#define __NO_FORTIFY
>  #include <linux/types.h>
>  #include <linux/kernel.h>
>  #include <linux/string.h>
> -- 
> 2.37.2

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
