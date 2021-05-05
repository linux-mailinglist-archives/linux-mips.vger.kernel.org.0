Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CCE83743B4
	for <lists+linux-mips@lfdr.de>; Wed,  5 May 2021 19:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235041AbhEEQvc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 May 2021 12:51:32 -0400
Received: from [115.28.160.31] ([115.28.160.31]:46568 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S236090AbhEEQrp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 May 2021 12:47:45 -0400
Received: from ld50.lan (unknown [101.224.80.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 35B1563572;
        Thu,  6 May 2021 00:39:47 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1620232787; bh=9v8f97ChqoUTAZr7mZ3Hn4IYe/rARMySCQCNva+ssAo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PzW6C9eX9qh+7AdKJh6ATnCXaiEseW1ZvLtXf6wgHYSqW2f7M+YIoisljHthsSW4Z
         yDgxN9dFWmDqEWpxDngbPYipt71750cRdHhN8fM+J59X/B0uNdk8xui9kOBYOtwKZa
         KG/XF0npUuS42la3MeqhWdubHrlLZt+m8TteKj5Q=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 4/6] MIPS: Loongson: Enable LS2X RTC in loongson3_defconfig
Date:   Thu,  6 May 2021 00:39:03 +0800
Message-Id: <20210505163905.1199923-5-git@xen0n.name>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210505163905.1199923-1-git@xen0n.name>
References: <20210505163905.1199923-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is now supported, enable for Loongson-3 systems.
Other systems are unaffected.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/mips/configs/loongson3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index a18609cf0e5e..b34ca534b9b6 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -325,6 +325,7 @@ CONFIG_USB_SERIAL_OPTION=m
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_CMOS=y
 CONFIG_RTC_DRV_GOLDFISH=y
+CONFIG_RTC_DRV_LS2X=y
 CONFIG_DMADEVICES=y
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=m
-- 
2.30.1

