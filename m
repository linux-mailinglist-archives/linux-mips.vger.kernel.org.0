Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7CEE41EF10
	for <lists+linux-mips@lfdr.de>; Fri,  1 Oct 2021 16:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbhJAOFD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Oct 2021 10:05:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:49366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231824AbhJAOE7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 1 Oct 2021 10:04:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B184461439;
        Fri,  1 Oct 2021 14:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633096994;
        bh=j7RiikMVul/vm+Prmyx1rYn9xETi77NUVt/50phH7k0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JIchVvHkPwXFrApRkJNJ1jo9dQIfHa2T63ZG1i87FhM0l0ZvtL87mlGvplRQBraes
         vyMIL4dKf6z0JSmVBUSKIGtpiCVW0zfnCqS9jOnbL2dAZNjae538ZVygnqS9nR+eLF
         xHUU2hdOzmpySeLHR8g8uhJ86dXHlY3KzJVFj48iCHOSsm/sFJxKKMIWTwhwBE82+F
         FzjRuTX/sl0Oc1bN9a0bDb8maV8TNilTngNHqHbDe+oFp/6kLeNtnncm2EB6xtvQPd
         RxHjszo7Yuib1/P1V58ChVRmeUZKnKnZO6L+qjCn49PqGMSsJSfKE5Y6LZatW8Cmz/
         K9IirY56cVdeg==
Date:   Fri, 1 Oct 2021 07:03:13 -0700
From:   Mike Rapoport <rppt@kernel.org>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
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
Subject: Re: [PATCH v1 3/4] memblock: add MEMBLOCK_DRIVER_MANAGED to mimic
 IORESOURCE_SYSRAM_DRIVER_MANAGED
Message-ID: <YVcVIej0Wlyd9JAB@kernel.org>
References: <20210927150518.8607-1-david@redhat.com>
 <20210927150518.8607-4-david@redhat.com>
 <YVSW3uuu7mIcJMm3@kernel.org>
 <830c1670-378b-0fb6-bd5e-208e545fa126@redhat.com>
 <YVYqdN7MFdzBlCVm@kernel.org>
 <0d6c86ba-076b-5d4b-33a8-da267f951a85@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d6c86ba-076b-5d4b-33a8-da267f951a85@redhat.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 01, 2021 at 10:04:24AM +0200, David Hildenbrand wrote:
> On 30.09.21 23:21, Mike Rapoport wrote:
> > On Wed, Sep 29, 2021 at 06:54:01PM +0200, David Hildenbrand wrote:
> > > On 29.09.21 18:39, Mike Rapoport wrote:
> > > > Hi,
> > > > 
> > > > On Mon, Sep 27, 2021 at 05:05:17PM +0200, David Hildenbrand wrote:
> > > > > Let's add a flag that corresponds to IORESOURCE_SYSRAM_DRIVER_MANAGED.
> > > > > Similar to MEMBLOCK_HOTPLUG, most infrastructure has to treat such memory
> > > > > like ordinary MEMBLOCK_NONE memory -- for example, when selecting memory
> > > > > regions to add to the vmcore for dumping in the crashkernel via
> > > > > for_each_mem_range().
> > > > Can you please elaborate on the difference in semantics of MEMBLOCK_HOTPLUG
> > > > and MEMBLOCK_DRIVER_MANAGED?
> > > > Unless I'm missing something they both mark memory that can be unplugged
> > > > anytime and so it should not be used in certain cases. Why is there a need
> > > > for a new flag?
> > > 
> > > In the cover letter I have "Alternative B: Reuse MEMBLOCK_HOTPLUG.
> > > MEMBLOCK_HOTPLUG serves a different purpose, though.", but looking into the
> > > details it won't work as is.
> > > 
> > > MEMBLOCK_HOTPLUG is used to mark memory early during boot that can later get
> > > hotunplugged again and should be placed into ZONE_MOVABLE if the
> > > "movable_node" kernel parameter is set.
> > > 
> > > The confusing part is that we talk about "hotpluggable" but really mean
> > > "hotunpluggable": the reason is that HW flags DIMM slots that can later be
> > > hotplugged as "hotpluggable" even though there is already something
> > > hotplugged.
> > 
> > MEMBLOCK_HOTPLUG name is indeed somewhat confusing, but still it's core
> > meaning "this memory may be removed" which does not differ from what
> > IORESOURCE_SYSRAM_DRIVER_MANAGED means.
> > 
> > MEMBLOCK_HOTPLUG regions are indeed placed into ZONE_MOVABLE, but more
> > importantly, they are avoided when we allocate memory from memblock.
> > 
> > So, in my view, both flags mean that the memory may be removed and it
> > should not be used for certain types of allocations.
> 
> The semantics are different:
> 
> MEMBLOCK_HOTPLUG: memory is indicated as "System RAM" in the
> firmware-provided memory map and added to the system early during boot; we
> want this memory to be managed by ZONE_MOVABLE with "movable_node" set on
> the kernel command line, because only then we want it to be hotpluggable
> again. kexec *has to* indicate this memory to the second kernel and can
> place kexec-images on this memory. After memory hotunplug, kexec has to be
> re-armed.
> 
> MEMBLOCK_DRIVER_MANAGED: memory is not indicated as System RAM" in the
> firmware-provided memory map; this memory is always detected and added to
> the system by a driver; memory might not actually be physically
> hotunpluggable and the ZONE selection does not depend on "movable_core".
> kexec *must not* indicate this memory to the second kernel and *must not*
> place kexec-images on this memory.

Ok, this clarifies.
This explanation should be a part of the changelog. The sentences about the
zone selection could be probably skipped, because they are less important
for this case. E.g something like:

MEMBLOCK_HOTPLUG: memory is indicated as "System RAM" in the
firmware-provided memory map and added to the system early during boot;
kexec *has to* indicate this memory to the second kernel and can place
kexec-images on this memory. After memory hotunplug, kexec has to be
re-armed.

MEMBLOCK_DRIVER_MANAGED: memory is not indicated as "System RAM" in the
firmware-provided memory map; this memory is always detected and added to
the system by a driver; memory might not actually be physically
hotunpluggable.  kexec *must not* indicate this memory to the second kernel
and *must not* place kexec-images on this memory.

-- 
Sincerely yours,
Mike.
