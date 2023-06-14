Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEBD7306AC
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jun 2023 20:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbjFNSFT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Jun 2023 14:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231723AbjFNSEm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Jun 2023 14:04:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6DFE52;
        Wed, 14 Jun 2023 11:04:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A2166643F8;
        Wed, 14 Jun 2023 18:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0459AC433C9;
        Wed, 14 Jun 2023 18:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686765879;
        bh=wp7B/trtTxzsWZYBY9l+01nfl6ED3uURUNkOtUU1+Uw=;
        h=From:Subject:Date:To:Cc:From;
        b=KO+nORZYd0v91v7U3AQT65+13B2bxKZ62jI/Ssc83UeUa6tH/JtUBKI2/u9dsSZie
         3zV6tW9LHmRALXQI5dip9HaX+lnGYFFwzz1Kmf0yrNgzXCSbd+ZSEd8mgu3sdh/2RZ
         YuFyVwtNUta3juu+bhbJeeV86ZC2x+PZvwV7rcnNwkDNnTv2W+L7m9IVv6CzDKtz3n
         a+PEjsUuwWbgKeIyYJeXGJ0KvQYE2g/rn470WL7w610jeXCk7ihdDAJVh2wLB8KSqU
         zZzrPSKSPP8NQ1zktrapzwwpDv7eOMG/QREVkzgO/L1nEKi+RuRxHVnNsDxRuOWzE4
         BZVrHz/TbKVcw==
From:   Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 6.1 0/4] Update as-{instr,option} to use KBUILD_AFLAGS
Date:   Wed, 14 Jun 2023 11:04:34 -0700
Message-Id: <20230612-6-1-asssembler-target-llvm-17-v1-0-75605d553401@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADIBimQC/x2NQQrDIBAAvxL23C2uARv6ldKD2jUR1JZdCYWQv
 zfpcRiY2UBZMivchw2E16z53Q6gywBx8W1mzK+DwRo7GkcWHRJ6VeUaCgt2LzN3LGWtSDcc00S
 GUjRmSnA0glfGIL7F5axUr53lFB/hlL//8QPcleC57z/FxGyejQAAAA==
To:     gregkh@linuxfoundation.org, sashal@kernel.org,
        ndesaulniers@google.com
Cc:     naresh.kamboju@linaro.org, stable@vger.kernel.org,
        llvm@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Linux Kernel Functional Testing <lkft@linaro.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2123; i=nathan@kernel.org;
 h=from:subject:message-id; bh=wp7B/trtTxzsWZYBY9l+01nfl6ED3uURUNkOtUU1+Uw=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCldjKa+03bXmv4Q4tlR8/9Ul6HG72wZl847SrlXE1OFT
 nfxbYvoKGVhEONgkBVTZKl+rHrc0HDOWcYbpybBzGFlAhnCwMUpABO5EMzI8PiV3c+9Yan7hX9f
 vr23bvXyrBV365fWpDdtYbOYzrt0cwIjw1eZh8cyP9z0Y91Vk9RieOhxQr2cyvS6Gc7H9/ZrfPn
 JxwwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

This series backports commit d5c8d6e0fa61 ("kbuild: Update assembler
calls to use proper flags and language target") to linux-6.1.y to
address a recent issue caused by a change in behavior in clang:

https://lore.kernel.org/CA+G9fYsJq0sPC+q6vLNKUgBqCGmmjDrfeP4R1-95Eu28FJRY_A@mail.gmail.com/
https://lore.kernel.org/20230612185424.GA2891387@dev-arch.thelio-3990X/

While that was not the original intention of the aforementioned change,
it ends up resolving the issue for the same reason, by not passing flags
that are not supported or necessary for the current language target
(KBUILD_CFLAGS for .c files and KBUILD_AFLAGS for .S files) when testing
flags for that language target.

All patches except the second one are direct backports from mainline.
The second patch is a stable specific patch because the upstream
solution could break stable due to the minimum supported version of
binutils in mainline being a newer version than 6.1 and earlier; it
chooses to do the more conservative fix, which was alluded to in the
changelog of the upstream commit.

For now, this is just a 6.1 issue. If the issue occurs in older
releases, I will send separate backports. If there are any issues or
objections to this series, please let me know.

Cheers,
Nathan

---
Nathan Chancellor (2):
      MIPS: Move '-Wa,-msoft-float' check from as-option to cc-option
      MIPS: Prefer cc-option for additions to cflags

Nick Desaulniers (2):
      x86/boot/compressed: prefer cc-option for CFLAGS additions
      kbuild: Update assembler calls to use proper flags and language target

 arch/mips/Makefile                | 4 ++--
 arch/mips/loongson2ef/Platform    | 2 +-
 arch/x86/boot/compressed/Makefile | 2 +-
 scripts/Kconfig.include           | 2 +-
 scripts/Makefile.compiler         | 8 ++++----
 scripts/as-version.sh             | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)
---
base-commit: ca87e77a2ef8b298aa9f69658d5898e72ee450fe
change-id: 20230612-6-1-asssembler-target-llvm-17-3f8101fc008f

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

