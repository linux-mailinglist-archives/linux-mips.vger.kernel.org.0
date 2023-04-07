Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53FA06DB20C
	for <lists+linux-mips@lfdr.de>; Fri,  7 Apr 2023 19:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbjDGRui (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Apr 2023 13:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbjDGRuh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Apr 2023 13:50:37 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B76555FF0
        for <linux-mips@vger.kernel.org>; Fri,  7 Apr 2023 10:50:33 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id r14so25884354oiw.12
        for <linux-mips@vger.kernel.org>; Fri, 07 Apr 2023 10:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680889833; x=1683481833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+VWDUTiyAIZrT1X2EsT34QcYgiBZpyZBJBIXwgc590=;
        b=K0ENvho0bsKDHn+1k5tt89RXyLznYLnaiI2SgB8UgvRSi7elIfZR5tsojIjd3+bDFr
         1JAx0oN+H6ydkP2cSxI8zxKTdZiv6+lq3ZGXfmv/cEOaKAFzAoU3je2h0chk8QEaeIq/
         SYpRhEmH2THrWUiY3v+sq7+NFqDgOjs9g0q1m5GyUwyocMJJxGaAcT16Yjo+iP0gaGGY
         RZg3PQM0tWGDr4k5g47NQNOctuwH+j/MGvclwl21WbvQOvrGrf4vpfkLeXuIm1aVS/dQ
         ZvG4VKr2zkGp1EGXispVLD43RYzWYFhnfRZZ1FX5sl4pEdqSUzqUDSITmI8Q8Ggrxqq0
         xzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680889833; x=1683481833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+VWDUTiyAIZrT1X2EsT34QcYgiBZpyZBJBIXwgc590=;
        b=HyVne77LbBwVkasrAbOJnY+NEfB2/+VbuBNd5DYhc9bV4LogQuMCpjULPNzRqPcGuF
         yeNKadc73yNSQSZcpE7I9uYhGKR96uA667ErbBlWkMp7tjwc8RZRPYXD1bVecygZydOk
         K++RcQd8WvvnRHFNq3Tlw6vvVuxISp+UJdXXfUifx6N1mSiStMTYWVYmkmB3x1rOXury
         2V5HPm9X5cyeb7FOYlyMrVa1zx1lKwTS5bETj3YCaWyfVT5FVjzrEiRWUH/wOMHUTxyW
         fhAb+moZ5E6NnTtYXCP53uFycTu/9DePt/Il5iuYVIsFyy4wifaRl2KL4ZxrviyZxITY
         azOw==
X-Gm-Message-State: AAQBX9dd8Zha3TLEcqEyfWXxz7Sit6hIFC0Fx41dKgHr4lm/hwEv6jfS
        +iLRLtqB4YiKfB8d0PyzLog=
X-Google-Smtp-Source: AKy350ZEGL2IDJTisqAJVF9lNZcfO+DcGpiPbjRskaOM3UEaGi5EXhM8M1FPEZXq8Ut2OenY5FstDw==
X-Received: by 2002:a05:6808:2d8:b0:38b:8acb:3245 with SMTP id a24-20020a05680802d800b0038b8acb3245mr1265841oid.13.1680889833038;
        Fri, 07 Apr 2023 10:50:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e3-20020a05680809a300b00389509965e3sm1849580oig.58.2023.04.07.10.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 10:50:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 7 Apr 2023 10:50:31 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        philmd@linaro.org, sergei.shtylyov@gmail.com,
        aleksander.lobakin@intel.com
Subject: Re: [PATCH v3 12/12] MIPS: generic: Enable all CPUs supported by
 virt board in Kconfig
Message-ID: <80f1c596-8535-43e9-90dc-020738e38e81@roeck-us.net>
References: <20230404093351.4233-1-jiaxun.yang@flygoat.com>
 <20230404093351.4233-13-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404093351.4233-13-jiaxun.yang@flygoat.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
        FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 04, 2023 at 10:33:51AM +0100, Jiaxun Yang wrote:
> Enable extra CPUs that may be supported by virt board, including
> R4x00 (R4000 in QEMU), Cavium Octeon (Octeon68XX in QEMU), loongson2e,
> loongson2f.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---

Also, again with

Compiler version: mips64-linux-gcc (GCC) 11.3.0
Assembler version: GNU assembler (GNU Binutils) 2.39

and mips:allmodconfig:

In file included from <command-line>:
arch/mips/mm/init.c: In function 'mem_init':
include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_437' declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT)
  397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |                                             ^
include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
  378 |                         prefix ## suffix();                             \
      |                         ^~~~~~
include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
  397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |         ^~~~~~~~~~~~~~~~
arch/mips/mm/init.c:454:9: note: in expansion of macro 'BUILD_BUG_ON'
  454 |         BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT));
      |         ^~~~~~~~~~~~

