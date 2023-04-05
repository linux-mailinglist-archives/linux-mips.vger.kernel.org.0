Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAD226D76DE
	for <lists+linux-mips@lfdr.de>; Wed,  5 Apr 2023 10:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237490AbjDEI3G (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Apr 2023 04:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237500AbjDEI3B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Apr 2023 04:29:01 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7EB074EEF
        for <linux-mips@vger.kernel.org>; Wed,  5 Apr 2023 01:28:57 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pjyVe-0007pG-01; Wed, 05 Apr 2023 10:28:50 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D9339C2160; Wed,  5 Apr 2023 10:26:25 +0200 (CEST)
Date:   Wed, 5 Apr 2023 10:26:25 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     ndesaulniers@google.com, trix@redhat.com,
        linux-mips@vger.kernel.org, llvm@lists.linux.dev,
        patches@lists.linux.dev
Subject: Re: [PATCH] MIPS: Drop unused positional parameter in
 local_irq_{dis,en}able
Message-ID: <20230405082625.GB5556@alpha.franken.de>
References: <20230404-mips-unused-named-parameters-v1-1-71d6c656f1de@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404-mips-unused-named-parameters-v1-1-71d6c656f1de@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 04, 2023 at 02:18:41PM -0700, Nathan Chancellor wrote:
> When building with clang's integrated assembler, it points out that the
> CONFIG_CPU_HAS_DIEI versions of local_irq_enable and local_irq_disable
> have a named parameter that is not used in the body of the macro and it
> thinks that $8 is a positional parameter, rather than a register:
> 
>   arch/mips/include/asm/asmmacro.h:48:2: warning: macro defined with named parameters which are not used in macro body, possible positional parameter found in body which will have no effect
>    .macro local_irq_enable reg=$8
>    ^
> 
> The comment above the function that performs this check in LLVM notes
> that the warning may trigger in this case, even though it is not
> problematic. It is easy enough to clean this up by just omitting the
> named parameter for this version of the macro, as it is entirely unused.
> 
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1415
> Link: https://github.com/llvm/llvm-project/commit/81c944cadb7f9e55b3517b7423a820e2577b9279
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/mips/include/asm/asmmacro.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
