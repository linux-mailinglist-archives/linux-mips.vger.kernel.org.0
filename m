Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 491464A3E3A
	for <lists+linux-mips@lfdr.de>; Mon, 31 Jan 2022 08:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357909AbiAaHcz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jan 2022 02:32:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348119AbiAaHcu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jan 2022 02:32:50 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD2EC06173D
        for <linux-mips@vger.kernel.org>; Sun, 30 Jan 2022 23:32:50 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id i10so37657929ybt.10
        for <linux-mips@vger.kernel.org>; Sun, 30 Jan 2022 23:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=TGUXorpSDAKgj0QsOiF2A9Dkgmv8D/UrY5CjKLgD/kA=;
        b=PhjzCwvHcmYXp6njfB6W+ohC4edEQdVQGgFYuJx/9gDRmzmuB+axox3UttISgp4Np9
         4ppBzzrcfGZcXJw2GlBJSUFBYaytsPPW1la6fD4K256PgZMR2BOrdnlIsQaMjq19Ykcv
         +rH7UjL4iwTXDNlBTmGl4Y2gTiyfqNUG1WFwaOI73H//vqDWw7RsqRTnDalHYroYcS3o
         F9nteZLTVHUbf/BJrMVdmnFfZWudeTl/0C/BkGtqE7QCdvt26A0mc1OPhEWD5XdrNzG3
         IJxuUWfT4UbwvnBq5ckclF8+kcaA6WfNVngDNiqe0TGjFg8ofalYcOtLtmqXWA/cWbTL
         A+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=TGUXorpSDAKgj0QsOiF2A9Dkgmv8D/UrY5CjKLgD/kA=;
        b=joCJcKBpUoWvtufk+wOeMOHk95TAnFBvRb1p4ekJcAhpD//B5lCpOzgiuuU1068Uff
         kbXsN9bQCnmtG8vmDipBbKoFYSkf8B1IipFEtxgcy2jQqTqZQvKK6lo66+CClw25ZCI5
         iZvTN6P0GJVG52cIx+EzBbwJ1TVYXMrgL4+TYEde8lUbkvDUNOd54x2dG7UXtbe9Q3VP
         MfwYp1boCxoOv6rGF8ruWUeAe9fQURMFlxxIGp+1eqmX0+nvaOl4/6InOm4sjjzJxNXv
         7kIr/RyglGRMlWgQpj1fpez+vf2G9bdLqKtsXyNLr2hP101UQtx7FLI4t7DCs8ZKM9Hz
         9iwA==
X-Gm-Message-State: AOAM531YBifsE0osNddnczJH9ciWDFOUDeu3wQXWlncCXEyCOWIkHcmK
        kkW+kWjxWNLYB6KvMlSjTev4Z559Vyzlya+UpXfHVlLpXF16cw==
X-Google-Smtp-Source: ABdhPJyl2aP+0wY4wB+SmxvfCUrtBeMO9Ao11MdNpzPUCnLAZg/hzDhtnWtrflFHBxJnUwjqSz5dqOZ8+puYdLfJJI0=
X-Received: by 2002:a25:97c4:: with SMTP id j4mr29211965ybo.108.1643614368772;
 Sun, 30 Jan 2022 23:32:48 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 31 Jan 2022 13:02:37 +0530
