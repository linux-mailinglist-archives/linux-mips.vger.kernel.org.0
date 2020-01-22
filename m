Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBF20145349
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2020 11:59:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbgAVK7y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jan 2020 05:59:54 -0500
Received: from mail.dlink.ru ([178.170.168.18]:55172 "EHLO fd.dlink.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726049AbgAVK7x (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Jan 2020 05:59:53 -0500
Received: by fd.dlink.ru (Postfix, from userid 5000)
        id CF4E61B217DC; Wed, 22 Jan 2020 13:59:50 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru CF4E61B217DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
        t=1579690791; bh=YQqf5s0nBMnUvB2axoLErYtQEUvavXKoWZbfodgwkAI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=TaI0AEtABSUPBSMimJAphhlH35IUbagmP29yljsbztWd/u8yZgjS62/DGSqbahQDY
         Fyb7COnmpiCZV4O8ZtUPVUAycndFeZOujGW36SHPqBNUNo5Cwgr/mTEhdAF8Ss7vS1
         eialWzppOdbu9Vj6+yDusDlIxkzYZWgeNnWIENuM=
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dlink.ru
X-Spam-Level: 
X-Spam-Status: No, score=-99.2 required=7.5 tests=BAYES_50,URIBL_BLOCKED,
        USER_IN_WHITELIST autolearn=disabled version=3.4.2
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
        by fd.dlink.ru (Postfix) with ESMTP id 57F321B214D2;
        Wed, 22 Jan 2020 13:59:22 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 57F321B214D2
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
        by mail.rzn.dlink.ru (Postfix) with ESMTP id 409701B217C5;
        Wed, 22 Jan 2020 13:59:21 +0300 (MSK)
Received: from localhost.localdomain (unknown [196.196.203.126])
        by mail.rzn.dlink.ru (Postfix) with ESMTPA;
        Wed, 22 Jan 2020 13:59:21 +0300 (MSK)
From:   Alexander Lobakin <alobakin@dlink.ru>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Alexander Lobakin <alobakin@dlink.ru>,
        Michal Simek <michal.simek@xilinx.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH mips-next 2/5] MIPS: generic: don't unconditionally select PINCTRL
Date:   Wed, 22 Jan 2020 13:58:49 +0300
Message-Id: <20200122105852.8788-3-alobakin@dlink.ru>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122105852.8788-1-alobakin@dlink.ru>
References: <20200122105852.8788-1-alobakin@dlink.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CONFIG_PINCTRL was converted from hidden selectable to a visible option
with commit d219b924611a ("pinctrl: change Kconfig PINCTRL variable to
a menuconfig"). Remove unconditional select and enable this symbol in
Ocelot config, which currently is the only user among generic boards.

Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
---
 arch/mips/Kconfig                             | 1 -
 arch/mips/configs/generic/board-ocelot.config | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index b937a883b029..c5498146bd3b 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -117,7 +117,6 @@ config MIPS_GENERIC
 	select MIPS_L1_CACHE_SHIFT_7
 	select NO_EXCEPT_FILL
 	select PCI_DRIVERS_GENERIC
-	select PINCTRL
 	select SMP_UP if SMP
 	select SWAP_IO_SPACE
 	select SYS_HAS_CPU_MIPS32_R1
diff --git a/arch/mips/configs/generic/board-ocelot.config b/arch/mips/configs/generic/board-ocelot.config
index 1134fbb99fc2..7626f2a75b03 100644
--- a/arch/mips/configs/generic/board-ocelot.config
+++ b/arch/mips/configs/generic/board-ocelot.config
@@ -41,6 +41,7 @@ CONFIG_SPI_DESIGNWARE=y
 CONFIG_SPI_DW_MMIO=y
 CONFIG_SPI_SPIDEV=y
 
+CONFIG_PINCTRL=y
 CONFIG_PINCTRL_OCELOT=y
 
 CONFIG_GPIO_SYSFS=y
-- 
2.25.0

