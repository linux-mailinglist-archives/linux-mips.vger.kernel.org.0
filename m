Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31CE65B4C41
	for <lists+linux-mips@lfdr.de>; Sun, 11 Sep 2022 07:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbiIKF43 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 11 Sep 2022 01:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbiIKF42 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 11 Sep 2022 01:56:28 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB0DD275F5
        for <linux-mips@vger.kernel.org>; Sat, 10 Sep 2022 22:56:27 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id n23-20020a17090a091700b00202a51cc78bso3021573pjn.2
        for <linux-mips@vger.kernel.org>; Sat, 10 Sep 2022 22:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=DCwJj87WidsHgmYTeYszpwjCSpQ0FFV5K9uO1qTls9M=;
        b=MCDscIy6ZwSiHMmxGAWaWoCjqCB0cnaVl3wD8DzCGHM3GV/e6gN3jQAbtmV6gYq8+p
         TBSoTN5pFHqjd5FqvWnBwbD/R+6h8ql84sTepQbkVkFxe2oVm1f1FJ8ym4tpb9KO0I4x
         8whErwPAZjuWdee85tVZ2BegOHBRpH9o9D0gSS02xv4XFhjm+8oGwpY/HrqCvMuxvdni
         tqnURVJOJciTLWi96FuiBqjj/59gskU+JrxQ2V7ywje6S6gD3GKuRL23tTp5s8zaV1jz
         2gr9n6M5HpcDf17oUi6dVHVt0FgJiv+4AP2JMxE2Fyf7YuPldn1mIK0EgsLNChPf+JzJ
         TPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=DCwJj87WidsHgmYTeYszpwjCSpQ0FFV5K9uO1qTls9M=;
        b=1rAXvjt+r+utc5aI/KqcSD5Eq2sd7VRe6d/XcspCoYD3IoubaRHWPf/FaOjvAcdW1M
         J3PTYw2cqd7yudRgPycCHSMa5PrMtnxlSPa9DBMUlSyTnQvI0tqYfenMHJAtjlTTzyrc
         jIAQxd8AZ2VHBBmtZl24AOm9u4CaAaY/zeVW9qepwtHLphPWQeGP12Qc6VfcCvIrwqVU
         dgPsf8k/L0e+2gRFaJr4fHweIlgQAnr8BAmG9y6SrqCD9fTm5OqwD0NhfjrORMHQ1Tzw
         e0ejeet3MqJ+xCp3rbByjnwB3KOcpt4TtFSpQeud5sDgLsDTi8GMDU5Z8miMoB1VTJ8v
         QpbQ==
X-Gm-Message-State: ACgBeo3vcGX9yEF4GCKsGGrUrUUvEcrrGqdosKMt4aXaTUA9anKacSFm
        nj1y+65NnosDpEpVQTTllaMmJNZC5gd/Vk9j1RyoIJfUQczcIZp/
X-Google-Smtp-Source: AA6agR4gJ5JrWbdmFxZZQeW6/V+wWK1xQ2WTeoeFKXtoWRtdAVrHY1A4PF292/1VH/6N765IOfAsa+dg48SqRGfNbA8=
X-Received: by 2002:a17:902:6b42:b0:172:ed37:bc55 with SMTP id
 g2-20020a1709026b4200b00172ed37bc55mr20767390plt.33.1662875786811; Sat, 10
 Sep 2022 22:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <202209101939.bvk64Fok-lkp@intel.com>
In-Reply-To: <202209101939.bvk64Fok-lkp@intel.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Sun, 11 Sep 2022 06:56:14 +0100
Message-ID: <CAKwvOdn0i3N1DZCmx1RNoiq3086hBi_S2tkDmqNRhDx5-6rSeQ@mail.gmail.com>
Subject: Re: [masahiroy:fixes 6/6] arch/mips/kernel/branch.c:712:20: error:
 instruction requires a CPU feature not currently enabled
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        kernel test robot <lkp@intel.com>,
        linux-mips <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Sep 10, 2022 at 12:24 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git fixes
> head:   97f72ed7a6b5a6bbac628f1f6e91cf06d1ea2cb5
> commit: 97f72ed7a6b5a6bbac628f1f6e91cf06d1ea2cb5 [6/6] Makefile.compiler: Use KBUILD_AFLAGS for as-option
> config: mips-loongson2k_defconfig (https://download.01.org/0day-ci/archive/20220910/202209101939.bvk64Fok-lkp@intel.com/config)

This is likely:
arch/mips/loongson2ef/Platform
28:cflags-$(CONFIG_CPU_LOONGSON2EF)     += $(call
as-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
arch/mips/Makefile
155:cflags-y += $(call as-option,-Wa$(comma)-mno-fix-loongson3-llsc,)

probably both need to use cc-option similar to
https://lore.kernel.org/llvm/20220907045907.484043-2-ndesaulniers@google.com/

Masahiro, I'm at Linux Plumbers Conf; not sure when I can get to a
formal patch.  Want to drop my 2 patches and I'll send a v4 at some
point?

---
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 4d2a3e73fc45..6d27e302f6d1 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -152,7 +152,7 @@ cflags-y += -fno-stack-check
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
-cflags-$(CONFIG_CPU_LOONGSON2EF)       += $(call
as-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
+cflags-$(CONFIG_CPU_LOONGSON2EF)       += $(call
cc-option,-Wa$(comma)-mno-fix-loongson3-llsc,)

 # Enable the workarounds for Loongson2f
 ifdef CONFIG_CPU_LOONGSON2F_WORKAROUNDS
-- 
Thanks,
~Nick Desaulniers
