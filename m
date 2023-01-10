Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96CD1664632
	for <lists+linux-mips@lfdr.de>; Tue, 10 Jan 2023 17:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238534AbjAJQe6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Jan 2023 11:34:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239115AbjAJQeK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Jan 2023 11:34:10 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 02C8A8BF1F;
        Tue, 10 Jan 2023 08:33:43 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pFHZE-0000fQ-00; Tue, 10 Jan 2023 17:33:40 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 771C3C25E7; Tue, 10 Jan 2023 09:30:21 +0100 (CET)
Date:   Tue, 10 Jan 2023 09:30:21 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     masahiroy@kernel.org, ndesaulniers@google.com, nicolas@fjasle.eu,
        trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, kernel test robot <lkp@intel.com>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH 02/14] MIPS: Always use -Wa,-msoft-float and eliminate
 GAS_HAS_SET_HARDFLOAT
Message-ID: <20230110083021.GA5608@alpha.franken.de>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-2-658cbc8fc592@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228-drop-qunused-arguments-v1-2-658cbc8fc592@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 04, 2023 at 12:54:19PM -0700, Nathan Chancellor wrote:
> -Wa,-msoft-float is tested with as-option, which will be a problem for
> clang with an upcoming change to move as-option to use KBUILD_AFLAGS
> instead of KBUILD_CFLAGS due to a lack of '-mno-abicalls' in
> KBUILD_AFLAGS at the point that this check occurs; $(cflags-y) is added
> to KBUILD_AFLAGS towards the end of this file.
> 
>   clang: error: ignoring '-fno-PIE' option as it cannot be used with implicit usage of -mabicalls and the N64 ABI [-Werror,-Woption-ignored]
> 
> This could be resolved by switching to a cc-option check but
> '$(cflags-y)' would need to be added so that '-mno-abicalls' is present
> for the test. However, this check is no longer necessary, as
> -msoft-float is supported by all supported assembler versions (GNU as
> 2.25+ and LLVM 11+). Eliminate GAS_HAS_SET_HARDFLOAT and all of its
> uses, inlining SET_HARDFLOAT where necessary.
> 
> Link: https://lore.kernel.org/202209101939.bvk64Fok-lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: tsbogend@alpha.franken.de
> Cc: linux-mips@vger.kernel.org
> ---
>  arch/mips/Makefile                  | 11 +---------
>  arch/mips/include/asm/asmmacro-32.h |  4 ++--
>  arch/mips/include/asm/asmmacro.h    | 42 ++++++++++++++++++-------------------
>  arch/mips/include/asm/fpregdef.h    | 14 -------------
>  arch/mips/include/asm/mipsregs.h    | 20 ++++--------------
>  arch/mips/kernel/genex.S            |  2 +-
>  arch/mips/kernel/r2300_fpu.S        |  4 ++--
>  arch/mips/kernel/r4k_fpu.S          | 12 +++++------
>  arch/mips/kvm/fpu.S                 |  6 +++---
>  9 files changed, 40 insertions(+), 75 deletions(-)

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
