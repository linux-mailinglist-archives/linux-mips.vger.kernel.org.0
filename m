Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40138423517
	for <lists+linux-mips@lfdr.de>; Wed,  6 Oct 2021 02:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237088AbhJFAh5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Oct 2021 20:37:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:36770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237127AbhJFAhx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 5 Oct 2021 20:37:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6F5261207;
        Wed,  6 Oct 2021 00:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633480561;
        bh=8xj9E6op+Rg8PTXffqt5Iu6I5QYdPwtUpE27T1OKFzU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iu6vyfwg4W/tfIH5vF6EJ8rw4IAH6oyZstjQ+k71TftnxAoc/pd8Vg7g809vYXSmw
         HqBqPXNn18TKQQVolBCdPUBQNjbRZENvt/N4z6bD5KXEN7vh2A1ska4yQbc/iG3LBv
         9+PzqFOlfYw7EWsnTtgXQ3BetmXc3txVFFIYY2newPWMttQOXa9Z5OdONOzRjfJewv
         OlVGXBfO8XkC/k/4KN1DjHTDnLNTp55uKMab8YAyYWXAnirslZET9T3W1dieK8A9Lt
         f858nm0SZ+QfOwVHGG2EUsgGuL7mfwROiNowH7gIpRq8xDCM3duxbib9wjTXMRsty9
         9ElPf2xXwHi1w==
Date:   Tue, 5 Oct 2021 17:35:57 -0700
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
Subject: Re: [PATCH v2 2/5] memblock: improve MEMBLOCK_HOTPLUG documentation
Message-ID: <YVzvbUr2zO/Nw0Xf@kernel.org>
References: <20211004093605.5830-1-david@redhat.com>
 <20211004093605.5830-3-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004093605.5830-3-david@redhat.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Oct 04, 2021 at 11:36:02AM +0200, David Hildenbrand wrote:
> The description of MEMBLOCK_HOTPLUG is currently short and consequently
> misleading: we're actually dealing with a memory region that might get
> hotunplugged later (i.e., the platform+firmware supports it), yet it is
> indicated in the firmware-provided memory map as system ram that will just
> get used by the system for any purpose when not taking special care. The
> firmware marked this memory region as a hot(un)plugged (e.g., hotplugged
> before reboot), implying that it might get hotunplugged again later.
> 
> Whether we consider this information depends on the "movable_node" kernel
> commandline parameter: only with "movable_node" set, we'll try keeping
> this memory hotunpluggable, for example, by not serving early allocations
> from this memory region and by letting the buddy manage it using the
> ZONE_MOVABLE.
> 
> Let's make this clearer by extending the documentation.
> 
> Note: kexec *has to* indicate this memory to the second kernel. With
> "movable_node" set, we don't want to place kexec-images on this memory.
> Without "movable_node" set, we don't care and can place kexec-images on
> this memory. In both cases, after successful memory hotunplug, kexec has to
> be re-armed to update the memory map for the second kernel and to place the
> kexec-images somewhere else.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  include/linux/memblock.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index 34de69b3b8ba..4ee8dd2d63a7 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -28,7 +28,11 @@ extern unsigned long long max_possible_pfn;
>  /**
>   * enum memblock_flags - definition of memory region attributes
>   * @MEMBLOCK_NONE: no special request
> - * @MEMBLOCK_HOTPLUG: hotpluggable region
> + * @MEMBLOCK_HOTPLUG: memory region indicated in the firmware-provided memory
> + * map during early boot as hot(un)pluggable system RAM (e.g., memory range
> + * that might get hotunplugged later). With "movable_node" set on the kernel
> + * commandline, try keeping this memory region hotunpluggable. Does not apply
> + * to memblocks added ("hotplugged") after early boot.
>   * @MEMBLOCK_MIRROR: mirrored region
>   * @MEMBLOCK_NOMAP: don't add to kernel direct mapping and treat as
>   * reserved in the memory map; refer to memblock_mark_nomap() description
> -- 
> 2.31.1
> 

-- 
Sincerely yours,
Mike.
