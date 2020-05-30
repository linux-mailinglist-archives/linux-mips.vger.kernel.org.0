Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99CA81E916A
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 15:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728433AbgE3NP6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 30 May 2020 09:15:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:53780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727947AbgE3NP5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 30 May 2020 09:15:57 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8AFBA2074A;
        Sat, 30 May 2020 13:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590844557;
        bh=VceDSw21CiOfGJeqHBr1CP4d0xYCY00d31XuwrH77Jk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aVFSSCom4H9LHoxhuFn21pSETGkaKylK0YvCvLucRPX0jI6hztPTZnbP7mvnCxy4l
         oA+AGKd0ckZc3i0+ubbQrSZm01+ROfuZeNR0pGFvQomCNspGw9SscgzpO6h2dS5r5E
         z1k18Ix4rl6KA3vuYsaD/PcAHZOHHaKWMEJPDUBk=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jf1L9-00GXrc-Uf; Sat, 30 May 2020 14:15:56 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Jason Cooper <jason@lakedaemon.net>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Huacai Chen <chenhc@lemote.com>
Subject: Re: [PATCH 0/2] irqchip: loongson-*: Two small fixes
Date:   Sat, 30 May 2020 14:15:35 +0100
Message-Id: <159084442227.135078.812738924633130027.b4-ty@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200530121113.1797678-1-jiaxun.yang@flygoat.com>
References: <20200530121113.1797678-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jiaxun.yang@flygoat.com, jason@lakedaemon.net, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, tglx@linutronix.de, chenhc@lemote.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 30 May 2020 20:11:11 +0800, Jiaxun Yang wrote:
> 
> Jiaxun Yang (2):
>   irqchip: loongson-pci-msi: Fix a typo in Kconfig
>   irqchip: loongson-*: Fix COMPILE_TEST
> 
>  drivers/irqchip/Kconfig                | 2 +-
>  drivers/irqchip/irq-loongson-htpic.c   | 4 ++++
>  drivers/irqchip/irq-loongson-htvec.c   | 4 ++++
>  drivers/irqchip/irq-loongson-liointc.c | 4 ++++
>  4 files changed, 13 insertions(+), 1 deletion(-)
> 
> [...]

Applied to irqchip-next, thanks!

[1/2] irqchip/loongson-pci-msi: Fix a typo in Kconfig
      commit: 8abfb9b77d8707873088356cfee5bcbb842212af

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.

