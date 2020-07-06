Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A06B21556C
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jul 2020 12:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728813AbgGFKU1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Jul 2020 06:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728578AbgGFKU1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Jul 2020 06:20:27 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B81C061794
        for <linux-mips@vger.kernel.org>; Mon,  6 Jul 2020 03:20:27 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id mn17so3293016pjb.4
        for <linux-mips@vger.kernel.org>; Mon, 06 Jul 2020 03:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=GeR8L4kIoEXZk0wQOvWjYg63xKaKpq5waFcgjrGDjfw=;
        b=FlKEg/tqPChm9Ao6+ag009m/Zk9BXOntXRqTpG6qJsNyWCAzLFABwHEJ0f1PR3IIGb
         HhHdoXFPazEtnSUusxY0V15m+XXHlZDuaSr1l9hVpbvR9tBCAGrdYn4AqxVRTf3fXxKc
         xZfpb19n0/IOLLkai/yk/wgKe4t2Hs35R6mDK+r1n+bKn/v9y0qjqUy/wbOVpj6rxY6e
         ZfqYacyuz5r2unRT24A0RrIe2IVTBEnyj5tmODISW77PMBUnqDQzsBgFwZjh8AE+E5GH
         bippQigZ37PKa7PPKFDP9q/Lj8xH3DbgNVChzLzl/84vWM4vU+jMIBRFUTxzEW9Pjtu/
         aTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=GeR8L4kIoEXZk0wQOvWjYg63xKaKpq5waFcgjrGDjfw=;
        b=RJbbYO6/gD3rs9u0JVNGCEq2o0sdb2QQ+9fBj6xpPwEeRt817nwKEcw5yBc/TgXh3K
         tmXWgb0LxPNtFX+r1e/jucoE45uCoj1U3MizLQestH2VKbfZmJYNnj2vQ3QfybIysFO3
         Q99X4UygkuoHMW0WPfp96yPL5Q0InXKZxYmWACQWwZnwTI/uZ3ewDWLaRm6AtDcAXW1k
         yuJj4EyhYn2pEjDT1X0eWwx62W/Jrd/9uDO0LW7qNS+/gRCa4jGcf+01wS7ciIMflgbb
         1OCW8XvLsKZN7vZBp8QZPPgtC7DsRyomR9uNFJDiqx2iJaqkSKmPha8x6aReELSk30wv
         AFqA==
X-Gm-Message-State: AOAM531/nvV01+U8O5r6nb+K9UUTagFHQKm3JIMjRZFPb3d/swTi62wq
        iX3ndrIKkravCnhsHR2pndY=
X-Google-Smtp-Source: ABdhPJwPRuDmKHIVnSYwdMncNiQr5egtyGeCqan0qj89ukd1M1A27hl624QswbodfRmO5Y2oqgujFA==
X-Received: by 2002:a17:90a:6c97:: with SMTP id y23mr4876964pjj.28.1594030827140;
        Mon, 06 Jul 2020 03:20:27 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id d4sm18775186pgf.9.2020.07.06.03.20.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jul 2020 03:20:26 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH] MIPS: Loongson: Update dts file for RS780E
Date:   Mon,  6 Jul 2020 18:22:23 +0800
Message-Id: <1594030943-7568-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The size of ioports in the current RS780E dts file is not enough, which
sometimes causes device initialize fail. So we increase the size of ISA/
LPC ioports to 0x4000, and increase the size of PCI ioports to 0x8000.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/boot/dts/loongson/rs780e-pch.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/rs780e-pch.dtsi b/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
index d0d5d60..d4c803d 100644
--- a/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
@@ -17,7 +17,7 @@
 
 			reg = <0 0x1a000000 0 0x02000000>;
 
-			ranges = <0x01000000 0 0x00004000 0 0x18004000 0 0x00004000>,
+			ranges = <0x01000000 0 0x00004000 0 0x18004000 0 0x00008000>,
 				 <0x02000000 0 0x40000000 0 0x40000000 0 0x40000000>;
 		};
 
@@ -25,7 +25,7 @@
 			compatible = "isa";
 			#address-cells = <2>;
 			#size-cells = <1>;
-			ranges = <1 0 0 0 0x1000>;
+			ranges = <1 0 0 0 0x4000>;
 
 			rtc0: rtc@70 {
 				compatible = "motorola,mc146818";
-- 
2.7.0

