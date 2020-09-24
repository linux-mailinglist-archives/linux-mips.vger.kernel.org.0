Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C485277446
	for <lists+linux-mips@lfdr.de>; Thu, 24 Sep 2020 16:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbgIXOrb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Sep 2020 10:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728114AbgIXOrb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 24 Sep 2020 10:47:31 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48EC4C0613CE
        for <linux-mips@vger.kernel.org>; Thu, 24 Sep 2020 07:47:31 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id q124so961762vkb.8
        for <linux-mips@vger.kernel.org>; Thu, 24 Sep 2020 07:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=nFE4b2o9wRpJTa+5wFfEk+IlL+8Wjr/EPdR0SQr7RI8=;
        b=d6mVwZgSFvMTZF7Oh6LvBJ6U9c+Idd4OKFRbVAMQOhY8gzvjjDlCpedLa6KcCsACNA
         nWO8CfxpmH0mu+G97j6jK4CByRRJZGTxP+u6xKWZnoRgB9dr4ckwjEaRBhbJPmlIjRd7
         NwI0YcdXZmZPnjdZ7AZfg1gnLY+pFFZp2o22i+XU/Lj/3HmJv3mh5V6kBVMRpzC8k134
         EvNtcpHLCp3YNY3tyfyUbP0Ffz10T8lLlV0Dq1ZeVj9LLrD1xZclvDkQztJ3UG6pdfrk
         Wh+B3GiaNKFWL26oN0lauJ9v80sytETqqBi5c3bPoqapbvvI07SqELD5TSQtlOpDtgoC
         lN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=nFE4b2o9wRpJTa+5wFfEk+IlL+8Wjr/EPdR0SQr7RI8=;
        b=B0YWtkoVJ1SR/1Gu+MMy3b3QJHXfN+jZBuVD8aiO1pJqh/dZo6xpHGtAy+gD3wJjqZ
         UD5qhnf9JWNY3Odul1EmnOCLZ7Hac+mr5E5AcX7B6BrMmyA25jYbxiEimaCiVZAHEDRi
         yHqL+QWe2K6zpTC3gK9jaE7yLo+dI6HWzcaBIhuHkOOCY04n+HL3Q3qh5RF/3N5JHj7P
         6ys9xWfR0vufZrpgv/XNkUpU1zkK95bJ5skPc3g9S0G41xUJHcso0jeEIzVS7NDuTnr0
         JrvLz8qwJhv4Dxk5cMcITVhxXj+ecRwNDRxLOERDes7lST/wlT7aha7yboEWNQsb964Y
         /x1g==
X-Gm-Message-State: AOAM533KRJua73WE/WHrBkBI3dx9T58U236erkUG0rBbqIbG/p3sz3fn
        OOmnEXAYQeUxZ3euZNDXKSi0QA7BN1Z6RNdj4iLkAA==
X-Google-Smtp-Source: ABdhPJyaSFYu+pG+TUwzIOtE1Ak8AVCJSwEudGArCrbNNhphvHmeat1tIMeEN7MMdt6tZ/Fym58NVcnGdyFC5j+72Kw=
X-Received: by 2002:ac5:ccd3:: with SMTP id j19mr4208444vkn.8.1600958850318;
 Thu, 24 Sep 2020 07:47:30 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 24 Sep 2020 20:17:18 +0530
Message-ID: <CA+G9fYuSWaSbjXXFPGRR8w+w21ubpdfYbbtxH+GVQY7k4aBn8Q@mail.gmail.com>
Subject: mips: allmodconfig build failed on linux next
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org, lkft-triage@lists.linaro.org
Cc:     tsbogend@alpha.franken.de, rppt@kernel.org,
        Paul Burton <paulburton@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

mips allmodconfig build failed on linux next due to below errors.
Since we recently started building allmodconfig, we do not have information
on when this problem started.

We are building with gcc-8, gcc-9 and gcc-10.

metadata:
--------------
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    target_arch: mips
    toolchain: gcc-10
    git_short_log: dcf2427baa64 (\Add linux-next specific files for 2020092=
3\)
    git_describe: next-20200923
    kernel_version: 5.9.0-rc6

