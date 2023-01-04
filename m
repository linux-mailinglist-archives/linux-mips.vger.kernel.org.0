Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5736F65DD2E
	for <lists+linux-mips@lfdr.de>; Wed,  4 Jan 2023 20:55:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235145AbjADTzF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Jan 2023 14:55:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240113AbjADTy6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 4 Jan 2023 14:54:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5706A17881;
        Wed,  4 Jan 2023 11:54:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BEB8961805;
        Wed,  4 Jan 2023 19:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A424AC433EF;
        Wed,  4 Jan 2023 19:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672862096;
        bh=wSbm0g/ASp2Rq+1sjo1z5jYMHVjuwfrl7bVt7IhiTdE=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=nmrz3pPrWgfV/pQ7uNJa5V63CxdAXhhyJms738yQDD4zWiY7UG7QN6OM/H942rh40
         Kkj4yEix4MPJP+X9rf06gUznaQeUfwfghN4diJUSXuRRX7HX/av+LLXpB9tUPL1K4E
         Px+6IhHORjZsb06F33MOW181JKnzRiHXHrlhsWojT3X71123sb2gLdPEaJkZW13BWN
         WQrt5zC3gf4X+I0PjNogB0gLnExCX3CVmaJC8NzhbabiDMmAlveKyZP7Qthv4ZqmNu
         m1BtWNRy3kpgXpy+w9FAbPFcWxnrOx7RxYog1yMutY8auoetBH9CmkZaHP+krcn6wK
         wIaybXYU0kZUQ==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 04 Jan 2023 12:54:20 -0700
Subject: [PATCH 03/14] MIPS: Prefer cc-option for additions to cflags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v1-3-658cbc8fc592@kernel.org>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
To:     masahiroy@kernel.org, ndesaulniers@google.com
Cc:     nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        kernel test robot <lkp@intel.com>, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1776; i=nathan@kernel.org;
 h=from:subject:message-id; bh=wSbm0g/ASp2Rq+1sjo1z5jYMHVjuwfrl7bVt7IhiTdE=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMlbb3bdrVtlFFG7j31+9ZPnH3uW3Flc3Dc1V+LQg4Qpp/+s
 OxQk1FHKwiDGwSArpshS/Vj1uKHhnLOMN05NgpnDygQyhIGLUwAm8r2E4X9pr5kzM9tnKzPdZU/fPU
 wLDEtQ1/LMXBm39ufMtkfVT04xMux+NDNA91PoC059FaG22fJ/70z8v0JPpUvW02Gu1deXHowA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

A future change will switch as-option to use KBUILD_AFLAGS instead of
KBUILD_CFLAGS to allow clang to drop -Qunused-arguments, which may cause
issues if the flag being tested requires a flag previously added to
KBUILD_CFLAGS but not KBUILD_AFLAGS. Use cc-option for cflags additions
so that the flags are tested properly.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org
---
 arch/mips/Makefile             | 2 +-
 arch/mips/loongson2ef/Platform | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index a00a6d94e16f..04e46ec24319 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -143,7 +143,7 @@ cflags-y += -fno-stack-check
 #
 # Avoid this by explicitly disabling that assembler behaviour.
 #
-cflags-y += $(call as-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
+cflags-y += $(call cc-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
 
 #
 # CPU-dependent compiler/assembler options for optimization.
diff --git a/arch/mips/loongson2ef/Platform b/arch/mips/loongson2ef/Platform
index eebabf9df6ac..c6f7a4b95997 100644
--- a/arch/mips/loongson2ef/Platform
+++ b/arch/mips/loongson2ef/Platform
@@ -25,7 +25,7 @@ cflags-$(CONFIG_CPU_LOONGSON2F) += -march=loongson2f
 # binutils does not merge support for the flag then we can revisit & remove
 # this later - for now it ensures vendor toolchains don't cause problems.
 #
-cflags-$(CONFIG_CPU_LOONGSON2EF)	+= $(call as-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
+cflags-$(CONFIG_CPU_LOONGSON2EF)	+= $(call cc-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
 
 # Enable the workarounds for Loongson2f
 ifdef CONFIG_CPU_LOONGSON2F_WORKAROUNDS

-- 
2.39.0
