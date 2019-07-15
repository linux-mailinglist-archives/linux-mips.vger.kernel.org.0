Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20BB269E68
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2019 23:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732344AbfGOVk3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jul 2019 17:40:29 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:34536 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730156AbfGOVk3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Jul 2019 17:40:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1563226819; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J3Y/wy/LIbFFdcKa02s8pUYwReL91haevitxXohYmJA=;
        b=Yk53lv9HpDhZZKCFpscWK6v05vmArVKnUVaI7SqU6sdX/EkwKaQBao+LSzpuYc3ASEgRnI
        s9dwgcbs4to7XP7Nmm3tIICeid0REofrIomr+VEDsOmT6g8hHNYNuEXKWCJJ+HtKGeerhx
        L+0IJuliYJnKZz/Lj4TowRto6oT8p+k=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Daniel Silsby <dansilsby@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 3/5] MIPS: Decouple CPU_SUPPORTS_HUGEPAGES from 64BIT
Date:   Mon, 15 Jul 2019 17:40:01 -0400
Message-Id: <20190715214003.9714-3-paul@crapouillou.net>
In-Reply-To: <20190715214003.9714-1-paul@crapouillou.net>
References: <20190715214003.9714-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Daniel Silsby <dansilsby@gmail.com>

We now have partial 32-bit MIPS huge page support, so there's no need
to restrict these config options only to 64-bit systems.

Signed-off-by: Daniel Silsby <dansilsby@gmail.com>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ff5f1314241e..47d50e37faa4 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -43,7 +43,7 @@ config MIPS
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if MMU && COMPAT
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
-	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if CPU_SUPPORTS_HUGEPAGES && 64BIT
+	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if CPU_SUPPORTS_HUGEPAGES
 	select HAVE_EBPF_JIT if (!CPU_MICROMIPS)
 	select HAVE_CONTEXT_TRACKING
 	select HAVE_COPY_THREAD_TLS
@@ -1223,7 +1223,7 @@ config SYS_SUPPORTS_LITTLE_ENDIAN
 
 config SYS_SUPPORTS_HUGETLBFS
 	bool
-	depends on CPU_SUPPORTS_HUGEPAGES && 64BIT
+	depends on CPU_SUPPORTS_HUGEPAGES
 	default y
 
 config MIPS_HUGE_TLB_SUPPORT
-- 
2.21.0.593.g511ec345e18

