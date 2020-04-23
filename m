Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB9051B61CC
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2020 19:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729924AbgDWRSj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 13:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729873AbgDWRSi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Apr 2020 13:18:38 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E38C09B042;
        Thu, 23 Apr 2020 10:18:36 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id 72so7428112otu.1;
        Thu, 23 Apr 2020 10:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eWIMc/tafff8n4r/ioH7WudEqX5eKJY4/xwKjCeysa8=;
        b=kArGXup8Vf4fJZuWNPUdQbwhZ7FifQlAfceTOlwuVHUC/OYWb1p7KJPArTUaKcOXga
         Mv9Y9gxkdvL7oC1hzUwDZ/EocCxG8ckOUNDTactW2YiIzCfBKrO6txmbhl5httcUlK8K
         iBTT9N68VbXe8FkFBd7bXr7cpLj3f+5YL8qRrpj71musLmviat79JKlDcMErKwNcz6AX
         BYIe5CCCqhUlPxuh/c7qN9DQNC8kcT/5y4GFlUPI8NFhbc26lbzMmZRQDXK58RXpqRZ6
         Fu1g4xr1/+g56fPtO0kKSWLicbSBM0COZGld3VcqJ95HhTapoTZ5basg2o4l8g3IQE0g
         /H1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eWIMc/tafff8n4r/ioH7WudEqX5eKJY4/xwKjCeysa8=;
        b=Z3xlyeXFxSjU0XA+JO9BZjStdb5gV91EfS/p5nWyHQ7/Qid2EYRQyLqdYX+1gwnl8+
         OtYM2IXk9gKXw8WFh/WmFJykUToTju/f60nP1ct6fKXW8Uc8MJ+Wz7IhJ5lIHr9GSGfR
         OwJWaQvUun4rzR5Lzpggx0e+riEuTUcRbU0HEmN1qvYt0SLdJN1WPwtm3bYZsAlCLcGa
         OMfWtrMzKlJGk0ooTSDSDGS5fwL0giaa2NGcenu63Fw92DisA6IxbKOZJlSuCsbCcNEK
         wVJNCxBFZt4B4NtP+U2pvLN+LE6Ezf81Y5LszIt8HNjhizh6tLPm2a63BcAD31hMLAe5
         43aw==
X-Gm-Message-State: AGi0PuZh5qDjfUbGvHGHg1ph/MVQPQaK7vyn5ZP+JmKq4Mgy9JJYzvkE
        8v3IMpRtWsI5t15Rn0KKOjY=
X-Google-Smtp-Source: APiQypLHdw9Re8ZNGGoE8MiNgAXFonviP9LlIhN1ClhOhtuOBAsRxzkpDfuVDEM8JJY6OpSlwgyNdQ==
X-Received: by 2002:a9d:24e3:: with SMTP id z90mr4304153ota.39.1587662316179;
        Thu, 23 Apr 2020 10:18:36 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id y5sm746726otq.38.2020.04.23.10.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 10:18:35 -0700 (PDT)
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
Subject: [PATCH v3 4/4] MIPS: VDSO: Allow ld.lld to link the VDSO
Date:   Thu, 23 Apr 2020 10:18:07 -0700
Message-Id: <20200423171807.29713-4-natechancellor@gmail.com>
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

Reported-by: Dmitry Golovin <dima@golovin.in>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/785
Link: https://github.com/llvm/llvm-project/commit/e364e2e9ce50c12eb2bf093560e1a1a8544d455a
---

v2 -> v3:

* No changes.

v1 -> v2:

* Move into Kconfig so that the warning does not happen.

 arch/mips/vdso/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/vdso/Kconfig b/arch/mips/vdso/Kconfig
index 36a52158d849b..7aec721398d59 100644
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
2.26.2

