Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57B4C3743BA
	for <lists+linux-mips@lfdr.de>; Wed,  5 May 2021 19:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234854AbhEEQvg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 May 2021 12:51:36 -0400
Received: from [115.28.160.31] ([115.28.160.31]:46572 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S236096AbhEEQrt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 May 2021 12:47:49 -0400
Received: from ld50.lan (unknown [101.224.80.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E194163574;
        Thu,  6 May 2021 00:39:51 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1620232792; bh=Lcq9mkPiHImH+I0BXf7yKYe8aKuXGEHCkOdhuMAr6s0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rG/csFDiYt1syAaZV1xJxYZYtJaHtpK7WS94ADQGLdaUXFZDZZADu4gUQpOJvJ9Pt
         B+wNArmcgiDqcCjUgRGAzYNl505eqcPylPxzNpEZvj0cdaIJtkrvZx3qTvSfMRy+7V
         PND93va90IXr4neME9CqTJvsGhJ1mQnZz7+lWzZw=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 6/6] MIPS: Loongson: Enable LS2X RTC in loongson2k_defconfig
Date:   Thu,  6 May 2021 00:39:05 +0800
Message-Id: <20210505163905.1199923-7-git@xen0n.name>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210505163905.1199923-1-git@xen0n.name>
References: <20210505163905.1199923-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is now supported, enable for Loongson-2K systems.
Other systems are unaffected.

Signed-off-by: WANG Xuerui <git@xen0n.name>
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

