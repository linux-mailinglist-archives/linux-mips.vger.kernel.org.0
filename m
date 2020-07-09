Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16DFA219F18
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2020 13:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgGILbu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 07:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbgGILbt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jul 2020 07:31:49 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E400FC061A0B
        for <linux-mips@vger.kernel.org>; Thu,  9 Jul 2020 04:31:49 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id d194so842756pga.13
        for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2020 04:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=RgcwQf2G0iVfy6g/fqzvOYKp7C++pWe7EHEkWlb6a0s=;
        b=KqKwSv/FQdj92lj9LgGH2vX1wS6nci7YQgx58IsN3P3yGEf/NePB/xPXNoPZH82nrg
         6NB3mV2WdYAueLxO/UfnmK0YxPbs9dLU3FmRZ6E6JqI9q6AhQqjt8ZfvTUHo1tepbjC5
         454V0IWuI7d3fJUiRSvQM3UgEF5DyoqQCcFdFBU4zhQg9sYurGJrJ5rrgx2JyLiXl3hK
         JXIHZBCg81QB9wLpBqsYpvB6DLEGjNlAn2It9GE6VhUqqeB+Rv+J8DiGQ8zU0hRdGXN7
         n8X7HXCHY42sONoqgLpm7vRkmRMtZ5zHR9dgdKQAa2L6MuHS3U8Blfk/8cEdgpwAZ6gB
         qGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=RgcwQf2G0iVfy6g/fqzvOYKp7C++pWe7EHEkWlb6a0s=;
        b=WOE5VlsrdC0+PtmVkqj+cIQJGh8Snbmf0Ii4dXgmipgOEM+aUzt/VPu0IkdiwJsiV5
         otrdKTbypUxlhNsUzIvGPyFPz4wqZSMIuRS6XjDoecgeTlfOgIncXfW98NXlwZJdC7b0
         ZhU8k92XTppRFBdDj4gHmWgQhEeURa5pdegyFfk00E80u0T5cV6PLSmB8d3VqcfkIsZE
         C+rrzONDEqSu4tE1NKvFg5AADVeQbszO4iHuTZSvuuwscjlpPTBz73g7yAP/cHj+JfHA
         SRG9NoqhfkbmcQVrAZMQbogIJWStcNSxFDcELUL0EcBohRT4UWmHS5Ea9og5gctIBFWM
         ILNg==
X-Gm-Message-State: AOAM530JySFXvGwuJBesqysFl3GJQN1xilGlvjtO+x3eOo/V3tZAAmmJ
        vK5828ZS1g7rUrPPfIOz7Xs08iB00Gl4GQ==
X-Google-Smtp-Source: ABdhPJwlSSqvek08tNa3GZLQikQo4P8oALN3MYQVCJZvkRgE28ZrZs7nIcvrEKVvhqa8e9Azv0Karw==
X-Received: by 2002:a63:4f1f:: with SMTP id d31mr29804545pgb.241.1594294309461;
        Thu, 09 Jul 2020 04:31:49 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id w4sm2612507pfd.39.2020.07.09.04.31.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 04:31:48 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 1/4] MIPS: Loongson64: Fix machine naming
Date:   Thu,  9 Jul 2020 19:33:41 +0800
Message-Id: <1594294424-26218-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From previous commits, the machine names with "loongson3-" prefix have
renamed to "loongson64c-" prefix in documents, but the .dts files have
not been updated as well. So fix it.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/boot/dts/loongson/loongson64c_4core_rs780e.dts | 2 +-
 arch/mips/boot/dts/loongson/loongson64c_8core_rs780e.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/loongson64c_4core_rs780e.dts b/arch/mips/boot/dts/loongson/loongson64c_4core_rs780e.dts
index acd53a1..d681a29 100644
--- a/arch/mips/boot/dts/loongson/loongson64c_4core_rs780e.dts
+++ b/arch/mips/boot/dts/loongson/loongson64c_4core_rs780e.dts
@@ -6,7 +6,7 @@
 #include "rs780e-pch.dtsi"
 
 / {
-	compatible = "loongson,loongson3-4core-rs780e";
+	compatible = "loongson,loongson64c-4core-rs780e";
 };
 
 &package0 {
diff --git a/arch/mips/boot/dts/loongson/loongson64c_8core_rs780e.dts b/arch/mips/boot/dts/loongson/loongson64c_8core_rs780e.dts
index 433f9c3..3c20441 100644
--- a/arch/mips/boot/dts/loongson/loongson64c_8core_rs780e.dts
+++ b/arch/mips/boot/dts/loongson/loongson64c_8core_rs780e.dts
@@ -6,7 +6,7 @@
 #include "rs780e-pch.dtsi"
 
 / {
-	compatible = "loongson,loongson3-8core-rs780e";
+	compatible = "loongson,loongson64c-8core-rs780e";
 };
 
 &package0 {
-- 
2.7.0

