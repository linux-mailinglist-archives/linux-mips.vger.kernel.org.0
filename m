Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED1E10C6F8
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 11:43:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbfK1Kni (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 05:43:38 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25805 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbfK1Kni (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 05:43:38 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574937553; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=Psc+8CEyRPTGgLrD/yXU6u3DuQCoRAxQX4zRZ/fUgb5pVe7RpTdKp8ZKv8Um1H/CrcrcAivBtsfWqjTrkSwR0B/VxmRsltn+BS7qx/oluIrNySLfFv6JV4lU06Iqls000RCqzPKNzSxih5GwnN1+WecMEUb3XR0VkGxOZfvlYC4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574937553; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=GAQWeGd+h8VrekeWhUNwqLoHFFa2+G6t4HyTh3BtuYA=; 
        b=DO2tPp6Hnihkg5/Z3tEhpyOA3ethbrpcozF5K8Dxm7KWXB6eN6NzHcIdlbB0ccKmcNomf3GnqK+wa2CczMVxXD3t15PrmepKtMpjySZeW3w7DWFy0mauZd8IT0tY0nWsfw9RU9abSmS+gVIgmIRubQWhsKzRKuS8tJakPUB7A/I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=HN7fKinXmeNlQfkaNksbrBS8Dk3RShq+q9ggBi9jDzY7M4MYuFgPo43q4L92LXRMO2+kKBInzy9H
    +6kaDmc13FNtsjBaoeuTtOZtJUoUUaUYT7LJVDwU/dhKx4MrEPQw  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574937553;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=GAQWeGd+h8VrekeWhUNwqLoHFFa2+G6t4HyTh3BtuYA=;
        b=MtwFwSWnTXqGQ9P1KLSCqz4J1E5YXw/ZBYuh8gxMeLpI5m9285r+XFnvs9j4joC5
        TIAqwpxSbR3jdI2Qx1FwYLQ+XuNQfBraqukfOAnNM0hX1NUCCf6k3fCeOtVdeEJws0q
        l/Ps19GWqhVpbB4yuvLAjYkuqDwoYhJZDpvFF4LI=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 157493755101472.99312942936126; Thu, 28 Nov 2019 02:39:11 -0800 (PST)
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
Subject: [PATCH v5 08/10] MIPS: CU1000: Update defconfig for msc controller.
Date:   Thu, 28 Nov 2019 18:37:45 +0800
Message-Id: <1574937467-101907-9-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574937467-101907-1-git-send-email-zhouyanjie@zoho.com>
References: <1574937467-101907-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Selected msc controller support by default.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---

Notes:
    v5:
    New patch.

 arch/mips/configs/cu1000-neo_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/cu1000-neo_defconfig b/arch/mips/configs/cu1000-neo_defconfig
index 63903bf..565e9a0 100644
--- a/arch/mips/configs/cu1000-neo_defconfig
+++ b/arch/mips/configs/cu1000-neo_defconfig
@@ -61,6 +61,8 @@ CONFIG_GPIO_SYSFS=y
 # CONFIG_VGA_CONSOLE is not set
 # CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+CONFIG_MMC_JZ4740=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_JZ4780=y
 # CONFIG_IOMMU_SUPPORT is not set
-- 
2.7.4