build log:
-------------
make -sk KBUILD_BUILD_USER=3DTuxBuild -C/linux ARCH=3Dmips
CROSS_COMPILE=3Dmips-linux-gnu- HOSTCC=3Dgcc CC=3D"sccache
mips-linux-gnu-gcc" O=3Dbuild allmodconfig

make -sk KBUILD_BUILD_USER=3DTuxBuild -C/linux -j16 ARCH=3Dmips
CROSS_COMPILE=3Dmips-linux-gnu- HOSTCC=3Dgcc CC=3D"sccache
mips-linux-gnu-gcc" O=3Dbuild
#
In file included from <command-line>:
../arch/mips/mm/init.c: In function =E2=80=98mem_init=E2=80=99:
./../include/linux/compiler_types.h:319:38: error: call to
=E2=80=98__compiletime_assert_321=E2=80=99 declared with attribute error: B=
UILD_BUG_ON
failed: IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT)
  319 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
./../include/linux/compiler_types.h:300:4: note: in definition of
macro =E2=80=98__compiletime_assert=E2=80=99
  300 |    prefix ## suffix();    \
      |    ^~~~~~
./../include/linux/compiler_types.h:319:2: note: in expansion of macro
=E2=80=98_compiletime_assert=E2=80=99
  319 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:39:37: note: in expansion of macro
=E2=80=98compiletime_assert=E2=80=99
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg=
)
      |                                     ^~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:50:2: note: in expansion of macro
=E2=80=98BUILD_BUG_ON_MSG=E2=80=99
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
../arch/mips/mm/init.c:458:2: note: in expansion of macro =E2=80=98BUILD_BU=
G_ON=E2=80=99
  458 |  BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT)=
);
      |  ^~~~~~~~~~~~
make[3]: *** [../scripts/Makefile.build:283: arch/mips/mm/init.o] Error 1
make[3]: Target '__build' not remade because of errors.
make[2]: *** [../scripts/Makefile.build:500: arch/mips/mm] Error 2
make[2]: Target '__build' not remade because of errors.
make[1]: *** [/linux/Makefile:1792: arch/mips] Error 2
../drivers/bus/mhi/core/debugfs.c: In function =E2=80=98mhi_debugfs_events_=
show=E2=80=99:
../drivers/bus/mhi/core/debugfs.c:74:51: warning: cast from pointer to
integer of different size [-Wpointer-to-int-cast]
   74 |   seq_printf(m, " local rp: 0x%llx db: 0x%llx\n", (u64)ring->rp,
      |                                                   ^
../drivers/bus/mhi/core/debugfs.c:74:45: warning: format =E2=80=98%llx=E2=
=80=99
expects argument of type =E2=80=98long long unsigned int=E2=80=99, but argu=
ment 4 has
type =E2=80=98dma_addr_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wf=
ormat=3D]
   74 |   seq_printf(m, " local rp: 0x%llx db: 0x%llx\n", (u64)ring->rp,
      |                                          ~~~^
      |                                             |
      |                                             long long unsigned int
      |                                          %x
   75 |       mhi_event->db_cfg.db_val);
      |       ~~~~~~~~~~~~~~~~~~~~~~~~
      |                        |
      |                        dma_addr_t {aka unsigned int}
../drivers/bus/mhi/core/debugfs.c: In function =E2=80=98mhi_debugfs_channel=
s_show=E2=80=99:
../drivers/bus/mhi/core/debugfs.c:122:7: warning: cast from pointer to
integer of different size [-Wpointer-to-int-cast]
  122 |       (u64)ring->rp, (u64)ring->wp,
      |       ^
../drivers/bus/mhi/core/debugfs.c:122:22: warning: cast from pointer
to integer of different size [-Wpointer-to-int-cast]
  122 |       (u64)ring->rp, (u64)ring->wp,
      |                      ^
../drivers/bus/mhi/core/debugfs.c:121:62: warning: format =E2=80=98%llx=E2=
=80=99
expects argument of type =E2=80=98long long unsigned int=E2=80=99, but argu=
ment 5 has
type =E2=80=98dma_addr_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wf=
ormat=3D]
  121 |   seq_printf(m, " local rp: 0x%llx local wp: 0x%llx db: 0x%llx\n",
      |                                                           ~~~^
      |                                                              |
      |
long long unsigned int
      |                                                           %x
  122 |       (u64)ring->rp, (u64)ring->wp,
  123 |       mhi_chan->db_cfg.db_val);
      |       ~~~~~~~~~~~~~~~~~~~~~~~
      |                       |
      |                       dma_addr_t {aka unsigned int}
