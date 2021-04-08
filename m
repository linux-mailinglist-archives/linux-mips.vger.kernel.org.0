Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3540E3590B4
	for <lists+linux-mips@lfdr.de>; Fri,  9 Apr 2021 01:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233009AbhDHX4X (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Apr 2021 19:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhDHX4W (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Apr 2021 19:56:22 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B21C061760
        for <linux-mips@vger.kernel.org>; Thu,  8 Apr 2021 16:56:06 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id w4so91941wrt.5
        for <linux-mips@vger.kernel.org>; Thu, 08 Apr 2021 16:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FUgrgxqqz4diwCjBP0HD1w+rPMRysrRoSUWLps3lH3Q=;
        b=kd8jKvculh4H5q4n7eqGojRPWjym/jkxPZgrH7pFfViAllnHvQNGvJlLtjrvsJuG7+
         WYu/hhR6hHKa6y/CS62eYrhZ/ib6YnPE24zEFxuQk8G2/NS7sYvfNy470nlLqjO25K+5
         qN8eNqCBMDG5iMb5ET0JfRPPAQat8tEWDv3K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FUgrgxqqz4diwCjBP0HD1w+rPMRysrRoSUWLps3lH3Q=;
        b=lGCTqO4hjjVJLEDHIlw8LjVunbPqJ+LNk/02OpYeMxgBcudzGh0IkuppZDeX6RJiBi
         bU1ainCzyIWVw714u3TN0WYnsJaToHLkLW4fs98r7KsgLgZqgBogsxazkIarfdxJRrX/
         G3mQ5TKdN7Q/ZeU9Qwv/jRKkZM38idIYLaMLVtJhlrD4xfE3ucDUCV9fsGDFIUQYszRt
         GnrHwebiuVi5P8n5N98Q4K59eBx7RnkDW54Z7+0v8DETyG/tG1F5uueefMwtCMxfNA1M
         XU3o5ESIm7DEOey7sHdy0s2H6WH3j0eIg0OIccQqqwBCn2BagzSMbFTLzbASsf8YU6j7
         wq3Q==
X-Gm-Message-State: AOAM530I2OtoiM7Tiy6fRfLHeVYbeXQ9wOLK/3jsipmQ3uHxwUf19UIO
        bRV5Qy+zELBce89cODtFruUkR4QmdoBeZAePGqG6Yw==
X-Google-Smtp-Source: ABdhPJygUCn4Ql4GAfnaMrEFTrad9bn7UZ9Q0jhwJFVCA85E0d09pEa5BbYL87pimidRDnE06S6e95zalyP2ToKnVYw=
X-Received: by 2002:a5d:6d41:: with SMTP id k1mr15316791wri.66.1617926164907;
 Thu, 08 Apr 2021 16:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210408182253.6m3j6lhmh3iflquz@archlinux-ax161>
In-Reply-To: <20210408182253.6m3j6lhmh3iflquz@archlinux-ax161>
From:   Simon Glass <sjg@chromium.org>
Date:   Fri, 9 Apr 2021 11:55:52 +1200
Message-ID: <CAPnjgZ1ks+JfqO581veycOoLFRLzsXPZBMVSRrDATfukh4z_sw@mail.gmail.com>
Subject: Re: mkimage regression when building ARCH=mips defconfig Linux kernel
To:     Nathan Chancellor <nathan@kernel.org>,
        Tom Rini <trini@konsulko.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        U-Boot Mailing List <u-boot@lists.denx.de>,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

+Tom Rini

Hi Nathan,

On Fri, 9 Apr 2021 at 06:23, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Simon,
>
> Apologies if this is not the proper way to report a regression, this is my first
> time interacting with the U-Boot community.
>
> My distribution updated the uboot-tools package to 2021.04, which broke my
> Linux kernel builds for ARCH=mips:
>
> $ make -skj"$(nproc)" ARCH=mips CROSS_COMPILE=mips-linux- defconfig all
> ...
> /usr/bin/mkimage: verify_header failed for FIT Image support with exit code 1
> make[2]: *** [arch/mips/boot/Makefile:173: arch/mips/boot/vmlinux.gz.itb] Error 1
> ...
>
> I bisected this down to your commit:
>
> 3f04db891a353f4b127ed57279279f851c6b4917 is the first bad commit
> commit 3f04db891a353f4b127ed57279279f851c6b4917
> Author: Simon Glass <sjg@chromium.org>
> Date:   Mon Feb 15 17:08:12 2021 -0700
>
>     image: Check for unit addresses in FITs
>
>     Using unit addresses in a FIT is a security risk. Add a check for this
>     and disallow it.
>
>     CVE-2021-27138
>
>     Signed-off-by: Simon Glass <sjg@chromium.org>
>     Reported-by: Bruce Monroe <bruce.monroe@intel.com>
>     Reported-by: Arie Haenel <arie.haenel@intel.com>
>     Reported-by: Julien Lenoir <julien.lenoir@intel.com>
>
>  common/image-fit.c          | 56 +++++++++++++++++++++++++++++++++++++++++----
>  test/py/tests/test_vboot.py |  9 ++++----
>  2 files changed, 57 insertions(+), 8 deletions(-)
> bisect run success
>
> $ git bisect log
> # bad: [e9c99db7787e3b5c2ef05701177c43ed1c023c27] Merge branch '2021-04-07-CI-improvements'
> # good: [c4fddedc48f336eabc4ce3f74940e6aa372de18c] Prepare v2021.01
> git bisect start 'e9c99db7787e3b5c2ef05701177c43ed1c023c27' 'v2021.01'
> # good: [b2c86f596cfb1ea9f7f5138f72f1c5c49e3ae3f1] arm: dts: r8a774a1: Import DTS queued for Linux 5.12-rc1
> git bisect good b2c86f596cfb1ea9f7f5138f72f1c5c49e3ae3f1
> # bad: [74f4929c2c73beb595faf7d5d9bb6a78d710c2fd] ddr: marvell: axp: fix array types have different bounds warning
> git bisect bad 74f4929c2c73beb595faf7d5d9bb6a78d710c2fd
> # bad: [cbe607b920bc0827d8fe379ed4f5ae4e2058513e] Merge tag 'xilinx-for-v2021.04-rc3' of https://gitlab.denx.de/u-boot/custodians/u-boot-microblaze
> git bisect bad cbe607b920bc0827d8fe379ed4f5ae4e2058513e
> # good: [d5f3aadacbc63df3b690d6fd9f0aa3f575b43356] test: Add tests for the 'evil' vboot attacks
> git bisect good d5f3aadacbc63df3b690d6fd9f0aa3f575b43356
> # bad: [a1a652e8016426e2d67148cab225cd5ec45189fb] Merge tag 'mmc-2021-2-19' of https://gitlab.denx.de/u-boot/custodians/u-boot-mmc
> git bisect bad a1a652e8016426e2d67148cab225cd5ec45189fb
> # bad: [aeedeae40733131467de72c68e639cf9d795e059] spl: fit: Replace #ifdef blocks with more readable constructs
> git bisect bad aeedeae40733131467de72c68e639cf9d795e059
> # bad: [eb5fd9e46c11ea41430d9c5bcc81d4583424216e] usb: kbd: destroy device after console is stopped
> git bisect bad eb5fd9e46c11ea41430d9c5bcc81d4583424216e
> # bad: [99cb2b996bd649d98069a95941beaaade0a4447a] stdio: Split out nulldev_register() and move it under #if
> git bisect bad 99cb2b996bd649d98069a95941beaaade0a4447a
> # bad: [3f04db891a353f4b127ed57279279f851c6b4917] image: Check for unit addresses in FITs
> git bisect bad 3f04db891a353f4b127ed57279279f851c6b4917
> # good: [6f3c2d8aa5e6cbd80b5e869bbbddecb66c329d01] image: Add an option to do a full check of the FIT
> git bisect good 6f3c2d8aa5e6cbd80b5e869bbbddecb66c329d01
> # good: [124c255731c76a2b09587378b2bcce561bcd3f2d] libfdt: Check for multiple/invalid root nodes
> git bisect good 124c255731c76a2b09587378b2bcce561bcd3f2d
> # first bad commit: [3f04db891a353f4b127ed57279279f851c6b4917] image: Check for unit addresses in FITs
>
> Is this an actual regression or is this now the expected behavior? I have added
> Thomas and the linux-mips mailing list to take a look and see if the Linux
> kernel needs to have its sources updated.

It is expected. See the code in that commit:

      /*
       * U-Boot stopped using unit addressed in 2017. Since libfdt
       * can match nodes ignoring any unit address, signature
       * verification can see the wrong node if one is inserted with
       * the same name as a valid node but with a unit address
       * attached. Protect against this by disallowing unit addresses.
       */
      if (!ret && CONFIG_IS_ENABLED(FIT_SIGNATURE)) {
         ret = fdt_check_no_at(fit, 0);

         if (ret) {
            log_debug("FIT check error %d\n", ret);
            return ret;
         }
      }

Possibly you are using @ nodes in your FIT files in the kernel. Is it
possible to use a hyphen instead?

Regards,
Simon
