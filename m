Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27AB3223BAD
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jul 2020 14:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgGQMs5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jul 2020 08:48:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:50374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726383AbgGQMs4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 17 Jul 2020 08:48:56 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF41120768;
        Fri, 17 Jul 2020 12:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594990135;
        bh=F6eEgVp0U4T1SirH3j5XNkxHKxWH25GXK+ol/tUBod0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rgBLivDNtaFi8UBruKjJEjKbAkOYpU0MmhU5ikrjEZsHfru/d1LxjuOUA6T/GYAsQ
         ps+VxKdUfxeto/Ubw/4fJE31A81ojxPgd88rSEiuHbfB+By0mtczTGZhEDPAT7UmNQ
         zZfP9010at2XK/8Yber/8DNkHP9AO+2BWJfUrK9g=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jwPnK-00Ccsm-DG; Fri, 17 Jul 2020 13:48:54 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     marex@denx.de, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] irqchip/irq-bcm7038-l1: Allow building on ARM 32-bit
Date:   Fri, 17 Jul 2020 13:48:44 +0100
Message-Id: <159499001591.546505.10547196907819467000.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200709234141.4901-1-f.fainelli@gmail.com>
References: <20200709234141.4901-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: alexandre.torgue@st.com, jason@lakedaemon.net, tglx@linutronix.de, linux-kernel@vger.kernel.org, f.fainelli@gmail.com, marex@denx.de, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 9 Jul 2020 16:41:41 -0700, Florian Fainelli wrote:
> We need to have a definition for cpu_logical_map[] which on ARM
> platforms is provided by asm/smp_plat.h. This header is not
> automatically included from linux/smp.h and untangling it is a bit
> difficult.

Applied to irq/irqchip-5.9, thanks!

[1/1] irqchip/irq-bcm7038-l1: Allow building on ARM 32-bit
      commit: 52b350cbc94721d87f087d1a5800f9531c2d682c

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


