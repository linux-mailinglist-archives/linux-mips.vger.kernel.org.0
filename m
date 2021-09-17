Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 162B740F510
	for <lists+linux-mips@lfdr.de>; Fri, 17 Sep 2021 11:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343547AbhIQJqP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Sep 2021 05:46:15 -0400
Received: from foss.arm.com ([217.140.110.172]:50596 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245742AbhIQJqC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 17 Sep 2021 05:46:02 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EFAC101E;
        Fri, 17 Sep 2021 02:44:40 -0700 (PDT)
Received: from [10.57.24.25] (unknown [10.57.24.25])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D29AC3F59C;
        Fri, 17 Sep 2021 02:44:35 -0700 (PDT)
Subject: Re: [PATCH] swiotlb: set IO TLB segment size via cmdline
To:     Roman Skakun <rm.skakun@gmail.com>, Christoph Hellwig <hch@lst.de>
Cc:     Jan Beulich <jbeulich@suse.com>,
        Andrii Anisov <andrii_anisov@epam.com>,
        Roman Skakun <roman_skakun@epam.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Muchun Song <songmuchun@bytedance.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Mike Rapoport <rppt@kernel.org>, Will Deacon <will@kernel.org>,
        xen-devel@lists.xenproject.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        iommu <iommu@lists.linux-foundation.org>
References: <20210914151016.3174924-1-Roman_Skakun@epam.com>
 <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com>
 <CADu_u-Ou08tMFm5xU871ae8ct+2YOuvn4rQ=83CMTbg2bx87Pg@mail.gmail.com>
 <84ef7ff7-2c9c-113a-4a2c-cef54a6ded51@suse.com>
 <20210915135321.GA15216@lst.de>
 <CADu_u-OZzgVj+z=iD6kUQOZxUufF5QSMR6-MmpN_hLZ9PyQJhQ@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <eb98aeac-af61-0dd6-2052-5b55921746c1@arm.com>
Date:   Fri, 17 Sep 2021 10:44:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CADu_u-OZzgVj+z=iD6kUQOZxUufF5QSMR6-MmpN_hLZ9PyQJhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2021-09-17 10:36, Roman Skakun wrote:
> Hi, Christoph
> 
> I use Xen PV display. In my case, PV display backend(Dom0) allocates
> contiguous buffer via DMA-API to
> to implement zero-copy between Dom0 and DomU.

Well, something's gone badly wrong there - if you have to shadow the 
entire thing in a bounce buffer to import it then it's hardly zero-copy, 
is it? If you want to do buffer sharing the buffer really needs to be 
allocated appropriately to begin with, such that all relevant devices 
can access it directly. That might be something which needs fixing in Xen.

Robin.

> When I start Weston under DomU, I got the next log in Dom0:
> ```
> [ 112.554471] CPU: 0 PID: 367 Comm: weston Tainted: G O
> 5.10.0-yocto-standard+ #312
> [ 112.575149] Call trace:
> [ 112.577666] dump_backtrace+0x0/0x1b0
> [ 112.581373] show_stack+0x18/0x70
> [ 112.584746] dump_stack+0xd0/0x12c
> [ 112.588200] swiotlb_tbl_map_single+0x234/0x360
> [ 112.592781] xen_swiotlb_map_page+0xe4/0x4c0
> [ 112.597095] xen_swiotlb_map_sg+0x84/0x12c
> [ 112.601249] dma_map_sg_attrs+0x54/0x60
> [ 112.605138] vsp1_du_map_sg+0x30/0x60
> [ 112.608851] rcar_du_vsp_map_fb+0x134/0x170
> [ 112.613082] rcar_du_vsp_plane_prepare_fb+0x44/0x64
> [ 112.618007] drm_atomic_helper_prepare_planes+0xac/0x160
> [ 112.623362] drm_atomic_helper_commit+0x88/0x390
> [ 112.628029] drm_atomic_nonblocking_commit+0x4c/0x60
> [ 112.633043] drm_mode_atomic_ioctl+0x9a8/0xb0c
> [ 112.637532] drm_ioctl_kernel+0xc4/0x11c
> [ 112.641506] drm_ioctl+0x21c/0x460
> [ 112.644967] __arm64_sys_ioctl+0xa8/0xf0
> [ 112.648939] el0_svc_common.constprop.0+0x78/0x1a0
> [ 112.653775] do_el0_svc+0x24/0x90
> [ 112.657148] el0_svc+0x14/0x20
> [ 112.660254] el0_sync_handler+0x1a4/0x1b0
> [ 112.664315] el0_sync+0x174/0x180
> [ 112.668145] rcar-fcp fea2f000.fcp: swiotlb buffer is full (sz:
> 3686400 bytes), total 65536 (slots), used 112 (slots)
> ```
> The problem is happened here:
> https://elixir.bootlin.com/linux/v5.14.4/source/drivers/gpu/drm/rcar-du/rcar_du_vsp.c#L202
> 
> Sgt was created in dma_get_sgtable() by dma_common_get_sgtable() and
> includes a single page chunk
> as shown here:
> https://elixir.bootlin.com/linux/v5.14.5/source/kernel/dma/ops_helpers.c#L18
> 
> After creating a new sgt, we tried to map this sgt through vsp1_du_map_sg().
> Internally, vsp1_du_map_sg() using ops->map_sg (e.g
> xen_swiotlb_map_sg) to perform
> mapping.
> 
> I realized that required segment is too big to be fitted to default
> swiotlb segment and condition
> https://elixir.bootlin.com/linux/latest/source/kernel/dma/swiotlb.c#L474
> is always false.
> 
> I know that I use a large buffer, but why can't I map this buffer in one chunk?
> 
> Thanks!
> 
> ср, 15 сент. 2021 г. в 16:53, Christoph Hellwig <hch@lst.de>:
>>
>> On Wed, Sep 15, 2021 at 03:49:52PM +0200, Jan Beulich wrote:
>>> But the question remains: Why does the framebuffer need to be mapped
>>> in a single giant chunk?
>>
>> More importantly: if you use dynamic dma mappings for your framebuffer
>> you're doing something wrong.
> 
> 
> 
