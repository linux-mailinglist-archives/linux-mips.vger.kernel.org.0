Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8520267FE3
	for <lists+linux-mips@lfdr.de>; Sun, 13 Sep 2020 17:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgIMPUe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 13 Sep 2020 11:20:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:52858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbgIMPUd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 13 Sep 2020 11:20:33 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E5D192074B;
        Sun, 13 Sep 2020 15:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600010433;
        bh=XUXzvJfALY6Pg2Kv2ptJRwbrWvJo0GlwL4+ZWgPXIV0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bAdzwhD4iZy1Cgc9/dqv2pwnN0ihl2IuWpIbgCTrvryjsUDtOiTxjElNp/HxAL8QR
         N6y7Cr4xvu32ZhIKwEnSDsmCN3V1snVz2Zcojb5yW7wEp1t20+CJ05S8Su/iwSKJ4z
         LjTW4fZKNyXZWM0H8sSCgCTmadJhAc4/3ja0eypc=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kHTnr-00BS8M-0c; Sun, 13 Sep 2020 16:20:31 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Huacai Chen <chenhc@lemote.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Huacai Chen <chenhuacai@gmail.com>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH V2 1/2] MIPS: Loongson64: Increase NR_IRQS to 320
Date:   Sun, 13 Sep 2020 16:20:25 +0100
Message-Id: <160001025578.3778.10349943866125417466.b4-ty@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <1599819978-13999-1-git-send-email-chenhc@lemote.com>
References: <1599819978-13999-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: tsbogend@alpha.franken.de, jason@lakedaemon.net, chenhc@lemote.com, tglx@linutronix.de, chenhuacai@gmail.com, zhangfx@lemote.com, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 11 Sep 2020 18:26:17 +0800, Huacai Chen wrote:
> Modernized Loongson64 uses a hierarchical organization for interrupt
> controllers (INTCs), all INTC nodes (not only leaf nodes) need some IRQ
> numbers. This means 280 (i.e., NR_IRQS_LEGACY + NR_MIPS_CPU_IRQS + 256)
> is not enough to represent all interrupts, so let's increase NR_IRQS to
> 320 (NR_IRQS_LEGACY + NR_MIPS_CPU_IRQS + NR_MAX_CHAINED_IRQS + 256).

Applied to irq/irqchip-fixes-5.9, thanks!

[2/2] irqchip/loongson-htvec: Fix initial interrupt clearing
      commit: 1d1e5630de78f7253ac24b92cee6427c3ff04d56

Patch 1/1 can go via the MIPS tree.

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


