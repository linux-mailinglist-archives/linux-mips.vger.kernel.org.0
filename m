Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC33B75F5B9
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jul 2023 14:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbjGXMN7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jul 2023 08:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbjGXMN6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Jul 2023 08:13:58 -0400
Received: from frasgout13.his.huawei.com (unknown [14.137.139.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE42E6C;
        Mon, 24 Jul 2023 05:13:54 -0700 (PDT)
Received: from mail02.huawei.com (unknown [172.18.147.228])
        by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4R8f1667wKz9yh97;
        Mon, 24 Jul 2023 20:02:34 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.81.222.124])
        by APP2 (Coremail) with SMTP id GxC2BwA3_lTGar5ky0byBA--.27936S2;
        Mon, 24 Jul 2023 13:13:10 +0100 (CET)
From:   Petr Tesarik <petrtesarik@huaweicloud.com>
To:     Stefano Stabellini <sstabellini@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
        "H. Peter Anvin" <hpa@zytor.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Juergen Gross <jgross@suse.com>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        James Seo <james@equiv.tech>,
        James Clark <james.clark@arm.com>,
        Kees Cook <keescook@chromium.org>,
        xen-devel@lists.xenproject.org (moderated list:XEN HYPERVISOR ARM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT),
        linux-kernel@vger.kernel.org (open list),
        linux-mips@vger.kernel.org (open list:MIPS),
        iommu@lists.linux.dev (open list:XEN SWIOTLB SUBSYSTEM)
Cc:     Roberto Sassu <roberto.sassu@huaweicloud.com>, petr@tesarici.cz
Subject: [PATCH v5 0/9] Allow dynamic allocation of software IO TLB bounce buffers
Date:   Mon, 24 Jul 2023 14:12:36 +0200
Message-Id: <cover.1690200598.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GxC2BwA3_lTGar5ky0byBA--.27936S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Wr1Dtw1rJr47Aw4kKrykZrb_yoWfKr43pF
        WrK34ftF4qqryxA3s7Ca18GF1rKa1kGry5GrWFvryrur13Cr1j93WktayFqFWUGr40vF12
        qFyjvw13uw1DZ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9S14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
        0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
        8cxan2IY04v7MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
        IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
        MI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
        0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVW3
        JVWrJr1lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr
        1UYxBIdaVFxhVjvjDU0xZFpf9x0JU-yCJUUUUU=
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        MAY_BE_FORGED,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Petr Tesarik <petr.tesarik.ext@huawei.com>

Motivation
==========

The software IO TLB was designed with these assumptions:

1) It would not be used much. Small systems (little RAM) don't need it, and
   big systems (lots of RAM) would have modern DMA controllers and an IOMMU
   chip to handle legacy devices.
2) A small fixed memory area (64 MiB by default) is sufficient to
   handle the few cases which require a bounce buffer.
3) 64 MiB is little enough that it has no impact on the rest of the
   system.
4) Bounce buffers require large contiguous chunks of low memory. Such
   memory is precious and can be allocated only early at boot.

It turns out they are not always true:

1) Embedded systems may have more than 4GiB RAM but no IOMMU and legacy
   32-bit peripheral busses and/or DMA controllers.
2) CoCo VMs use bounce buffers for all I/O but may need substantially more
   than 64 MiB.
3) Embedded developers put as many features as possible into the available
   memory. A few dozen "missing" megabytes may limit what features can be
   implemented.
4) If CMA is available, it can allocate large continuous chunks even after
   the system has run for some time.

Goals
=====

The goal of this work is to start with a small software IO TLB at boot and
expand it later when/if needed.

Design
======

This version of the patch series retains the current slot allocation
algorithm with multiple areas to reduce lock contention, but additional
slots can be added when necessary.

These alternatives have been considered:

- Allocate and free buffers as needed using direct DMA API. This works
  quite well, except in CoCo VMs where each allocation/free requires
  decrypting/encrypting memory, which is a very expensive operation.

