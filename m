Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5BF66693A
	for <lists+linux-mips@lfdr.de>; Thu, 12 Jan 2023 04:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235845AbjALDFm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Jan 2023 22:05:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234552AbjALDFk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Jan 2023 22:05:40 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 401FE4882A;
        Wed, 11 Jan 2023 19:05:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F3A4AB81DB7;
        Thu, 12 Jan 2023 03:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17550C43396;
        Thu, 12 Jan 2023 03:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673492736;
        bh=txYeyGRL/DUszIFU8B4pWQlNw6Izr2In0VO93aHbv50=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=ImL+LmFd0dlpeiyG1gRq30oZdW6wC3ArA18BiYxRvSms8DRsD6rb8jnDldcLQQwfu
         LsOt6BDl/yPjPIx8v4EndJd4sTBkMsAAbKw/onUjgObwRykyngh1jSHRqe3UAIvmRl
         rs1a5GPIEMRUbeNmOZWtxXPm8xfcxWNPVJ0/yAAhGQb81HgbFYz2cuUOAKZd1mWCbl
         hy947COMZyZgE/CuywCG3Vn+tVtcHQuCTrJ2KVTA9INFqScm6aPedZ7GeMkTveffTu
         ESylkPlUnpZPtfIKCkEjXbIyclOW+0xq2AcHwSPp/78OQ5flR4TZ/8jUCx/vjUvgtq
         SYOqcRObpSk7Q==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 11 Jan 2023 20:05:00 -0700
Subject: [PATCH v2 03/14] MIPS: Prefer cc-option for additions to cflags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221228-drop-qunused-arguments-v2-3-9adbddd20d86@kernel.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
To:     masahiroy@kernel.org
Cc:     ndesaulniers@google.com, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        linux-mips@vger.kernel.org
X-Mailer: b4 0.12-dev-78c63
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919; i=nathan@kernel.org;
 h=from:subject:message-id; bh=txYeyGRL/DUszIFU8B4pWQlNw6Izr2In0VO93aHbv50=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMn7K35pvpfa//161ZvdhwWcAqtnti902blfldHEv2Rdxo5b
 bg9PdpSyMIhxMMiKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICbfIHhf46LXNv7dbW+KnM7G9Rm7N
 yX2Cbjtu/eYV+W6NkPa+QsfzH8L59tc+jYp/lJq54+P6Z3ND/3UpfwHp/srSevtC/UP+BqzwgA
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
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
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

