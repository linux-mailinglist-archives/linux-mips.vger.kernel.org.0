Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C92B623A354
	for <lists+linux-mips@lfdr.de>; Mon,  3 Aug 2020 13:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgHCLbL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Aug 2020 07:31:11 -0400
Received: from elvis.franken.de ([193.175.24.41]:60602 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725945AbgHCLbK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 3 Aug 2020 07:31:10 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k2YgO-0003Nm-00; Mon, 03 Aug 2020 13:31:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 44A95C0B3D; Mon,  3 Aug 2020 13:30:20 +0200 (CEST)
Date:   Mon, 3 Aug 2020 13:30:20 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@linux-mips.org,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: BMIPS: Disable pref 30 for buggy CPUs
Message-ID: <20200803113020.GA8958@alpha.franken.de>
References: <20200731042401.22871-1-f.fainelli@gmail.com>
 <21ad5472-1287-acba-5604-09f2e633c043@flygoat.com>
 <46de49ec-cc8b-708a-0cdd-82389b041078@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46de49ec-cc8b-708a-0cdd-82389b041078@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jul 31, 2020 at 03:49:28PM -0700, Florian Fainelli wrote:
> On 7/31/20 3:34 AM, Jiaxun Yang wrote:
> > 
> > 
> > 在 2020/7/31 下午12:24, Florian Fainelli 写道:
> >> Disable pref 30 by utilizing the standard quirk method and matching the
> >> affected SoCs: 7344, 7346, 7425.
> >>
> >> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> >> ---
> >>   arch/mips/bmips/setup.c | 17 +++++++++++++++++
> >>   1 file changed, 17 insertions(+)
> >>
> >> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
> >> index 19308df5f577..df0efea12611 100644
> >> --- a/arch/mips/bmips/setup.c
> >> +++ b/arch/mips/bmips/setup.c
> >> @@ -110,6 +110,20 @@ static void bcm6368_quirks(void)
> >>       bcm63xx_fixup_cpu1();
> >>   }
> >>   +static void bmips5000_pref30_quirk(void)
> >> +{
> >> +    __asm__ __volatile__(
> >> +    "    li    $8, 0x5a455048\n"
> >> +    "    .word    0x4088b00f\n"    /* mtc0 $8, $22, 15 */
> >> +    "    nop; nop; nop\n"
> >> +    "    .word    0x4008b008\n"    /* mfc0 $8, $22, 8 */
> >> +    /* disable "pref 30" on buggy CPUs */
> >> +    "    lui    $9, 0x0800\n"
> >> +    "    or    $8, $9\n"
> >> +    "    .word    0x4088b008\n"    /* mtc0 $8, $22, 8 */
> >> +    : : : "$8", "$9");
> >> +}
> > Hi,
> > 
> > Is there any toolchain issue blocking read_c0_**** family helpers being
> > used?
> > 
> > Use .word looks unreasonable.
> 
> Yes, the assembler would be choking on the custom $22 selector, however

I guess you meant selector 8 and 15. If BMIPS has a 4 bit selector field
it might be good to do a binutils patch supporting it.

> this patch should not be necessary given that the boot loader (CFE)
> should have long been updated by now to disable pref 30.

so, should I add it or drop it ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
