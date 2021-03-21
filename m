Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1749F3432B6
	for <lists+linux-mips@lfdr.de>; Sun, 21 Mar 2021 14:19:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhCUNSu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 21 Mar 2021 09:18:50 -0400
Received: from aposti.net ([89.234.176.197]:38258 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229874AbhCUNSj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 21 Mar 2021 09:18:39 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] MIPS: generic: Support linking with LLVM ld.lld
Date:   Sun, 21 Mar 2021 13:18:05 +0000
Message-Id: <20210321131805.98422-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

LLVM's ld.lld chokes on the 64-bit sign-extended load addresses. Use
32-bit addresses if the linker is LLVM's ld.lld.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/generic/Platform | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
index b871af16b5b6..19b7d92a4ca7 100644
--- a/arch/mips/generic/Platform
+++ b/arch/mips/generic/Platform
@@ -12,8 +12,8 @@
 cflags-$(CONFIG_MACH_INGENIC_SOC)	+= -I$(srctree)/arch/mips/include/asm/mach-ingenic
 cflags-$(CONFIG_MIPS_GENERIC)	+= -I$(srctree)/arch/mips/include/asm/mach-generic
 
-load-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff80100000
-zload-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff81000000
+load-$(CONFIG_MIPS_GENERIC)		+= $(if $(CONFIG_LD_IS_LLD),0x80100000,0xffffffff80100000)
+zload-$(CONFIG_MIPS_GENERIC)	+= $(if $(CONFIG_LD_IS_LLD),0x81000000,0xffffffff81000000)
 all-$(CONFIG_MIPS_GENERIC)	:= vmlinux.gz.itb
 
 its-y					:= vmlinux.its.S
-- 
2.30.2

