Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5B1BD0FD
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2019 19:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437490AbfIXRws (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Sep 2019 13:52:48 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40485 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbfIXRws (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Sep 2019 13:52:48 -0400
Received: by mail-io1-f68.google.com with SMTP id h144so6589883iof.7;
        Tue, 24 Sep 2019 10:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i7nOdUPQO8n52YcV67l4CYsUQMUzMn8oGMVoe1snO9A=;
        b=KDsJx0z1LDZXVlzQqXRrdwBlzM09gGR/sb1O1xx0IBuRbKHHe5jHQgVafZu5mO7o/a
         EMP5O+b5/zIGrE6jOB9HABkMWPsIzH2eY5i/TSXPnwFQVkaUmUlTCKG41j3IxWXoQqaI
         21ipDPaF2Gn8VudpwuI7M4ocIcbMZ4ylo/zwg99zZbEo2ciDuq1oRfl539G8TNPoUmIv
         6A3m5wKxFgOl9M6ihgmG8xwGKJnInS8A0/2CIuv3DGfrbhKa7BJ9lMnwYkHTc508Jt8Z
         Gtbm0d/l5TPJkjEUOJReowOLVxpJTkSQyk3HMAW1PrmkFMKZr2+SFOHIVq//d7WpT5a1
         wygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i7nOdUPQO8n52YcV67l4CYsUQMUzMn8oGMVoe1snO9A=;
        b=Bd7sPCLcJaQFVvGHZw5b5/0JbrJ6NRFIL1nckIDDb30ypLsr3YvXx8/iLkgQNFn9uZ
         T2JzVTXyAQB4P3G8ykXd6qQIe630LJqdTQtWPMWOWuT/KAScKjLmpOq1jf53WbTxiNci
         f7TDbm2Oq/8rQ3x7hLlgTu4/CGO2t9CCKJ5djHefdzmBS4CFSn/hAGsbyecL4asMPXme
         9KbrJI8KxgHicyRkpyuUeoquwol8KmhbH+uMr/vM648/Pu1JQ1gpJIuzgI8Ko8fwgq4d
         6JeQzvWI85CQSsPomkQTiRjY+2k1BHlRoU6DqY1//LenfYdiUcKZFQODJaOgZ1ikXn23
         vCDw==
X-Gm-Message-State: APjAAAWyp8tH8mFs96Sl105zeerLJTnBbvA8rO9FFv0XH0Ci0mUZhKAj
        zn7X2fiYcZqmDQvLk+ak6r3sJUjiToNuMlGEe7A=
X-Google-Smtp-Source: APXvYqzavLuw+fYyO/Ee/mlQ+iY4CvacUIYc3xWeyHRCeNGC5+bZUljuFpVga925HYErcNTBU0srAK1dAYx0mT418mM=
X-Received: by 2002:a6b:cd81:: with SMTP id d123mr4933848iog.78.1569347566383;
 Tue, 24 Sep 2019 10:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
In-Reply-To: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 24 Sep 2019 12:52:35 -0500
Message-ID: <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Refine memblock API
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     linux-mm@kvack.org, Rich Felker <dalias@libc.org>,
        linux-ia64@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org,
        linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
        Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
        linux-c6x-dev@linux-c6x.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Richard Weinberger <richard@nod.at>, linux-sh@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        kasan-dev@googlegroups.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mark Salter <msalter@redhat.com>,
        Dennis Zhou <dennis@kernel.org>,
        Matt Turner <mattst88@gmail.com>,
        linux-snps-arc@lists.infradead.org,
        uclinux-h8-devel@lists.sourceforge.jp,
        Petr Mladek <pmladek@suse.com>, linux-xtensa@linux-xtensa.org,
        linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, Rob Herring <robh+dt@kernel.org>,
        Greentime Hu <green.hu@gmail.com>,
        xen-devel@lists.xenproject.org, Stafford Horne <shorne@gmail.com>,
        Guan Xuetao <gxt@pku.edu.cn>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Michal Simek <monstr@monstr.eu>,
        Tony Luck <tony.luck@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        linuxppc-dev@lists.ozlabs.org,
        "David S. Miller" <davem@davemloft.net>,
        openrisc@lists.librecores.org, etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 21, 2019 at 2:05 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> Hi,
>
> Current memblock API is quite extensive and, which is more annoying,
> duplicated. Except the low-level functions that allow searching for a free
> memory region and marking it as reserved, memblock provides three (well,
> two and a half) sets of functions to allocate memory. There are several
> overlapping functions that return a physical address and there are
> functions that return virtual address. Those that return the virtual
> address may also clear the allocated memory. And, on top of all that, some
> allocators panic and some return NULL in case of error.
>
> This set tries to reduce the mess, and trim down the amount of memblock
> allocation methods.
>
> Patches 1-10 consolidate the functions that return physical address of
> the allocated memory
>
> Patches 11-13 are some trivial cleanups
>
> Patches 14-19 add checks for the return value of memblock_alloc*() and
> panics in case of errors. The patches 14-18 include some minor refactoring
> to have better readability of the resulting code and patch 19 is a
> mechanical addition of
>
>         if (!ptr)
>                 panic();
>
> after memblock_alloc*() calls.
>
> And, finally, patches 20 and 21 remove panic() calls memblock and _nopanic
> variants from memblock.
>
> v2 changes:
> * replace some more %lu with %zu
> * remove panics where they are not needed in s390 and in printk
> * collect Acked-by and Reviewed-by.
>
>
> Christophe Leroy (1):
>   powerpc: use memblock functions returning virtual address
>
> Mike Rapoport (20):
>   openrisc: prefer memblock APIs returning virtual address
>   memblock: replace memblock_alloc_base(ANYWHERE) with memblock_phys_alloc
>   memblock: drop memblock_alloc_base_nid()
>   memblock: emphasize that memblock_alloc_range() returns a physical address
>   memblock: memblock_phys_alloc_try_nid(): don't panic
>   memblock: memblock_phys_alloc(): don't panic
>   memblock: drop __memblock_alloc_base()
>   memblock: drop memblock_alloc_base()
>   memblock: refactor internal allocation functions
>   memblock: make memblock_find_in_range_node() and choose_memblock_flags() static
>   arch: use memblock_alloc() instead of memblock_alloc_from(size, align, 0)
>   arch: don't memset(0) memory returned by memblock_alloc()
>   ia64: add checks for the return value of memblock_alloc*()
>   sparc: add checks for the return value of memblock_alloc*()
>   mm/percpu: add checks for the return value of memblock_alloc*()
>   init/main: add checks for the return value of memblock_alloc*()
>   swiotlb: add checks for the return value of memblock_alloc*()
>   treewide: add checks for the return value of memblock_alloc*()
>   memblock: memblock_alloc_try_nid: don't panic
>   memblock: drop memblock_alloc_*_nopanic() variants
>
I know it's rather late, but this patch broke the Etnaviv 3D graphics
in my i.MX6Q.

When I try to use the 3D, it returns some errors and the dmesg log
shows some memory allocation errors too:
[    3.682347] etnaviv etnaviv: bound 130000.gpu (ops gpu_ops)
[    3.688669] etnaviv etnaviv: bound 134000.gpu (ops gpu_ops)
[    3.695099] etnaviv etnaviv: bound 2204000.gpu (ops gpu_ops)
[    3.700800] etnaviv-gpu 130000.gpu: model: GC2000, revision: 5108
[    3.723013] etnaviv-gpu 130000.gpu: command buffer outside valid
memory window
[    3.731308] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
[    3.752437] etnaviv-gpu 134000.gpu: command buffer outside valid
memory window
[    3.760583] etnaviv-gpu 2204000.gpu: model: GC355, revision: 1215
[    3.766766] etnaviv-gpu 2204000.gpu: Ignoring GPU with VG and FE2.0
[    3.776131] [drm] Initialized etnaviv 1.2.0 20151214 for etnaviv on minor 0

# glmark2-es2-drm
Error creating gpu
Error: eglCreateWindowSurface failed with error: 0x3009
Error: eglCreateWindowSurface failed with error: 0x3009
Error: CanvasGeneric: Invalid EGL state
Error: main: Could not initialize canvas


Before this patch:

[    3.691995] etnaviv etnaviv: bound 130000.gpu (ops gpu_ops)
[    3.698356] etnaviv etnaviv: bound 134000.gpu (ops gpu_ops)
[    3.704792] etnaviv etnaviv: bound 2204000.gpu (ops gpu_ops)
[    3.710488] etnaviv-gpu 130000.gpu: model: GC2000, revision: 5108
[    3.733649] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
[    3.756115] etnaviv-gpu 2204000.gpu: model: GC355, revision: 1215
[    3.762250] etnaviv-gpu 2204000.gpu: Ignoring GPU with VG and FE2.0
[    3.771432] [drm] Initialized etnaviv 1.2.0 20151214 for etnaviv on minor 0

and the 3D gemos work without this.

I don't know enough about the i.MX6 nor the 3D accelerator to know how
to fix it.
I am hoping someone in the know might have some suggestions.

>  arch/alpha/kernel/core_cia.c              |   5 +-
>  arch/alpha/kernel/core_marvel.c           |   6 +
>  arch/alpha/kernel/pci-noop.c              |  13 +-
>  arch/alpha/kernel/pci.c                   |  11 +-
>  arch/alpha/kernel/pci_iommu.c             |  16 +-
>  arch/alpha/kernel/setup.c                 |   2 +-
>  arch/arc/kernel/unwind.c                  |   3 +-
>  arch/arc/mm/highmem.c                     |   4 +
>  arch/arm/kernel/setup.c                   |   6 +
>  arch/arm/mm/init.c                        |   6 +-
>  arch/arm/mm/mmu.c                         |  14 +-
>  arch/arm64/kernel/setup.c                 |   8 +-
>  arch/arm64/mm/kasan_init.c                |  10 ++
>  arch/arm64/mm/mmu.c                       |   2 +
>  arch/arm64/mm/numa.c                      |   4 +
>  arch/c6x/mm/dma-coherent.c                |   4 +
>  arch/c6x/mm/init.c                        |   4 +-
>  arch/csky/mm/highmem.c                    |   5 +
>  arch/h8300/mm/init.c                      |   4 +-
>  arch/ia64/kernel/mca.c                    |  25 +--
>  arch/ia64/mm/contig.c                     |   8 +-
>  arch/ia64/mm/discontig.c                  |   4 +
>  arch/ia64/mm/init.c                       |  38 ++++-
>  arch/ia64/mm/tlb.c                        |   6 +
>  arch/ia64/sn/kernel/io_common.c           |   3 +
>  arch/ia64/sn/kernel/setup.c               |  12 +-
>  arch/m68k/atari/stram.c                   |   4 +
>  arch/m68k/mm/init.c                       |   3 +
>  arch/m68k/mm/mcfmmu.c                     |   7 +-
>  arch/m68k/mm/motorola.c                   |   9 ++
>  arch/m68k/mm/sun3mmu.c                    |   6 +
>  arch/m68k/sun3/sun3dvma.c                 |   3 +
>  arch/microblaze/mm/init.c                 |  10 +-
>  arch/mips/cavium-octeon/dma-octeon.c      |   3 +
>  arch/mips/kernel/setup.c                  |   3 +
>  arch/mips/kernel/traps.c                  |   5 +-
>  arch/mips/mm/init.c                       |   5 +
>  arch/nds32/mm/init.c                      |  12 ++
>  arch/openrisc/mm/init.c                   |   5 +-
>  arch/openrisc/mm/ioremap.c                |   8 +-
>  arch/powerpc/kernel/dt_cpu_ftrs.c         |   8 +-
>  arch/powerpc/kernel/irq.c                 |   5 -
>  arch/powerpc/kernel/paca.c                |   6 +-
>  arch/powerpc/kernel/pci_32.c              |   3 +
>  arch/powerpc/kernel/prom.c                |   5 +-
>  arch/powerpc/kernel/rtas.c                |   6 +-
>  arch/powerpc/kernel/setup-common.c        |   3 +
>  arch/powerpc/kernel/setup_32.c            |  26 ++--
>  arch/powerpc/kernel/setup_64.c            |   4 +
>  arch/powerpc/lib/alloc.c                  |   3 +
>  arch/powerpc/mm/hash_utils_64.c           |  11 +-
>  arch/powerpc/mm/mmu_context_nohash.c      |   9 ++
>  arch/powerpc/mm/numa.c                    |   4 +
>  arch/powerpc/mm/pgtable-book3e.c          |  12 +-
>  arch/powerpc/mm/pgtable-book3s64.c        |   3 +
>  arch/powerpc/mm/pgtable-radix.c           |   9 +-
>  arch/powerpc/mm/ppc_mmu_32.c              |   3 +
>  arch/powerpc/platforms/pasemi/iommu.c     |   3 +
>  arch/powerpc/platforms/powermac/nvram.c   |   3 +
>  arch/powerpc/platforms/powernv/opal.c     |   3 +
>  arch/powerpc/platforms/powernv/pci-ioda.c |   8 +
>  arch/powerpc/platforms/ps3/setup.c        |   3 +
>  arch/powerpc/sysdev/dart_iommu.c          |   3 +
>  arch/powerpc/sysdev/msi_bitmap.c          |   3 +
>  arch/s390/kernel/crash_dump.c             |   3 +
>  arch/s390/kernel/setup.c                  |  16 ++
>  arch/s390/kernel/smp.c                    |   9 +-
>  arch/s390/kernel/topology.c               |   6 +
>  arch/s390/numa/mode_emu.c                 |   3 +
>  arch/s390/numa/numa.c                     |   6 +-
>  arch/sh/boards/mach-ap325rxa/setup.c      |   5 +-
>  arch/sh/boards/mach-ecovec24/setup.c      |  10 +-
>  arch/sh/boards/mach-kfr2r09/setup.c       |   5 +-
>  arch/sh/boards/mach-migor/setup.c         |   5 +-
>  arch/sh/boards/mach-se/7724/setup.c       |  10 +-
>  arch/sh/kernel/machine_kexec.c            |   3 +-
>  arch/sh/mm/init.c                         |   8 +-
>  arch/sh/mm/numa.c                         |   4 +
>  arch/sparc/kernel/prom_32.c               |   6 +-
>  arch/sparc/kernel/setup_64.c              |   6 +
>  arch/sparc/kernel/smp_64.c                |  12 ++
>  arch/sparc/mm/init_32.c                   |   2 +-
>  arch/sparc/mm/init_64.c                   |  11 ++
>  arch/sparc/mm/srmmu.c                     |  18 ++-
>  arch/um/drivers/net_kern.c                |   3 +
>  arch/um/drivers/vector_kern.c             |   3 +
>  arch/um/kernel/initrd.c                   |   2 +
>  arch/um/kernel/mem.c                      |  16 ++
>  arch/unicore32/kernel/setup.c             |   4 +
>  arch/unicore32/mm/mmu.c                   |  15 +-
>  arch/x86/kernel/acpi/boot.c               |   3 +
>  arch/x86/kernel/apic/io_apic.c            |   5 +
>  arch/x86/kernel/e820.c                    |   5 +-
>  arch/x86/kernel/setup_percpu.c            |  10 +-
>  arch/x86/mm/kasan_init_64.c               |  14 +-
>  arch/x86/mm/numa.c                        |  12 +-
>  arch/x86/platform/olpc/olpc_dt.c          |   3 +
>  arch/x86/xen/p2m.c                        |  11 +-
>  arch/xtensa/mm/kasan_init.c               |  10 +-
>  arch/xtensa/mm/mmu.c                      |   3 +
>  drivers/clk/ti/clk.c                      |   3 +
>  drivers/firmware/memmap.c                 |   2 +-
>  drivers/macintosh/smu.c                   |   5 +-
>  drivers/of/fdt.c                          |   8 +-
>  drivers/of/of_reserved_mem.c              |   7 +-
>  drivers/of/unittest.c                     |   8 +-
>  drivers/usb/early/xhci-dbc.c              |   2 +-
>  drivers/xen/swiotlb-xen.c                 |   7 +-
>  include/linux/memblock.h                  |  59 +------
>  init/main.c                               |  26 +++-
>  kernel/dma/swiotlb.c                      |  21 ++-
>  kernel/power/snapshot.c                   |   3 +
>  kernel/printk/printk.c                    |   9 +-
>  lib/cpumask.c                             |   3 +
>  mm/cma.c                                  |  10 +-
>  mm/kasan/init.c                           |  10 +-
>  mm/memblock.c                             | 249 ++++++++++--------------------
>  mm/page_alloc.c                           |  10 +-
>  mm/page_ext.c                             |   2 +-
>  mm/percpu.c                               |  84 +++++++---
>  mm/sparse.c                               |  25 ++-
>  121 files changed, 860 insertions(+), 412 deletions(-)
>
> --
> 2.7.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