Bisect log attached for reference, this time when trying to compile 
arch/mips/mm/init.c.

Guenter

---
# bad: [e134c93f788fb93fd6a3ec3af9af850a2048c7e6] Add linux-next specific files for 20230406
# good: [7e364e56293bb98cae1b55fd835f5991c4e96e7d] Linux 6.3-rc5
git bisect start 'HEAD' 'v6.3-rc5'
# bad: [ba6a630973076d0884c86c180cbfffe2fd7ccae3] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
git bisect bad ba6a630973076d0884c86c180cbfffe2fd7ccae3
# bad: [11ed4fef8498d6e90290b0ddae0b9a3a4f84d99f] Merge branch 'for-next' of git:git.kernel.org/pub/scm/linux/kernel/git/glaubitz/sh-linux.git
git bisect bad 11ed4fef8498d6e90290b0ddae0b9a3a4f84d99f
# good: [f73baa9938bb8f981aa3d58bab24b028f14fb7ff] Merge branch 'next' of https://github.com/Broadcom/stblinux.git
git bisect good f73baa9938bb8f981aa3d58bab24b028f14fb7ff
# good: [74a7ccd0bd5b39518b9d45e3ea455fcbbdc34632] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git
git bisect good 74a7ccd0bd5b39518b9d45e3ea455fcbbdc34632
# good: [7864de002ddd7557ac110a6d594ebbf0ec61773a] Merge branch 'clk-next' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
git bisect good 7864de002ddd7557ac110a6d594ebbf0ec61773a
# bad: [657d2f0b627f20afad9b5253b32d4448a0c514bd] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
git bisect bad 657d2f0b627f20afad9b5253b32d4448a0c514bd
# bad: [04f439aefe3b46cbdc4c547302af567012653fe9] Merge branch 'mips-next' of git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
git bisect bad 04f439aefe3b46cbdc4c547302af567012653fe9
# good: [e1aa1dfef69320141f5d00eddbf279b41e70d4e7] MIPS: mips-cm: Check availability of config registers
git bisect good e1aa1dfef69320141f5d00eddbf279b41e70d4e7
# good: [7a0f190098f32bae208689fee6e8f6dc607d2930] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git
git bisect good 7a0f190098f32bae208689fee6e8f6dc607d2930
# bad: [de34007751aaba992373f2d659001a846aeb8811] MIPS: generic: Enable all CPUs supported by virt board in Kconfig
git bisect bad de34007751aaba992373f2d659001a846aeb8811
# good: [b6007ff809682350515936539eb91a2e8a5f799c] MIPS: Octeon: Allow CVMSEG to be disabled
git bisect good b6007ff809682350515936539eb91a2e8a5f799c
# good: [0c6ff92773a9c004c44af47b0609f67dcc97ba82] MIPS: Loongson: Don't select platform features with CPU
git bisect good 0c6ff92773a9c004c44af47b0609f67dcc97ba82
# good: [03be534e1bac6d92cbcebdddfc4242e1e3588350] MIPS: Add board config for virt board
git bisect good 03be534e1bac6d92cbcebdddfc4242e1e3588350
# first bad commit: [de34007751aaba992373f2d659001a846aeb8811] MIPS: generic: Enable all CPUs supported by virt board in Kconfig
