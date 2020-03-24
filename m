Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB04919154A
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 16:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbgCXPrw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 11:47:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:40878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727826AbgCXPrv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Mar 2020 11:47:51 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB90A2076F;
        Tue, 24 Mar 2020 15:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585064871;
        bh=WtoEx689uIy92IuHg5B9nN2uCDlFhHGSJ6zHQ9Z88oE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=auDPhKwZe7ytFdQC8taLMul6iS+xsqB/7ZpB/ZE4b8VePFmsYDE1fldA2fWnfpm14
         H8lop1IChvRXPSjcuLF9QfEyGadWme4M5C8zKSuD/kLMPS4KHs8kbOblr/AAjYYozz
         w3FhB7T4ac8r4+ee6enf1SA31lUjkVzDYzsHTUzo=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jGlmP-00FKPD-5c; Tue, 24 Mar 2020 15:47:49 +0000
Date:   Tue, 24 Mar 2020 15:47:47 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 00/11] Modernize Loongson64 Machine v6
Message-ID: <20200324154747.18e8ccd5@why>
In-Reply-To: <20200324153624.23109-1-jiaxun.yang@flygoat.com>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
        <20200324153624.23109-1-jiaxun.yang@flygoat.com>
Organization: Approximate
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, tsbogend@alpha.franken.de, chenhc@lemote.com, allison@lohutok.net, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Jiaxun,

On Tue, 24 Mar 2020 23:35:57 +0800
Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

> Loongson have a long history of contributing their code to mainline kernel.
> However, it seems like recent years, they are focusing on maintain a kernel by themselves
> rather than contribute there code to the community.
> 
> Kernel is progress rapidly too. Their code slept in mainline for a long peroid without proper
> maintainance and became outdated.
> 
> This patchset brings modern DeviceTree and irqchip support to the Loongson64 machine, and leaves
> Loongson 2e/f alone since they are too legacy to touch.
> 
> PCI and some legacy I/O device will be converted later, together with LS7A PCH support.
> 
> v1:
> - dt-bindings fixup according to Rob's comments
> - irqchip fixup according to Marc's comments
> - ls3-iointc: Make Core&IP map per-IRQ
> - Regenerate kconfigs
> - Typo & style improvements
> 
> v2:
> - dt-bindings: Fix IOINTC, collect Rob's review tag
> - dtbs: Drop CPU Node, merge different ways according to Huacai and Paul's comments
> 
> v3:
> - Split code have been merged
> - Fix IOINTC binding to allow map any child IRQ to and parent
> - Convert "HTINTC" into "HTPIC", which mixed HT vectors processing and i8259
> - Naming style fix according to Huacai's suggestions
> 
> v4:
> - More naming related fixes
> 
> v5:
> - irqchip fixes thanks to maz (see per file changelog)
> - Remove unnecessary details in dt-bindings
> - Credit Huacai with Co-developed-by
> 
> v6:
> - HTPIC minor fix
> - device binding naming fix 
> 
> ---
> Jiaxun Yang (11):
>   irqchip: Add driver for Loongson I/O Local Interrupt Controller
>   irqchip: loongson-liointc: Workaround LPC IRQ Errata
>   dt-bindings: interrupt-controller: Add Loongson LIOINTC
>   irqchip: Add driver for Loongson-3 HyperTransport PIC controller
>   dt-bindings: interrupt-controller: Add Loongson-3 HTPIC
>   irqchip: mips-cpu: Convert to simple domain
>   MIPS: Loongson64: Drop legacy IRQ code
>   dt-bindings: mips: Add loongson boards
>   MIPS: Loongson64: Add generic dts
>   MIPS: Loongson64: Load built-in dtbs
>   MIPS: Loongson64: Move MIPS_CPU_IRQ_BASE

[...]

How do you want to get these merged? I can take the first 6 patches
through the irqchip tree, and leave the rest to go via the MIPS tree.

Otherwise, if you plan to have the whole thing go via the MIPS tree,
please add my:

Reviewed-by: Marc Zyngier <maz@kernel.org>

to patches 1, 2, 4 and 6.

Please let me know quickly, as I'd like to close the irqchip tree
tomorrow.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
