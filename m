Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2FD7752E3
	for <lists+linux-mips@lfdr.de>; Wed,  9 Aug 2023 08:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbjHIGaF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Aug 2023 02:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjHIGaE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Aug 2023 02:30:04 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C65C01BFA
        for <linux-mips@vger.kernel.org>; Tue,  8 Aug 2023 23:30:03 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-447823dd96fso1869813137.1
        for <linux-mips@vger.kernel.org>; Tue, 08 Aug 2023 23:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691562603; x=1692167403;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=neTmf5P15paOxXzupKMu3RNPlvtFTYN497G//b83UsM=;
        b=lY1NEIiEUr4uPw84kWrKXa/qzm7f/NO2muz0k589XUGjYkGfxqvFoKk4rxJTaZRDV8
         13qp6kkCThe9RUGFqj4slajifw/qTLwA0kapIZDvMNJR7uT5FHwNUCP4k6t057FW0NJD
         kOx4nwLne8cf+DmHK8yM90DugOvtgFlUliXFWFXfXfIDrFJQAwOh0WuPYswL4P8SSEp/
         LF+MAmwVewrUHyQn/gaCoW4aq9vB83qnaHx2rWstAgNKSTtGTR3MJhABy0dV87qgc7XK
         /GXZqmiBGa1IeUg+OujjHCzNVRR9oM2wsaD8LbNS3pQRwrDei4zELH6iPQhzVSmsEOxZ
         vq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691562603; x=1692167403;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=neTmf5P15paOxXzupKMu3RNPlvtFTYN497G//b83UsM=;
        b=jUIxd0FGxuUGfb/vg1PvqwfN2Rvmm1585TAXq/Ee9QwI1JvnSVk74BXNLwTncj/yYD
         rzJF3UwpWUxO0s3HPVtbpSb5HHIPlo/DFWWDlXduf6Cin7ZOlu+wMkwEcmwFLu7lxr6A
         pwhFnylYR/JVVWKO4X6ik5SgXqvhZhHPkzrIKCTnDuGbRVFYhcVw6qewpILUhxh0Lqci
         Va4Y2G8OVuMF5wz7nRQoX3S8KJS1jS4jCqUXBprEGF/p7DY/qcj5KzUauMAbZ5tVkGzO
         +0WVJYA9GrJqQ6xXN2WI38W2ql/YmE7fJjh9InDmpO+AQMss9AnX6i5ots6g1e7bEgku
         6wUw==
X-Gm-Message-State: AOJu0YxovU5cVzmHC2dVOU/Lt7t9hERjnpjmONooaplUI7Cy6UrMYj0T
        FVNZEb/h4dfAt4Kl129pkzq+zXnMOJcqrdN/IKTSOg==
X-Google-Smtp-Source: AGHT+IFjZhbcKr3eNydvf6ZMRnd1wQ4W6yXaoahpWXSff3ZmV4KNZ/0/E3kghBQjZDI3KisgUGjuTzJbCuRETv/9jYA=
X-Received: by 2002:a67:fbd1:0:b0:447:9a22:2a6 with SMTP id
 o17-20020a67fbd1000000b004479a2202a6mr1319385vsr.26.1691562602807; Tue, 08
 Aug 2023 23:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYspyEdT9wmVpL04J-p0CwqA+_v_L4H+ihY9VYqpCMmQ1Q@mail.gmail.com>
 <1ab766fca893588d75590d2faf624eb7d9d27a8a.camel@triops.cz>
In-Reply-To: <1ab766fca893588d75590d2faf624eb7d9d27a8a.camel@triops.cz>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 9 Aug 2023 11:59:50 +0530
Message-ID: <CA+G9fYuO1-q_agmNqRaGVq5Af4+EpCx3UVG7gCx0Gu=O2Kd-vg@mail.gmail.com>
Subject: Re: next: mips: cavium_octeon_defconfig: gcc-8 - dwc3-octeon.c:502:8:
 include/linux/compiler_types.h:397:38: error: call to '__compiletime_assert_335'
 declared with attribute error: FIELD_PREP: value too large for the field _compiletime_assert
To:     Ladislav Michl <ladis@triops.cz>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
        lkft-triage@lists.linaro.org, Thinh.Nguyen@synopsys.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 8 Aug 2023 at 13:15, Ladislav Michl <ladis@triops.cz> wrote:
>
> Hi Naresh,
>
> On Tue, 2023-08-08 at 12:41 +0530, Naresh Kamboju wrote:
> > [My two cents]
> >
> > While building Linux next-20230808 mips cavium_octeon_defconfig with
> > gcc-8
> > failed with below warnings and errors.
> >
> > Build log:
> > ----------
> >
> > In function 'dwc3_octeon_setup.isra.4',
> >     inlined from 'dwc3_octeon_probe' at drivers/usb/dwc3/dwc3-
> > octeon.c:502:8:
> > include/linux/compiler_types.h:397:38: error: call to
> > '__compiletime_assert_335' declared with attribute error: FIELD_PREP:
> > value too large for the field
> >   _compiletime_assert(condition, msg, __compiletime_assert_,
> > __COUNTER__)
> >                                       ^
> > include/linux/compiler_types.h:378:4: note: in definition of macro
> > '__compiletime_assert'
> >     prefix ## suffix();    \
> >     ^~~~~~
>
> Not sure what is really going on there. Code compiles even using 32bit
> toochains without warnings and such an assignments are used in other
> kernel drivers. See for example drivers/cxl/core/hdm.c:534 which is
> using the same types. Also
> drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c in
> rvu_exact_prepare_table_entry...
>
> Anyway, let me setup gcc-8 toolchain :)

For your reference,
These are steps to setup toolchain and build with single command,

# TuxMake is a command line tool and Python library that provides
# portable and repeatable Linux kernel builds across a variety of
# architectures, toolchains, kernel configurations, and make targets.
#
# TuxMake supports the concept of runtimes.
# See https://docs.tuxmake.org/runtimes/, for that to work it requires
# that you install podman or docker on your system.
#
# To install tuxmake to your home directory at ~/.local/bin:
# pip3 install -U --user tuxmake
#
# Or install a deb/rpm depending on the running distribution
# See https://tuxmake.org/install-deb/ or
# https://tuxmake.org/install-rpm/
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.
# tuxmake --runtime podman --target-arch mips --toolchain gcc-8
--kconfig cavium_octeon_defconfig


tuxmake --runtime podman --target-arch mips --toolchain gcc-8
--kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2TgoAZwerJ28UWHyqfQUiaYYhrl/config


Steps to reproduce:
------------
  tuxmake --runtime podman --target-arch mips --toolchain gcc-8
--kconfig cavium_octeon_defconfig


   - https://storage.tuxsuite.com/public/linaro/lkft/builds/2TgoAZwerJ28UWHyqfQUiaYYhrl/tuxmake_reproducer.sh


- Naresh
