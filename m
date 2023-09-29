Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 200A87B2CCC
	for <lists+linux-mips@lfdr.de>; Fri, 29 Sep 2023 09:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231774AbjI2HDs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Sep 2023 03:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjI2HDr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Sep 2023 03:03:47 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E9A195
        for <linux-mips@vger.kernel.org>; Fri, 29 Sep 2023 00:03:44 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-45289425da1so5713189137.1
        for <linux-mips@vger.kernel.org>; Fri, 29 Sep 2023 00:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695971023; x=1696575823; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yVYuURB2cheQTyHOhbnV0CiyPuHwKJiKEUrZ0k9NBTk=;
        b=Vgl4obYEXH9vsMgejsYBa8wKVYAN+ArOHls5/Ytc0GESgxWeZCRNXNCqE/zunqQ08C
         p73wO533ELQssUGYN8FISNN9J1ceqZh7zGlyXhvl6fg8b6x0XC/k9UA3akBOyLASYvkc
         Z4NGKQsJ2K/FpNDac0q6mYNHPeVF/hgm4fxx0+gleIYe90SY8IJqRVGDt1npNMM6AaRV
         3AGubP4shNTONwbWnBK5fvHDxK9lDWlPNxBHWF/6EBmNPwOc2jbeXH+ucFskeuKer/pA
         n7L9AZOiJP92Pb1IpunAhB0z7bx/ApPRKNKzfBWCB4kwBHUln+2oeImyNthRvZKbpKdb
         eDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695971023; x=1696575823;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yVYuURB2cheQTyHOhbnV0CiyPuHwKJiKEUrZ0k9NBTk=;
        b=cE/DRwhnBKXk+JeKwMLuzbBY5o+w6dcqiIfvJPFSsmh6DbyYGctFsfcizeYTa4pEoU
         M9Oai1/etE7Rqf7DWZktXTKH/y/74bTJ1aRHXySts+BhdsDCpGn2zIuzm11QRQTUf1Ul
         uK6TXiNzO52v0nuPkhTESND74RrCqSGEzfFtzUwE8WDjxxTKG8CUXPdjK9fvMAZoSjCu
         9gTZalD6NlUgsV6b/jQdDBWBgV1uZQFfo7LjYOCflbPC9a4rTFWlNJCj2Rwqza8Yxo4C
         K5+EYI59mF8yCHN9+IZj8hGE/yTO+86h3dQu5Hb7b07tCHRK+1zNw/TBA4ATEysF/gNe
         Cz7g==
X-Gm-Message-State: AOJu0YzuGSCfTgd9PGM/cxglu4pLfvaJ0pFxBuTSEZJgYZB5Yotgak3g
        8boiRKtadhJ+PD1Cg3NbYPhWxknuiPJV/znZN4pJTA==
X-Google-Smtp-Source: AGHT+IHQAyrtYw6eFyGn+nC8nJKCAAl7jmDDfoPwLpeWUIuOh3FxqsVtkdL3fgC7qCAGj2sBL8dOQY9dTeRAdFaA1BY=
X-Received: by 2002:a67:cd01:0:b0:44e:9afe:c5b9 with SMTP id
 u1-20020a67cd01000000b0044e9afec5b9mr2704237vsl.23.1695971023130; Fri, 29 Sep
 2023 00:03:43 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 29 Sep 2023 12:33:31 +0530
Message-ID: <CA+G9fYvVETLEtiZ=MFRrxgXpmgirVHz-tDOxhU=7_9dtmx7o5g@mail.gmail.com>
Subject: next: mips: cavium_octeon_defconfig failed - drivers/staging/octeon/ethernet.c:204:37:
 error: storage size of 'rx_status' isn't known
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mips@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Oliver Crumrine <ozlinux@hotmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The mips cavium_octeon_defconfig builds failing on Linux next from
Sept 19th tag.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
--------
drivers/staging/octeon/ethernet.c: In function 'cvm_oct_common_get_stats':
drivers/staging/octeon/ethernet.c:204:37: error: storage size of
'rx_status' isn't known
  204 |         struct cvmx_pip_port_status rx_status;
      |                                     ^~~~~~~~~
drivers/staging/octeon/ethernet.c:205:37: error: storage size of
'tx_status' isn't known
  205 |         struct cvmx_pko_port_status tx_status;
      |                                     ^~~~~~~~~
drivers/staging/octeon/ethernet.c:205:37: warning: unused variable
'tx_status' [-Wunused-variable]
drivers/staging/octeon/ethernet.c:204:37: warning: unused variable
'rx_status' [-Wunused-variable]
  204 |         struct cvmx_pip_port_status rx_status;
      |                                     ^~~~~~~~~
drivers/staging/octeon/ethernet.c: In function 'cvm_oct_probe':
drivers/staging/octeon/ethernet.c:801:22: error: variable 'imode' has
initializer but incomplete type
  801 |                 enum cvmx_helper_interface_mode imode =
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/staging/octeon/ethernet.c:801:49: error: storage size of
'imode' isn't known
  801 |                 enum cvmx_helper_interface_mode imode =
      |                                                 ^~~~~
drivers/staging/octeon/ethernet.c:801:49: warning: unused variable
'imode' [-Wunused-variable]
make[6]: *** [scripts/Makefile.build:243:
drivers/staging/octeon/ethernet.o] Error 1
make[6]: Target 'drivers/staging/octeon/' not remade because of errors.
make[5]: *** [scripts/Makefile.build:480: drivers/staging/octeon] Error 2



Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230928/testrun/20145550/suite/build/test/gcc-12-cavium_octeon_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230928/testrun/20145550/suite/build/test/gcc-12-cavium_octeon_defconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230928/testrun/20145550/suite/build/test/gcc-12-cavium_octeon_defconfig/history/



--
Linaro LKFT
https://lkft.linaro.org
