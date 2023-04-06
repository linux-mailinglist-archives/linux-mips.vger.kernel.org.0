Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79DF46DA254
	for <lists+linux-mips@lfdr.de>; Thu,  6 Apr 2023 22:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjDFUJt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Apr 2023 16:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239084AbjDFUJb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Apr 2023 16:09:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF1ADE
        for <linux-mips@vger.kernel.org>; Thu,  6 Apr 2023 13:09:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 87B1662CC7
        for <linux-mips@vger.kernel.org>; Thu,  6 Apr 2023 20:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D89C433D2;
        Thu,  6 Apr 2023 20:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680811770;
        bh=Q7lexELhWJnXP5ulJenE60lac1wT7UwrK1pKH0F6JEM=;
        h=From:Date:Subject:To:Cc:From;
        b=b/e4Q8CHXD7PdCulLx9tfXOkZNUr/kiIjmM0HMkVvUHAjbKB0C1B/sLBaMliVYDYy
         aupviGR5G0w+TK0gWCMXwtJX/k2Hal7azC4hwUDsDxamY/rXPjDQu05Oi5xYFGum+S
         GdonFAbHsTK3Y8vW8aJLppF9CjsWUCREkF6ZQlQYBc+QIxJDxwm3zC8akUTt2tfW6R
         ATs7x9pU8GWci6yLkAw07XFVn/221wS/os8jViHn7Ybrb1dqMKjpk8NDEbEKkdf2uZ
         5K0af7Ava8HgTROFyL53btUn4ZKMQDiaUZ01XHvjAitfy+rRBTBLof89HyV1M0XlS0
         NYQbkfZf2MU3Q==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Thu, 06 Apr 2023 13:09:15 -0700
Subject: [PATCH] MIPS: generic: Do not select CPUs that are unsupported in
 clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230406-mips-clang-generic-selects-fix-v1-1-811690c9fb69@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOomL2QC/x2NwQqDQAxEf0VybmB3Lbb0V0oPuzFqQLeSSCmI/
 97Y4/Bm3uxgrMIGj2YH5Y+YvKuHeGmAplxHRuk9QwqpDdfQ4SKrIc2OcOTqY0LjmWkzHOSLOQ2
 30qbY9fEOLinZGIvmStOpWbJtrCdYlb3/f36+juMH0I9/84kAAAA=
To:     tsbogend@alpha.franken.de, jiaxun.yang@flygoat.com
Cc:     linux-mips@vger.kernel.org, llvm@lists.linux.dev,
        patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1846; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Q7lexELhWJnXP5ulJenE60lac1wT7UwrK1pKH0F6JEM=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCn6aj9zHQse+prd+XfuYWLHxeSgewf33H33NJf3PBPT4
 xdrLFw+dZSyMIhxMMiKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJWDowMqxjiAmSq1Nk/jmP
 KUfxc4VbrZh80Iz1TB8TnvouX3q35TEjw5q32ZIGMqIz2TeZNsx9c32NbuTppmNbrm0w2vD0YGB
 4OD8A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When building allnoconfig with clang after commit de34007751aa ("MIPS:
generic: Enable all CPUs supported by virt board in Kconfig"), the
following error occurs:

  error: unknown target CPU 'r4600'
  note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600

Working around that, there are similar errors for 'loongson2e' and
'loongson2f'.

These CPUs are not supported in clang/LLVM, so do not select support for
them in MIPS_GENERIC_KERNEL when building with clang.

Fixes: de34007751aa ("MIPS: generic: Enable all CPUs supported by virt board in Kconfig")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/mips/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index a975f140ae82..84de20f48b59 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -154,15 +154,15 @@ config MIPS_GENERIC_KERNEL
 	select SMP_UP if SMP
 	select SWAP_IO_SPACE
 	select SYS_HAS_CPU_CAVIUM_OCTEON
-	select SYS_HAS_CPU_LOONGSON2E
-	select SYS_HAS_CPU_LOONGSON2F
+	select SYS_HAS_CPU_LOONGSON2E if !CC_IS_CLANG
+	select SYS_HAS_CPU_LOONGSON2F if !CC_IS_CLANG
 	select SYS_HAS_CPU_MIPS32_R1
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_HAS_CPU_MIPS32_R6
 	select SYS_HAS_CPU_MIPS64_R1
 	select SYS_HAS_CPU_MIPS64_R2
 	select SYS_HAS_CPU_MIPS64_R6
-	select SYS_HAS_CPU_R4X00
+	select SYS_HAS_CPU_R4X00 if !CC_IS_CLANG
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN

---
base-commit: 045c340c86f8a9d7cb675e179dc6297caa6ebc01
change-id: 20230406-mips-clang-generic-selects-fix-a2f7b3216d18

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

