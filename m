Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2091A0D86
	for <lists+linux-mips@lfdr.de>; Tue,  7 Apr 2020 14:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728304AbgDGMZp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Apr 2020 08:25:45 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17543 "EHLO
        sender2-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728146AbgDGMZp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Apr 2020 08:25:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586262323;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=Qcosx3zOods1ZrT/9F495oLQo2i1f+60srMg2RUuf7A=;
        b=ags5tFZ/0zZxTM73JceTG1Mmm3zVwPq29RPqq/7RBJz9wypY+9hjo1RIF1lnKAqZ
        coO3/cN3zC0K/wsMDwcKtP103XkOoTY9eAst8VpFAA7EG2Tx493vbYrS5SboxAECf2Z
        gVKizgoJxE7jo4OTgUFxct5tZP1yTpg30KRsA8K0=
Received: from flygoat-x1e (60.177.191.213 [60.177.191.213]) by mx.zoho.com.cn
        with SMTPS id 15862623217966.568477178934359; Tue, 7 Apr 2020 20:25:21 +0800 (CST)
Date:   Tue, 7 Apr 2020 20:25:19 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: BUG: mips: errors when compiling kernel with a large initramfs
Message-ID: <20200407202519.4d384f3b@flygoat-x1e>
In-Reply-To: <0c1e4eda-53c6-ea8b-c27b-eabc8569cc74@windriver.com>
References: <0c1e4eda-53c6-ea8b-c27b-eabc8569cc74@windriver.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 7 Apr 2020 17:58:23 +0800
"Xu, Yanfei" <yanfei.xu@windriver.com> wrote:

> Hi,
>=20
>=20
> It fails to compile mips kernel with large initramfs (at link time).
>=20
> kernel version: 5.6.0
>=20
>=20
> Steps to reproduce:
>=20
> 1. git clone mainline kernel
>=20
> 2. set ARCH=3Dmips and CROSS_COMPILE=3Dmips-linux-gnu-
>=20
> 3. make defconfig
>=20
> 4.enable initramfs support and set the path about initramfs source
> file
>=20
> 5.make -j24
>=20
> [KEY] when your initramfs files is too large, and cause=20
> usr/initramfs_data.cpio.gz
>=20
> compiled is larger than 225M, you will get the following error. BTW,
> x86 doesn't
>=20
> have this issue that I have tested.
>=20
> ------------------------------error=20
> messages-----------------------------------------
>=20
>  =C2=A0 CHK=C2=A0=C2=A0=C2=A0=C2=A0 include/generated/compile.h
>  =C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmlinux.o
>  =C2=A0 MODPOST vmlinux.o
>  =C2=A0 MODINFO modules.builtin.modinfo
>  =C2=A0 GEN=C2=A0=C2=A0=C2=A0=C2=A0 modules.builtin
>  =C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kallsyms1
> kernel/configs.o: In function `ikconfig_cleanup':
> /home/wrsadmin/work/linux/kernel/linux-master/kernel/configs.c:72:(.exit.=
text+0x8):=20
> relocation truncated to fit: R_MIPS_26 against `remove_proc_entry'
> fs/binfmt_script.o: In function `exit_script_binfmt':
> /home/wrsadmin/work/linux/kernel/linux-master/fs/binfmt_script.c:165:(.ex=
it.text+0x4):=20
> relocation truncated to fit: R_MIPS_26 against `unregister_binfmt'
> fs/binfmt_elf.o: In function `exit_elf_binfmt':
> /home/wrsadmin/work/linux/kernel/linux-master/fs/binfmt_elf.c:2393:(.exit=
.text+0x4):=20
> relocation truncated to fit: R_MIPS_26 against `unregister_binfmt'
> fs/mbcache.o: In function `mbcache_exit':
> /home/wrsadmin/work/linux/kernel/linux-master/fs/mbcache.c:429:(.exit.tex=
t+0x4):=20
> relocation truncated to fit: R_MIPS_26 against `kmem_cache_destroy'
> fs/nfs_common/grace.o: In function `exit_grace':
> /home/wrsadmin/work/linux/kernel/linux-master/fs/nfs_common/grace.c:133:(=
.exit.text+0x4):=20
> relocation truncated to fit: R_MIPS_26 against
> `unregister_pernet_subsys' fs/ext4/super.o: In function
> `ext4_destroy_lazyinit_thread':
> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:3456:(.exit=
.text+0x24):
> relocation truncated to fit: R_MIPS_26 against `kthread_stop'
> fs/ext4/super.o: In function `unregister_as_ext2':
> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:6126:(.exit=
.text+0x30):
> relocation truncated to fit: R_MIPS_26 against
> `unregister_filesystem' fs/ext4/super.o: In function
> `unregister_as_ext3':
> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:6155:(.exit=
.text+0x3c):
> relocation truncated to fit: R_MIPS_26 against
> `unregister_filesystem' fs/ext4/super.o: In function `ext4_exit_fs':
> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:6261:(.exit=
.text+0x48):
> relocation truncated to fit: R_MIPS_26 against
> `unregister_filesystem' fs/ext4/super.o: In function
> `destroy_inodecache':
> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:1218:(.exit=
.text+0x50):
> relocation truncated to fit: R_MIPS_26 against `rcu_barrier'
> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:1219:(.exit=
.text+0x5c):
> additional relocation overflows omitted from the output
> Makefile:1086: recipe for target 'vmlinux' failed make[1]: ***
> [vmlinux] Error 1 Makefile:1058: recipe for target
> 'autoksyms_recursive' failed make: *** [autoksyms_recursive] Error 2
>=20
>=20
> Any comment will be appreciated.

Actually I think that won't work even if you managed to workaround
reloc issue.

MIPS have limited LOW MEM range accessible via KSEG0 (512M, but can be
less if your system place some MMIO register in that range). Kernel
image will be placed here together with built-in initramfs, and a
lot of memory like Page Table can only be allocated from here.

Such a huge initrd will occupy the whole LOW MEM range leaving no space
for others.

It seems like your system is 32bit, we have no solution for that
hardware limitaion. For 64bit system you may try to move your kernel
into XKPHYS instead of KSEG0.

Thanks

--
Jiaxun Yang

>=20
> Thanks,
>=20
> Yanfei
>=20

