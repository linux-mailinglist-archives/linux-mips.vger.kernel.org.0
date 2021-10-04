Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88B8542085F
	for <lists+linux-mips@lfdr.de>; Mon,  4 Oct 2021 11:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbhJDJiI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Oct 2021 05:38:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58190 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230408AbhJDJiH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Oct 2021 05:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633340178;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=hlABN2UfX8mmg4ng0oI/HDWFcaKFWagGNJM8HwtDihg=;
        b=gOEQREfE2GsN48YxEGzRUyONDoAW2aBL+CP8w/wtlVnM6uYIU9yb8znJoEeaU/W79hQ3bP
        01Dy0AWJ5K2vk81WRiO1D6/o9l8J0PR1GueTc/05U/f3eurOBGkmNBLiO6CTZhbg7FbdMD
        ugB4a9/zjD344LCHgFWR2JIUHMyfyvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-MDZ8qFBKP2Whbkrt_JF4zg-1; Mon, 04 Oct 2021 05:36:17 -0400
X-MC-Unique: MDZ8qFBKP2Whbkrt_JF4zg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B143E1006AA4;
        Mon,  4 Oct 2021 09:36:14 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.159])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 098A9100763D;
        Mon,  4 Oct 2021 09:36:06 +0000 (UTC)
From:   David Hildenbrand <david@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Jianyong Wu <Jianyong.Wu@arm.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-snps-arc@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-mm@kvack.org,
        kexec@lists.infradead.org
Subject: [PATCH v2 0/5] mm/memory_hotplug: full support for add_memory_driver_managed() with CONFIG_ARCH_KEEP_MEMBLOCK
Date:   Mon,  4 Oct 2021 11:36:00 +0200
Message-Id: <20211004093605.5830-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Architectures that require CONFIG_ARCH_KEEP_MEMBLOCK=y, such as arm64,
don't cleanly support add_memory_driver_managed() yet. Most prominently,
kexec_file can still end up placing kexec images on such driver-managed
memory, resulting in undesired behavior, for example, having kexec images
located on memory not part of the firmware-provided memory map.

Teaching kexec to not place images on driver-managed memory is especially
relevant for virtio-mem. Details can be found in commit 7b7b27214bba
("mm/memory_hotplug: introduce add_memory_driver_managed()").

Extend memblock with a new flag and set it from memory hotplug code
when applicable. This is required to fully support virtio-mem on
arm64, making also kexec_file behave like on x86-64.

v1 -> v2:
- "memblock: improve MEMBLOCK_HOTPLUG documentation"
-- Added
- "memblock: add MEMBLOCK_DRIVER_MANAGED to mimic
   IORESOURCE_SYSRAM_DRIVER_MANAGED"
-- Improve documentation of MEMBLOCK_DRIVER_MANAGED
- Refine patch descriptions

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Jianyong Wu <Jianyong.Wu@arm.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Eric Biederman <ebiederm@xmission.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-ia64@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: kexec@lists.infradead.org

David Hildenbrand (5):
  mm/memory_hotplug: handle memblock_add_node() failures in
    add_memory_resource()
  memblock: improve MEMBLOCK_HOTPLUG documentation
  memblock: allow to specify flags with memblock_add_node()
  memblock: add MEMBLOCK_DRIVER_MANAGED to mimic
    IORESOURCE_SYSRAM_DRIVER_MANAGED
  mm/memory_hotplug: indicate MEMBLOCK_DRIVER_MANAGED with
    IORESOURCE_SYSRAM_DRIVER_MANAGED

 arch/arc/mm/init.c               |  4 ++--
 arch/ia64/mm/contig.c            |  2 +-
 arch/ia64/mm/init.c              |  2 +-
 arch/m68k/mm/mcfmmu.c            |  3 ++-
 arch/m68k/mm/motorola.c          |  6 ++++--
 arch/mips/loongson64/init.c      |  4 +++-
 arch/mips/sgi-ip27/ip27-memory.c |  3 ++-
 arch/s390/kernel/setup.c         |  3 ++-
 include/linux/memblock.h         | 25 +++++++++++++++++++++----
 include/linux/mm.h               |  2 +-
 kernel/kexec_file.c              |  5 +++++
 mm/memblock.c                    | 13 +++++++++----
 mm/memory_hotplug.c              | 11 +++++++++--
 13 files changed, 62 insertions(+), 21 deletions(-)


base-commit: 9e1ff307c779ce1f0f810c7ecce3d95bbae40896
-- 
2.31.1

