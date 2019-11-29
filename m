Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97AF010D2C6
	for <lists+linux-mips@lfdr.de>; Fri, 29 Nov 2019 09:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfK2IyM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Nov 2019 03:54:12 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25827 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbfK2IyM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Nov 2019 03:54:12 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1575017606; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=asuNwnZLYC/hJlJ/BVp43eSdf4F1A8BG2WXp4LWpCCPNYBk31+lXIO/bRbDB0odyy9YKdLPtMkourxsx/X1qPmZ928nk1yRPExVS2Vme683B8t1MM65eKSHqdmBHXpS+aT6vmsJQ6Bja2wueBPfF2HH9QH3BonIqqFaijl6nXUI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1575017606; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=1JaFRz4EgDg7++NJKPw4UFEhkGHDD9ntKf62/envvGg=; 
        b=N+VtYP57e7LqTPgqATVOUoVIKkbTXjclxoHiTClO7zFXD5Vs4sibJkpZIz2zL9O5FDjp+GfNFdUrlQIkR/8kZtbU2OMnqwS0ch/Lun9mSDJu2AnWuyrN/AbE4ZXLxXvo0eXpajzSUPFls/foU2ABlO/l3JmQoa6/PmyqiMktv1s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=kFsET3vGFKETmGZOgDzoAK/Szb7M/3Dm8/B5vKCbs18CZWhh/gwOYnXOs2/xBurod07uAkuxB6Aw
    etOxcd9yePp2dIInQq7dIndzmgt9E/hrscc7m8nfM18DExELQ50u  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1575017606;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=1JaFRz4EgDg7++NJKPw4UFEhkGHDD9ntKf62/envvGg=;
        b=bzuF8r1mTo9zpq5UtQsQzw7yIUJKSE/nabFfKeBvmBjrSqKNBnwVXjS5OjaZyF1P
        Zj8sGUwtZNW1QmP2ASoGXhNP/tzxYyrg8PxkATKnYZRWfSVW/fmdIf8paXyUHE/aWPL
        F/on7IEib9QLSf2yOggvQ8slmCaClR+irS7BgJYw=
Received: from zhouyanjie-virtual-machine.localdomain (139.207.146.46 [139.207.146.46]) by mx.zohomail.com
        with SMTPS id 1575017605574280.931980782956; Fri, 29 Nov 2019 00:53:25 -0800 (PST)
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
        zhenwenjin@gmail.com, 772753199@qq.com
Subject: [PATCH v6 08/12] MIPS: CU1000: Update defconfig for msc controller.
Date:   Fri, 29 Nov 2019 16:48:49 +0800
Message-Id: <1575017333-29020-9-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575017333-29020-1-git-send-email-zhouyanjie@zoho.com>
References: <1575017333-29020-1-git-send-email-zhouyanjie@zoho.com>
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
    
    v5->v6:
    No change.

 arch/mips/configs/cu1000-neo_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/cu1000-neo_defconfig b/arch/mips/configs/cu1000-neo_defconfig
index 6ac51ec..eef0c5a 100644
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


