Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8E76E916E
	for <lists+linux-mips@lfdr.de>; Thu, 20 Apr 2023 13:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235234AbjDTLD3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Apr 2023 07:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235235AbjDTLDP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Apr 2023 07:03:15 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2753C26BF
        for <linux-mips@vger.kernel.org>; Thu, 20 Apr 2023 04:01:46 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id o2so1828708uao.11
        for <linux-mips@vger.kernel.org>; Thu, 20 Apr 2023 04:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681988483; x=1684580483;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9/krmrwSEL+NhwRErVEyJ99NsFitd2cJDfkllHsD/uM=;
        b=snFz9FcgJNGFQnSpVoFHu1+dHtbiF64/WO8BtxY/LR2Hrw/c+dITS3cGbHrCA8w0mp
         aaY9QiLMN9eLID591qSC5AXl3zJ533ZDXnhmNJ8xHiKh2GDuuqG8pCGoi3Nc0nYtyxjT
         jmNANCKY87CY6wuZA1sJgeUGQt3vLRObLyKxjo9ZJ0e1SibwRqsWOjpcEySFvPd92MBk
         2WKsPGMGruUM86PM+CxOFyBt+OOJ6tEOGvTNDZsYZhdHMPLPAD2ueuSvYqOYLq7XIUHn
         s4t5uE0LsVAAgz4bjwRzq4ReBpEGWUQYAGrtBOakq+i1VJxxQpTSt0CfJR+itdvu9sZ4
         yG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681988483; x=1684580483;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9/krmrwSEL+NhwRErVEyJ99NsFitd2cJDfkllHsD/uM=;
        b=VqqLZfhyfnOPDSxY/L/eD/rxf/GFFco+fKlfZqjW0orWboouuDjsuCDt1VzEq8Mnh/
         /2+5svP+ku6utDuNUnRC/oPHsSQrkwGfvsdiJSGIdRq8sPLwolooU1bPFTILNYbfcaOS
         fEsIZPKE7DIsb94dLYKJ7hXacXCGm5XpA2IMeGGHxQVwobaUg6hjX+HqF3LUpI6j1sXG
         plQ3Hhr9madG6sQNJPszI0fFdbaY6SQPhGIaKswrG4jd2VXYBFxUefj334jgvY/dMuEV
         uRhRWEvGJ2vD+Xn3B2HtOamHUaXqV1gG7RUxr8f8D/gOpvoNsKe7nGL4PvoJRDv7sIWq
         QjIQ==
X-Gm-Message-State: AAQBX9fygM1khRvCJc6I6Iw379eu2yHuphEau159inI6K1uwLjZx6tbD
        upx0LkW4BPqzGwhYMqYAGVtvuM+PS/3oSCdXBzpiTDo2bNJIXl/cU6U=
X-Google-Smtp-Source: AKy350aynQMU4rqBVkT/HvHFUt9abSuGDscTBinD7vNfgD4VGkzFrpIlTakGszMHxO00jZ3rmdvHBbAoYTW5MPyHV8w=
X-Received: by 2002:a1f:5fc5:0:b0:43f:f4a3:7385 with SMTP id
 t188-20020a1f5fc5000000b0043ff4a37385mr498327vkb.7.1681988483260; Thu, 20 Apr
 2023 04:01:23 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 20 Apr 2023 16:31:12 +0530
Message-ID: <CA+G9fYt+4e57Gdy6cix=LeNK6XqWoui8du=mZWu=cf8vPYocKw@mail.gmail.com>
Subject: next: mips: ERROR: modpost: Section mismatches detected.
To:     linux-mips@vger.kernel.org, llvm@lists.linux.dev,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>
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

Following build failures noticed on Linux next-20230419 for mips.

Regressions found on mips:
 - build/clang-nightly-allnoconfig
 - build/clang-16-allnoconfig
 - build/clang-16-tinyconfig
 - build/clang-nightly-tinyconfig


arch/mips/kernel/genex.S:520:2: warning: macro defined with named
parameters which are not used in macro body, possible positional
parameter found in body which will have no effect
 .macro __BUILD_verbose nexception
 ^
WARNING: modpost: vmlinux.o: section mismatch in reference: check_bugs
(section: .text) -> check_bugs32 (section: .init.text)
ERROR: modpost: Section mismatches detected.
Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.
make[2]: *** [scripts/Makefile.modpost:136: vmlinux.symvers] Error 1
make[2]: *** Deleting file 'vmlinux.symvers'
make[2]: Target '__modpost' not remade because of errors.
make[1]: *** [Makefile:1978: modpost] Error 2


Build details:
---------
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230419/testrun/16367253/suite/build/test/clang-16-tinyconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230419/testrun/16367253/suite/build/test/clang-16-tinyconfig/log


Steps to reproduce:
----------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.

tuxmake --runtime podman --target-arch mips --toolchain clang-16
--kconfig tinyconfig LLVM=1 LLVM_IAS=1


--
Linaro LKFT
https://lkft.linaro.org
