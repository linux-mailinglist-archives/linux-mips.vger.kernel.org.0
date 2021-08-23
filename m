Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B46B03F4E83
	for <lists+linux-mips@lfdr.de>; Mon, 23 Aug 2021 18:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbhHWQjt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Aug 2021 12:39:49 -0400
Received: from [115.28.160.31] ([115.28.160.31]:50526 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S230149AbhHWQjr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Aug 2021 12:39:47 -0400
Received: from ld50.lan (unknown [101.88.30.186])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 8B9F260131;
        Tue, 24 Aug 2021 00:31:53 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1629736313; bh=csEujhwkRZrzuHB76h5qRwQuonezZFuzfVCaeB8i0fE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WRDDKPVX4VaooJF+xtozec/6aygbCutaxVCmHNIjMnh6qeUWFlXqE4f+sBFqmjm1B
         8XZaNhInzziMcYeS7v8aDjSbWoBwJ3epYtRCAmm0o2C8olxnpZmYeSxhObr1bt/rRl
         F0i50Q6dYUpwj6eOQkhF9qEKvVxE3XBRyBKkJ1xw=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Qing Zhang <zhangqing@loongson.cn>, linux-mips@vger.kernel.org
Subject: [PATCH RESEND v5 6/6] MIPS: Loongson: Enable LS2X RTC in loongson2k_defconfig
Date:   Tue, 24 Aug 2021 00:31:42 +0800
Message-Id: <20210823163142.586529-7-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210823163142.586529-1-git@xen0n.name>
References: <20210823163142.586529-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is now supported, enable for Loongson-2K systems.
Other systems are unaffected.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com> # loongson2k
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Qing Zhang <zhangqing@loongson.cn>
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
2.33.0

