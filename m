Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31C291BCFAE
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 00:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726361AbgD1WO6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 18:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726946AbgD1WOs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Apr 2020 18:14:48 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96ED9C03C1AE;
        Tue, 28 Apr 2020 15:14:48 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id m13so35588371otf.6;
        Tue, 28 Apr 2020 15:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7RXicgLKtxfo0xJMhMqi5KWPBmvi4LyzTbOskfEYJQQ=;
        b=cboZAHaR1XgMdVyexb3ZGscW0yg4jWB0WpJQsyGN+lTcL8lo0DgeHrbARXRAwiBelT
         fv11CmiuZPcFsPUdZ8Dk+cJFKE8pyoidKR1d3NFr2BdZlfocsEijQwaSXTfJi06/l5hd
         bghcn7uaGbR50pQ0KULUrZ/37+Xhf1drNozRzBeTLWLqMJN2OItBt7D8ILHkk7qhUv/R
         FVSPXdnhK/XVrHtHF742d0mlh5PFTggLAAnQhz+u409zzuWp1T2W2dG3BUDYMand6XtU
         M0E5oV3fpNweYRrDo7ridTW0Qfj/E++JGqWAGbPgSO8EfX8jQx9qmsZ7JzcIP7Qij4H1
         Sqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7RXicgLKtxfo0xJMhMqi5KWPBmvi4LyzTbOskfEYJQQ=;
        b=jTdy/cX5adnxpDedcssbFj6GHk2j55rBwxPJRDs0APjjAIIZXpwDMtlAnU1AFSdUDT
         SjhIiV5HX4wy9rtPU65TPuqmQGBcNzQrXMLkegBnMsbr5KE3jDgE0InQeOdNEHMqwu/W
         MO0Ql4ZDPACNN4+dDuqQALJ+ekahxmpIKtZ35lvH4CEyg6LKkRf/hlwLlS+EAXjSHYGo
         rW2YJJmWGkoZc0c2j7PX6Atbi8j/kihPFsiVwYhLmEza1anMKsVAHmxnv286tRZb0SW1
         qPYcT39S+nvjaDJfOS+bTzhoTtkaztPlSvbPC+H955dXsqaeUFrPIhK/qfvDIrVNFOKK
         84UA==
X-Gm-Message-State: AGi0PuYZDZyJ4LnlohK8iz5PI5YRrdCfhFN+EaEWvdaYDFwqgQNPPLQC
        KYFXSjh7NqsmW8xEwT/SjWc=
X-Google-Smtp-Source: APiQypL7QIFgYkaJ3tpdi/WMTCTqv80Zf90fvEaMBmkj0KaYd0MyEcNgUPXo4UrUQWWmFQ5wK66MQQ==
X-Received: by 2002:a05:6830:92:: with SMTP id a18mr25129047oto.317.1588112087977;
        Tue, 28 Apr 2020 15:14:47 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id 186sm5267476ooi.30.2020.04.28.15.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 15:14:47 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Fangrui Song <maskray@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH v4 5/5] MIPS: VDSO: Allow ld.lld to link the VDSO
Date:   Tue, 28 Apr 2020 15:14:19 -0700
Message-Id: <20200428221419.2530697-6-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200428221419.2530697-1-natechancellor@gmail.com>
References: <20200423171807.29713-1-natechancellor@gmail.com>
 <20200428221419.2530697-1-natechancellor@gmail.com>
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

v3 -> v4:

* No changes.

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

