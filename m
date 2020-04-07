Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41BA91A0AF6
	for <lists+linux-mips@lfdr.de>; Tue,  7 Apr 2020 12:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbgDGKVR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Apr 2020 06:21:17 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:35418 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbgDGKVR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Apr 2020 06:21:17 -0400
Received: by mail-qk1-f195.google.com with SMTP id k134so1057249qke.2;
        Tue, 07 Apr 2020 03:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Pw5SHn7uGKt6KQlHl89DgRiO5EZqq1p5H6I7kFAPUx8=;
        b=jWbbQH5ubkBW7eMYItRPBlnP69/yYnXeeGoyfrsIoK2gwOD0FktKAZI9sh894dkcmB
         hPwbBfxCc56mKU0gS+tpFS+vox+PWiNSPZfIscoPHeGYDCCSZSxShkEa264f19is8dUc
         t63u7SNae+AeFT5wvI5xZrAOY9jLRVeitiflSAcGR70oGzXLWPyNA2daeZAjW5tQkH1A
         9S/SLfsVvSXnyqwBiIat13mjmTyKQUt+f0fzI2cEW3xTIqTfkISQrGiH7uoDOB9NzehS
         vRWvZDkDahCMczDfA860u2hpitD9sYgIjPn41HDM378bMPQ3XXPZESTpaEo/rMwZEKT1
         HMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Pw5SHn7uGKt6KQlHl89DgRiO5EZqq1p5H6I7kFAPUx8=;
        b=L6lrB9HJArv2MtRXeY3U3IeGpdxsHKEiE/o8/bNWur+TcqlVYGqyDlb7UB/O+qDbP2
         Mw9YpLz/N2df6nju3fFGNuxnnKXXSLykqStMfLJJsW5DiXLdtXiDjGHnTBVHOE63Buun
         1UkjHIXvFNBtzuXSbbYQvpW2cxVUP/o/7ZGp4pww34Uvg41e58YoP9NLGlmXOiOvOolH
         YuRT/5S9McAmU7KdijLh2wXrI9g0wESgED2RsULz2VIvqa9cX8ZgYzixOniTS2PVLu4C
         161KbEjg4pWRiJn0cH9lWvp4VKInxNv+kAYVqi2cadGGXKfY90k+qeZ3hg1ij/+Owibg
         MnFA==
X-Gm-Message-State: AGi0PuYZNaCLkVUOgU2q6HYgXTWle19crlxmpu+y6E46KLLYr7KrFGjb
        ycZZDI1K1rvusMh+vYquubcXoQNuktQLorR02Xs=
X-Google-Smtp-Source: APiQypIWSH1LxPjZiZp12MRVreOTEBqimQBIcr88HPo4LHS3+QGped1M7OzSdwKvpUcU3BVGXuvSeHZPRwkVT5xiKgk=
X-Received: by 2002:a37:684a:: with SMTP id d71mr1235942qkc.469.1586254874418;
 Tue, 07 Apr 2020 03:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <0c1e4eda-53c6-ea8b-c27b-eabc8569cc74@windriver.com>
In-Reply-To: <0c1e4eda-53c6-ea8b-c27b-eabc8569cc74@windriver.com>
From:   YunQiang Su <wzssyqa@gmail.com>
Date:   Tue, 7 Apr 2020 18:21:03 +0800
Message-ID: <CAKcpw6XtUDLOPfdCxJzdSfsEeJyuoNZ9Wo0ydmTGfckLkuKbiA@mail.gmail.com>
Subject: Re: BUG: mips: errors when compiling kernel with a large initramfs
To:     "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Xu, Yanfei <yanfei.xu@windriver.com> =E4=BA=8E2020=E5=B9=B44=E6=9C=887=E6=
=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=885:58=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
>
> It fails to compile mips kernel with large initramfs (at link time).
>
> kernel version: 5.6.0
>
>
> Steps to reproduce:
>
> 1. git clone mainline kernel
>
> 2. set ARCH=3Dmips and CROSS_COMPILE=3Dmips-linux-gnu-
>
> 3. make defconfig
>
> 4.enable initramfs support and set the path about initramfs source file
>
> 5.make -j24
>
> [KEY] when your initramfs files is too large, and cause
> usr/initramfs_data.cpio.gz
>
> compiled is larger than 225M, you will get the following error. BTW, x86
> doesn't

