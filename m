Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10E8B57273B
	for <lists+linux-mips@lfdr.de>; Tue, 12 Jul 2022 22:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbiGLU2t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Jul 2022 16:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiGLU2s (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 Jul 2022 16:28:48 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81EB921252
        for <linux-mips@vger.kernel.org>; Tue, 12 Jul 2022 13:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1657657722; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P6AF5YfII0kqwpEWbII933myZBkIuec0Ljvi7Xb7dpQ=;
        b=CpvGwsfOScDg4MwOP83c7t9QT7c/H97TJCGhXMTiLc2XFwKMjp1FvLcGwLlkt9fWSRRGc0
        4VPkpryo3UuVAOwYWw9WCtMXq3chuLz4SSxptNwEb6nqD5FNDPg3l++he4JH4nLXcd0459
        fb0utqRZE3nMLux2B6qHNUD0M64CSks=
Date:   Tue, 12 Jul 2022 21:28:27 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: RFC: Proper suspend-to-ram implementation of Ingenic SoCs
To:     Mike Yang <reimu@sudomaker.com>
Cc:     linux-mips@vger.kernel.org,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>,
        aidanmacdonald.0x0@gmail.com
Message-Id: <FVCXER.DV642VYMZNVS1@crapouillou.net>
In-Reply-To: <e58406ce-a79b-fe91-9587-09e87953d0ab@sudomaker.com>
References: <e58406ce-a79b-fe91-9587-09e87953d0ab@sudomaker.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Mike,

Le mer., juil. 13 2022 at 03:19:32 +0800, Mike Yang=20
<reimu@sudomaker.com> a =E9crit :
> The suspend-to-ram implementation of Ingenic SoCs in the current=20
> kernel is nowhere near usable, especially for the X series SoCs.=20
> Since it involves turning off CPU core power and putting DRAM into=20
> self-refresh mode, things are a bit complicated. Turning off CPU core=20
> power means all register files and cache contents are lost. Putting=20
> DRAM into self-refresh mode means it will no longer respond to bus=20
> transactions.

Suspend-to-RAM is well-tested and has been working fine for ages on all=20
JZ SoCs, so I wouldn't call it "nowhere near usable". Zhou also=20
implemented it on X-series SoCs.

> I ported the implementation from Ingenic's 3.10 kernel to 5.18, and=20
> it worked. But it involves a separate piece of executable code, and=20
> apparently there's no way to eliminate it. During pm_enter(), various=20
> CPM registers are configured to turn off CPU core and put DRAM into=20
> self-refresh upon issuing the "wait" instruction, this piece of=20
> executable code will be copied to the on-chip SRAM, and its entry=20
> address will be written into the CPM.SLPC register. Then, cache will=20
> be flushed and CPU register files (incl. CP0, CP1 stuff) will also be=20
> saved in the SRAM. Finally, the "wait" instruction will be issued,=20
> and the suspend procedure completed. When any external events trigger=20
> a resume, the CPU is powered on, and immediately jumps to the PC=20
> stored in CPM.SLPC, and starts executing the piece of code. The code=20
> will perform the usual crt0 stuff on MIPS machines, reconfigure the=20
> DRAM into normal mode, and finally restore the register files. Then=20
> the control flow goes back to pm_enter(), and the resume procedure is=20
> completed.

This sounds extremely complex and way overkill. But you don't need any=20
of this.

> The suspend-to-ram really saves a lot of power. For my particular=20
> board, the idle power consumption is about 0.24W (1.25V Vcore,=20
> 1.2GHz, 1000Hz, preempt). After suspend-to-ram, it drops to only=20
> 0.045W.

Yes, doesn't surprise me. The RG-350 (JZ4770 based) can last about ~6=20
hours of up-time, and when put  to sleep it will survive a few weeks.

> So here are my questions:
> 1. I don't see a way to eliminate the piece of executable code in=20
> SRAM. Is there any other ways?

There is what's already implemented, yes. When triggering a suspend,=20
the CPM.LCR.LPM setting is set to SLEEP mode=20
(drivers/clk/ingenic/pm.c), then the ingenic_pm_enter() function=20
(arch/mips/generic/board-ingenic.c) just executes the "wait" CPU=20
instruction to put the CPU to sleep. All clocks but the RTC one are=20
disabled until an interrupt is raised.

> 2. If we can't eliminate the code in SRAM, what's the accepted way of=20
> integrating it into the kernel tree?

Already upstream :)

> 3. If the hardware doesn't have 32k crystal connected, or the RTC is=20
> stripped off (e.g. X1501), some CPM registers need to be configured=20
> differently. How could we provide this configuration?

It's already supported. The RTC clock can be re-parented (in device=20
tree) to the EXT/512 clock, which is (as its name suggests) derived=20
from the external EXT oscillator.

Hopefully I answered all your questions.

Cheers,
-Paul


