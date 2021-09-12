Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCB80407C06
	for <lists+linux-mips@lfdr.de>; Sun, 12 Sep 2021 08:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbhILGQA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Sep 2021 02:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhILGQA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 12 Sep 2021 02:16:00 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 946B6C061574
        for <linux-mips@vger.kernel.org>; Sat, 11 Sep 2021 23:14:46 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id x7so5787255pfa.8
        for <linux-mips@vger.kernel.org>; Sat, 11 Sep 2021 23:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GSpqv4Z4uKnMUHGDEzEFn5fbi3NHs7ZRYGYmjlzUxFA=;
        b=BsAda9HUlhSiZ7gre4fIAIjXweZvQw7ryqDBhpiz3mncsPxpgNowlGparm2ywda27j
         rGLFfn0xFyQsgYWE9jUdKWsXWStwMWZx4Gumymn2CX8qxbfL6pLnX4TT6F2/dqyN/7NF
         jTrBpet1eRsKsjlF6UfwB8cMAJHJ2E1Xr4TuOrJqAunCewqiqeAgG/IoxWTUfHb0zVMI
         JJF4Dk0FRpnDCM1xUQ0ruNIZGyPJtfvuvdqyR4voXfdVfRvH06Qt2EP7tJMjVZpUFb8O
         4SNklJBkgWWPrLLLIYItWnVApJ1easQ17XEq/ERONjbtZJGbWz+k7UVD3XAHA65ttjJh
         4yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GSpqv4Z4uKnMUHGDEzEFn5fbi3NHs7ZRYGYmjlzUxFA=;
        b=ukL2bPZgsUEGSb521N5FIDK4jyuFu+pLuI3kRFlW545GLh3WaWtyPLN+TnGfTt9Jmu
         xnvSrjyu20antAYd6IODCcib/FzpMuBZLQ5ysB69T3xy7Ih+kwLE2xXSDO6kQadSldb+
         E698IFeoZeAqy6rwSjSRvBgwZaOER9wCVbNROJS2rXZ9ihGKCCgfp5ZG1rNOgMJXasKr
         rGhfWGZCCRHxy/HUcYteC4Ex6yQJtT1xfqARwTgcoGj7svEhbDmMMX/w9mbATY2QBRT6
         aCbLZskSXyUMAQR9sBalwEXt7cxQkdPmeVxsdTg/Tf9DjwiIqB8xp6EDFewmfcR9pONB
         8EJw==
X-Gm-Message-State: AOAM531eswozPbrkDumgBxZfs9nkcLvoxeR6lsx7kkG+2BEup65Ch+bH
        W2Sj7V+zjWIjQ9hzXKiuero=
X-Google-Smtp-Source: ABdhPJzg+MeKcCBe0ouy4kzKhAPjVGdM32Yq+uofNHE6ED7vKP8qgKIznR28ALIX4AN936LFH/NfJQ==
X-Received: by 2002:a63:4f54:: with SMTP id p20mr5214538pgl.437.1631427286034;
        Sat, 11 Sep 2021 23:14:46 -0700 (PDT)
Received: from localhost.localdomain ([8.47.69.162])
        by smtp.gmail.com with ESMTPSA id b21sm345912pfv.96.2021.09.11.23.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 23:14:45 -0700 (PDT)
From:   Wang Haojun <jiangliuer01@gmail.com>
X-Google-Original-From: Wang Haojun <wanghaojun@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Wang Haojun <wanghaojun@loongson.cn>,
        Li Xuefeng <lixuefeng@loongson.cn>
Cc:     linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: loongson64: Fix no screen display during boot-up
Date:   Sun, 12 Sep 2021 14:13:56 +0800
Message-Id: <20210912061356.1723912-1-wanghaojun@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is no display on the screen during boot-up when using latest
loongson3_defconfig, because CONFIG_FRAMEBUFFER_CONSOLE=y depends
on CONFIG_FB=y in this file.

Signed-off-by: Wang Haojun <wanghaojun@loongson.cn>
---
 arch/mips/configs/loongson3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index f02101ff04b3..25ecd15bc952 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -282,6 +282,7 @@ CONFIG_DRM=y
 CONFIG_DRM_RADEON=m
 CONFIG_DRM_QXL=y
 CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_FB=y
 CONFIG_FB_RADEON=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_PLATFORM=m
-- 
2.27.0

