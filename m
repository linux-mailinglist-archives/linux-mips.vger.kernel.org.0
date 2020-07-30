Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8761E2331A8
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jul 2020 14:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgG3MGS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jul 2020 08:06:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:57266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726631AbgG3MGR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Jul 2020 08:06:17 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C9B122074B;
        Thu, 30 Jul 2020 12:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596110776;
        bh=/D2uOwXRivYhVR3101SZUAl6oVzLV/X8fj2bGvnloEg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pC+qVFJwJ2zytu75hZMiq1wncax1LIoAj3olIwU7ubeOHRppQf92/XfPjSJwJS5Wd
         jZh66MmIm0Y8cPi62qwBDDPVx3pIjVMab4aX6PhZe8MY6s67fSwwaIz0crzkwHYQ7+
         DI0gApk0ycAOkf8DftrHg4dFb+Syi4Hje9U0Iaq0=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1k17KB-00GFNE-50; Thu, 30 Jul 2020 13:06:15 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-mips@vger.kernel.org, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Fuxin Zhang <zhangfx@lemote.com>
Subject: Re: [PATCH V2 0/5] MIPS: Loongson64: Fix and improve irqchip drivers
Date:   Thu, 30 Jul 2020 13:06:03 +0100
Message-Id: <159611041857.27532.12008177304488845888.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1596099090-23516-1-git-send-email-chenhc@lemote.com>
References: <1596099090-23516-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: chenhc@lemote.com, tsbogend@alpha.franken.de, robh+dt@kernel.org, jason@lakedaemon.net, tglx@linutronix.de, linux-mips@vger.kernel.org, chenhuacai@gmail.com, jiaxun.yang@flygoat.com, zhangfx@lemote.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 30 Jul 2020 16:51:25 +0800, Huacai Chen wrote:
> Modernized Loongson64 platforms use a hierarchical interrupt controller
> architecture. For LS7A PCH, the hierarchy (from inside to outside) is
> CPUINTC --> LIOINTC --> HTVEC --> PCHPIC/PCHMSI. However, the current
> status is that there are several bugs in the LIOINTC and PCHPIC drivers,
> and the HTVEC driver should be improved to support 8 groups of vectors.
> Loonson64C support only 4 groups of HT vectors, and Loongson64G support
> as many as 8 groups, so the .dts file and dt-bindings description should
> also be updated.
> 
> [...]

Applied to irq/irqchip-next, thanks!

[1/5] dt-bindings: interrupt-controller: Update Loongson HTVEC description
      commit: 8fea4b2e804ab8ff93bd0d67a3dadee1d1a3e24f
[3/5] irqchip/loongson-liointc: Fix misuse of gc->mask_cache
      commit: c9c73a05413ea4a465cae1cb3593b01b190a233f
[4/5] irqchip/loongson-htvec: Support 8 groups of HT vectors
      commit: c47e388cfc648421bd821f5d9fda9e76eefe29cd
[5/5] irqchip/loongson-pch-pic: Fix the misused irq flow handler
      commit: ac62460c24126eb2442e3653a266ebbf05b004d8

Please note that I haven't taken patch #2, as it doesn't apply on top 
of irqchip/next. Please route it via the MIPS tree.

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


