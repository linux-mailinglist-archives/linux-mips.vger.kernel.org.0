Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7663DA0A2
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jul 2021 11:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235592AbhG2Jx7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Jul 2021 05:53:59 -0400
Received: from elvis.franken.de ([193.175.24.41]:32870 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235610AbhG2Jx6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 29 Jul 2021 05:53:58 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1m92jg-00021m-01; Thu, 29 Jul 2021 11:53:52 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B7A8DC254D; Thu, 29 Jul 2021 11:53:42 +0200 (CEST)
Date:   Thu, 29 Jul 2021 11:53:42 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Rui Wang <wangrui@loongson.cn>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        hev <r@hev.cc>
Subject: Re: [RFC PATCH] locking/atomic: arch/mips: Fix
 atomic{_64,}_sub_if_positive
Message-ID: <20210729095342.GB8286@alpha.franken.de>
References: <20210729082549.144559-1-wangrui@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729082549.144559-1-wangrui@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 29, 2021 at 04:25:49PM +0800, Rui Wang wrote:
> This looks like a typo and that caused atomic64 test failed.
> 
> Signed-off-by: Rui Wang <wangrui@loongson.cn>
> Signed-off-by: hev <r@hev.cc>
> ---
>  arch/mips/include/asm/atomic.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.h
> index 95e1f7f3597f..a0b9e7c1e4fc 100644
> --- a/arch/mips/include/asm/atomic.h
> +++ b/arch/mips/include/asm/atomic.h
> @@ -206,7 +206,7 @@ ATOMIC_OPS(atomic64, xor, s64, ^=, xor, lld, scd)
>   * The function returns the old value of @v minus @i.
>   */
>  #define ATOMIC_SIP_OP(pfx, type, op, ll, sc)				\
> -static __inline__ int arch_##pfx##_sub_if_positive(type i, pfx##_t * v)	\
> +static __inline__ type arch_##pfx##_sub_if_positive(type i, pfx##_t * v)	\
>  {									\
>  	type temp, result;						\
>  									\

sub_if_postive looks unused to me. Could you send a patch removing it
instead ? riscv also has a sub_if_positive implementation, which looks
unused.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