- Allocate a very large software IO TLB at boot, but allow to migrate pages
  to/from it (like CMA does). For systems with CMA, this would mean two big
  allocations at boot. Finding the balance between CMA, SWIOTLB and rest of
  available RAM can be challenging. More importantly, there is no clear
  benefit compared to allocating SWIOTLB memory pools from the CMA.

Implementation Constraints
==========================

These constraints have been taken into account:

1) Minimize impact on devices which do not benefit from the change.
2) Minimize the number of memory decryption/encryption operations.
3) Avoid contention on a lock or atomic variable to preserve parallel
   scalability.

Additionally, the software IO TLB code is also used to implement restricted
DMA pools. These pools are restricted to a pre-defined physical memory
region and must not use any other memory. In other words, dynamic
allocation of memory pools must be disabled for restricted DMA pools.

Data Structures
===============

The existing struct io_tlb_mem is the central type for a SWIOTLB allocator,
but it now contains multiple memory pools::

  io_tlb_mem
  +---------+   io_tlb_pool
  | SWIOTLB | 	+-------+   +-------+   +-------+
  |allocator|-->|default|-->|dynamic|-->|dynamic|-->...
  |    	    |  	|memory |   |memory |   |memory |
  +---------+ 	| pool  |   | pool  |   | pool  |
	      	+-------+   +-------+   +-------+

The allocator structure contains global state (such as flags and counters)
and structures needed to schedule new allocations. Each memory pool
contains the actual buffer slots and metadata. The first memory pool in the
list is the default memory pool allocated statically at early boot.

New memory pools are allocated from a kernel worker thread. That's because
bounce buffers are allocated when mapping a DMA buffer, which may happen in
interrupt context where large atomic allocations would probably fail.
Allocation from process context is much more likely to succeed, especially
if it can use CMA.

Nonetheless, the onset of a load spike may fill up the SWIOTLB before the
worker has a chance to run. In that case, try to allocate a small transient
memory pool to accommodate the request. If memory is encrypted and the
device cannot do DMA to encrypted memory, this buffer is allocated from the
coherent atomic DMA memory pool. Reducing the size of SWIOTLB may therefore
require increasing the size of the coherent pool with the "coherent_pool"
command-line parameter.

Performance
===========

All testing compared a vanilla v6.4-rc6 kernel with a fully patched
kernel. The kernel was booted with "swiotlb=force" to allow stress-testing
the software IO TLB on a high-performance device that would otherwise not
need it. CONFIG_DEBUG_FS was set to 'y' to match the configuration of
popular distribution kernels; it is understood that parallel workloads
suffer from contention on the recently added debugfs atomic counters.

These benchmarks were run:

- small: single-threaded I/O of 4 KiB blocks,
- big: single-threaded I/O of 64 KiB blocks,
- 4way: 4-way parallel I/O of 4 KiB blocks.

In all tested cases, the default 64 MiB SWIOTLB would be sufficient (but
wasteful). The "default" pair of columns shows performance impact when
booted with 64 MiB SWIOTLB (i.e. current state). The "growing" pair of
columns shows the impact when booted with a 1 MiB initial SWIOTLB, which
grew to 5 MiB at run time. The "var" column in the tables below is the
coefficient of variance over 5 runs of the test, the "diff" column is the
difference in read-write I/O bandwidth (MiB/s). The very first column is
the coefficient of variance in the results of the base unpatched kernel.

First, on an x86 VM against a QEMU virtio SATA driver backed by a RAM-based
block device on the host:

	base	   default	   growing
	var	var	diff	var	diff
small	1.96%	0.47%	-1.5%	0.52%	-2.2%
big	2.03%	1.35%	+0.9%	2.22%	+2.9%
4way	0.80%	0.45%	-0.7%	1.22%	<0.1%

Second, on a Raspberry Pi4 with 8G RAM and a class 10 A1 microSD card:

	base	   default	   growing
	var	var	diff	var	diff
small	1.09%	1.69%	+0.5%	2.14%	-0.2%
big	0.03%	0.28%	-0.5%	0.03%	-0.1%
4way	5.15%	2.39%	+0.2%	0.66%	<0.1%

