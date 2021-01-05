Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0B52EB40F
	for <lists+linux-mips@lfdr.de>; Tue,  5 Jan 2021 21:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbhAEUTQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Jan 2021 15:19:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbhAEUTQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Jan 2021 15:19:16 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCB4BC061574;
        Tue,  5 Jan 2021 12:18:35 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id d14so529196qkc.13;
        Tue, 05 Jan 2021 12:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6NEnic80tcUo3+yVoxdPk0SMP2vGpWUPUrthjFQDkyc=;
        b=bjKr0rNPdSfS5qRBw050TlXxNM9LGC7XQlj0qjPQWdYRRQzwA8OB7JPd1pSewiq51x
         UG/rbeUCpyUw3pLVOUfAqNgzJVJRBiv7Aw4i9r6g8CnNlWxmBRW1410XH5sKBZ7yjH/r
         ILjJSepQGGOGmo6bVZaxEzYN5GAaHd+ii5o8uoFBMERyw4loh9/7G1KPQ8szLpY/7pJD
         rL7OZhy7JbiPKfxUx+Xd/6rmUNU2lAy9nKf7xzvzSBguQEaGnnkyv1VZC5BKZQfmPYSs
         +FnkTRhktRyhmhNIl+7MM5PC4oQwnK4W/Biw9y0ykIyv9RSrfr7RcC5F5RlX2Lwz65Sq
         otVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6NEnic80tcUo3+yVoxdPk0SMP2vGpWUPUrthjFQDkyc=;
        b=GKAm7MtcG9yzTOilPDpxdbSpsnkSRt7ZqCfbYVzLl8cnOKFXh2xKbO16kd/Sw8Jm9c
         tK3dmXk6htneZ1b+wrxKAEHrS34K85Y0VY3iMXAHigjnIxeKj0ttFJNruvmUaq92lLDY
         nTHoPS7Rv4udGjIY/r1S8RDTICnm8FbtE9JajBshSolsidtmgyHplW6WB7PGMJT7bVJB
         dA+IK/HO618VmOE8vCwpYdJUKpNwTCoTY0VgL63/QVVeLkJ97v5R2w1IWfvChssk3Igz
         +yzPnLOPejtMEp/cHH4QeWqvdpZkrcU//XNwfnUKw5oOj/amSLgVOTigiVh+vn8Xc2dL
         ij+A==
X-Gm-Message-State: AOAM5332a4oniJ/geAvy9/3QY4uD+2hYls6SstY2KJZoXBmhYh7COurx
        HMVTjCmbzNRioKhX6rKBmC0=
X-Google-Smtp-Source: ABdhPJx4e3xeygMm1A3AkFlYVBxltIL8C+yHe8XO8vbZ+WhazHsv3KmdWj9VYkCntZD5MYocKFD1zg==
X-Received: by 2002:a37:a40d:: with SMTP id n13mr1238262qke.47.1609877915054;
        Tue, 05 Jan 2021 12:18:35 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id d84sm235057qke.47.2021.01.05.12.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 12:18:34 -0800 (PST)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        John Crispin <john@phrozen.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] MIPS: Use address-of operator on section symbols
Date:   Tue,  5 Jan 2021 13:18:27 -0700
Message-Id: <20210105201827.51766-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When building xway_defconfig with clang:

arch/mips/lantiq/prom.c:82:23: error: array comparison always evaluates
to true [-Werror,-Wtautological-compare]
        else if (__dtb_start != __dtb_end)
                             ^
1 error generated.

These are not true arrays, they are linker defined symbols, which are
just addresses. Using the address of operator silences the warning
and does not change the resulting assembly with either clang/ld.lld
or gcc/ld (tested with diff + objdump -Dr). Do the same thing across
the entire MIPS subsystem to ensure there are no more warnings around
this type of comparison.

Link: https://github.com/ClangBuiltLinux/linux/issues/1232
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 arch/mips/bmips/setup.c          | 2 +-
 arch/mips/lantiq/prom.c          | 2 +-
 arch/mips/pic32/pic32mzda/init.c | 2 +-
 arch/mips/ralink/of.c            | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index 19308df5f577..1b06b25aea87 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -167,7 +167,7 @@ void __init plat_mem_setup(void)
 		dtb = phys_to_virt(fw_arg2);
 	else if (fw_passed_dtb) /* UHI interface or appended dtb */
 		dtb = (void *)fw_passed_dtb;
-	else if (__dtb_start != __dtb_end)
+	else if (&__dtb_start != &__dtb_end)
 		dtb = (void *)__dtb_start;
 	else
 		panic("no dtb found");
diff --git a/arch/mips/lantiq/prom.c b/arch/mips/lantiq/prom.c
index 51a218f04fe0..3f568f5aae2d 100644
--- a/arch/mips/lantiq/prom.c
+++ b/arch/mips/lantiq/prom.c
@@ -79,7 +79,7 @@ void __init plat_mem_setup(void)
 
 	if (fw_passed_dtb) /* UHI interface */
 		dtb = (void *)fw_passed_dtb;
-	else if (__dtb_start != __dtb_end)
+	else if (&__dtb_start != &__dtb_end)
 		dtb = (void *)__dtb_start;
 	else
 		panic("no dtb found");
diff --git a/arch/mips/pic32/pic32mzda/init.c b/arch/mips/pic32/pic32mzda/init.c
index 50f376f058f4..f232c77ff526 100644
--- a/arch/mips/pic32/pic32mzda/init.c
+++ b/arch/mips/pic32/pic32mzda/init.c
@@ -28,7 +28,7 @@ static ulong get_fdtaddr(void)
 	if (fw_passed_dtb && !fw_arg2 && !fw_arg3)
 		return (ulong)fw_passed_dtb;
 
-	if (__dtb_start < __dtb_end)
+	if (&__dtb_start < &__dtb_end)
 		ftaddr = (ulong)__dtb_start;
 
 	return ftaddr;
diff --git a/arch/mips/ralink/of.c b/arch/mips/ralink/of.c
index cbae9d23ab7f..2c9af61efc20 100644
--- a/arch/mips/ralink/of.c
+++ b/arch/mips/ralink/of.c
@@ -75,7 +75,7 @@ void __init plat_mem_setup(void)
 	 */
 	if (fw_passed_dtb)
 		dtb = (void *)fw_passed_dtb;
-	else if (__dtb_start != __dtb_end)
+	else if (&__dtb_start != &__dtb_end)
 		dtb = (void *)__dtb_start;
 
 	__dt_setup_arch(dtb);

base-commit: 36bbbd0e234d817938bdc52121a0f5473b3e58f5
-- 
2.30.0

