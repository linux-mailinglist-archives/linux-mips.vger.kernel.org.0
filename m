Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3167C23420F
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jul 2020 11:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731923AbgGaJJz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 31 Jul 2020 05:09:55 -0400
Received: from elvis.franken.de ([193.175.24.41]:56277 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731818AbgGaJJz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 31 Jul 2020 05:09:55 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k1R33-0005K6-01; Fri, 31 Jul 2020 11:09:53 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id DD277C0B21; Fri, 31 Jul 2020 11:05:26 +0200 (CEST)
Date:   Fri, 31 Jul 2020 11:05:26 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-mips@linux-mips.org,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: BMIPS: Disable pref 30 for buggy CPUs
Message-ID: <20200731090526.GB7946@alpha.franken.de>
References: <20200731042401.22871-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200731042401.22871-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 30, 2020 at 09:24:01PM -0700, Florian Fainelli wrote:
> Disable pref 30 by utilizing the standard quirk method and matching the
> affected SoCs: 7344, 7346, 7425.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  arch/mips/bmips/setup.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
> index 19308df5f577..df0efea12611 100644
> --- a/arch/mips/bmips/setup.c
> +++ b/arch/mips/bmips/setup.c
> @@ -110,6 +110,20 @@ static void bcm6368_quirks(void)
>  	bcm63xx_fixup_cpu1();
>  }
>  
> +static void bmips5000_pref30_quirk(void)
> +{
> +	__asm__ __volatile__(
> +	"	li	$8, 0x5a455048\n"
> +	"	.word	0x4088b00f\n"	/* mtc0 $8, $22, 15 */
> +	"	nop; nop; nop\n"
> +	"	.word	0x4008b008\n"	/* mfc0 $8, $22, 8 */
> +	/* disable "pref 30" on buggy CPUs */
> +	"	lui	$9, 0x0800\n"
> +	"	or	$8, $9\n"
> +	"	.word	0x4088b008\n"	/* mtc0 $8, $22, 8 */
> +	: : : "$8", "$9");

what's the reason for not using mfc/mtc here ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