Third, on a CoCo VM. This was a bigger system, so I also added a 24-thread
parallel I/O test:

	base	   default	   growing
	var	var	diff	var	diff
small	2.41%	6.02%	+1.1%	10.33%	+6.7%
big	9.20%	2.81%	-0.6%	16.84%	-0.2%
4way	0.86%	2.66%	-0.1%	 2.22%	-4.9%
24way	3.19%	6.19%	+4.4%	 4.08%	-5.9%

Note the increased variance of the CoCo VM, although the host was not
otherwise loaded. These are caused by the first run, which includes the
overhead of allocating additional bounce buffers and sharing them with the
hypervisor. The system was not rebooted between successive runs.

Parallel tests suffer from a reduced number of areas in the dynamically
allocated memory pools. This can be improved by allocating a larger pool
from CMA (not implemented in this series yet).

I have no good explanation for the increase in performance of the
24-thread I/O test with the default (non-growing) memory pool. Although the
difference is within variance, it seems to be real. The average bandwidth
is consistently above that of the unpatched kernel.

To sum it up:

- All workloads benefit from reduced memory footprint.
- No performance regressions have been observed with the default size of
  the software IO TLB.
- Most workloads retain their former performance even if the software IO
  TLB grows at run time.

Changelog
=========

Changes from v4:
- Guard the code with a CONFIG_SWIOTLB_DYNAMIC option
- Remove is_swiotlb_allocated(); instead, prevent repeated initialization
  in swiotlb_init_late()
- Rename default_swiotlb_start() to default_swiotlb_base()
- Embed the default struct io_tlb_pool into struct io_tlb_mem
- Do not re-introduce struct io_tlb_pool.used

Changes from v3:
- Provide swiotlb_is_allocated() instead of extending swiotlb_is_active().
- Do not grow SWIOTLB if its address has been queried (affects Octeon).
- Do not grow SWIOTLB if a remap function is used (affects Xen PV).
- Use dma_mask instead of coherent_dma_mask.
- Replace complex ternary operators with if-else blocks.

Changes from v2:
- Complete rewrite using dynamically allocated memory pools rather
  than a list of individual buffers
- Depend on other SWIOTLB fixes (already sent)
- Fix Xen and MIPS Octeon builds

Changes from RFC:
- Track dynamic buffers per device instead of per swiotlb
- Use a linked list instead of a maple tree
- Move initialization of swiotlb fields of struct device to a
  helper function
- Rename __lookup_dyn_slot() to lookup_dyn_slot_locked()
- Introduce per-device flag if dynamic buffers are in use
- Add one more user of DMA_ATTR_MAY_SLEEP
- Add kernel-doc comments for new (and some old) code
- Properly escape '*' in dma-attributes.rst

Petr Tesarik (9):
  swiotlb: bail out of swiotlb_init_late() if swiotlb is already
    allocated
  swiotlb: make io_tlb_default_mem local to swiotlb.c
  swiotlb: add documentation and rename swiotlb_do_find_slots()
  swiotlb: separate memory pool data from other allocator data
  swiotlb: add a flag whether SWIOTLB is allowed to grow
  swiotlb: if swiotlb is full, fall back to a transient memory pool
  swiotlb: determine potential physical address limit
  swiotlb: allocate a new memory pool when existing pools are full
  swiotlb: search the software IO TLB only if the device makes use of it

 arch/arm/xen/mm.c           |  10 +-
 arch/mips/pci/pci-octeon.c  |   2 +-
 arch/x86/kernel/pci-dma.c   |  12 +-
 drivers/base/core.c         |   4 +-
 drivers/xen/swiotlb-xen.c   |   2 +-
 include/linux/device.h      |  10 +-
 include/linux/dma-mapping.h |   2 +
 include/linux/swiotlb.h     | 125 +++++--
 kernel/dma/Kconfig          |  13 +
 kernel/dma/direct.c         |   2 +-
 kernel/dma/swiotlb.c        | 675 ++++++++++++++++++++++++++++++++----
 11 files changed, 754 insertions(+), 103 deletions(-)

-- 
2.25.1