In file included from ../include/linux/printk.h:7,
                 from ../include/linux/kernel.h:16,
                 from ../include/asm-generic/bug.h:20,
                 from ../arch/mips/include/asm/bug.h:42,
                 from ../include/linux/bug.h:5,
                 from ../include/linux/thread_info.h:12,
                 from ../include/asm-generic/current.h:5,
                 from ./arch/mips/include/generated/asm/current.h:1,
                 from ../include/linux/sched.h:12,
                 from ../fs/btrfs/extent-tree.c:6:
../fs/btrfs/extent-tree.c: In function =E2=80=98__btrfs_free_extent=E2=80=
=99:
../include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lu=E2=80=99 =
expects
argument of type =E2=80=98long unsigned int=E2=80=99, but argument 8 has ty=
pe
=E2=80=98unsigned int=E2=80=99 [-Wformat=3D]
    5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
      |                  ^~~~~~
../include/linux/kern_levels.h:10:19: note: in expansion of macro =E2=80=98=
KERN_SOH=E2=80=99
   10 | #define KERN_CRIT KERN_SOH "2" /* critical conditions */
      |                   ^~~~~~~~
../fs/btrfs/ctree.h:3148:24: note: in expansion of macro =E2=80=98KERN_CRIT=
=E2=80=99
 3148 |  btrfs_printk(fs_info, KERN_CRIT fmt, ##args)
      |                        ^~~~~~~~~
../fs/btrfs/extent-tree.c:3187:4: note: in expansion of macro =E2=80=98btrf=
s_crit=E2=80=99
 3187 |    btrfs_crit(info,
      |    ^~~~~~~~~~
../drivers/input/joystick/analog.c:160:2: warning: #warning Precise
timer not defined for this architecture. [-Wcpp]
  160 | #warning Precise timer not defined for this architecture.
      |  ^~~~~~~
In file included from ../arch/mips/include/asm/sibyte/sb1250.h:28,
                 from ../drivers/watchdog/sb_wdog.c:58:
../arch/mips/include/asm/sibyte/bcm1480_scd.h:261: warning:
"M_SPC_CFG_CLEAR" redefined
  261 | #define M_SPC_CFG_CLEAR   M_BCM1480_SPC_CFG_CLEAR
      |
In file included from ../arch/mips/include/asm/sibyte/sb1250.h:27,
                 from ../drivers/watchdog/sb_wdog.c:58:
../arch/mips/include/asm/sibyte/sb1250_scd.h:392: note: this is the
location of the previous definition
  392 | #define M_SPC_CFG_CLEAR  _SB_MAKEMASK1(32)
      |
In file included from ../arch/mips/include/asm/sibyte/sb1250.h:28,
                 from ../drivers/watchdog/sb_wdog.c:58:
../arch/mips/include/asm/sibyte/bcm1480_scd.h:262: warning:
"M_SPC_CFG_ENABLE" redefined
  262 | #define M_SPC_CFG_ENABLE  M_BCM1480_SPC_CFG_ENABLE
      |
In file included from ../arch/mips/include/asm/sibyte/sb1250.h:27,
                 from ../drivers/watchdog/sb_wdog.c:58:
../arch/mips/include/asm/sibyte/sb1250_scd.h:393: note: this is the
location of the previous definition
  393 | #define M_SPC_CFG_ENABLE _SB_MAKEMASK1(33)
      |
In file included from ../drivers/net/ethernet/intel/ice/ice_flow.c:5:
../drivers/net/ethernet/intel/ice/ice_flow.c: In function =E2=80=98ice_flow=
_add_entry=E2=80=99:
../drivers/net/ethernet/intel/ice/ice_flow.h:197:33: warning: cast
from pointer to integer of different size [-Wpointer-to-int-cast]
  197 | #define ICE_FLOW_ENTRY_HNDL(e) ((u64)e)
      |                                 ^
../drivers/net/ethernet/intel/ice/ice_flow.c:946:13: note: in
expansion of macro =E2=80=98ICE_FLOW_ENTRY_HNDL=E2=80=99
  946 |  *entry_h =3D ICE_FLOW_ENTRY_HNDL(e);
      |             ^~~~~~~~~~~~~~~~~~~
../drivers/net/ethernet/intel/ice/ice_flow.c: In function =E2=80=98ice_flow=
_rem_entry=E2=80=99:
../drivers/net/ethernet/intel/ice/ice_flow.h:198:32: warning: cast to
pointer from integer of different size [-Wint-to-pointer-cast]
  198 | #define ICE_FLOW_ENTRY_PTR(h) ((struct ice_flow_entry *)(h))
      |                                ^
../drivers/net/ethernet/intel/ice/ice_flow.c:974:10: note: in
expansion of macro =E2=80=98ICE_FLOW_ENTRY_PTR=E2=80=99
  974 |  entry =3D ICE_FLOW_ENTRY_PTR(entry_h);
      |          ^~~~~~~~~~~~~~~~~~
In file included from ../drivers/net/ethernet/intel/ice/ice_flex_pipe.c:6:
../drivers/net/ethernet/intel/ice/ice_flex_pipe.c: In function
=E2=80=98ice_free_flow_profs=E2=80=99:
../drivers/net/ethernet/intel/ice/ice_flow.h:197:33: warning: cast
from pointer to integer of different size [-Wpointer-to-int-cast]
  197 | #define ICE_FLOW_ENTRY_HNDL(e) ((u64)e)
      |                                 ^
../drivers/net/ethernet/intel/ice/ice_flex_pipe.c:2921:9: note: in
expansion of macro =E2=80=98ICE_FLOW_ENTRY_HNDL=E2=80=99
 2921 |         ICE_FLOW_ENTRY_HNDL(e));
      |         ^~~~~~~~~~~~~~~~~~~
In file included from ../arch/mips/include/asm/page.h:258,
                 from ../arch/mips/include/asm/io.h:29,
                 from ../include/linux/io.h:13,
                 from ../arch/mips/include/asm/mips-cps.h:10,
                 from ../arch/mips/include/asm/smp-ops.h:16,
                 from ../arch/mips/include/asm/smp.h:21,
                 from ../include/linux/smp.h:85,
                 from ../include/linux/percpu.h:7,
                 from ../include/linux/prandom.h:12,
                 from ../include/linux/random.h:118,
                 from ../include/linux/net.h:18,
                 from ../drivers/infiniband/sw/siw/siw_qp_tx.c:8:
../drivers/infiniband/sw/siw/siw_qp_tx.c: In function =E2=80=98siw_tx_hdt=
=E2=80=99:
../arch/mips/include/asm/page.h:249:53: warning: cast to pointer from
integer of different size [-Wint-to-pointer-cast]
  249 | #define virt_to_pfn(kaddr)    PFN_DOWN(virt_to_phys((void *)(kaddr)=
))
      |                                                     ^
