Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD87C1B61CA
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2020 19:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729914AbgDWRSf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 13:18:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729873AbgDWRSf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Apr 2020 13:18:35 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D7DEC09B042;
        Thu, 23 Apr 2020 10:18:35 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id i9so1483360ool.5;
        Thu, 23 Apr 2020 10:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GILvIx3f4BgcOXSqsviaTizrH5Jn18xvHIx2HxEKgO0=;
        b=boH2xgHEvJLwuVRAfI6ruW7K6gG7cxpBDf76Wb3CvUghX8huVBdPbFzsn8KXSbt8L5
         GSrbXveRLSNQ1XKpMTl6tWxbZOhwu2Q71EtSdaaggQ03zHuTtlEoA3VIfZVLSLBigfrw
         Oosb/ev9UpkJXNY8Ocxbrq1YJdDNv0zVKewwUtJw5zVCJimidtn9xOFKOY+UPxUV7epR
         81poD39/jembYOT9xM66sS44p7wGiHCO30qUlYewUTRpCXThNddvg+YKpi+9LBpjobm7
         wwErfQ2d9JDr2aDn3uXX3D3MeZYVCaNU5OYx0BroXhrezDD54nn6bZBO9GMTrnI/4n7r
         GWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GILvIx3f4BgcOXSqsviaTizrH5Jn18xvHIx2HxEKgO0=;
        b=rCe2v8VYZEEJNUYKM2BtieZfMtm007FxIAEB0DfyUx2rqlSWkF+JzZZLbkYA7LVCf4
         T/8ESy7+Lo9XwvuLqUbGwM7agE/USXhiJD6NGyUjoiIwu8u2cyvg2W6VcwXfWV3Yphem
         hC36+3CpBJsvfTcYvcQn3ZcVxp11QXIXGjSXp55TBbAmPvxMgr9rUxI3Lzez6JVr/mDl
         +qLAFLAaQmnv+h4wnq7oeSpwJ/eL+2NYVI12qLCX/XhKn5cTE+/79qL/ml2BIlIoBO/H
         3ex8LZ5PQvL5t1yJlmMGhGWKuec8R8OCmh3m8kr9uyqmHkjXNjZRKQCHYxYPuTT3UpV3
         H7Gw==
X-Gm-Message-State: AGi0PuaUTixrHprENnioOA7B0PxOi1bjHR0hn6JQCPJA37s5jfOWFQiT
        vEsI6Db5lInU53SpE9sAEl8=
X-Google-Smtp-Source: APiQypIEvSQvqrAUjKg/5w2LZSQtWpOI62mrEPs+UkTHfg38XF/2xlNzkC7c2s3ipf+OBN7YpsFx6Q==
X-Received: by 2002:a4a:a54a:: with SMTP id s10mr4319105oom.73.1587662314470;
        Thu, 23 Apr 2020 10:18:34 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id y5sm746726otq.38.2020.04.23.10.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 10:18:33 -0700 (PDT)
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
Subject: [PATCH v3 3/4] MIPS: VDSO: Use $(LD) instead of $(CC) to link VDSO
Date:   Thu, 23 Apr 2020 10:18:06 -0700
Message-Id: <20200423171807.29713-3-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200423171807.29713-1-natechancellor@gmail.com>
References: <20200419202128.20571-1-natechancellor@gmail.com>
 <20200423171807.29713-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently, the VDSO is being linked through $(CC). This does not match
how the rest of the kernel links objects, which is through the $(LD)
variable.

When clang is built in a default configuration, it first attempts to use
the target triple's default linker then the system's default linker,
unless told otherwise through -fuse-ld=... We do not use -fuse-ld=
because it can be brittle and we have support for invoking $(LD)
directly. See commit fe00e50b2db8c ("ARM: 8858/1: vdso: use $(LD)
instead of $(CC) to link VDSO") and commit 691efbedc60d2 ("arm64: vdso:
use $(LD) instead of $(CC) to link VDSO") for examples of doing this in
the VDSO.

Do the same thing here. Replace the custom linking logic with $(cmd_ld)
and ldflags-y so that $(LD) is respected.

Before this patch, LD=ld.lld did nothing:

$ llvm-readelf -p.comment arch/mips/vdso/vdso.so.dbg | sed 's/(.*//'
String dump of section '.comment':
[     0] ClangBuiltLinux clang version 11.0.0

After this patch, it does:

$ llvm-readelf -p.comment arch/mips/vdso/vdso.so.dbg | sed 's/(.*//'
String dump of section '.comment':
[     0] Linker: LLD 11.0.0
[    62] ClangBuiltLinux clang version 11.0.0

Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v2 -> v3:

* New patch.

 arch/mips/vdso/Makefile | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index 92b53d1df42c3..da5db947072d5 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -60,10 +60,9 @@ ifdef CONFIG_MIPS_DISABLE_VDSO
 endif
 
 # VDSO linker flags.
-VDSO_LDFLAGS := \
-	-Wl,-Bsymbolic -Wl,--no-undefined -Wl,-soname=linux-vdso.so.1 \
-	$(addprefix -Wl$(comma),$(filter -E%,$(KBUILD_CFLAGS))) \
-	-nostdlib -shared -Wl,--hash-style=sysv -Wl,--build-id
+ldflags-y := -Bsymbolic --no-undefined -soname=linux-vdso.so.1 \
+	$(filter -E%,$(KBUILD_CFLAGS)) -nostdlib -shared \
+	--hash-style=sysv --build-id -T
 
 CFLAGS_REMOVE_vdso.o = -pg
 
@@ -82,11 +81,7 @@ quiet_cmd_vdso_mips_check = VDSOCHK $@
 #
 
 quiet_cmd_vdsold_and_vdso_check = LD      $@
-      cmd_vdsold_and_vdso_check = $(cmd_vdsold); $(cmd_vdso_check); $(cmd_vdso_mips_check)
-
-quiet_cmd_vdsold = VDSO    $@
-      cmd_vdsold = $(CC) $(c_flags) $(VDSO_LDFLAGS) \
-                   -Wl,-T $(filter %.lds,$^) $(filter %.o,$^) -o $@
+      cmd_vdsold_and_vdso_check = $(cmd_ld); $(cmd_vdso_check); $(cmd_vdso_mips_check)
 
 quiet_cmd_vdsoas_o_S = AS      $@
       cmd_vdsoas_o_S = $(CC) $(a_flags) -c -o $@ $<
-- 
2.26.2

