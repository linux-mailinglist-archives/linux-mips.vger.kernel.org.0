Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05DC143E0F2
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 14:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbhJ1M2O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 08:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbhJ1M2O (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 08:28:14 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B671C061570
        for <linux-mips@vger.kernel.org>; Thu, 28 Oct 2021 05:25:47 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id y207so7962791oia.11
        for <linux-mips@vger.kernel.org>; Thu, 28 Oct 2021 05:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GMyOY8PCFVVOZ0hPtDrkLyKK9NOPb8N56A+X2xapE7I=;
        b=AqO/dMaFQGSrs33+DvthVPz/t77jxJ6Rj6URM4LLl43zjAhPbvcG758Mfi+E70edRn
         edCdVI7X7M7TZgJL6Yc/NZOf4N2Fum+xNcdT4MGTSBSbNBnyW2tL1ayvR1qq9dVTDZjb
         1L7rtTgV0aXzSNG2SnMiFtd0Ok7aeyzGe3kmLuMXe9KEnWwhUYUIGJdFzyUah2bfI4d+
         nz4fnWw+XET3TUdLkBApmWz5e+I1+rpySIry6Rg6gQFSXTalobyUxPXbW3u+uf2yKDcA
         cM7X0WfIN3B8LzRNphsLsj0a1uGmvut9PieT8AVaVGTiwHIIcPOozdzM33xRxCRu/OMf
         Z8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GMyOY8PCFVVOZ0hPtDrkLyKK9NOPb8N56A+X2xapE7I=;
        b=0sxfp/2QVIBkCZHdEZxN32qHHB5cGBl/2IVrXc30eQGSZ8XSHOQeS0YKND9cuU3xhO
         iJydIgsUt6VXAX5juW/kx/RNgDA+nwVEJoZ/m8tqmneamZ780xLHR3lAjZFyqSfBjQAf
         /A6wxwZlAxqdOVsOwPEt9fMM43WTeoFAuWZZMq85oM2tb49gPz0nnGNdKt5aTfQiTD6l
         UJC6FhvMaLEz4KSYKNvvVCeVjz2rw203qZYgbZyRzD5dVomjsyeK4QwRLwchy7PAULV3
         InMcDqQ0rj9Q+MWJ2BGLVvrRUui2dXYaHvWAU7AHnK77nenKdwxe7x/dGD6XLDcb0noW
         jiBA==
X-Gm-Message-State: AOAM532xDPMG4o7/HLSafs7VhGmV+qp4go3J3GPAYBTzl+k0fKzq3Ijq
        WMfC+HDdJmCX3qYKc7hXsf5DdxI62DOZLw==
X-Google-Smtp-Source: ABdhPJwul91JiUE3rW04Zeb1QoXVKrFw55bt2fsQ+/970ELGuJlGxW0ABfCIy6o6/k0+mfjsWieBzw==
X-Received: by 2002:a05:6808:2115:: with SMTP id r21mr887973oiw.110.1635423946861;
        Thu, 28 Oct 2021 05:25:46 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.76])
        by smtp.gmail.com with ESMTPSA id m23sm986486oom.34.2021.10.28.05.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 05:25:46 -0700 (PDT)
From:   Wang Haojun <jiangliuer01@gmail.com>
X-Google-Original-From: Wang Haojun <wanghaojun@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Wang Haojun <wanghaojun@loongson.cn>,
        Li Xuefeng <lixuefeng@loongson.cn>
Cc:     linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: Wire up sys_futex_waitv syscall
Date:   Thu, 28 Oct 2021 20:25:16 +0800
Message-Id: <20211028122516.3850621-1-wanghaojun@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Wire up sys_futex_waitv syscall.

Fix Build warning: #warning syscall futex_waitv not implemented [-Wcpp]

syscall futex_waitv not implemented

Signed-off-by: Wang Haojun <wanghaojun@loongson.cn>
---
 arch/mips/kernel/syscalls/syscall_n32.tbl | 1 +
 arch/mips/kernel/syscalls/syscall_n64.tbl | 1 +
 arch/mips/kernel/syscalls/syscall_o32.tbl | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/mips/kernel/syscalls/syscall_n32.tbl b/arch/mips/kernel/syscalls/syscall_n32.tbl
index 70e32de2bcaa..72d02d363f36 100644
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

