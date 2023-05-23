Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB8970D89F
	for <lists+linux-mips@lfdr.de>; Tue, 23 May 2023 11:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236344AbjEWJOO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 May 2023 05:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236325AbjEWJOC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 May 2023 05:14:02 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 82A38129
        for <linux-mips@vger.kernel.org>; Tue, 23 May 2023 02:13:54 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1q1O5L-0007MY-03; Tue, 23 May 2023 11:13:39 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 48418C02E6; Tue, 23 May 2023 11:13:31 +0200 (CEST)
Date:   Tue, 23 May 2023 11:13:31 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     sunying@nj.iscas.ac.cn
Cc:     linux-mips@vger.kernel.org
Subject: Re: Bug: arch/mips/txx9/generic/setup.c: 714-716: dead code
Message-ID: <20230523091331.GH9484@alpha.franken.de>
References: <61c44cda.1230d.188426efee3.Coremail.sunying@nj.iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61c44cda.1230d.188426efee3.Coremail.sunying@nj.iscas.ac.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 22, 2023 at 03:49:10PM +0800, sunying@nj.iscas.ac.cn wrote:
> The second element of array "struct resource res []" in arch/mips/txx9/generic/setup.c: 714-716 will run
> only if the conditions "#if IS_ENABLED(CONFIG_TXX9_DMAC)"(line 707) and "#ifndef CONFIG_MACH_TX49XX" (line 713) both are true.
> 
> 707 #if IS_ENABLED(CONFIG_TXX9_DMAC)
> 708         struct resource res[] = {
> 709                 {
> 710                         .start = baseaddr,
> 711                         .end = baseaddr + 0x800 - 1,
> 712                         .flags = IORESOURCE_MEM,
> 713 #ifndef CONFIG_MACH_TX49XX
> 714                 }, {
> 715                         .start = irq,
> 716                         .flags = IORESOURCE_IRQ,
> 717 #endif
> 718                 }
> 719          };
> 
> 
> But according to the definition of the configuration option CONFIG_TXX9_DMAC (drivers/dma/Kconfig:614):
> 
> config TXX9_DMAC
>         tristate "Toshiba TXx9 SoC DMA support"
>         depends on MACH_TX49XX
>         select DMA_ENGINE
>         help
>           Support the TXx9 SoC internal DMA controller.  This can be
>           integrated in chips such as the Toshiba TX4927/38/39.
> 
> "CONFIG_TXX9_DMAC" depends on "CONFIG_MACH_TX49XX". "CONFIG_TXX9_DMAC" will only be enabled 
> if "CONFIG_MACH_TX49XX" is enabled. So the lines 714-716 in arch/mips/txx9/generic/setup.c is a dead code.
> 
> I am not sure whether directly delete this dead code or 
> modify the dependency of the configuration option.
> May I ask how to modify it?

just remove the dead code. This part was for TX39 SoCs and support for
them has been removed.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
