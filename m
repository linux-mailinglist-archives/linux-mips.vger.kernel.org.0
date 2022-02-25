Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0BB14C3EC5
	for <lists+linux-mips@lfdr.de>; Fri, 25 Feb 2022 08:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236827AbiBYHKW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Feb 2022 02:10:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232670AbiBYHKW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 25 Feb 2022 02:10:22 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CBB01E1107
        for <linux-mips@vger.kernel.org>; Thu, 24 Feb 2022 23:09:50 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id d21so4099812yba.11
        for <linux-mips@vger.kernel.org>; Thu, 24 Feb 2022 23:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=RkKJ3feumDpaH/4Q4R9EWvmv9jLE7v7OSMOwoBOQVW8=;
        b=HWn4IvjfftzLpqogskfwiXRMAhH2YnmMfM5OsMY9RPUSUcpryyGeZSTHjOYBaHiIhl
         DVOSOUlkmc+GGeLQcCUCEg0bwaxihtZERTQVzs5XnzXFXVQtPTUIDk9zHM5vNiWqySP/
         oCCjbOR3glTpDgw6Ab7PaILpFVVNUw4Z0UebaRQq7ZVMZmcXjHL8O/hAGCL94evRM/CE
         1JnE2fM1rc/x9+lklrxU1xg20vX4oB7de6MI2UDp54zDrz/ZqQ1qP5CvbBTmPTSLBvA4
         b7esENhujCgn/h//pWlg7FsoklcZbtwyv1b98q4BPSugWpd5aACAOCjFVOaDvk67eTwE
         2iJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=RkKJ3feumDpaH/4Q4R9EWvmv9jLE7v7OSMOwoBOQVW8=;
        b=Z5GoiVxPq4+s65Zhyt7g64fwiMD3ZNOQoBsZt3tMEnRKZmxR958fqqwiC5vhmY2snz
         a+zZLX02ukib5+iiT1TSTCEFBqCSE6s5EJ8Vcz3KDMass18No61YtgRpwaMXbt4PoO/x
         Fp1g2VlxLjcttcmyakNj5h8uM5RKf0dmIZrbtwe8KYPNeBm5a6a2oF3L24SJI1umBCY3
         uFc0eRsQ8vnG6bmgQn7y8jTRFk0EgSCFHTQHze84qe0rpMC8IHFPnxlk4otn82P0/GQN
         S4p5Vlf1Uq0FQYoGhnhPg3ThmvkIJn6n8ihI4Xvd0fjjaItR6cqKt/02A+63+BRZmVXg
         sTzQ==
X-Gm-Message-State: AOAM531lGcLnNndEkYqMZAK4nCxDvgqdzHwETToPVPQPRibUnPjozv7q
        vIkm0ZVuq/dujVBzufFR7psG/DCmwhzXefcfpSjm7r+fJPtIbg==
X-Google-Smtp-Source: ABdhPJz5laBsJeGK80mAX/WEbB1K3EIdSrupGykMNNj/HIKrR3FFyHPZAgRAHsNtHZz81rqQLu1yS8VO8iZ7ZOAkxDU=
X-Received: by 2002:a25:2551:0:b0:623:a424:e2b5 with SMTP id
 l78-20020a252551000000b00623a424e2b5mr6277259ybl.603.1645772989000; Thu, 24
 Feb 2022 23:09:49 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 25 Feb 2022 12:39:37 +0530
Message-ID: <CA+G9fYtEx=k9TM7c7EihbO3U0qxZLbKX26NWJ1L=jjEOuy7cHQ@mail.gmail.com>
Subject: [next] mips-mt.c:233:19: error: conflicting types for 'mt_init'
To:     linux-mips@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kees Cook <keescook@chromium.org>,
        Juxin Gao <gaojuxin@loongson.cn>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

[Please ignore this email if it is already reported]

Linux next-20220224 arch mips build errors / warnings noticed [1].

Build configs:
  -  mips-gcc-8-malta_defconfig
  -  mips-gcc-10-malta_defconfig
  -  mips-gcc-8-defconfig
  -  mips-gcc-10-defconfig

metadata:
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_sha: 44948bd49d878dad6c9707e34f4a06df73c3a800
    git_short_log: 44948bd49d87 (\Add linux-next specific files for 20220224\)
    kconfig: defconfig
    target_arch: mips
    toolchain: gcc-10


Build errors / warnings:

arch/mips/kernel/mips-mt.c:233:19: error: conflicting types for 'mt_init'
  233 | static int __init mt_init(void)
      |                   ^~~~~~~
In file included from include/linux/mm_types.h:12,
                 from include/linux/mmzone.h:21,
                 from include/linux/gfp.h:6,
                 from include/linux/radix-tree.h:12,
                 from include/linux/idr.h:15,
                 from include/linux/kernfs.h:12,
                 from include/linux/sysfs.h:16,
                 from include/linux/kobject.h:20,
                 from include/linux/energy_model.h:7,
                 from include/linux/device.h:16,
                 from arch/mips/kernel/mips-mt.c:7:
include/linux/maple_tree.h:589:20: note: previous definition of
'mt_init' was here
  589 | static inline void mt_init(struct maple_tree *mt)
      |                    ^~~~~~~
make[3]: *** [scripts/Makefile.build:288: arch/mips/kernel/mips-mt.o] Error 1

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Steps to reproduce:
------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake

tuxmake --runtime podman --target-arch mips --toolchain gcc-10
--kconfig defconfig

--
Linaro LKFT
https://lkft.linaro.org

[1] https://builds.tuxbuild.com/25aFF2X7uoyebURaYzNHW9FVEmN/
