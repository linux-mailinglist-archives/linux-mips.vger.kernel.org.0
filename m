Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52026223B9C
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jul 2020 14:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgGQMs5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jul 2020 08:48:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:50320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726056AbgGQMsz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 17 Jul 2020 08:48:55 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B97620775;
        Fri, 17 Jul 2020 12:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594990135;
        bh=oveUsRxE3s8oXYlG1x5cDW1hlCLkwDVYSrD4BqPqSFk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vpNpTMTzpGWGrYrt95Jx2Ul+jVSw/2ns4oGtH2ArDJV5sFfTY+L5ZG8UnreK2snAN
         jsKvjS4RcW9BDL1vMCJdhHfiOqmoGRs4KZRZ8xip3FLibEEUvPlCRWONxoh+MZCWHP
         bjZ0+sP08pROk+Uq7oCBCktebS+oGLFmDqD8bjVo=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jwPnJ-00Ccsm-L7; Fri, 17 Jul 2020 13:48:53 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     marex@denx.de, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 0/6] irqchip: Broadcom STB interrupt controller updates
Date:   Fri, 17 Jul 2020 13:48:43 +0100
Message-Id: <159499001591.546505.10421625541842835450.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200709223016.989-1-f.fainelli@gmail.com>
References: <20200709223016.989-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: alexandre.torgue@st.com, jason@lakedaemon.net, tglx@linutronix.de, linux-kernel@vger.kernel.org, f.fainelli@gmail.com, marex@denx.de, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 9 Jul 2020 15:30:10 -0700, Florian Fainelli wrote:
> This patch series contains a number of updates for Broadcom STB L2
> interrupt controllers to enable them as wake-up interrupt controllers,
> and add missing compatible strings that should be matched.
> 
> Thanks!
> 
> Florian Fainelli (3):
>   dt-bindings: interrupt-controller: Document Broadcom STB HIF L2
>   dt-bindings: interrupt-controller: Document UPG auxiliary L2
>   irqchip/brcmstb-l2: Match UPG_AUX_AON_INTR2 compatible
> 
> [...]

Applied to irq/irqchip-5.9, thanks!

[1/6] irqchip/bcm7120-l2: Set controller as wake-up source
      commit: f4ccb74569aaf839c2830382e902dd50d564df55
[2/6] irqchip/brcmstb-l2: Set controller as wake-up source
      commit: c8d8d6fc478a30f3e8ea5372664dd2a808c4311e
[3/6] dt-bindings: interrupt-controller: Document Broadcom STB HIF L2
      commit: 90b06e2dc4d1e8e9311a5275d53f61d90b61efdc
[4/6] irqchip/brcmstb-l2: Match HIF_SPI_INTR2 compatible
      commit: 9ac793dc5c97691152818305974299604c67e110
[5/6] dt-bindings: interrupt-controller: Document UPG auxiliary L2
      commit: 03a7ac47c14c7ef50742a34b3cfba1a47a578a03
[6/6] irqchip/brcmstb-l2: Match UPG_AUX_AON_INTR2 compatible
      commit: 240e176a96187ee84e63626ca0d1aac92da503aa

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


