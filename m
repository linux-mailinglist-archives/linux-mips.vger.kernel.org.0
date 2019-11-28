Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3150A10C6F0
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 11:42:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbfK1Kmn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 05:42:43 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25873 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfK1Kmn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 05:42:43 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574937537; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=VcdzdLjHH32ch/bv/47dWZzQ2+FhyM5xHnhAwedSKHenihLqPJN3jg+6b8FVuvJFRCuiAGUk0Xc38erVOllzCTHnSWyCnKF0Ykp7NM76y8pHy2anSsNzzOwfjDraExHnjyXMIfsYFmKFMlabz6b4jwvG3qT5wIGb0ggEloXIIok=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574937537; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=NCG4dq1lPVKddLeRK2Wp2XDWMGKFxwGglae1Gg+BO3I=; 
        b=bQqU1g6tq8uco0kvb7sfyv9s6xjRXVEig14lvAD5p+ARPa2uZzTyOXrrHewqoJDHi7zxQNwygnts6y6eDyWzv1wa7d/Kik+k9WCdOQJ9HxXVRhCFBUSrpFjZQ9Tk7ah9VJjlsCOa6TJ0e87BgcPKkRwPPidZjnrQp6wIb1FDxpA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=EDWiDINbrVmL7ylDifAEFeTTNeq4gp4ZaagY5g8N23mCcGPrKiN5kr2KSHGH3S4kb9xCmkA8GdZf
    KRHGPzwxsU1TarF/i2FQbLW5aISQ8g1/tfMxGJUglrwrViwCa2NX  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574937537;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=NCG4dq1lPVKddLeRK2Wp2XDWMGKFxwGglae1Gg+BO3I=;
        b=O9BqFqkpwm9mz8+3TI1tp5qbHJg3+ZM4DtUOn7S1k8e8/bc2EhbAe9U3zvb7qylf
        XA+ioHyRn5pVncFTeD7/JcvWi8+297N0C2Ut6VNNoOWR49GM11jfDLyjIb9wdi9DR2o
        mAyM+Pqm824zH2h6tGelflKH8LtG71HryO1d1zJU=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1574937535046394.2329066527785; Thu, 28 Nov 2019 02:38:55 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mripard@kernel.org, shawnguo@kernel.org,
        mark.rutland@arm.com, syq@debian.org, ralf@linux-mips.org,
        heiko@sntech.de, icenowy@aosc.io,
        laurent.pinchart@ideasonboard.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH v5 06/10] MIPS: CU1000: Update defconfig for pdma controller.
Date:   Thu, 28 Nov 2019 18:37:43 +0800
Message-Id: <1574937467-101907-7-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574937467-101907-1-git-send-email-zhouyanjie@zoho.com>
References: <1574937467-101907-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Selected pdma controller support by default.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---

Notes:
    v4:
    New patch.
    
    v4->v5:
    No change.

 arch/mips/configs/cu1000-neo_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/cu1000-neo_defconfig b/arch/mips/configs/cu1000-neo_defconfig
index 427763d..63903bf 100644
--- a/arch/mips/configs/cu1000-neo_defconfig
+++ b/arch/mips/configs/cu1000-neo_defconfig
@@ -61,6 +61,8 @@ CONFIG_GPIO_SYSFS=y
 # CONFIG_VGA_CONSOLE is not set
 # CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
+CONFIG_DMADEVICES=y
+CONFIG_DMA_JZ4780=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_NVMEM=y
 CONFIG_NVMEM_SYSFS=y
-- 
2.7.4


