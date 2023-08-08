Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A34507742D9
	for <lists+linux-mips@lfdr.de>; Tue,  8 Aug 2023 19:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235057AbjHHRvR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Aug 2023 13:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234984AbjHHRuq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 13:50:46 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACAEE9EC3
        for <linux-mips@vger.kernel.org>; Tue,  8 Aug 2023 09:22:41 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5768a7e3adbso332317b3.0
        for <linux-mips@vger.kernel.org>; Tue, 08 Aug 2023 09:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691511738; x=1692116538;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y6sSetytOmUwyBC8vzBUgi7mxtEE0jfVhWzzVyZzcSg=;
        b=JhoheN3H6C/80HqucaJ0VlvAmt9SpiVKCn+6gqg+521jRNgLgUd6vvjAd/mmB+4HTm
         iJEzuy6fVLSUMpRvA3GldiaXm4kC2Up5Sg+vKmmfe2gROHOUh2K7vrgxp48AJAxDPoMt
         WWb341ivTLs5rcdHjyCXWR5CHOohfE1zE8uDii6kNjBRtB2Dx4iJAHvWhLp328XrA95i
         AJRXqc4urH2HMH1BeNl36x71lAzybbwZ3AHT8DXXfVMnja5SlzuxwCSSXxxpVvWG+UK/
         sMnQScfLqFvk77gmZBuzVK5QlSjMDvuQHIdIs1ZZnGpEwErLzT3A7gbHVyTdlybhx12f
         DIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511738; x=1692116538;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y6sSetytOmUwyBC8vzBUgi7mxtEE0jfVhWzzVyZzcSg=;
        b=lJ+SS37E242fk7BnqUWS8AgXGei1aLnRUPxE65yQNoqTw+Ja9Y5Hoc8pltpRczbodI
         UkpKcPuXHtayeWQhBwBtKSY/kq8lEMNEGAcI92rP1h7FC6y93zBVfLVJuTQFVjBPo8ws
         ZrYa4Cd4RJn790EVOdMVsHJ/QsJ8sau5nnRxGLN2x/KMmitRj7VJBK8qIJIUNMDIiU+Q
         9TGlQCuXFQMeHwlDnzRNF94fP4Si2RNw2gBRcAbYwUYaP3o0xr8qTLiKo51aoCwLDq3i
         KxVaCl7F2/yFhYEm5zXj5OjDX2561FjfWp1xpGQmsUz7o76J99UgLZyubLzQScbHImHo
         q3yA==
X-Gm-Message-State: AOJu0YxojbYG/o0wDwZrdD8cTenj93J2CKrgXB/JSe7KgxYDTCCMrmT5
        asU9x0XmUL/YMrKOCxmYAJV4WY0XDiEmDA2C1hBZ/T3rk6R/9nL7pKs=
X-Google-Smtp-Source: AGHT+IHtywQ8e8sdcBJ4nEsVchvTc5SRUSLKPPN/CcX+znemohbI6SJix20yoRk10mpcbIo22CBF5AHYdgr0wG7ZGcU=
X-Received: by 2002:a05:6102:11f8:b0:43f:3426:9e35 with SMTP id
 e24-20020a05610211f800b0043f34269e35mr3147137vsg.12.1691478715881; Tue, 08
 Aug 2023 00:11:55 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 8 Aug 2023 12:41:44 +0530
Message-ID: <CA+G9fYspyEdT9wmVpL04J-p0CwqA+_v_L4H+ihY9VYqpCMmQ1Q@mail.gmail.com>
Subject: next: mips: cavium_octeon_defconfig: gcc-8 - dwc3-octeon.c:502:8:
 include/linux/compiler_types.h:397:38: error: call to '__compiletime_assert_335'
 declared with attribute error: FIELD_PREP: value too large for the field _compiletime_assert
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
        lkft-triage@lists.linaro.org
Cc:     Ladislav Michl <ladis@linux-mips.org>, Thinh.Nguyen@synopsys.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

[My two cents]

While building Linux next-20230808 mips cavium_octeon_defconfig with gcc-8
failed with below warnings and errors.

Build log:
----------

In function 'dwc3_octeon_setup.isra.4',
    inlined from 'dwc3_octeon_probe' at drivers/usb/dwc3/dwc3-octeon.c:502:8:
include/linux/compiler_types.h:397:38: error: call to
'__compiletime_assert_335' declared with attribute error: FIELD_PREP:
value too large for the field
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                      ^
include/linux/compiler_types.h:378:4: note: in definition of macro
'__compiletime_assert'
    prefix ## suffix();    \
    ^~~~~~

  Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Links:
-----
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230808/testrun/18882876/suite/build/test/gcc-8-cavium_octeon_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230808/testrun/18882876/suite/build/test/gcc-8-cavium_octeon_defconfig/history/

Steps to reproduce:
------------
  tuxmake --runtime podman --target-arch mips --toolchain gcc-8
--kconfig cavium_octeon_defconfig
   - https://storage.tuxsuite.com/public/linaro/lkft/builds/2TgoAZwerJ28UWHyqfQUiaYYhrl/tuxmake_reproducer.sh

--
Linaro LKFT
https://lkft.linaro.org
