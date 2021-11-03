Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8362B443B9C
	for <lists+linux-mips@lfdr.de>; Wed,  3 Nov 2021 03:56:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhKCC6m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Nov 2021 22:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbhKCC6m (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Nov 2021 22:58:42 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A755BC061714
        for <linux-mips@vger.kernel.org>; Tue,  2 Nov 2021 19:56:06 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id j6-20020a4aab46000000b002bb88bfb594so353723oon.4
        for <linux-mips@vger.kernel.org>; Tue, 02 Nov 2021 19:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jmcoOFlseOJ8q36YqWInVUDgFMr2I+2JqFQNK1o3S+o=;
        b=ZI8ecfgNQGD3cgz14Fr1nXNC8xoNlmkmHG8AVUQ1L5RKdd6EX93Ml/mwZ9wxRFA7r9
         MqzNs4eJxJJkmJ0gRljnNl5Gl0iY4olscPSki79RvHqWBWB29ly6kcNzxx6rr4j5iec6
         4o2CXnV4uDT1VQIfYoA7etRRkpaomGPji3GpEMJRpbxIHEW4gbJH3oR8haER4Kb/mkgN
         yiLzFsqdutL/KF/VC3waFk6wHrdjHvYrjcsDyeBUHQ7eOWnML9eCXhU20/FyNljzvz2E
         iLP/4hqTRBGN6dR3tLlSJ4Ep7dgoVDnpOCmelvVSXL4FpYBc57J1AHzEenMAM1bWc3tm
         xkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jmcoOFlseOJ8q36YqWInVUDgFMr2I+2JqFQNK1o3S+o=;
        b=ZiqJWMG1CqZs+iuy3qtCmKqm2FdQovhp9XCUGuJPv7UE4tC94oHCMQvpuKq7yyhC7e
         J23YqmLk2kyg00tzSqRdrr7CwGNKbOzgAZkoH/V2HUyLDnkVYdVlMi4I3Yoaaq9rpaiR
         jKw8ZwkMRvS+dVInSb+Fd3BdSqwbSCaTbGIJnPS22XII+OfI7temFqQOTkQ8JZYWqRCx
         8fRYWuYXuMoCxTN/kseDXA3JA1klsdS5Xmy+RO3U8Tm+0UEQBgL9mlbBYBbGBLb7UVtH
         lmcwgZjfg1NyW6h1NLu5NvDfvH0XlKj01ZYSOJOe40rCccvL7nHPo89HZ/iFD11ikndx
         j1hg==
X-Gm-Message-State: AOAM532IVdqaqWVPoYFBmXp7STXeAzh+uws7uwKSUOYyu0D9nk2kucq3
        6ZkB5cb5mab/fxyT3L1XDuI0Vcn+kgMqd/8v
X-Google-Smtp-Source: ABdhPJwyrKqRto5Eval60ZLGuPp3nJzg9cJ/kQvXeTvJ8UumgQ9RW96EtWladX6+rqaBEmLN+HixeQ==
X-Received: by 2002:a4a:ae0b:: with SMTP id z11mr27559539oom.25.1635908165882;
        Tue, 02 Nov 2021 19:56:05 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.76])
        by smtp.gmail.com with ESMTPSA id y4sm224766ots.73.2021.11.02.19.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 19:56:05 -0700 (PDT)
From:   Wang Haojun <jiangliuer01@gmail.com>
X-Google-Original-From: Wang Haojun <wanghaojun@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Wang Haojun <wanghaojun@loongson.cn>,
        Li Xuefeng <lixuefeng@loongson.cn>
Cc:     linux-mips@vger.kernel.org
Subject: [PATCH v2] MIPS: syscalls: Wire up futex_waitv syscall
Date:   Wed,  3 Nov 2021 10:55:21 +0800
Message-Id: <20211103025521.3615671-1-wanghaojun@loongson.cn>
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
+449	n32	futex_waitv			sys_futex_waitv
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

