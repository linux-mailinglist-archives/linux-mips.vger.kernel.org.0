Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6FE34A853
	for <lists+linux-mips@lfdr.de>; Fri, 26 Mar 2021 14:44:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbhCZNoH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Mar 2021 09:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbhCZNnu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 26 Mar 2021 09:43:50 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B585AC0613AA
        for <linux-mips@vger.kernel.org>; Fri, 26 Mar 2021 06:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=IsLDh/9zb6GI45K97NG+VYP4yjQ30bO8WIfXv0zSurs=; b=Vlw3DqKjCdPNdcvm9hNV59onaL
        XNdVVosCwsn7oXYiorqgy4LOsUYLremUbI5ALDNBQp6fiL/1+M1Sbeq3cBZtFLXZ5bS57rEQdI0Yx
        UBKqiRF+MSnDb5d33mfOh9IdBORdlPC85zMYh2esMOShTpOys0j7IYuoczMTpYWYeykW86OcPwyJv
        Eze5wPGUtck2tC/zNzXZ8l4yVoJoAO1qNJjbeamLfL3FxWx9BkCYsTQ8ZvqZ9+vliubX/otMkl54E
        wmmZXeaZ64Ew4O6PHPgkJGSnkY7A/NGXv9AGlDzsFAFAcQrK+AmG58MWFuCkqy0m0Z6bi0DRPhJYA
        aZLALD7Q==;
Received: from 97-173-191-90.dyn.estpak.ee ([90.191.173.97] helo=ubuntu)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sandberg@mailfence.com>)
        id 1lPmkZ-0008Rl-J6; Fri, 26 Mar 2021 15:43:44 +0200
Received: by ubuntu (sSMTP sendmail emulation); Fri, 26 Mar 2021 15:43:43 +0200
From:   Mauri Sandberg <sandberg@mailfence.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        Mauri Sandberg <sandberg@mailfence.com>
Subject: [PATCH 0/1] MIPS: fix compilation error
Date:   Fri, 26 Mar 2021 15:41:57 +0200
Message-Id: <20210326134158.268164-1-sandberg@mailfence.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.173.97
X-SA-Exim-Mail-From: sandberg@mailfence.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

I hit into a compilation error while making a build for ath79
It apparently seems to have a trivial fix but I cannot say for sure with
superficial investigation. Adding into CC: the author and reviewer of the
commit that appears to be the root cause. You might have a better
understanding of the causes and consequences.

Root cause:
commit b83ba0b9df56 ("MIPS: of: Introduce helper function to get DTB")

When reproducing the error my diff of the default ath79_defconfig is:
-# CONFIG_RD_GZIP is not set
+CONFIG_INITRAMFS_SOURCE="initramfs.txt"
-CONFIG_MIPS_CMDLINE_FROM_DTB=y
+CONFIG_PRINTK_TIME=y
-CONFIG_CMDLINE="rootfstype=squashfs,jffs2"
+CONFIG_CMDLINE="console=ttyS0,115200 rootfstype=ramfs"
+CONFIG_CMDLINE_OVERRIDE=y

Cheers,
Mauri

Mauri Sandberg (1):
  MIPS: kernel: setup.c: fix compilation error

 arch/mips/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


base-commit: 509d36a941a3466b78d4377913623d210b162458
-- 
2.25.1

