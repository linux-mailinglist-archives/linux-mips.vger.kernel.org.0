Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A703E267FE6
	for <lists+linux-mips@lfdr.de>; Sun, 13 Sep 2020 17:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgIMPUl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 13 Sep 2020 11:20:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:52944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725941AbgIMPUe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 13 Sep 2020 11:20:34 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 42AA021D7E;
        Sun, 13 Sep 2020 15:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600010434;
        bh=Clk04YddRZ2JcKZqXKj7dicQ6+RqZ+uoJawDi26trmA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AR+IHDlliqAwQX3MJd6shqcPv6MPr2LCGsTr5lfz2LCm7axzD/BtgT5cyt9mkfbjs
         wZ9UWoxeLZ9eFG/gjxuw18htt7F3vMcRewxF3BNkja8zREee7hG0374lnyGZKX9us8
         MPzJQ2ne8OScWQyPM53noX5t0FPGt80RTkgvo0hg=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kHTns-00BS8M-Mh; Sun, 13 Sep 2020 16:20:32 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Huacai Chen <chenhc@lemote.com>,
        Thomas Gleixner <tglx@linutronix.de>, t-kristo@ti.com,
        lokeshvutla@ti.com, nm@ti.com, ssantosh@kernel.org,
        YueHaibing <yuehaibing@huawei.com>
Cc:     Huacai Chen <chenhuacai@gmail.com>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next] irqchip/ti-sci-intr: Fix unsigned comparison to zero
Date:   Sun, 13 Sep 2020 16:20:27 +0100
Message-Id: <160001025578.3778.3949132960332724841.b4-ty@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826035321.18620-1-yuehaibing@huawei.com>
References: <20200826035321.18620-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: tsbogend@alpha.franken.de, jason@lakedaemon.net, chenhc@lemote.com, tglx@linutronix.de, t-kristo@ti.com, lokeshvutla@ti.com, nm@ti.com, ssantosh@kernel.org, yuehaibing@huawei.com, chenhuacai@gmail.com, zhangfx@lemote.com, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 26 Aug 2020 11:53:21 +0800, YueHaibing wrote:
> ti_sci_intr_xlate_irq() return -ENOENT on fail, p_hwirq
> should be int type.

Applied to irq/irqchip-fixes-5.9, thanks!

[1/1] irqchip/ti-sci-intr: Fix unsigned comparison to zero
      commit: 8ddf1905a904ca86d71ca1c435e4b0b2a0b70df8

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


