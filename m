Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 813F3745E40
	for <lists+linux-mips@lfdr.de>; Mon,  3 Jul 2023 16:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbjGCOMd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Jul 2023 10:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbjGCOM1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 3 Jul 2023 10:12:27 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A93E1E5B;
        Mon,  3 Jul 2023 07:12:25 -0700 (PDT)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
        id 1qGKHs-0008Fn-00; Mon, 03 Jul 2023 16:12:20 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 87CF9C0301; Mon,  3 Jul 2023 16:09:13 +0200 (CEST)
Date:   Mon, 3 Jul 2023 16:09:13 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhuacai@loongson.cn>
Cc:     Huacai Chen <chenhuacai@gmail.com>, linux-mips@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org,
        Feiyang Chen <chenfeiyang@loongson.cn>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH V2] MIPS: Loongson: Fix build error when make
 modules_install
Message-ID: <20230703140913.GB16247@alpha.franken.de>
References: <20230628110847.3168269-1-chenhuacai@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628110847.3168269-1-chenhuacai@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 28, 2023 at 07:08:47PM +0800, Huacai Chen wrote:
> After commit 0e96ea5c3eb5904e5dc2f ("MIPS: Loongson64: Clean up use of
> cc-ifversion") we get a build error when make modules_install:
> 
> cc1: error: '-mloongson-mmi' must be used with '-mhard-float'
> 
> The reason is when make modules_install, 'call cc-option' doesn't work
> in $(KBUILD_CFLAGS) of 'CHECKFLAGS'. Then there is no -mno-loongson-mmi
> applied and -march=loongson3a enable MMI instructions.
> 
> To be detail, the error message comes from the CHECKFLAGS invocation of
> $(CC) but it has no impact on the final result of make modules_install,
> it is purely a cosmetic issue. The error occurs because cc-option is
> defined in scripts/Makefile.compiler, which is not included in Makefile
> when running 'make modules_install', as install targets are not supposed
> to require the compiler; see commit 805b2e1d427aab4b ("kbuild: include
> Makefile.compiler only when compiler is needed"). As a result, the call
> to check for '-mno-loongson-mmi' just never happens.
> 
> Fix this by partially reverting to the old logic, use 'call cc-option'
> to conditionally apply -march=loongson3a and -march=mips64r2.
> 
> By the way, Loongson-2E/2F is also broken in commit 13ceb48bc19c563e05f4
> ("MIPS: Loongson2ef: Remove unnecessary {as,cc}-option calls") so fix it
> together.
> 
> Fixes: 13ceb48bc19c563e05f4 ("MIPS: Loongson2ef: Remove unnecessary {as,cc}-option calls")
> Fixes: 0e96ea5c3eb5904e5dc2 ("MIPS: Loongson64: Clean up use of cc-ifversion")
> Cc: stable@vger.kernel.org
> Cc: Feiyang Chen <chenfeiyang@loongson.cn>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
> V2: Update commit message and fix for LOONGSON2EF together.
> 
>  arch/mips/Makefile | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
