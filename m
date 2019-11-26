Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7B210A328
	for <lists+linux-mips@lfdr.de>; Tue, 26 Nov 2019 18:10:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728678AbfKZRKk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Nov 2019 12:10:40 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25885 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727674AbfKZRKj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Nov 2019 12:10:39 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574788068; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=oIQe1PY4vGRM9TPEiTAsrAkTfKIqjn4z22/azPgO0cxcz/PmbKxhs5o8yvy3Zdg6Wb4RprVWH6HI20x+B7wqh+RecwDBYdiCQzOUF6Dx5rOfShwEEchlJi+SyRsVbBJUtOzDWt9LRiKhjjDmloLsA8H4+wqXl6rxfvvxGsXEycM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574788068; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=yuMGxHMKAHxS16p3bQXnY0TEe3BCGLx/Srx8HskDs9w=; 
        b=OowQ6wTM3xDrfvOEDclaYybFvKOFmnpLXn0FC7NscW+I1cuIHvsEFTz3UC5supkZkrKIRVvtO7hkbkq4ImHXF4FTq4hkCqA9cwo9wuuTsm5MDjnQGtnd3omNbjPJSNytp4U70n9MzBjia5xs9Ah8YlNDc3Sdz0QyOFZPI80GX4E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=JsqhkJb1VfBMYa/vBi5UQK814q1qIloFBFpCyufV1Tv1kXZ9ZqiSnFmLgu5OZlOc34ozDxPn9toj
    ij+9rIjE3qjxP9X2USgsaO8VgAYrzQnqNVS7yZILDQyA9DPw45MK  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574788068;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=yuMGxHMKAHxS16p3bQXnY0TEe3BCGLx/Srx8HskDs9w=;
        b=YZpyFUSYz08hsuTfrUsQrYV8aR6FSVqrVMoGpMEg5Y/BsYgCKqPpGvYs+CMEPWh0
        roLGvak981ZWENIfkD75zSv7q5FG0j3B7ZfqGqgiQ6Rhu9kq3DsFob+hMueseA7mtOR
        isytNAOvVkuP7Ax1pZYdzRb9lg5isAeJbDVYRRUE=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.112.214 [171.221.112.214]) by mx.zohomail.com
        with SMTPS id 1574788067290799.8760784734405; Tue, 26 Nov 2019 09:07:47 -0800 (PST)
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
Subject: [PATCH v4 6/6] MIPS: CU1000: Update defconfig for pdma controller.
Date:   Wed, 27 Nov 2019 01:06:14 +0800
Message-Id: <1574787974-58040-7-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574787974-58040-1-git-send-email-zhouyanjie@zoho.com>
References: <1574787974-58040-1-git-send-email-zhouyanjie@zoho.com>
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

 arch/mips/configs/cu1000_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/cu1000_defconfig b/arch/mips/configs/cu1000_defconfig
index 88729ee..9f26d00 100644
--- a/arch/mips/configs/cu1000_defconfig
+++ b/arch/mips/configs/cu1000_defconfig
@@ -62,6 +62,8 @@ CONFIG_GPIO_SYSFS=y
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


