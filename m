Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F06694473C0
	for <lists+linux-mips@lfdr.de>; Sun,  7 Nov 2021 17:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234210AbhKGQZ7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Nov 2021 11:25:59 -0500
Received: from condef-10.nifty.com ([202.248.20.75]:58973 "EHLO
        condef-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231853AbhKGQZ7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 7 Nov 2021 11:25:59 -0500
Received: from conuserg-09.nifty.com ([10.126.8.72])by condef-10.nifty.com with ESMTP id 1A7GKdLd000845
        for <linux-mips@vger.kernel.org>; Mon, 8 Nov 2021 01:20:40 +0900
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 1A7GJdco018789;
        Mon, 8 Nov 2021 01:19:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 1A7GJdco018789
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1636301980;
        bh=Ia5nRSFeHj6vuVeol5rcoB9Th6hH+WhF8mEQNkaxAjY=;
        h=From:To:Cc:Subject:Date:From;
        b=dDK0SVTkj2j/DKFFJpe6NecOPbWEQQQ3zitlty16bFz3cneWvfCc4koyvdz/cTXYM
         RmGuA3QeQthyb1pTUtYErEAh878SDx7YFNQ44Yd6Zdt0lwwhBmwO7WsaLcjSHosVY2
         0UgjqVpjay7wAEzpCk0HaMZ6obMQn1cr5Fjt1fn/K2i42ffFwfg7DQyzQDVIe9h8+P
         h0G7whinLfw+B6HA1kL0cqlatiqBsscAohwS4/dcy3nqwoMB2oQVAbJHPV6jq5Xu/M
         ijqC6ABzga70vFcoxxY4ldHKW62ZPEYpo5rl0QROrTJdrykN7N5b1+IP8Mr2Lo3VAq
         qAbQeIGYnlvVg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-mips@linux-mips.org
Cc:     clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        zhaoxiao <zhaoxiao@uniontech.com>
Subject: [PATCH] MIPS: VDSO: remove -nostdlib compiler flag
Date:   Mon,  8 Nov 2021 01:19:38 +0900
Message-Id: <20211107161938.323485-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The -nostdlib option requests the compiler to not use the standard
system startup files or libraries when linking. It is effective only
when $(CC) is used as a linker driver.

Since commit 2ff906994b6c ("MIPS: VDSO: Use $(LD) instead of $(CC) to
link VDSO"), $(LD) is directly used, hence -nostdlib is unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/mips/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index 1b2ea34c3d3b..d65f55f67e19 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -57,7 +57,7 @@ endif
 
 # VDSO linker flags.
 ldflags-y := -Bsymbolic --no-undefined -soname=linux-vdso.so.1 \
-	$(filter -E%,$(KBUILD_CFLAGS)) -nostdlib -shared \
+	$(filter -E%,$(KBUILD_CFLAGS)) -shared \
 	-G 0 --eh-frame-hdr --hash-style=sysv --build-id=sha1 -T
 
 CFLAGS_REMOVE_vdso.o = $(CC_FLAGS_FTRACE)
-- 
2.30.2

