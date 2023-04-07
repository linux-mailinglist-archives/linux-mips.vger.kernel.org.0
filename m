Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7036DB1FD
	for <lists+linux-mips@lfdr.de>; Fri,  7 Apr 2023 19:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjDGRqS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Apr 2023 13:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbjDGRqR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Apr 2023 13:46:17 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E89FF11D
        for <linux-mips@vger.kernel.org>; Fri,  7 Apr 2023 10:46:14 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id o25-20020a9d4119000000b006a11eb19f8eso21204739ote.5
        for <linux-mips@vger.kernel.org>; Fri, 07 Apr 2023 10:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680889574; x=1683481574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Km/TTUdssvJ6LUJeka1mufWyNrdiHANvtguzKnjLMEE=;
        b=RojzCeJGL3ZznYgLOK2fIVwjWZOoZfY1lOomKyYDwSs7M0jzYmKX4UgznWvl+AunJT
         jLbF1yO3HPqIzKZsNd+LkGpcH1QAXHdY62bd0urpsjamUyje7bfhHBFy8PAYQPvt56Ef
         opP9KYZdVlr3ZeLqPvEU3L8euUK467+W/p2GOnxYOTVs2VckOZs4quMRE4FQZpNEy66j
         WsQO2mr68IYRWgoOmGmIl87F0BqTo+RQgg+0oaabBz8eE7lBzAWzsI86mmKKlpWPdwof
         2py0TaDGWiHmi7MxqgbqOgT/BS5ZAArjexXFR7zBZBoMdUVBpI3FJ4BCkbx35/JJzr2p
         eZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680889574; x=1683481574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Km/TTUdssvJ6LUJeka1mufWyNrdiHANvtguzKnjLMEE=;
        b=0hprWCCgz3wFVz7SvdffxB8nAyhqrehurocxLs1cGpKJjdDfQj0SypnIyTWI1/bWHP
         X8QHCdwq+9GGJzDTyk8WdFhMZio980kvNNg3mNnleJTiL/6sNQv1z9C6x8Yk1Ct0ubQ3
         zKBpdM/f8t26CiZNt0XFTdjnuiZp9FWBaXsSxVIAoLcVMMXikCKVvhRJsa4Q0hbiFYed
         iHuUMMpDIRZhXNKVuWeE81qg8MzdnpEGo0SwQdvxwybYIf5OrlNQBb6aq9F0wdHWUism
         zCRS9xNuCZAfehAdjLx3LD1c/tShyEalHVS1jegeydcGHWq8b1r8wVrDct7VnY76+Yt7
         QkFA==
X-Gm-Message-State: AAQBX9fBuSpoWjT29atGKQRxa2Vrokik2jVX2Y8rgu6oCL9Tlwb5TJOj
        xhJcyb8FQ/avaLRLetrXkYc=
X-Google-Smtp-Source: AKy350YdWAbDPoIRXgIn62gOBqhsXX9CIWARCS76R2T66Y6hdw5qhIzc2fbfdA0aSmx0VdrHoGXpmg==
X-Received: by 2002:a9d:6e84:0:b0:6a1:411a:fccc with SMTP id a4-20020a9d6e84000000b006a1411afcccmr1354467otr.8.1680889574233;
        Fri, 07 Apr 2023 10:46:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g25-20020a9d6c59000000b0069f95707335sm1844631otq.69.2023.04.07.10.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 10:46:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 7 Apr 2023 10:46:11 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        philmd@linaro.org, sergei.shtylyov@gmail.com,
        aleksander.lobakin@intel.com
Subject: Re: [PATCH v3 12/12] MIPS: generic: Enable all CPUs supported by
 virt board in Kconfig
Message-ID: <85ed22b8-9a63-4df7-a84d-4cd644e2578a@roeck-us.net>
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

This patch results in:

Building mips:allmodconfig ... failed
--------------
Error log:
arch/mips/kernel/cps-vec.S: Assembler messages:
arch/mips/kernel/cps-vec.S:228: Error: invalid operands `mfc0 $8,$16,1'
arch/mips/kernel/cps-vec.S:228: Error: invalid operands `mfc0 $8,$16,2'
arch/mips/kernel/cps-vec.S:228: Error: invalid operands `mfc0 $8,$16,3'
arch/mips/kernel/cps-vec.S:326: Error: invalid operands `mfc0 $14,$16,1'
arch/mips/kernel/cps-vec.S:326: Error: invalid operands `mfc0 $14,$16,2'
arch/mips/kernel/cps-vec.S:326: Error: invalid operands `mfc0 $14,$16,3'
arch/mips/kernel/cps-vec.S:329: Error: invalid operands `mfc0 $9,$0,2'
arch/mips/kernel/cps-vec.S:335: Error: opcode not supported on this processor: r4600 (mips3) `clz $9,$9'
arch/mips/kernel/cps-vec.S:343: Error: invalid operands `mfc0 $25,$15,1'
arch/mips/kernel/cps-vec.S:385: Error: invalid operands `mfc0 $8,$16,1'
arch/mips/kernel/cps-vec.S:385: Error: invalid operands `mfc0 $8,$16,2'
arch/mips/kernel/cps-vec.S:385: Error: invalid operands `mfc0 $8,$16,3'
arch/mips/kernel/cps-vec.S:395: Error: opcode not supported on this processor: r4600 (mips3) `jr.hb $9'
arch/mips/kernel/cps-vec.S:397: Error: invalid operands `mfc0 $9,$0,1'
arch/mips/kernel/cps-vec.S:399: Error: invalid operands `mtc0 $9,$0,1'
arch/mips/kernel/cps-vec.S:412: Error: invalid operands `mfc0 $8,$1,1'
arch/mips/kernel/cps-vec.S:416: Error: invalid operands `mtc0 $8,$1,1'
arch/mips/kernel/cps-vec.S:507: Error: invalid operands `mtc0 $8,$2,4'
arch/mips/kernel/cps-vec.S:509: Error: opcode not supported on this processor: r4600 (mips3) `jr.hb $8'

This is with:

Compiler version: mips64-linux-gcc (GCC) 11.3.0
Assembler version: GNU assembler (GNU Binutils) 2.39

Bisect log attached for reference.

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
