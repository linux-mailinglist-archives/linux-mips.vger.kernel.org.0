Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 235DA6BC6D1
	for <lists+linux-mips@lfdr.de>; Thu, 16 Mar 2023 08:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbjCPHPJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Mar 2023 03:15:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbjCPHOm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Mar 2023 03:14:42 -0400
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E00916AC4
        for <linux-mips@vger.kernel.org>; Thu, 16 Mar 2023 00:14:13 -0700 (PDT)
Received: by mail-ua1-x936.google.com with SMTP id h34so544878uag.4
        for <linux-mips@vger.kernel.org>; Thu, 16 Mar 2023 00:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678950851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DIcQiQ+PixIuhqgdCx8gDBGlIxjSr4mA5y32j1Q4pG4=;
        b=F5t/9b92W8kdvvTdhOSrm+AL7r2052O8R1daRmqonXkg27V3xMTVUtwBK4/b7aFzpB
         WpaTRyfApUQXY3QRH4xKd7QHs5Nh9TLaQZ45obTYRnQtWCO+sPjK28tpLclYis3M5wk3
         Se+AYliFMtuOqwJH7JC47wxdYTOVEh9ms0NLJCGSMpLg8i2jFxY+qzFRbCqGsYOChfR9
         533CMQ94A5hSU3U6Vt8qcv8VazSSWJS+E+p3UAIjW11h5OX49XtgjjDq4ZEoLupggRI9
         KhLhoHdC9OJEb33SGAPVrgfPLoEK72IPfT5P87UqHHc6K/r2GcK4xFkoHWb4UekX7Fws
         3++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678950851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DIcQiQ+PixIuhqgdCx8gDBGlIxjSr4mA5y32j1Q4pG4=;
        b=dEjjU0ee4EDuClkIWN2gtBI6iNJxVNvBt8Nqag9coBZmGrnb5W60uNxD3a3wVEzstS
         o6jDrqtnoq+EgKXWDfwzs+6IM1/Lve7aCJM0HJ+FZlmst2RGsFpLfnVuKapjB3Dg4IRg
         RfxfH1zO6uXeFdEv/3qTu7YLddiSQW+STwQlu94ttauJLm3Q04t+h/ACZMuHshqr8dwT
         2JWfBipOy5lZWV/Vs4/Dx1jUidKU9K3uGnzF9zDGIGMCDk7X0Gzrp5rVouBmly+By2UK
         r1pDajC5rsnlRRMpQCX83L1WFc47If0JO1ZsXW/N2nGo7E1SmgW0jY+EkJa8gpOBQNnK
         u6OQ==
X-Gm-Message-State: AO0yUKUGkkbAliMNxW4dZ8XDjLbdxzhczex50CXf9OQOq9QPEfbH0f4S
        gD48MzQimtCnjhyoW1pQ4YL11/cafwZtMrWZ7Fltgw==
X-Google-Smtp-Source: AK7set/wk7hUQtvHn1YRvBN6v4aKwj3cuIxPyxHD5UJMl/24sS4nsnvSb5aa2bWhWIS3UFZqDPvXKrPS0cOj6alRCDc=
X-Received: by 2002:a1f:5283:0:b0:40c:4d1:b550 with SMTP id
 g125-20020a1f5283000000b0040c04d1b550mr24714137vkb.0.1678950851171; Thu, 16
 Mar 2023 00:14:11 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 16 Mar 2023 12:44:00 +0530
Message-ID: <CA+G9fYsqpaicB4TKpMHKbma+YKs0Lm_mpsGBnxvh4tHcubAUeg@mail.gmail.com>
Subject: next: arm-32bit: build errors: kernel/module/internal.h:252:56:
 error: expected ';', ',' or ')' before 'const'
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, bpf <bpf@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Viktor Malik <vmalik@redhat.com>, Jiri Olsa <jolsa@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Results from Linaro=E2=80=99s test farm.
Following mips and arm builds failed.

Regressions found on mips:
 - build/gcc-12-ath79_defconfig
 - build/gcc-8-ath79_defconfig

Regressions found on arm:
 - build/gcc-8-omap1_defconfig
 - build/gcc-12-omap1_defconfig
 - build/clang-nightly-omap1_defconfig
 - build/clang-16-omap1_defconfig


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
------------

In file included from kernel/module/main.c:59:
kernel/module/internal.h:252:56: error: expected ';', ',' or ')' before 'co=
nst'
  252 |                                                        const char *=
name)
      |                                                        ^~~~~
make[4]: *** [scripts/Makefile.build:252: kernel/module/main.o] Error 1
In file included from kernel/module/strict_rwx.c:12:
kernel/module/internal.h:252:56: error: expected ';', ',' or ')' before 'co=
nst'
  252 |                                                        const char *=
name)
      |                                                        ^~~~~
make[4]: *** [scripts/Makefile.build:252: kernel/module/strict_rwx.o] Error=
 1
In file included from kernel/module/tree_lookup.c:11:
kernel/module/internal.h:252:56: error: expected ';', ',' or ')' before 'co=
nst'
  252 |                                                        const char *=
name)
      |                                                        ^~~~~
make[4]: *** [scripts/Makefile.build:252: kernel/module/tree_lookup.o] Erro=
r 1
In file included from kernel/module/procfs.c:13:
kernel/module/internal.h:252:56: error: expected ';', ',' or ')' before 'co=
nst'
  252 |                                                        const char *=
name)
      |                                                        ^~~~~
make[4]: *** [scripts/Makefile.build:252: kernel/module/procfs.o] Error 1
In file included from kernel/module/sysfs.c:15:
kernel/module/internal.h:252:56: error: expected ';', ',' or ')' before 'co=
nst'
  252 |                                                        const char *=
name)
      |                                                        ^~~~~
make[4]: *** [scripts/Makefile.build:252: kernel/module/sysfs.o] Error 1


build log:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230316=
/testrun/15632981/suite/build/test/gcc-12-omap1_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230316=
/testrun/15632981/suite/build/test/gcc-12-omap1_defconfig/details/


--
Linaro LKFT
https://lkft.linaro.org
