Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D79B2F9A3D
	for <lists+linux-mips@lfdr.de>; Mon, 18 Jan 2021 07:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731414AbhARG4E (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 Jan 2021 01:56:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731777AbhARGzc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 Jan 2021 01:55:32 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD753C061786
        for <linux-mips@vger.kernel.org>; Sun, 17 Jan 2021 22:54:32 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id gx5so2903008ejb.7
        for <linux-mips@vger.kernel.org>; Sun, 17 Jan 2021 22:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=fDRB4uV7zrbbsbfSb05mW4A9LkdllT0DcRvCp4Muxtg=;
        b=H0niptT4fWtp7lNB22qUO62vkqQJt9WxHm+TWUG+YQHieH5eq0uRZnm1NP85H8iz9i
         SGScFmRhGP/8GgUfKlnhrtX6USP50AQDKSDWgv7u0msWLINc560a3KJptq/EpjluoAXC
         rkvgfwD/9ONjUGdLhs/pad8UrWWkoIShMggdw4DUGt3PLbwgENgvwVbeFVJeWj6z98l0
         O35Lk1TvtHdfIVQ29QTbvwxNXIbHKmvNRHjfzaBQf5f8zai+gTkrti5ZemnM/GwiUJVk
         Xv9wpA8iU93KR2/YHQh2XBB5RE2bXSw9/ZQKP6iC4SI5/Jl1HMpPwnSB1dya0iS1gHsh
         Mlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=fDRB4uV7zrbbsbfSb05mW4A9LkdllT0DcRvCp4Muxtg=;
        b=TsWN8EkJSYVLUJKnC+hrdZpGxNJCPEy4YVzJZzq0pTfgDZVdcmfKZADvycC8efV5BH
         gJotO3B4QHoq6+GJoAPCSYmhYHrrtsv5fPV5mPJDexuXfD4fnVIQ8DeZTyIJDKtK8qNt
         8Gajy0gTY2bLrLiDFrPO/vwDfyMdrhB0O5J9ZC7YL3HxyEA01np26TLdg+Y4XIu0Aalh
         +1nbAzZa8fJAH4WWyF50Fgdq6jMTqAfHHNtdBCq2kUCXLX9J9DpJ2TazemBSVrUd4GsJ
         3thE+owPyKdj9bTKBswiAdbya6keClb9hYS2k6iAiYP9aGwOG5BRUDYh6m1IolcYnR3j
         6hLQ==
X-Gm-Message-State: AOAM5332/aSo6aO8kk0BUqA89yVrqz1WcZnbqsgbDaisd6IDlQzRPTGl
        /BdUYGASy++zYDM2sNfx0uSZuMgKt41k69oTHpiaUrAmsbb6pdsh
X-Google-Smtp-Source: ABdhPJyue6XUAXFoNhxFDDx2oPowQekK5icF2VlV5e8O9Vt/h/8P3fkkUI6Rf9nDP1vYWJbd5SasSkq+8tmX8oIIjLw=
X-Received: by 2002:a17:907:104c:: with SMTP id oy12mr16212368ejb.503.1610952870596;
 Sun, 17 Jan 2021 22:54:30 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 18 Jan 2021 12:24:19 +0530
Message-ID: <CA+G9fYvZ1uSTSH1CaedGu9n8bMr7Fstmi5AQ_7jkZomEBNy=5A@mail.gmail.com>
Subject: MIPS: cavium_octeon_defconfig and nlm_xlp_defconfig builds failed
To:     linux-mips@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        linux-stable <stable@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

on stable-rc 4.19 and stable-rc 5.4 branch MIPS cavium_octeon_defconfig and
nlm_xlp_defconfig builds failed recently.

Regressions (compared to build v4.19.167-43-g5a52ae31885b)
Regressions (compared to build v5.4.89-62-ga698e3bcad9e)

mips:
  build:
    * gcc-10-cavium_octeon_defconfig
    * gcc-10-nlm_xlp_defconfig
    * gcc-8-cavium_octeon_defconfig
    * gcc-8-nlm_xlp_defconfig
    * gcc-9-cavium_octeon_defconfig
    * gcc-9-nlm_xlp_defconfig


Build log :
---------------

# to reproduce this build locally:

tuxmake --target-arch=mips --kconfig=cavium_octeon_defconfig
--toolchain=gcc-8 --wrapper=sccache
--environment=SCCACHE_BUCKET=sccache.tuxbuild.com --runtime=docker
--image=public.ecr.aws/tuxmake/mips_gcc-8 config kernel xipkernel
debugkernel modules dtbs dtbs-legacy

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=mips
CROSS_COMPILE=mips-linux-gnu- 'CC=sccache mips-linux-gnu-gcc'
'HOSTCC=sccache gcc' cavium_octeon_defconfig

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=mips
CROSS_COMPILE=mips-linux-gnu- 'CC=sccache mips-linux-gnu-gcc'
'HOSTCC=sccache gcc'
In file included from arch/mips/kernel/binfmt_elfn32.c:113:
arch/mips/kernel/../../../fs/binfmt_elf.c: In function 'fill_siginfo_note':
arch/mips/kernel/../../../fs/binfmt_elf.c:1599:23: error: passing
argument 1 of 'copy_siginfo_to_user' from incompatible pointer type
[-Werror=incompatible-pointer-types]
  copy_siginfo_to_user((user_siginfo_t __user *) csigdata, siginfo);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/uapi/linux/elfcore.h:6,
                 from include/linux/elfcore.h:10,
                 from arch/mips/kernel/binfmt_elfn32.c:42:
include/linux/signal.h:24:49: note: expected 'struct siginfo *' but
argument is of type 'compat_siginfo_t *' {aka 'struct compat_siginfo
*'}
 int copy_siginfo_to_user(struct siginfo __user *to, const struct
siginfo *from);
                          ~~~~~~~~~~~~~~~~~~~~~~~^~
cc1: all warnings being treated as errors

build log link,
 - https://builds.tuxbuild.com/1nCmFsW7GqWQp1LTwGO5BpU93fy/
 - https://builds.tuxbuild.com/1nCmFl54F1ONC7hNoPkeO8kBt5o/

Best regards
Naresh Kamboju
