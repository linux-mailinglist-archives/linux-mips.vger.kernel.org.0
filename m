Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D36D5683EE
	for <lists+linux-mips@lfdr.de>; Wed,  6 Jul 2022 11:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbiGFJnS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Jul 2022 05:43:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233304AbiGFJnD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Jul 2022 05:43:03 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A5F2C24085;
        Wed,  6 Jul 2022 02:42:36 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1o91YH-0003Nf-00; Wed, 06 Jul 2022 11:42:33 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 869D2C0230; Wed,  6 Jul 2022 10:19:01 +0200 (CEST)
Date:   Wed, 6 Jul 2022 10:19:01 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Sander Vanheule <sander@svanheule.net>,
        Aleksander Jan Bajkowski <olek2@wp.pl>,
        martin.blumenstingl@googlemail.com, hauke@hauke-m.de,
        git@birger-koblitz.de, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: smp-mt: enable all hardware interrupts on second
 VPE
Message-ID: <20220706081901.GA10797@alpha.franken.de>
References: <20220702190705.5319-1-olek2@wp.pl>
 <3c9a032edd0fb9b9608ad3ca08d6e3cc38f21464.camel@svanheule.net>
 <87fsjen2kl.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fsjen2kl.wl-maz@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jul 06, 2022 at 08:05:30AM +0100, Marc Zyngier wrote:
> On Sun, 03 Jul 2022 19:15:11 +0100,
> Sander Vanheule <sander@svanheule.net> wrote:
> > 
> > Hi Aleksander,
> > 
> > Since this is IRQ related: +CC Marc Zyngier
> > 
> > On Sat, 2022-07-02 at 21:07 +0200, Aleksander Jan Bajkowski wrote:
> > > This patch is needed to handle interrupts by the second VPE on
> > > the Lantiq xRX200, xRX300 and xRX330 SoCs. In these chips, 32 ICU
> > > interrupts are connected to each hardware line. The SoC supports
> > > a total of 160 interrupts. Currently changing smp_affinity to the
> > > second VPE hangs interrupts.
> > > 
> > > This problem affects multithreaded SoCs with a custom interrupt
> > > controller. Chips with 1004Kc core and newer use the MIPS GIC.
> > > 
> > > Also CC'ed Birger Koblitz and Sander Vanheule. Both are working
> > > on support for Realtek RTL930x chips with 34Kc core and Birger
> > > has added a patch in OpenWRT that also enables all interrupt
> > > lines. So it looks like this patch is useful for more SoCs.
> > > 
> > > Tested on lantiq xRX200 and xRX330.
> > > 
> > > Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> > 
> > Thanks for bringing up this issue. Like you say OpenWrt carries a
> > similar patch, and I also carry a patch on my tree to enable all CPU
> > IRQ lines.
> > 
> > Indiscriminately enabling all IRQ lines doesn't sit quite right with
> > me though, since I would expect these to be enabled
> > on-demand. I.e. when a peripheral requests an IRQ, or when an IRQ
> > controller is cascaded into one of the CPU's interrupt lines. If I
> > understand correctly, the IRQ mask/unmask functions in
> > drivers/irqchip/irq-mips-cpu.c should do this.
> 
> But this is only enabling interrupts at the CPU level, right? And the
> irqchip is still in control of the masking of the individual
> interrupts?

in the Lantiq case yes

> If both assertions are true, then this patch seems OK. If it just let
> any interrupt through without any control, then this is wrong.
> 
> So which one is it?

if there isn't an additional irqchip connected to the cpu interrupt lines,
this patch will cause problems.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