../include/asm-generic/memory_model.h:33:41: note: in definition of
macro =E2=80=98__pfn_to_page=E2=80=99
   33 | #define __pfn_to_page(pfn) (mem_map + ((pfn) - ARCH_PFN_OFFSET))
      |                                         ^~~
../arch/mips/include/asm/page.h:249:31: note: in expansion of macro =E2=80=
=98PFN_DOWN=E2=80=99
  249 | #define virt_to_pfn(kaddr)    PFN_DOWN(virt_to_phys((void *)(kaddr)=
))
      |                               ^~~~~~~~
../arch/mips/include/asm/page.h:250:41: note: in expansion of macro
=E2=80=98virt_to_pfn=E2=80=99
  250 | #define virt_to_page(kaddr) pfn_to_page(virt_to_pfn(kaddr))
      |                                         ^~~~~~~~~~~
../drivers/infiniband/sw/siw/siw_qp_tx.c:528:23: note: in expansion of
macro =E2=80=98virt_to_page=E2=80=99
  528 |     page_array[seg] =3D virt_to_page(va & PAGE_MASK);
      |                       ^~~~~~~~~~~~
make[1]: Target '__all' not remade because of errors.
make: *** [Makefile:185: __sub-make] Error 2
make: Target '__all' not remade because of errors.

--=20
Linaro LKFT
https://lkft.linaro.org
