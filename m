Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEF433F4E8C
	for <lists+linux-mips@lfdr.de>; Mon, 23 Aug 2021 18:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbhHWQjx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Aug 2021 12:39:53 -0400
Received: from [115.28.160.31] ([115.28.160.31]:50522 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S230174AbhHWQju (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Aug 2021 12:39:50 -0400
Received: from ld50.lan (unknown [101.88.30.186])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C35096012C;
        Tue, 24 Aug 2021 00:31:51 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1629736312; bh=qpAnScgPwqn8ve3G4zCzZbEzb9Q72hJJphj8MfLBmek=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YeBFDY03/ICFADd+o4dE2+nFOSerho30dWwKRM5hRSmDlCh09Ow0mDuGwIxl0L8Su
         7kPgj00xCuhl5bV8nbdfDExAba3NyGS2J5iKf+Hu4mP8QBvMCvmYlzJoWc5fuEgXR2
         FP7vDjQ4VrQfWY57dG/OZ/1s0cSAPXvBxMX02pEY=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Youling Tang <tangyouling@loongson.cn>,
        Qing Zhang <zhangqing@loongson.cn>, linux-mips@vger.kernel.org
Subject: [PATCH RESEND v5 4/6] MIPS: Loongson: Enable LS2X RTC in loongson3_defconfig
Date:   Tue, 24 Aug 2021 00:31:40 +0800
Message-Id: <20210823163142.586529-5-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210823163142.586529-1-git@xen0n.name>
References: <20210823163142.586529-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is now supported, enable for Loongson-3 systems.
Other systems are unaffected.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Youling Tang <tangyouling@loongson.cn>
Cc: Qing Zhang <zhangqing@loongson.cn>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/configs/loongson3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index f02101ff04b3..fccb6906d4b4 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -320,6 +320,7 @@ CONFIG_USB_SERIAL_OPTION=m
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_CMOS=y
 CONFIG_RTC_DRV_GOLDFISH=y
+CONFIG_RTC_DRV_LS2X=y
 CONFIG_DMADEVICES=y
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=m
-- 
2.33.0