Message-ID: <CA+G9fYt4JnOkZeRu9ASXbgbDE+C8AYua+UzBuvWi9sUtEXd7Lw@mail.gmail.com>
Subject: [next] mips: cavium-octeon/octeon-memcpy.o] Error 1
To:     linux-mips@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        regressions@lists.linux.dev, lkft-triage@lists.linaro.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Following build errors noticed on Linux next 20220131 mips with
cavium_octeon_defconfig
  - mips  cavium_octeon_defconfig gcc-8 - FAILED
  - mips  cavium_octeon_defconfig gcc-10 - FAILED

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=mips
CROSS_COMPILE=mips-linux-gnu- 'CC=sccache mips-linux-gnu-gcc'
'HOSTCC=sccache gcc' cavium_octeon_defconfig
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=mips
CROSS_COMPILE=mips-linux-gnu- 'CC=sccache mips-linux-gnu-gcc'
'HOSTCC=sccache gcc'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S: Assembler messages:
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:187: Error:
unrecognized opcode `ptr 9b,l_exc'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:188: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:189: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:190: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:192: Error:
unrecognized opcode `ptr 9b,s_exc_p16u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:193: Error:
unrecognized opcode `ptr 9b,s_exc_p15u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:194: Error:
unrecognized opcode `ptr 9b,s_exc_p14u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:195: Error:
unrecognized opcode `ptr 9b,s_exc_p13u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:196: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:197: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:198: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:199: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:200: Error:
unrecognized opcode `ptr 9b,s_exc_p12u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:201: Error:
unrecognized opcode `ptr 9b,s_exc_p11u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:202: Error:
unrecognized opcode `ptr 9b,s_exc_p10u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:204: Error:
unrecognized opcode `ptr 9b,s_exc_p9u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:206: Error:
unrecognized opcode `ptr 9b,l_exc_copy_rewind16'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:207: Error:
unrecognized opcode `ptr 9b,l_exc_copy_rewind16'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:208: Error:
unrecognized opcode `ptr 9b,l_exc_copy_rewind16'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:209: Error:
unrecognized opcode `ptr 9b,l_exc_copy_rewind16'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:210: Error:
unrecognized opcode `ptr 9b,s_exc_p8u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:211: Error:
unrecognized opcode `ptr 9b,s_exc_p7u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:212: Error:
unrecognized opcode `ptr 9b,s_exc_p6u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:213: Error:
unrecognized opcode `ptr 9b,s_exc_p5u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:214: Error:
unrecognized opcode `ptr 9b,l_exc_copy_rewind16'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:215: Error:
unrecognized opcode `ptr 9b,l_exc_copy_rewind16'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:216: Error:
unrecognized opcode `ptr 9b,l_exc_copy_rewind16'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:217: Error:
unrecognized opcode `ptr 9b,l_exc_copy_rewind16'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:218: Error:
unrecognized opcode `ptr 9b,s_exc_p4u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:219: Error:
unrecognized opcode `ptr 9b,s_exc_p3u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:220: Error:
unrecognized opcode `ptr 9b,s_exc_p2u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:221: Error:
unrecognized opcode `ptr 9b,s_exc_p1u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:235: Error:
unrecognized opcode `ptr 9b,l_exc'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:236: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:237: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:238: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:240: Error:
unrecognized opcode `ptr 9b,s_exc_p8u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:241: Error:
unrecognized opcode `ptr 9b,s_exc_p7u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:242: Error:
unrecognized opcode `ptr 9b,s_exc_p6u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:243: Error:
unrecognized opcode `ptr 9b,s_exc_p5u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:244: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:245: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:246: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:247: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:248: Error:
unrecognized opcode `ptr 9b,s_exc_p4u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:249: Error:
unrecognized opcode `ptr 9b,s_exc_p3u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:250: Error:
unrecognized opcode `ptr 9b,s_exc_p2u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:251: Error:
unrecognized opcode `ptr 9b,s_exc_p1u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:262: Error:
unrecognized opcode `ptr 9b,l_exc'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:263: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:264: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:265: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:267: Error:
unrecognized opcode `ptr 9b,s_exc_p4u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:268: Error:
unrecognized opcode `ptr 9b,s_exc_p3u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:269: Error:
unrecognized opcode `ptr 9b,s_exc_p2u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:270: Error:
unrecognized opcode `ptr 9b,s_exc_p1u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:285: Error:
unrecognized opcode `ptr 9b,l_exc'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:288: Error:
unrecognized opcode `ptr 9b,s_exc_p1u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:295: Error:
unrecognized opcode `ptr 9b,l_exc'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:298: Error:
unrecognized opcode `ptr 9b,s_exc_p1u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:305: Error:
unrecognized opcode `ptr 9b,l_exc'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:310: Error:
unrecognized opcode `ptr 9b,s_exc_p1u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:324: Error:
unrecognized opcode `ptr 9b,l_exc'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:325: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:327: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:328: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:329: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:330: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:331: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:332: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:334: Error:
unrecognized opcode `ptr 9b,s_exc_p4u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:335: Error:
unrecognized opcode `ptr 9b,s_exc_p3u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:336: Error:
unrecognized opcode `ptr 9b,s_exc_p2u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:337: Error:
unrecognized opcode `ptr 9b,s_exc_p1u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:347: Error:
unrecognized opcode `ptr 9b,l_exc'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:348: Error:
unrecognized opcode `ptr 9b,l_exc_copy'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:350: Error:
unrecognized opcode `ptr 9b,s_exc_p1u'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:366: Error:
unrecognized opcode `ptr 9b,l_exc'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:366: Error:
unrecognized opcode `ptr 9b,s_exc_p1'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:367: Error:
unrecognized opcode `ptr 9b,l_exc'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:367: Error:
unrecognized opcode `ptr 9b,s_exc_p1'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:368: Error:
unrecognized opcode `ptr 9b,l_exc'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:368: Error:
unrecognized opcode `ptr 9b,s_exc_p1'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:369: Error:
unrecognized opcode `ptr 9b,l_exc'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:369: Error:
unrecognized opcode `ptr 9b,s_exc_p1'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:370: Error:
unrecognized opcode `ptr 9b,l_exc'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:370: Error:
unrecognized opcode `ptr 9b,s_exc_p1'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:371: Error:
unrecognized opcode `ptr 9b,l_exc'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:371: Error:
unrecognized opcode `ptr 9b,s_exc_p1'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:372: Error:
unrecognized opcode `ptr 9b,l_exc'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:375: Error:
unrecognized opcode `ptr 9b,s_exc_p1'
/builds/linux/arch/mips/cavium-octeon/octeon-memcpy.S:399: Error:
unrecognized opcode `ptr 9b,l_exc'
make[3]: *** [/builds/linux/scripts/Makefile.build:411:
arch/mips/cavium-octeon/octeon-memcpy.o] Error 1
make[3]: Target '__build' not remade because of errors.
make[2]: *** [/builds/linux/scripts/Makefile.build:572:
arch/mips/cavium-octeon] Error 2
make[2]: Target '__build' not remade because of errors.
make[1]: *** [/builds/linux/Makefile:1965: arch/mips] Error 2

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

meta data:
-----------
    git describe: next-20220131
    git_repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
    git_sha: 887a333c44eb67973622e530e43cd5e4cf9af927
    target_arch: mips
    kconfig: cavium_octeon_defconfig
    toolchain: gcc-10

Build log:
-------------
https://builds.tuxbuild.com/24RxfqNGrh0Y5VPGCY9Ixeo6ejf/

Steps to reproduce:
--------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.

tuxmake --runtime podman --target-arch mips --toolchain gcc-10
--kconfig cavium_octeon_defconfig


--
Linaro LKFT
https://lkft.linaro.org
