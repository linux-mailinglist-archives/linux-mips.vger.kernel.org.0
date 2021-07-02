Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920FF3B9C9F
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jul 2021 08:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhGBG54 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Jul 2021 02:57:56 -0400
Received: from [115.28.160.31] ([115.28.160.31]:41746 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S230170AbhGBG5z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Jul 2021 02:57:55 -0400
Received: from ld50.lan (unknown [101.224.80.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 98AAF60114;
        Fri,  2 Jul 2021 14:55:22 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1625208922; bh=l6nNtMBrbd9/YgzMBRPnOZZn6huLGhQUw3VJmWG6Ea0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MszcFaKvcoeEURnunI485xpT87izE0Xt/YR/BamOL9zarn33l10z1czRnG9BqJ7FA
         QSQGAJuMxWqAvZZEtBv7U7ImG8ewFHUbS8sxqKbsIt3HjM50JrM0EqDsBe72y94KGM
         onHJ+3rVkhvV2RRStXmFPfVYJvU4C6HS15HMFPC0=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org
Subject: [PATCH v5 6/6] MIPS: Loongson: Enable LS2X RTC in loongson2k_defconfig
Date:   Fri,  2 Jul 2021 14:54:51 +0800
Message-Id: <20210702065451.1175356-7-git@xen0n.name>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210702065451.1175356-1-git@xen0n.name>
References: <20210702065451.1175356-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is now supported, enable for Loongson-2K systems.
Other systems are unaffected.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com> # loongson2k
Cc: linux-mips@vger.kernel.org
---
 arch/mips/configs/loongson2k_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/loongson2k_defconfig b/arch/mips/configs/loongson2k_defconfig
index e948ca487e2d..e15f34857956 100644
--- a/arch/mips/configs/loongson2k_defconfig
+++ b/arch/mips/configs/loongson2k_defconfig
@@ -280,6 +280,7 @@ CONFIG_USB_SERIAL=m
 CONFIG_USB_SERIAL_OPTION=m
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_CMOS=y
+CONFIG_RTC_DRV_LS2X=y
 CONFIG_DMADEVICES=y
 # CONFIG_CPU_HWMON is not set
 CONFIG_PM_DEVFREQ=y
-- 
2.30.1

