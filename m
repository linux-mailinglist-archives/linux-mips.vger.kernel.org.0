Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A49C443B99
	for <lists+linux-mips@lfdr.de>; Wed,  3 Nov 2021 03:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhKCCwe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Nov 2021 22:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbhKCCwe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Nov 2021 22:52:34 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 575D0C061714
        for <linux-mips@vger.kernel.org>; Tue,  2 Nov 2021 19:49:58 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id u2so1680278oiu.12
        for <linux-mips@vger.kernel.org>; Tue, 02 Nov 2021 19:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pk9sYOS+33gx/6YxsrMWiCUGpnQuP13swEJcLFFH5oE=;
        b=A8V6LwAg6j5jxIKWhUoNg6PASIlDlmViKxT1fVSFfLtWHTp3M1iQBPU6sD4NJI7kJM
         Wp2AsR9XVhDFm7JUEmC/PQBX0QVd0HkbfoLYAHG7A9j6krXmtdEx57qbIRLQ71ryifld
         8cwLUGwxrMP12ifr5T8wsVeoJjyzKAFni0jvv0cibsmY3LPBZavnTMhcdkNx3tPt1Z7R
         vTG6Wj0+2JCY2Ega8gFVRI5tSvmnBiQXbEXMEPl8O6ojFDjrmDLKhlXPD6gPUzyvafNJ
         BO5Rnq4prWavXzB44BUTO2jX8lQVl1CLTfTlgt3iZm8QLre0HiacQxr0gh3L3i3c1rI2
         tL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pk9sYOS+33gx/6YxsrMWiCUGpnQuP13swEJcLFFH5oE=;
        b=TCtt6MscPTs7Zkq0JRc8JsopB23cG19rybtBeNde8IbfnyjGJZkzOUDLFsDl49OOgt
         FWVTkmT7IxGZqAOzS2rMqhe1QZ8RnKc7+/KIH48zEgztlVDnyJOlCeNMKxCd8Zbg1k2A
         adgDN0UsXFfy3hKlysTZRrMgPtD0Xg13AsRY61yGoaQqk/J3QU0xhwSLnhHm0rlRl6Jk
         vXbg9kSBEn6ecZyGGxa8D7z+xzquNaRj0PdVRBtRIw4QdETX10C8ZMXCSweh2IMLSkJY
         bD+Enh4nRIAa+jXcrK4c5ORG8U+9S8+VYTcdmbt+1FRoBvK2dCJpaKtoXm0y6s/LGVd7
         aAoQ==
X-Gm-Message-State: AOAM533H8gv9iNheElGD7nFozyzMc7UpCknxFRiUkvZSG+xXCMtnwiNH
        B7EqKRPAW5+KReG11DXK1x0=
X-Google-Smtp-Source: ABdhPJyi9YLpEHpPXeLKfr87ndnsb60uG4i+fOkUvXYQ44OlN20ACVIbS5wLTAmyLpT9+R6ETfdueA==
X-Received: by 2002:a05:6808:f8b:: with SMTP id o11mr8151343oiw.5.1635907797788;
        Tue, 02 Nov 2021 19:49:57 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.76])
        by smtp.gmail.com with ESMTPSA id h7sm219751otn.11.2021.11.02.19.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 19:49:57 -0700 (PDT)
From:   Wang Haojun <jiangliuer01@gmail.com>
X-Google-Original-From: Wang Haojun <wanghaojun@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Wang Haojun <wanghaojun@loongson.cn>,
        Li Xuefeng <lixuefeng@loongson.cn>
Cc:     linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: syscalls: Wire up futex_waitv syscall
Date:   Wed,  3 Nov 2021 10:49:17 +0800
Message-Id: <20211103024917.3611276-1-wanghaojun@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Wire up the futex_waitv syscall.

Fix Build warning: #warning syscall futex_waitv not implemented [-Wcpp]

Signed-off-by: Wang Haojun <wanghaojun@loongson.cn>
---
 arch/mips/kernel/syscalls/syscall_n32.tbl | 1 +
 arch/mips/kernel/syscalls/syscall_n64.tbl | 1 +
 arch/mips/kernel/syscalls/syscall_o32.tbl | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/mips/kernel/syscalls/syscall_n32.tbl b/arch/mips/kernel/syscalls/syscall_n32.tbl
index 70e32de2bcaa..e497492eb72f 100644
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@ -387,3 +387,4 @@
 446	n32	landlock_restrict_self		sys_landlock_restrict_self
 # 447 reserved for memfd_secret
 448	n32	process_mrelease		sys_process_mrelease
+448	n32	futex_waitv			sys_futex_waitv
diff --git a/arch/mips/kernel/syscalls/syscall_n64.tbl b/arch/mips/kernel/syscalls/syscall_n64.tbl
index 1ca7bc337932..e2c481fcede6 100644
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@ -363,3 +363,4 @@
 446	n64	landlock_restrict_self		sys_landlock_restrict_self
 # 447 reserved for memfd_secret
 448	n64	process_mrelease		sys_process_mrelease
+449	n64	futex_waitv			sys_futex_waitv
diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/syscalls/syscall_o32.tbl
index a61c35edaa74..3714c97b2643 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -436,3 +436,4 @@
 446	o32	landlock_restrict_self		sys_landlock_restrict_self
 # 447 reserved for memfd_secret
 448	o32	process_mrelease		sys_process_mrelease
+449	o32	futex_waitv			sys_futex_waitv
-- 
2.27.0

