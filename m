Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 836042ED455
	for <lists+linux-mips@lfdr.de>; Thu,  7 Jan 2021 17:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728601AbhAGQ3q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Jan 2021 11:29:46 -0500
Received: from elvis.franken.de ([193.175.24.41]:34729 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727753AbhAGQ3q (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 Jan 2021 11:29:46 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kxY9o-0000Mi-01; Thu, 07 Jan 2021 17:29:04 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A44DEC080E; Thu,  7 Jan 2021 17:26:40 +0100 (CET)
Date:   Thu, 7 Jan 2021 17:26:40 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     John Crispin <john@phrozen.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Dmitry Golovin <dima@golovin.in>
Subject: Re: [PATCH] MIPS: lantiq: Explicitly compare LTQ_EBU_PCC_ISTAT
 against 0
Message-ID: <20210107162640.GB11882@alpha.franken.de>
References: <20210105201548.50920-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105201548.50920-1-natechancellor@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 05, 2021 at 01:15:48PM -0700, Nathan Chancellor wrote:
> When building xway_defconfig with clang:
> 
> arch/mips/lantiq/irq.c:305:48: error: use of logical '&&' with constant
> operand [-Werror,-Wconstant-logical-operand]
>         if ((irq == LTQ_ICU_EBU_IRQ) && (module == 0) && LTQ_EBU_PCC_ISTAT)
>                                                       ^ ~~~~~~~~~~~~~~~~~
> arch/mips/lantiq/irq.c:305:48: note: use '&' for a bitwise operation
>         if ((irq == LTQ_ICU_EBU_IRQ) && (module == 0) && LTQ_EBU_PCC_ISTAT)
>                                                       ^~
>                                                       &
> arch/mips/lantiq/irq.c:305:48: note: remove constant to silence this
> warning
>         if ((irq == LTQ_ICU_EBU_IRQ) && (module == 0) && LTQ_EBU_PCC_ISTAT)
>                                                      ~^~~~~~~~~~~~~~~~~~~~
> 1 error generated.
> 
> Explicitly compare the constant LTQ_EBU_PCC_ISTAT against 0 to fix the
> warning. Additionally, remove the unnecessary parentheses as this is a
> simple conditional statement and shorthand '== 0' to '!'.
> 
> Fixes: 3645da0276ae ("OF: MIPS: lantiq: implement irq_domain support")
> Link: https://github.com/ClangBuiltLinux/linux/issues/807
> Reported-by: Dmitry Golovin <dima@golovin.in>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  arch/mips/lantiq/irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
