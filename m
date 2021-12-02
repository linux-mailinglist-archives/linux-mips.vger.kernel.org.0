Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDBE8466482
	for <lists+linux-mips@lfdr.de>; Thu,  2 Dec 2021 14:29:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358246AbhLBNct (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 Dec 2021 08:32:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358213AbhLBNcr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 Dec 2021 08:32:47 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EEF2C06174A
        for <linux-mips@vger.kernel.org>; Thu,  2 Dec 2021 05:29:24 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id y12so115905053eda.12
        for <linux-mips@vger.kernel.org>; Thu, 02 Dec 2021 05:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=eeWMTaetwSCl+1Gux4Y+6ccJE7U0astjY10X/txA5Pk=;
        b=Xnwc+IWWy7SBWNxusBlLRqTfoxrgn05jnDfYFPqXXQNA+R7laDEK/hY0ZHmzXK4+rF
         xguHIL8QLWQoBSkbtyMsU2lNISNPThIX3UpnQnH1L9D/uaHzKJ4ceX7X0Mn3TjMjYj3B
         UKRkL3Ao+uKWyCeR3Dq5MGwCin86B5V/DYGgZBQM/XCuMOE9yiJ/Uqp5oohUQgJ3ZgGH
         ZA8LJ4/kGzVgzEnzPnw5gWWBoyO5/FgvOpyKldP3oCbgNGMeTJfqcvD2QzSzbQWALCIm
         9GfpGIE6Q3c9a4lxi9a8ibI6UnBmcpu/ERivXTquCibua/gfCKVNYaEro6EzpFehfOZE
         56Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=eeWMTaetwSCl+1Gux4Y+6ccJE7U0astjY10X/txA5Pk=;
        b=0I3b0rRvkVQpU4wEvSotrp3C8NY/AxDQLwbOthlqbW0BKh+S6ZWrUGzhTT7eO7V5qn
         GIcJf+ud7i4NeJFs48ABKKRpRJoKnBszN/lLRzsT5FZrIElT7iKh/0kKECJDc6tjs7eT
         WQIjgwGLUrBRr9VSSvBmDyEI6MRt411HT1EeFkmQ+v/MvI0CMxWVPp5G333h8x4U2K09
         AL27BnrBaZcr9865ZoHAZasQyF/7vK+z2SyHl2wg569rpElChE2uqQBt1B4WOGZ2SOaD
         MIUQJZg7oqXIPUQuw4/2cJked6L8UeffWP1InJfquLb78nMlNqKW1ZjufcMKGWDSS3Ij
         mwOg==
X-Gm-Message-State: AOAM530W3BCCft1qOksCBKWUyrHPzvqyRqyZTJNs0TEwPj9przQVBCN2
        E1F1pEekHfupGQIsTJj4XGP3dl8KYKd4ZDHzpr/FbQ==
X-Google-Smtp-Source: ABdhPJygEmkY/ykQ8nrkRIuJkUgYfNy+8KlJGKbNa1o7DdDpLvqYB87MtMJX6llY3wUr6bsYlJjuyV7g1oYdb7Zxz68=
X-Received: by 2002:a17:907:7f8c:: with SMTP id qk12mr15232079ejc.169.1638451756985;
 Thu, 02 Dec 2021 05:29:16 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 2 Dec 2021 18:59:05 +0530
Message-ID: <CA+G9fYv-os1goBNae4RSk2Gt9vdg53j3MPyAbmKPAoBdn5z7nA@mail.gmail.com>
Subject: [Next] futex.h:89:9: error: implicit declaration of function 'arch_futex_atomic_op_inuser_local'
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>, Rich Felker <dalias@libc.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

While building Linux next 20211202 tag for sh with gcc-10
following warnings / errors noticed.

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=mips
CROSS_COMPILE=mips-linux-gnu- 'CC=sccache mips-linux-gnu-gcc'
'HOSTCC=sccache gcc'
In file included from /builds/linux/kernel/futex/futex.h:12,
                 from /builds/linux/kernel/futex/core.c:41:
/builds/linux/arch/mips/include/asm/futex.h: In function
'arch_futex_atomic_op_inuser':
/builds/linux/arch/mips/include/asm/futex.h:89:9: error: implicit
declaration of function 'arch_futex_atomic_op_inuser_local'; did you
mean 'futex_atomic_op_inuser_local'?
[-Werror=implicit-function-declaration]
   89 |   ret = arch_futex_atomic_op_inuser_local(op, oparg, oval,\
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/builds/linux/arch/mips/include/asm/futex.h:89:9: note: in definition
of macro '__futex_atomic_op'
   89 |   ret = arch_futex_atomic_op_inuser_local(op, oparg, oval,\
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /builds/linux/kernel/futex/futex.h:12,
                 from /builds/linux/kernel/futex/core.c:41:
/builds/linux/arch/mips/include/asm/futex.h:23:39: error: invalid
storage class for function 'futex_atomic_cmpxchg_inatomic'
   23 | #define futex_atomic_cmpxchg_inatomic futex_atomic_cmpxchg_inatomic
      |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/builds/linux/arch/mips/include/asm/futex.h:133:1: note: in expansion
of macro 'futex_atomic_cmpxchg_inatomic'
  133 | futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /builds/linux/kernel/futex/futex.h:12,
                 from /builds/linux/kernel/futex/core.c:41:
/builds/linux/arch/mips/include/asm/futex.h:132:1: warning: ISO C90
forbids mixed declarations and code [-Wdeclaration-after-statement]
  132 | static inline int
      | ^~~~~~
In file included from /builds/linux/kernel/futex/core.c:41:
/builds/linux/kernel/futex/futex.h:33:20: error: invalid storage class
for function 'should_fail_futex'
   33 | static inline bool should_fail_futex(bool fshared)
      |                    ^~~~~~~~~~~~~~~~~
/builds/linux/kernel/futex/futex.h:134:19: error: invalid storage
class for function 'futex_match'
  134 | static inline int futex_match(union futex_key *key1, union
futex_key *key2)
      |                   ^~~~~~~~~~~
/builds/linux/kernel/futex/futex.h:169:20: error: invalid storage
class for function 'futex_queue'
  169 | static inline void futex_queue(struct futex_q *q, struct
futex_hash_bucket *hb)
      |                    ^~~~~~~~~~~
/builds/linux/kernel/futex/futex.h:183:20: error: invalid storage
class for function 'futex_hb_waiters_inc'
  183 | static inline void futex_hb_waiters_inc(struct futex_hash_bucket *hb)
      |                    ^~~~~~~~~~~~~~~~~~~~
/builds/linux/kernel/futex/futex.h:198:20: error: invalid storage
class for function 'futex_hb_waiters_dec'
  198 | static inline void futex_hb_waiters_dec(struct futex_hash_bucket *hb)
      |                    ^~~~~~~~~~~~~~~~~~~~
/builds/linux/kernel/futex/futex.h:205:19: error: invalid storage
class for function 'futex_hb_waiters_pending'
  205 | static inline int futex_hb_waiters_pending(struct futex_hash_bucket *hb)
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~
/builds/linux/kernel/futex/futex.h:238:1: error: invalid storage class
for function 'double_lock_hb'
  238 | double_lock_hb(struct futex_hash_bucket *hb1, struct
futex_hash_bucket *hb2)
      | ^~~~~~~~~~~~~~
/builds/linux/kernel/futex/futex.h:249:1: error: invalid storage class
for function 'double_unlock_hb'
  249 | double_unlock_hb(struct futex_hash_bucket *hb1, struct
futex_hash_bucket *hb2)
      | ^~~~~~~~~~~~~~~~


Build config:
https://builds.tuxbuild.com/21igw2PcUSaVeHzl1QOiAUEwpkt/config


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

meta data:
-----------
    git describe: next-20211202
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_sha: 9606f9efb1cec7f8f5912326f182fbfbcad34382
    git_short_log: 9606f9efb1ce (\"Add linux-next specific files for 20211202\")
    target_arch: mips
    toolchain: gcc-10


steps to reproduce:
tuxmake --runtime podman --target-arch mips --toolchain gcc-10
--kconfig ar7_defconfig

https://builds.tuxbuild.com/21igw2PcUSaVeHzl1QOiAUEwpkt/tuxmake_reproducer.sh

--
Linaro LKFT
https://lkft.linaro.org
