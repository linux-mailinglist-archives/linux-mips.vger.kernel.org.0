Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60A9E35C8DF
	for <lists+linux-mips@lfdr.de>; Mon, 12 Apr 2021 16:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238815AbhDLOhT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Apr 2021 10:37:19 -0400
Received: from elvis.franken.de ([193.175.24.41]:45417 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238789AbhDLOhT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Apr 2021 10:37:19 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lVxgR-0006ax-00; Mon, 12 Apr 2021 16:36:59 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 8E128C01E5; Mon, 12 Apr 2021 16:27:30 +0200 (CEST)
Date:   Mon, 12 Apr 2021 16:27:30 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Jinyang He <hejinyang@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix strnlen_user access check
Message-ID: <20210412142730.GA23146@alpha.franken.de>
References: <1618139092-4018-1-git-send-email-hejinyang@loongson.cn>
 <cbe5e79b-ee6c-5c59-0051-28e4d1152666@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbe5e79b-ee6c-5c59-0051-28e4d1152666@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 12, 2021 at 11:02:19AM +0800, Tiezhu Yang wrote:
> On 04/11/2021 07:04 PM, Jinyang He wrote:
> > Commit 04324f44cb69 ("MIPS: Remove get_fs/set_fs") brought a problem for
> > strnlen_user(). Jump out when checking access_ok() with condition that
> > (s + strlen(s)) < __UA_LIMIT <= (s + n). The old __strnlen_user_asm()
> > just checked (ua_limit & s) without checking (ua_limit & (s + n)).
> > Therefore, find strlen form s to __UA_LIMIT - 1 in that condition.
> > 
> > Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> > ---
> >   arch/mips/include/asm/uaccess.h | 11 +++++++++--
> >   1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
> > index 91bc7fb..85ba0c8 100644
> > --- a/arch/mips/include/asm/uaccess.h
> > +++ b/arch/mips/include/asm/uaccess.h
> > @@ -630,8 +630,15 @@ static inline long strnlen_user(const char __user *s, long n)
> >   {
> >   	long res;
> > -	if (!access_ok(s, n))
> > -		return -0;
> > +	if (unlikely(n <= 0))
> > +		return 0;
> > +
> > +	if (!access_ok(s, n)) {
> > +		if (!access_ok(s, 0))
> > +			return 0;
> > +
> > +		n = __UA_LIMIT - (unsigned long)s - 1;
> > +	}
> >   	might_fault();
> >   	__asm__ __volatile__(
> 
> The following simple changes are OK to fix this issue?
> 
> diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
> index 91bc7fb..eafc99b 100644
> --- a/arch/mips/include/asm/uaccess.h
> +++ b/arch/mips/include/asm/uaccess.h
> @@ -630,8 +630,8 @@ static inline long strnlen_user(const char __user *s, long n)
>  {
>         long res;
> -       if (!access_ok(s, n))
> -               return -0;
> +       if (!access_ok(s, 1))
> +               return 0;
>         might_fault();
>         __asm__ __volatile__(

that's the fix I'd like to apply. Could someone send it as a formal
patch ? Thanks.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
