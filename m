Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE12443E037
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 13:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbhJ1Ltv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 07:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbhJ1Ltv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 07:49:51 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA90C061745
        for <linux-mips@vger.kernel.org>; Thu, 28 Oct 2021 04:47:24 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id ee16so10656835edb.10
        for <linux-mips@vger.kernel.org>; Thu, 28 Oct 2021 04:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=J1HSbTsrMEQI/U/YbiCc+5c6T/LW7ZVWAAUAlEL1IAU=;
        b=tXvtIytz0bfa5k9zkzWy7Ha/EfUR3MVX60l2VSDubKCkCnNlfiYqRuqx3uCOCYUMCS
         W4zgQEgXUnITXdLOvNRlLUQ5YN8n8ZUBRvQm7JH46dv6Zpp0P/w/41Qz9/5MSSZZl130
         K72hGNV6R9h5Fc/y/LTNevvuC5QWnjYGTkRGkTy5FgEFUeKi2FS6oPtxq53XaBEOXVC0
         cd5riiaDVwBwfAw8uvY6W6xju8fCDBr4mo3Lfz5BDLpx/PRA2fz5F1fZ2pidhekyoWXx
         Yibq8o79m9fEjLCZZ+HA40MsXDBoeiH5DXe2aJ3KJupYomUvG/czS6x6A6g8THSBsfjN
         x03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=J1HSbTsrMEQI/U/YbiCc+5c6T/LW7ZVWAAUAlEL1IAU=;
        b=X83V2T8gozBZT13QqAeePFTIAlvF+LdeAbKhe+BY6i90mveKpJqQQJLZGcLT+pk7bF
         wj5neeF3+Yl7CeUTrEdcl/LA7KOi0aH7gVZLIbJv7sKwNvIcWP6khlgjrfdrqZw6ohab
         4z96a2P8hLsP+EKcTB6GfiF4vt5PzjF8AFOX6xwlKS4HdaE7Ey1V6d/lHtTZKIOlaJFg
         UsbOPZujNWbX/iBak3iwsCYPBRa276UTRN+270iJbqaLxea0xVXTZ20L391Ov8tZigOP
         eX5cQ66aMchYy38QIcpsEpGgb5p9R0MgQ/Tw5eJF1994jQUVGqgMzVlcCUtnWJktfjGe
         53Aw==
X-Gm-Message-State: AOAM530szLLGckhFz/REkPjHQfP3bi4zKygaMOdgWhLmRHj5AYnEcwV2
        pp6C5a6Pkb++wdiemF+VjyPU9KJOoYzsDPgOl9WgYE9Jv2aExg==
X-Google-Smtp-Source: ABdhPJwMPU0JSbf9rgqPGZAT9qVbTZ/lKa7s54pyRcMY6qOJ5m6qoSgrhdrnYMiELxgogXz28FNpx2c5einX3a5y7bc=
X-Received: by 2002:a17:906:c302:: with SMTP id s2mr4642505ejz.499.1635421642352;
 Thu, 28 Oct 2021 04:47:22 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 28 Oct 2021 17:17:11 +0530
Message-ID: <CA+G9fYtQCd4V9Y=qEGZeQw17TRNG1p_g9MKtYaWVo8QPua-Cug@mail.gmail.com>
Subject: mips: irq.c:114:19: error: unused variable 'desc' [-Werror=unused-variable]
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Regression found on mips gcc-10 built with defconfig
Following build warnings / errors reported on linux next 20211027.

The bisect tool pointing to the following commit
The first bad commit:

commit 4cb6f4df976b288aa02bbb658d38e73d34d8231f
  irq: mips: simplify do_domain_IRQ()

metadata:
    git_describe: next-20211027
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_short_log: ae5179317e79 (\"Add linux-next specific files for 20211027\")
    target_arch: mips
    toolchain: gcc-10

build error :
--------------
<stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [-Wcpp]
arch/mips/kernel/irq.c: In function 'do_domain_IRQ':
arch/mips/kernel/irq.c:114:19: error: unused variable 'desc'
[-Werror=unused-variable]
  struct irq_desc *desc;
                   ^~~~
cc1: all warnings being treated as errors

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build link:
-----------
https://builds.tuxbuild.com/205S9XOzkonL7F3xvY8YUO2l1QT/build.log

build config:
-------------
https://builds.tuxbuild.com/205S9XOzkonL7F3xvY8YUO2l1QT/config

# To install tuxmake on your system globally
# sudo pip3 install -U tuxmake
tuxmake --runtime podman --target-arch mips --toolchain gcc-10
--kconfig defconfig

--
Linaro LKFT
https://lkft.linaro.org
