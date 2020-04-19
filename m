Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612051AFE0E
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2020 22:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgDSUVz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 19 Apr 2020 16:21:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgDSUVx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 19 Apr 2020 16:21:53 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB22C061A0C;
        Sun, 19 Apr 2020 13:21:53 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id w11so3977943pga.12;
        Sun, 19 Apr 2020 13:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vBTqjGSKxgqxZT9szVE8GVzxQE45UvUGVBjF3adPVE0=;
        b=FWvrXP6CntvRsYPxzVTzUNRydPoYIZ4A7DdlMX4Ng+XWJDb8L0xAxZMUmQNA1r73cs
         zOcvGl1RVuumjeJlXrZl2s7zQI2ewF2SCtOEgKVTiDB1T0o7WK8rxQVDg0M6EkNMNhVU
         LDGt1Sb2FDl6XwLUWRGXtPpklR4K6St5lvDPKjGRyA/8isV5xNpyN6YX0+HPZepQDBSj
         BmSxrb5brFn1qsYgrpOgG5wyWbJGpBPm9ebC9pkUcMo433rZ5sQVXqWfjkSxzYZp1pY2
         IEldluRJe2ADydFFFeR6ZGfV4HeHIHLWD/jkFA9W7Qi3dTBiP7l+1zL4geSNsksXx7Xv
         uc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vBTqjGSKxgqxZT9szVE8GVzxQE45UvUGVBjF3adPVE0=;
        b=gHSSfOHkUDegwS6ZvNBlz6QOUL2k4UFr9ESt7bLebXkNiqs/qO4j3bWFEoJ15B42ZA
         JLw554ZQAY+2OQp4efLOjw5780BW+LNdKKHEFv5Sy54J47bFZoMHO9MqP+LCk8jO4oC8
         KCFy9eSGI8KkpCrM8z5WHBKhEcJ3EVjNdTezBPIPb+7fhBEqzByhgMsJNyBDz4KnVzWd
         hY/ocabv5CN0h2DH9ui2ao2Ivz3uykI+jq+6M2jCbFoVpSVNnt+k2otqCXGaZ8RIb+ET
         4GdS9xxXnG7TDYuoJ0efjs9e6c1uJzhzh1t3P/2SPHVdJywUVRxop6fGt4d2S5AwxK3w
         zJOw==
X-Gm-Message-State: AGi0PuYj42tZdlKbDEorulOwwxi3/tYgb3CArbCSKEgMwTV6j/UsCIPm
        a7p2/fV4OPeSmtejtOdY0c0=
X-Google-Smtp-Source: APiQypIh9o5Ckl/3oHuyQjBPHeJK2UhvKUcM5DWz0EK2eYvUWxfMUgXaS/bAVcUEft80cdh6Xk2kLQ==
X-Received: by 2002:aa7:8118:: with SMTP id b24mr1866865pfi.321.1587327713102;
        Sun, 19 Apr 2020 13:21:53 -0700 (PDT)
Received: from Ryzen-7-3700X.localdomain ([82.102.31.53])
        by smtp.gmail.com with ESMTPSA id s66sm10881010pgb.84.2020.04.19.13.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 13:21:52 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH v2 3/3] MIPS: VDSO: Allow ld.lld to link the VDSO
Date:   Sun, 19 Apr 2020 13:21:28 -0700
Message-Id: <20200419202128.20571-3-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200419202128.20571-1-natechancellor@gmail.com>
References: <20200419180445.26722-1-natechancellor@gmail.com>
 <20200419202128.20571-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently, when linking with ld.lld, this warning pops up:

    arch/mips/vdso/Makefile:70: MIPS VDSO requires binutils >= 2.25

CONFIG_LD_VERSION is set with scripts/ld-version.sh, which is specific
to GNU ld. It returns 0 for ld.lld so CONFIG_MIPS_LD_CAN_LINK_VDSO does
not set.

ld.lld has a completely different versioning scheme (as it follows
LLVM's versioning) and it does not have the issue mentioned in the
comment block so it should be allowed to link the VDSO.

With this patch, the VDSO successfully links and shows P_MIPS_PC32 in
vgettimeofday.o.

$ llvm-objdump -Dr arch/mips/vdso/vgettimeofday.o | grep R_MIPS_PC32
			00000024:  R_MIPS_PC32	_start
			000000b0:  R_MIPS_PC32	_start
			000002bc:  R_MIPS_PC32	_start
			0000036c:  R_MIPS_PC32	_start
			00000468:  R_MIPS_PC32	_start

Link: https://github.com/ClangBuiltLinux/linux/issues/785
Link: https://github.com/llvm/llvm-project/commit/e364e2e9ce50c12eb2bf093560e1a1a8544d455a
Reported-by: Dmitry Golovin <dima@golovin.in>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v2:

* Move into Kconfig so that the warning does not happen.

 arch/mips/vdso/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/vdso/Kconfig b/arch/mips/vdso/Kconfig
index 36a52158d849..7aec721398d5 100644
--- a/arch/mips/vdso/Kconfig
+++ b/arch/mips/vdso/Kconfig
@@ -12,7 +12,7 @@
 # the lack of relocations. As such, we disable the VDSO for microMIPS builds.
 
 config MIPS_LD_CAN_LINK_VDSO
-	def_bool LD_VERSION >= 225000000
+	def_bool LD_VERSION >= 225000000 || LD_IS_LLD
 
 config MIPS_DISABLE_VDSO
 	def_bool CPU_MICROMIPS || (!CPU_MIPSR6 && !MIPS_LD_CAN_LINK_VDSO)
-- 
2.26.1

