Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2E2B358C1C
	for <lists+linux-mips@lfdr.de>; Thu,  8 Apr 2021 20:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbhDHSXJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Apr 2021 14:23:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:40052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231676AbhDHSXI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 8 Apr 2021 14:23:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2BB56610A7;
        Thu,  8 Apr 2021 18:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617906177;
        bh=O9i23Zz7sOX9JfpvtBrMns2I+XN+AjHRdTaX9tVGbRQ=;
        h=Date:From:To:Cc:Subject:From;
        b=jXbv1x42aqQyogLYiUEk2qkXRoiU4C+aFDeR5EyEydxRlkwPhrPQw3gDU5pzSlAgh
         pvQrIMyMraJbjPg5GxsDCbYCAT9anIgsVRDzUifVVQ7qPXFJLKzt1BpFo/Hj9YjWqw
         OKQkih/IunJqbAz9tSclQhnlljeoKWAP463jBzesThRjQWi8OBYNA5Lbi4Qr1rETPg
         OH79zTOLZYVqC5uTeMu2SHIX6Gfaw47Re6pR9SbGiMpxjY90wzwv5ldwziABBUlOeD
         OZlvjxJ5K9y5r4cKLO8KIKEqZZupcTJp+GA26gVEpuQRiuaQOlHp1iW3WY2qlMguuh
         8sarYjKr4Zhvw==
Date:   Thu, 8 Apr 2021 11:22:53 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Simon Glass <sjg@chromium.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     u-boot@lists.denx.de, linux-mips@vger.kernel.org
Subject: mkimage regression when building ARCH=mips defconfig Linux kernel
Message-ID: <20210408182253.6m3j6lhmh3iflquz@archlinux-ax161>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Simon,

Apologies if this is not the proper way to report a regression, this is my first
time interacting with the U-Boot community.

My distribution updated the uboot-tools package to 2021.04, which broke my
Linux kernel builds for ARCH=mips:

$ make -skj"$(nproc)" ARCH=mips CROSS_COMPILE=mips-linux- defconfig all
...
/usr/bin/mkimage: verify_header failed for FIT Image support with exit code 1
make[2]: *** [arch/mips/boot/Makefile:173: arch/mips/boot/vmlinux.gz.itb] Error 1
...

I bisected this down to your commit:

3f04db891a353f4b127ed57279279f851c6b4917 is the first bad commit
commit 3f04db891a353f4b127ed57279279f851c6b4917
Author: Simon Glass <sjg@chromium.org>
Date:   Mon Feb 15 17:08:12 2021 -0700

    image: Check for unit addresses in FITs

    Using unit addresses in a FIT is a security risk. Add a check for this
    and disallow it.

    CVE-2021-27138

    Signed-off-by: Simon Glass <sjg@chromium.org>
    Reported-by: Bruce Monroe <bruce.monroe@intel.com>
    Reported-by: Arie Haenel <arie.haenel@intel.com>
    Reported-by: Julien Lenoir <julien.lenoir@intel.com>

 common/image-fit.c          | 56 +++++++++++++++++++++++++++++++++++++++++----
 test/py/tests/test_vboot.py |  9 ++++----
 2 files changed, 57 insertions(+), 8 deletions(-)
bisect run success

$ git bisect log
# bad: [e9c99db7787e3b5c2ef05701177c43ed1c023c27] Merge branch '2021-04-07-CI-improvements'
# good: [c4fddedc48f336eabc4ce3f74940e6aa372de18c] Prepare v2021.01
git bisect start 'e9c99db7787e3b5c2ef05701177c43ed1c023c27' 'v2021.01'
# good: [b2c86f596cfb1ea9f7f5138f72f1c5c49e3ae3f1] arm: dts: r8a774a1: Import DTS queued for Linux 5.12-rc1
git bisect good b2c86f596cfb1ea9f7f5138f72f1c5c49e3ae3f1
# bad: [74f4929c2c73beb595faf7d5d9bb6a78d710c2fd] ddr: marvell: axp: fix array types have different bounds warning
git bisect bad 74f4929c2c73beb595faf7d5d9bb6a78d710c2fd
# bad: [cbe607b920bc0827d8fe379ed4f5ae4e2058513e] Merge tag 'xilinx-for-v2021.04-rc3' of https://gitlab.denx.de/u-boot/custodians/u-boot-microblaze
git bisect bad cbe607b920bc0827d8fe379ed4f5ae4e2058513e
# good: [d5f3aadacbc63df3b690d6fd9f0aa3f575b43356] test: Add tests for the 'evil' vboot attacks
git bisect good d5f3aadacbc63df3b690d6fd9f0aa3f575b43356
# bad: [a1a652e8016426e2d67148cab225cd5ec45189fb] Merge tag 'mmc-2021-2-19' of https://gitlab.denx.de/u-boot/custodians/u-boot-mmc
git bisect bad a1a652e8016426e2d67148cab225cd5ec45189fb
# bad: [aeedeae40733131467de72c68e639cf9d795e059] spl: fit: Replace #ifdef blocks with more readable constructs
git bisect bad aeedeae40733131467de72c68e639cf9d795e059
# bad: [eb5fd9e46c11ea41430d9c5bcc81d4583424216e] usb: kbd: destroy device after console is stopped
git bisect bad eb5fd9e46c11ea41430d9c5bcc81d4583424216e
# bad: [99cb2b996bd649d98069a95941beaaade0a4447a] stdio: Split out nulldev_register() and move it under #if
git bisect bad 99cb2b996bd649d98069a95941beaaade0a4447a
# bad: [3f04db891a353f4b127ed57279279f851c6b4917] image: Check for unit addresses in FITs
git bisect bad 3f04db891a353f4b127ed57279279f851c6b4917
# good: [6f3c2d8aa5e6cbd80b5e869bbbddecb66c329d01] image: Add an option to do a full check of the FIT
git bisect good 6f3c2d8aa5e6cbd80b5e869bbbddecb66c329d01
# good: [124c255731c76a2b09587378b2bcce561bcd3f2d] libfdt: Check for multiple/invalid root nodes
git bisect good 124c255731c76a2b09587378b2bcce561bcd3f2d
# first bad commit: [3f04db891a353f4b127ed57279279f851c6b4917] image: Check for unit addresses in FITs

Is this an actual regression or is this now the expected behavior? I have added
Thomas and the linux-mips mailing list to take a look and see if the Linux
kernel needs to have its sources updated.

Cheers,
Nathan
