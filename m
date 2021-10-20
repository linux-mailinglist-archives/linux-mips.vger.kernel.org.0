Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97442435511
	for <lists+linux-mips@lfdr.de>; Wed, 20 Oct 2021 23:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbhJTVQK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Oct 2021 17:16:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:52470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229842AbhJTVQJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 Oct 2021 17:16:09 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0739F611ED;
        Wed, 20 Oct 2021 21:13:55 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=hot-poop.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mdIuG-000XQi-Jd; Wed, 20 Oct 2021 22:13:52 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-kernel@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>, Ray Jui <rjui@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Will Deacon <will@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "moderated list:ARM SUB-ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v6 00/13] Modular Broadcom irqchip drivers
Date:   Wed, 20 Oct 2021 22:13:40 +0100
Message-Id: <163476440018.2197762.4815332437984645814.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211020184859.2705451-1-f.fainelli@gmail.com>
References: <20211020184859.2705451-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, f.fainelli@gmail.com, linux-mips@vger.kernel.org, linux@armlinux.org.uk, devicetree@vger.kernel.org, rjui@broadcom.com, bcm-kernel-feedback-list@broadcom.com, sbranden@broadcom.com, will@kernel.org, robh+dt@kernel.org, tsbogend@alpha.franken.de, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, tglx@linutronix.de, frowand.list@gmail.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 20 Oct 2021 11:48:46 -0700, Florian Fainelli wrote:
> This patch series aims at allowing the 3 interrupt controller drivers
> used on Broadcom STB platforms to be built as modules in order for those
> to be shipped in a GKI enabled system (Android).
> 
> The irq-bcm7038-l1 requires us to export a number of symbols, which is
> not great, but there are not obvious solutions other than adding
> accessor functions to get the same information.
> 
> [...]

Applied to irq/irqchip-next, thanks!

[01/13] MIPS: BMIPS: Remove use of irq_cpu_offline
        commit: bf8bde41d296849fd5f9db8becd71ad4e84bc521
[02/13] irqchip/irq-bcm7038-l1: Remove .irq_cpu_offline()
        commit: 57de689ce7829219db007dca5c88ae023a8be2d3
[03/13] irqchip/irq-bcm7038-l1: Use irq_get_irq_data()
        commit: 4b55192009fc62d2817efa2346ec1c0da4be1033
[04/13] irqchip/irq-bcm7038-l1: Gate use of CPU logical map to MIPS
        commit: 35eb2ef5df42d3c3d2186ae6dab5622a31e6ceee
[05/13] irqchip/irq-bcm7038-l1: Restrict affinity setting to MIPS
        commit: 3578fd47137c405b6fb9f90e2e6d1654c71f5e1e
[06/13] irqchip/irq-bcm7038-l1: Switch to IRQCHIP_PLATFORM_DRIVER
        commit: c057c799e379f940b0e14dc83f96540a4c27730a
[07/13] genirq: Export irq_gc_{unmask_enable,mask_disable}_reg
        commit: fcd0f63dec4abc281988ac08b83ca3ae6946c13b
[08/13] irqchip/irq-brcmstb-l2: Switch to IRQCHIP_PLATFORM_DRIVER
        commit: 51d9db5c8fbbed160081d4cb5c193abdf67ded05
[09/13] genirq: Export irq_gc_noop()
        commit: 945486bf1ee3362068d95b5e1b5d4a7779ea0aaf
[10/13] irqchip/irq-bcm7120-l2: Switch to IRQCHIP_PLATFORM_DRIVER
        commit: 3ac268d5ed2233d4a2db541d8fd744ccc13f46b0
[11/13] arm64: broadcom: Removed forced select of interrupt controllers
        commit: 9db71e8966bf7c80ab89d8d5b113d8daa3b237ea
[12/13] ARM: bcm: Removed forced select of interrupt controllers
        commit: c40ef4c57599c30efc0c1e8ad6bec4f842295521
[13/13] irqchip: Fix kernel-doc parameter typo for IRQCHIP_DECLARE
        commit: b8419e7be6c6029eee3448fda45f4f9ad340c4ca

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


