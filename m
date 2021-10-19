Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461214340C2
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 23:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhJSVtL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 17:49:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:46550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229483AbhJSVtK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 19 Oct 2021 17:49:10 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5D775610A3;
        Tue, 19 Oct 2021 21:46:57 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=wait-a-minute.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mcwwh-000J9z-9J; Tue, 19 Oct 2021 22:46:55 +0100
Date:   Tue, 19 Oct 2021 22:46:54 +0100
Message-ID: <87y26ou1pt.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "moderated list:ARM SUB-ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 00/14] Modular Broadcom irqchip drivers
In-Reply-To: <9f54089d-86de-cb47-d623-fb30bc9aed73@gmail.com>
References: <20211009022023.3796472-1-f.fainelli@gmail.com>
        <9f54089d-86de-cb47-d623-fb30bc9aed73@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: f.fainelli@gmail.com, linux-kernel@vger.kernel.org, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, tsbogend@alpha.franken.de, tglx@linutronix.de, robh+dt@kernel.org, frowand.list@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, devicetree@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 19 Oct 2021 20:13:08 +0100,
Florian Fainelli <f.fainelli@gmail.com> wrote:
> 
> On 10/8/21 7:20 PM, Florian Fainelli wrote:
> > Hi Thomas, Marc,
> > 
> > This patch series aims at allowing the 3 interrupt controller drivers
> > used on Broadcom STB platforms to be built as modules in order for those
> > to be shipped in a GKI enabled system (Android).
> > 
> > The irq-bcm7038-l1 requires us to export a number of symbols, which is
> > not great, but there are not obvious solutions other than adding
> > accessor functions to get the same information.
> > 
> > Assuming you are happy with the changes though, please do take the last
> > two changes as well through your tree.
> > 
> > Thanks!
> 
> Does this look reasonable to you? If so, can you apply all of those
> patches through the irqchip tree? Thanks!

Great timing! See my reply to patch #9. Please respin this to fix the
glaring issue I mentioned there.

	M.

-- 
Without deviation from the norm, progress is not possible.
