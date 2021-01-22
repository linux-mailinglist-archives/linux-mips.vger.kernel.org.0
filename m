Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC50430012E
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 12:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbhAVLGu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Jan 2021 06:06:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:54526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727460AbhAVLEH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 Jan 2021 06:04:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0BE40239EE;
        Fri, 22 Jan 2021 11:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611313403;
        bh=H3dvS7z1dpIycPUnlikAwY9JX62iMQkndlpCnas/7tA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n8toSNaA1wuY9Fde0EW/luaN3+HBy+B33bzDxTlV7FsfWbR4jLf+z5quCEINTy8uR
         7n2k8wiFltsOsS9pFHu+SSz+cIGDIjhZILV9tHtY2cXfsSPOsDLKh6Sp3t+j7Ah29G
         EdcaQxy8PhvVdxpeuuJKLf1J9c0WxSJ+z5do0/bKJRqlUH/wOWyYauFiVvlmEXPPre
         hzeu999c9ruFUFz3OXnOlPzmsfvTuV5RADx3slSvcfF/vv6OY70xx1pIkVKLwmLuZv
         eG2j5thvZ2VapxYhX/r5dineDMXe0iZuf4ktu3gsUl86Gt6T8WE3gxxP30nXXn9o8R
         BrJayyxMpXW9Q==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Paul Burton <paulburton@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] MIPS: make kgdb depend on FPU support
Date:   Fri, 22 Jan 2021 12:02:51 +0100
Message-Id: <20210122110307.934543-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122110307.934543-1-arnd@kernel.org>
References: <20210122110307.934543-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

kgdb fails to build when the FPU support is disabled:

arch/mips/kernel/kgdb.c: In function 'dbg_set_reg':
arch/mips/kernel/kgdb.c:147:35: error: 'struct thread_struct' has no member named 'fpu'
  147 |    memcpy((void *)&current->thread.fpu.fcr31, mem,
      |                                   ^
arch/mips/kernel/kgdb.c:155:34: error: 'struct thread_struct' has no member named 'fpu'
  155 |   memcpy((void *)&current->thread.fpu.fpr[fp_reg], mem,

This is only relevant for CONFIG_EXPERT=y, so disallowing it
in Kconfig is an easier workaround than fixing it properly.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index e6bd1eee70f2..7fea149f63cf 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -41,7 +41,7 @@ config MIPS
 	select HANDLE_DOMAIN_IRQ
 	select HAVE_ARCH_COMPILER_H
 	select HAVE_ARCH_JUMP_LABEL
-	select HAVE_ARCH_KGDB
+	select HAVE_ARCH_KGDB if MIPS_FP_SUPPORT
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if MMU && COMPAT
 	select HAVE_ARCH_SECCOMP_FILTER
-- 
2.29.2

