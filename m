Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 358586B8CD
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jul 2019 11:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbfGQJEC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jul 2019 05:04:02 -0400
Received: from elvis.franken.de ([193.175.24.41]:38560 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725941AbfGQJEC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 17 Jul 2019 05:04:02 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1hnfqw-0005ZZ-00; Wed, 17 Jul 2019 11:03:58 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A00ADC12B1; Wed, 17 Jul 2019 11:03:22 +0200 (CEST)
Date:   Wed, 17 Jul 2019 11:03:22 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: kernel: only use i8253 clocksource with periodic
 clockevent
Message-ID: <20190717090322.GA8585@alpha.franken.de>
References: <20190513114725.17823-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513114725.17823-1-tbogendoerfer@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 13, 2019 at 01:47:25PM +0200, Thomas Bogendoerfer wrote:
> i8253 clocksource needs a free running timer. This could only
> be used, if i8253 clockevent is set up as periodic.
> 
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> ---
>  arch/mips/kernel/i8253.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/i8253.c b/arch/mips/kernel/i8253.c
> index 5f209f111e59..df7ddd246eaa 100644
> --- a/arch/mips/kernel/i8253.c
> +++ b/arch/mips/kernel/i8253.c
> @@ -32,7 +32,8 @@ void __init setup_pit_timer(void)
>  
>  static int __init init_pit_clocksource(void)
>  {
> -	if (num_possible_cpus() > 1) /* PIT does not scale! */
> +	if (num_possible_cpus() > 1 || /* PIT does not scale! */
> +	    !clockevent_state_periodic(&i8253_clockevent))
>  		return 0;
>  
>  	return clocksource_i8253_init();
> -- 
> 2.13.7

Paul,

can you take it into 5.3 ? This fixes a boot ang on mips/jazz and
is the same as x86 does for quite some time.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
