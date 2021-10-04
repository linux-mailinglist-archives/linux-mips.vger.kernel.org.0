Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75476420869
	for <lists+linux-mips@lfdr.de>; Mon,  4 Oct 2021 11:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232391AbhJDJia (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Oct 2021 05:38:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49282 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232395AbhJDJiX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Oct 2021 05:38:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633340193;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kO8zp8Wu6+ZvuXVBX/LGAottNCd0eE/ew4t9MBAkcjM=;
        b=Y3T+VJ8SV861XZI43prpmFb85AviOdBHHMwABHyOcN4pAqtdBz2vfQtwVBEaIeLqTjChoj
        sza70+Sx2ld9Xxrn+iWUcjgTTU2HKf3xf1f30MrqguUVAvOF3NU9nTIEIYC29n+BFXpTfI
        qcPL5oojEg46rYD7IIt1Z7pV1k+lWlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-OGpOPFWFNk6D_1xBVHXnQA-1; Mon, 04 Oct 2021 05:36:30 -0400
X-MC-Unique: OGpOPFWFNk6D_1xBVHXnQA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF7541922962;
        Mon,  4 Oct 2021 09:36:27 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.159])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3C62410013C1;
        Mon,  4 Oct 2021 09:36:22 +0000 (UTC)
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
Subject: [PATCH v2 2/5] memblock: improve MEMBLOCK_HOTPLUG documentation
Date:   Mon,  4 Oct 2021 11:36:02 +0200
Message-Id: <20211004093605.5830-3-david@redhat.com>
In-Reply-To: <20211004093605.5830-1-david@redhat.com>
References: <20211004093605.5830-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The description of MEMBLOCK_HOTPLUG is currently short and consequently
misleading: we're actually dealing with a memory region that might get
hotunplugged later (i.e., the platform+firmware supports it), yet it is
indicated in the firmware-provided memory map as system ram that will just
get used by the system for any purpose when not taking special care. The
firmware marked this memory region as a hot(un)plugged (e.g., hotplugged
before reboot), implying that it might get hotunplugged again later.

Whether we consider this information depends on the "movable_node" kernel
commandline parameter: only with "movable_node" set, we'll try keeping
this memory hotunpluggable, for example, by not serving early allocations
from this memory region and by letting the buddy manage it using the
ZONE_MOVABLE.

Let's make this clearer by extending the documentation.

Note: kexec *has to* indicate this memory to the second kernel. With
"movable_node" set, we don't want to place kexec-images on this memory.
Without "movable_node" set, we don't care and can place kexec-images on
this memory. In both cases, after successful memory hotunplug, kexec has to
be re-armed to update the memory map for the second kernel and to place the
kexec-images somewhere else.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/memblock.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 34de69b3b8ba..4ee8dd2d63a7 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -28,7 +28,11 @@ extern unsigned long long max_possible_pfn;
 /**
  * enum memblock_flags - definition of memory region attributes
  * @MEMBLOCK_NONE: no special request
- * @MEMBLOCK_HOTPLUG: hotpluggable region
+ * @MEMBLOCK_HOTPLUG: memory region indicated in the firmware-provided memory
+ * map during early boot as hot(un)pluggable system RAM (e.g., memory range
+ * that might get hotunplugged later). With "movable_node" set on the kernel
+ * commandline, try keeping this memory region hotunpluggable. Does not apply
+ * to memblocks added ("hotplugged") after early boot.
  * @MEMBLOCK_MIRROR: mirrored region
  * @MEMBLOCK_NOMAP: don't add to kernel direct mapping and treat as
  * reserved in the memory map; refer to memblock_mark_nomap() description
-- 
2.31.1

