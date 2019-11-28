Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14B5E10C6FE
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 11:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbfK1Kog (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 05:44:36 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25834 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfK1Kog (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 05:44:36 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574937567; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=gbifLyfxXSjhuVpdDK5yhqzJAJrFrP0Xk9vRDm/2CA1Vnf3lDvAtrgp2SLDJNOaXj7EPfN+F5Ml2BvU6vdTsqc2DmHOphCgw5P2V0cX6H/zuLEjui4aM+1H20aPDpX/0GVt2ZGdwQAVgOr2x5n/rbhFpdwcdaGatH0vkE/hAdk0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574937567; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=D/TyBfxdE1KJU3O6deL6nqGADKKoWzKVTrMkn0LyFno=; 
        b=QxbGAnbghonu1uoR1f821BBDDGbc3sn9xYukTm/vEhtOJ7gJXIvB7PH129RXFpylEC/k2dmt3Dnqgxt3/lO8P7uLTcNTtxZOgJPUeHfr6K1I/JCN4Ys0dHJ/RXbdQXRX3nMV6UNsUR8fy2qvZI+W48YyU9KJKu822CIe31yOUOM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=Q13PLFMU0azaSrkdejDcjxBmGueIs4hrwHtv+joRxQAnM1rKq6rLQ7/qC1S1+9ST/Uql8x6msVtN
    O/zrV/LDC/Z4wxd492czzuaPqBQP5h2K1fHkCKW3Tml/1NDZRWfg  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574937567;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=D/TyBfxdE1KJU3O6deL6nqGADKKoWzKVTrMkn0LyFno=;
        b=WUjR+4P3LD55TeIP0S7T+3YEx9sRvY1UjkTA2ukRa7q/yVAjroajHeQn+xNM8W68
        h/Jxow5DxRijpC1AqTU314b9Q9DtpH3463gZByy+auhbrMxZkQRASMf53Bc2s6UO5aZ
        pX2rcu3u7niGgKXxRBRCKF6taNnwvwhkOg2Ms+nA=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1574937566816104.92396606968191; Thu, 28 Nov 2019 02:39:26 -0800 (PST)
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
Subject: [PATCH v5 10/10] MIPS: CU1000: Update defconfig for rtc.
Date:   Thu, 28 Nov 2019 18:37:47 +0800
Message-Id: <1574937467-101907-11-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574937467-101907-1-git-send-email-zhouyanjie@zoho.com>
References: <1574937467-101907-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Selected rtc support by default.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---

Notes:
    v5:
    New patch.

 arch/mips/configs/cu1000-neo_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/cu1000-neo_defconfig b/arch/mips/configs/cu1000-neo_defconfig
index 565e9a0..b48a1cb 100644
--- a/arch/mips/configs/cu1000-neo_defconfig
+++ b/arch/mips/configs/cu1000-neo_defconfig
@@ -63,6 +63,8 @@ CONFIG_GPIO_SYSFS=y
 # CONFIG_USB_SUPPORT is not set
 CONFIG_MMC=y
 CONFIG_MMC_JZ4740=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_JZ4740=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_JZ4780=y
 # CONFIG_IOMMU_SUPPORT is not set
-- 
2.7.4


