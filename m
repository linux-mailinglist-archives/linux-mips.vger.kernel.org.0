Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 095742D78A1
	for <lists+linux-mips@lfdr.de>; Fri, 11 Dec 2020 16:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437536AbgLKPCl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Dec 2020 10:02:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:32784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437560AbgLKPCb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 11 Dec 2020 10:02:31 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F3D63206F8;
        Fri, 11 Dec 2020 15:01:49 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1knjvY-000TxV-6g; Fri, 11 Dec 2020 15:01:48 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     shawnguo@kernel.org, linux@rasmusvillemoes.dk, leoyang.li@nxp.com,
        mark.rutland@arm.com, zhiqiang.hou@nxp.com,
        Biwen Li <biwen.li@oss.nxp.com>, robh+dt@kernel.org,
        tglx@linutronix.de, Huacai Chen <chenhuacai@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     xiaobo.xie@nxp.com, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Biwen Li <biwen.li@nxp.com>, linux-kernel@vger.kernel.org,
        jiafei.pan@nxp.com, linux-mips@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] irqchip/loongson-htpic: Fix build warnings
Date:   Fri, 11 Dec 2020 15:01:33 +0000
Message-Id: <160769813659.482133.14256770645432673640.b4-ty@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <1607159744-995-1-git-send-email-chenhuacai@kernel.org>
References: <1607159744-995-1-git-send-email-chenhuacai@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: shawnguo@kernel.org, linux@rasmusvillemoes.dk, leoyang.li@nxp.com, mark.rutland@arm.com, zhiqiang.hou@nxp.com, biwen.li@oss.nxp.com, robh+dt@kernel.org, tglx@linutronix.de, chenhuacai@kernel.org, tsbogend@alpha.franken.de, xiaobo.xie@nxp.com, Zhiqiang.Hou@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, biwen.li@nxp.com, linux-kernel@vger.kernel.org, jiafei.pan@nxp.com, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 5 Dec 2020 17:15:44 +0800, Huacai Chen wrote:
> Fix build warnings as below:
> 
>    drivers/irqchip/irq-loongson-htpic.c: In function 'htpic_reg_init':
> >> drivers/irqchip/irq-loongson-htpic.c:62:12: warning: variable 'val' set but not used [-Wunused-but-set-variable]
>       62 |   uint32_t val;
>          |            ^~~
>    drivers/irqchip/irq-loongson-htpic.c: At top level:
> >> drivers/irqchip/irq-loongson-htpic.c:84:12: warning: no previous prototype for 'htpic_of_init' [-Wmissing-prototypes]
>       84 | int __init htpic_of_init(struct device_node *node, struct device_node *parent)
>          |            ^~~~~~~~~~~~~

Applied to irq/irqchip-next, thanks!

[1/1] irqchip/loongson-htpic: Fix build warnings
      commit: 3ee36352e26935c7e8145eb4e7ed38b536ca01fc

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