It is due to the JAL insn can only support <256MiB jump

>
> have this issue that I have tested.
>
> ------------------------------error
> messages-----------------------------------------
>
>    CHK     include/generated/compile.h
>    LD      vmlinux.o
>    MODPOST vmlinux.o
>    MODINFO modules.builtin.modinfo
>    GEN     modules.builtin
>    LD      .tmp_vmlinux.kallsyms1
> kernel/configs.o: In function `ikconfig_cleanup':
> /home/wrsadmin/work/linux/kernel/linux-master/kernel/configs.c:72:(.exit.=
text+0x8):
> relocation truncated to fit: R_MIPS_26 against `remove_proc_entry'
> fs/binfmt_script.o: In function `exit_script_binfmt':
> /home/wrsadmin/work/linux/kernel/linux-master/fs/binfmt_script.c:165:(.ex=
it.text+0x4):
> relocation truncated to fit: R_MIPS_26 against `unregister_binfmt'
> fs/binfmt_elf.o: In function `exit_elf_binfmt':
> /home/wrsadmin/work/linux/kernel/linux-master/fs/binfmt_elf.c:2393:(.exit=
.text+0x4):
> relocation truncated to fit: R_MIPS_26 against `unregister_binfmt'
> fs/mbcache.o: In function `mbcache_exit':
> /home/wrsadmin/work/linux/kernel/linux-master/fs/mbcache.c:429:(.exit.tex=
t+0x4):
> relocation truncated to fit: R_MIPS_26 against `kmem_cache_destroy'
> fs/nfs_common/grace.o: In function `exit_grace':
> /home/wrsadmin/work/linux/kernel/linux-master/fs/nfs_common/grace.c:133:(=
.exit.text+0x4):
> relocation truncated to fit: R_MIPS_26 against `unregister_pernet_subsys'
> fs/ext4/super.o: In function `ext4_destroy_lazyinit_thread':
> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:3456:(.exit=
.text+0x24):
> relocation truncated to fit: R_MIPS_26 against `kthread_stop'
> fs/ext4/super.o: In function `unregister_as_ext2':
> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:6126:(.exit=
.text+0x30):
> relocation truncated to fit: R_MIPS_26 against `unregister_filesystem'
> fs/ext4/super.o: In function `unregister_as_ext3':
> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:6155:(.exit=
.text+0x3c):
> relocation truncated to fit: R_MIPS_26 against `unregister_filesystem'
> fs/ext4/super.o: In function `ext4_exit_fs':
> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:6261:(.exit=
.text+0x48):
> relocation truncated to fit: R_MIPS_26 against `unregister_filesystem'
> fs/ext4/super.o: In function `destroy_inodecache':
> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:1218:(.exit=
.text+0x50):
> relocation truncated to fit: R_MIPS_26 against `rcu_barrier'
> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:1219:(.exit=
.text+0x5c):
> additional relocation overflows omitted from the output
> Makefile:1086: recipe for target 'vmlinux' failed
> make[1]: *** [vmlinux] Error 1
> Makefile:1058: recipe for target 'autoksyms_recursive' failed
> make: *** [autoksyms_recursive] Error 2
>
>
> Any comment will be appreciated.

Maybe, you can have a try add  `-mlong-calls' to your CFLAGS.
I am not sure that it can work.
   https://gcc.gnu.org/onlinedocs/gcc/MIPS-Options.html

>
> Thanks,
>
> Yanfei
>


--=20
YunQiang Su
