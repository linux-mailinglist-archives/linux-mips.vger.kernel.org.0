Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 991F3315F11
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 06:31:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbhBJFbF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 00:31:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbhBJFbE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 00:31:04 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 785EFC061756
        for <linux-mips@vger.kernel.org>; Tue,  9 Feb 2021 21:30:24 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id y9so1701810ejp.10
        for <linux-mips@vger.kernel.org>; Tue, 09 Feb 2021 21:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=MICJlJ29tnK0OfCyoQ6hy5raS8MLx1t0pMdT44oGdyg=;
        b=nfbBML/4y70ovJ2kiP9RG4GcxYkTO+D3LyhbGrYmbdYX7rKrIpX6minKQOhPHiNfVf
         ycrDDxo78Yn4BzEYDPu66bkXO+MyRZ+XJfiIEX6eAmCK7Ubo6u6uU+pkzcufzqcgX5HL
         jsHZlagsshooCK1KC0HIgZYZkvmlZOsbBwCzbrl/ixW7WlnNGy5dGyqqRgjcUdhVmmkT
         tCQ0O1OyhgTyBA7T9xH1+ABwCHlABqisavBE7ffDIVSYjpOSJWwFBYTyx6g+uvGHkYsu
         d1Pecs/8/PGPQC06MBB9T1yLCJZ7/KNGEZXAKroDC1N1+fTESJhsrqouMLi+mC/80Pzs
         DCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=MICJlJ29tnK0OfCyoQ6hy5raS8MLx1t0pMdT44oGdyg=;
        b=aKCw0XoYyrOHOEsLg6J8Gie4vsYHPxlW2OLnow3F07Of8MhjVuMNLSe4h6tKz6cboh
         oHuBhkj//saVYgU/X+km0jrpVAGuYOE1rugBR/K2R6c2ri1ZVLwxpPNkh4lANG/bmpm4
         lN74tRzp3Rj1KB3MplGA4Haz3T6qz8NawDPaz0EAU5z0ADeZ67Nrc6RH6Qg9vtGYms49
         4qdLAwyzevbTr4Eym+qa9ptQ46CSGAFT5KZTwKV1EEBx+IRbksH78YEbGbK9ORjCARkb
         PhaSJPjDLJr3iSSl1Vo8hJwWzEjD/JHuncEG8Fr2r3EoFW520RwtoEu5Sm3b39mYhgT1
         6OCg==
X-Gm-Message-State: AOAM533RtwqjTnp8myvbb5NJ+zXaoNs7Sekr2MaA/Lz6dGlZE+oMcU6A
        /xwOrvpz6dD+kfnRWUEup0ZuJLUy+U3bAPZ0EMHlzOpeC28TtYRT
X-Google-Smtp-Source: ABdhPJxEoJqFS1/67jseq2Ryw8nAFmbH3a+Jxs2FDMzSngVK9VYGXMqwMiOfqb1G8wgBu2idtECavM8knM8Y8m+9beE=
X-Received: by 2002:a17:906:a153:: with SMTP id bu19mr1269611ejb.287.1612935022534;
 Tue, 09 Feb 2021 21:30:22 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 10 Feb 2021 11:00:11 +0530
Message-ID: <CA+G9fYtkWdeL7-nfXW8+VbaCK7swinU_Ksn67RW4FFD+cx8VYg@mail.gmail.com>
Subject: [next] [mips] spinlock.h:17:28: error: redefinition of 'queued_spin_unlock'
To:     linux-mips@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Paul Burton <paul.burton@mips.com>, Will Deacon <will@kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Waiman Long <longman@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

While building Linux next tag 20210209 mips uImage.gz failed with below configs

  - mips (cavium_octeon_defconfig) with gcc-8, gcc-9 and gcc-10 - FAILED
  - mips (malta_defconfig) with gcc-8, gcc-9 and gcc-10 - FAILED
  - mips (nlm_xlp_defconfig) with gcc-8, gcc-9 and gcc-10 - FAILED
  - mips (defconfig) with gcc-8, gcc-9 and gcc-10 - FAILED

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=mips
CROSS_COMPILE=mips-linux-gnu- 'CC=sccache mips-linux-gnu-gcc'
'HOSTCC=sccache gcc' uImage.gz
In file included from /include/linux/spinlock.h:90,
                 from /include/linux/ipc.h:5,
                 from /include/uapi/linux/sem.h:5,
                 from /include/linux/sem.h:5,
                 from /include/linux/compat.h:14,
                 from /arch/mips/kernel/asm-offsets.c:12:
/arch/mips/include/asm/spinlock.h:17:28: error: redefinition of
'queued_spin_unlock'
   17 | #define queued_spin_unlock queued_spin_unlock
      |                            ^~~~~~~~~~~~~~~~~~

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

build link,
https://builds.tuxbuild.com/1oF9lkBAeWM2WvR11O2Yun8ERNT/

-- 
Linaro LKFT
https://lkft.linaro.org
