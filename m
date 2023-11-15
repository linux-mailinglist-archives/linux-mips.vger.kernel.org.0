Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21B9F7DCFE0
	for <lists+linux-mips@lfdr.de>; Tue, 31 Oct 2023 16:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbjJaPG2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 31 Oct 2023 11:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233467AbjJaPG1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 31 Oct 2023 11:06:27 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD367F9
        for <linux-mips@vger.kernel.org>; Tue, 31 Oct 2023 08:06:23 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-66d09b6d007so39534066d6.1
        for <linux-mips@vger.kernel.org>; Tue, 31 Oct 2023 08:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698764783; x=1699369583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFiJeiYR5SSNo2dE3+Iew6FPjauUb0S9LLfJ6JqjMGA=;
        b=j8vckZMqbY9KcvIxQrSo/HJlbqDw7k6UvP2Kd2EAGuwecFKnb0LZ24iXjhl9/9MH1Y
         /oD8lDN4AWShZT8fRTurC3X8jdX/+un17y/PzuOCyR8ctgnEOk0TaWtIwB80449HGsl6
         O9VJp9jCm0Yv8uOSUzbKsEnSDcRzCueJYfkiwBUVPEsK8X7D++xSacNzmIppWZRaOe53
         CvXlKF4DA4MqOrgM8j0vapBcMAzwkZjE5RJmMBoOA8bMU+uDVmuIR5uJYy11RV0GW2vF
         IefiSWIgC+R3u10Gemm5sChFQBiIgCJ/pOqHuHOXY49BmVH77uKH8Od8H58JRTXtIggx
         qR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698764783; x=1699369583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFiJeiYR5SSNo2dE3+Iew6FPjauUb0S9LLfJ6JqjMGA=;
        b=c8VfngdoztfjizAs14Vt2jV0x264L5brnQgtMxLNoA4lEDLveFNPy4OzgfbUdoyYOn
         PgUP4p4e1P3U3nlMEVo66JzWT9MhGSlgiLA0tMc4sP5cEqVTaFtr//FZT2UQf8p41Z61
         HHCUGLwcDCbGN/6vSkCDooLRgiOLBaBeuU6LQ0JkuTDoP/zgNDGXegp5CwrEvlXdQRYt
         Po0HNkpNJM4qJl1PJN+VGjHN0DXLxGzfXlsCECcAcSEJ14+icIpCPuMq/Ynvs9Bmy71k
         Z5MhrXapP+0yelftntrcRaxsjN4JbMZjH7D9MsvYuwjAXRLD20wal8Sq89gWjLGoTVcz
         1dNg==
X-Gm-Message-State: AOJu0YxEKZD5uOAZk4lfTfOI9iVAYTWo134CuIVSqPt8tiw5NMtUN5OH
        XntiJmzNEPIyZtPSTHOwJG6u3h3SloGXN97RwsQRuA==
X-Google-Smtp-Source: AGHT+IE151kEFir7qf7e2DG0sarSRU7TzUC/5hmwAex0rxC4ctantPqpX1svsxQNccGEPatzUcut0zJ7zmReLsYMGwo=
X-Received: by 2002:ad4:5ce3:0:b0:66d:5b50:44d with SMTP id
 iv3-20020ad45ce3000000b0066d5b50044dmr20218799qvb.57.1698764782743; Tue, 31
 Oct 2023 08:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-17-seanjc@google.com>
From:   Fuad Tabba <tabba@google.com>
Date:   Tue, 31 Oct 2023 15:05:45 +0000
Message-ID: <CA+EHjTzj4drYKONVOLP19DYpJ4O8kSXcFzw2AKier1QdcFKx_Q@mail.gmail.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To:     Sean Christopherson <seanjc@google.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>,
        Xu Yilun <yilun.xu@intel.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Anish Moorthy <amoorthy@google.com>,
        David Matlack <dmatlack@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Vishal Annapurve <vannapurve@google.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Maciej Szmigiero <mail@maciej.szmigiero.name>,
        David Hildenbrand <david@redhat.com>,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>,
        Wang <wei.w.wang@intel.com>,
        Liam Merwick <liam.merwick@oracle.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Fri, Oct 27, 2023 at 7:23=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:

...

> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.=
rst
> index e2252c748fd6..e82c69d5e755 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6079,6 +6079,15 @@ applied.
>  :Parameters: struct kvm_userspace_memory_region2 (in)
>  :Returns: 0 on success, -1 on error
>
> +KVM_SET_USER_MEMORY_REGION2 is an extension to KVM_SET_USER_MEMORY_REGIO=
N that
> +allows mapping guest_memfd memory into a guest.  All fields shared with
> +KVM_SET_USER_MEMORY_REGION identically.  Userspace can set KVM_MEM_PRIVA=
TE in
> +flags to have KVM bind the memory region to a given guest_memfd range of
> +[guest_memfd_offset, guest_memfd_offset + memory_size].  The target gues=
t_memfd
> +must point at a file created via KVM_CREATE_GUEST_MEMFD on the current V=
M, and
> +the target range must not be bound to any other memory region.  All stan=
dard
> +bounds checks apply (use common sense).
> +

Bikeshedding here: Not sure if KVM_MEM_PRIVATE is the best name for
this. It gets confusing with KVM_MEMORY_ATTRIBUTE_PRIVATE, i.e., that
a region marked as KVM_MEM_PRIVATE is only potentially private. It did
confuse the rest of the team when I walked them through a previous
version of this code once. Would something like KVM_MEM_GUESTMEM make
more sense?

>  ::
>
>    struct kvm_userspace_memory_region2 {
> @@ -6087,9 +6096,24 @@ applied.
>         __u64 guest_phys_addr;
>         __u64 memory_size; /* bytes */
>         __u64 userspace_addr; /* start of the userspace allocated memory =
*/
> +  __u64 guest_memfd_offset;
> +       __u32 guest_memfd;
> +       __u32 pad1;
> +       __u64 pad2[14];
>    };
>
> -See KVM_SET_USER_MEMORY_REGION.
> +A KVM_MEM_PRIVATE region _must_ have a valid guest_memfd (private memory=
) and
> +userspace_addr (shared memory).  However, "valid" for userspace_addr sim=
ply
> +means that the address itself must be a legal userspace address.  The ba=
cking
> +mapping for userspace_addr is not required to be valid/populated at the =
time of
> +KVM_SET_USER_MEMORY_REGION2, e.g. shared memory can be lazily mapped/all=
ocated
> +on-demand.

Regarding requiring that a private region have both a valid
guest_memfd and a userspace_addr, should this be
implementation-specific? In pKVM at least, all regions for protected
VMs are private, and KVM doesn't care about the host userspace address
for those regions even when part of the memory is shared.

> +When mapping a gfn into the guest, KVM selects shared vs. private, i.e c=
onsumes
> +userspace_addr vs. guest_memfd, based on the gfn's KVM_MEMORY_ATTRIBUTE_=
PRIVATE
> +state.  At VM creation time, all memory is shared, i.e. the PRIVATE attr=
ibute
> +is '0' for all gfns.  Userspace can control whether memory is shared/pri=
vate by
> +toggling KVM_MEMORY_ATTRIBUTE_PRIVATE via KVM_SET_MEMORY_ATTRIBUTES as n=
eeded.

In pKVM, guest memory is private by default, and most of it will
remain so for the lifetime of the VM. Userspace could explicitly mark
all the guest's memory as private at initialization, but it would save
a slight amount of work. That said, I understand that it might be
better to be consistent across implementations.

...

> --- /dev/null
> +++ b/virt/kvm/guest_memfd.c
> @@ -0,0 +1,548 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/backing-dev.h>
> +#include <linux/falloc.h>
> +#include <linux/kvm_host.h>
> +#include <linux/pagemap.h>
> +#include <linux/anon_inodes.h>

nit: should this include be first (to maintain alphabetical ordering
of the includes)?

> +
> +#include "kvm_mm.h"
> +
> +struct kvm_gmem {
> +       struct kvm *kvm;
> +       struct xarray bindings;
> +       struct list_head entry;
> +};
> +
> +static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t ind=
ex)
> +{
> +       struct folio *folio;
> +
> +       /* TODO: Support huge pages. */
> +       folio =3D filemap_grab_folio(inode->i_mapping, index);
> +       if (IS_ERR_OR_NULL(folio))
> +               return NULL;
> +
> +       /*
> +        * Use the up-to-date flag to track whether or not the memory has=
 been
> +        * zeroed before being handed off to the guest.  There is no back=
ing
> +        * storage for the memory, so the folio will remain up-to-date un=
til
> +        * it's removed.
> +        *
> +        * TODO: Skip clearing pages when trusted firmware will do it whe=
n
> +        * assigning memory to the guest.
> +        */
> +       if (!folio_test_uptodate(folio)) {
> +               unsigned long nr_pages =3D folio_nr_pages(folio);
> +               unsigned long i;
> +
> +               for (i =3D 0; i < nr_pages; i++)
> +                       clear_highpage(folio_page(folio, i));
> +
> +               folio_mark_uptodate(folio);
> +       }
> +
> +       /*
> +        * Ignore accessed, referenced, and dirty flags.  The memory is
> +        * unevictable and there is no storage to write back to.
> +        */
> +       return folio;
> +}
> +
> +static void kvm_gmem_invalidate_begin(struct kvm_gmem *gmem, pgoff_t sta=
rt,
> +                                     pgoff_t end)
> +{
> +       bool flush =3D false, found_memslot =3D false;
> +       struct kvm_memory_slot *slot;
> +       struct kvm *kvm =3D gmem->kvm;
> +       unsigned long index;
> +
> +       xa_for_each_range(&gmem->bindings, index, slot, start, end - 1) {
> +               pgoff_t pgoff =3D slot->gmem.pgoff;
> +
> +               struct kvm_gfn_range gfn_range =3D {
> +                       .start =3D slot->base_gfn + max(pgoff, start) - p=
goff,
> +                       .end =3D slot->base_gfn + min(pgoff + slot->npage=
s, end) - pgoff,
> +                       .slot =3D slot,
> +                       .may_block =3D true,
> +               };
> +
> +               if (!found_memslot) {
> +                       found_memslot =3D true;
> +
> +                       KVM_MMU_LOCK(kvm);
> +                       kvm_mmu_invalidate_begin(kvm);
> +               }
> +
> +               flush |=3D kvm_mmu_unmap_gfn_range(kvm, &gfn_range);
> +       }
> +
> +       if (flush)
> +               kvm_flush_remote_tlbs(kvm);
> +
> +       if (found_memslot)
> +               KVM_MMU_UNLOCK(kvm);
> +}
> +
> +static void kvm_gmem_invalidate_end(struct kvm_gmem *gmem, pgoff_t start=
,
> +                                   pgoff_t end)
> +{
> +       struct kvm *kvm =3D gmem->kvm;
> +
> +       if (xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT)) {
> +               KVM_MMU_LOCK(kvm);
> +               kvm_mmu_invalidate_end(kvm);
> +               KVM_MMU_UNLOCK(kvm);
> +       }
> +}
> +
> +static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff=
_t len)
> +{
> +       struct list_head *gmem_list =3D &inode->i_mapping->private_list;
> +       pgoff_t start =3D offset >> PAGE_SHIFT;
> +       pgoff_t end =3D (offset + len) >> PAGE_SHIFT;
> +       struct kvm_gmem *gmem;
> +
> +       /*
> +        * Bindings must stable across invalidation to ensure the start+e=
nd

nit: Bindings must _be/stay?_ stable

...

> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 78a0b09ef2a5..5d1a2f1b4e94 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -798,7 +798,7 @@ void kvm_mmu_invalidate_range_add(struct kvm *kvm, gf=
n_t start, gfn_t end)
>         }
>  }
>
> -static bool kvm_mmu_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_rang=
e *range)
> +bool kvm_mmu_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *rang=
e)
>  {
>         kvm_mmu_invalidate_range_add(kvm, range->start, range->end);
>         return kvm_unmap_gfn_range(kvm, range);
> @@ -1034,6 +1034,9 @@ static void kvm_destroy_dirty_bitmap(struct kvm_mem=
ory_slot *memslot)
>  /* This does not remove the slot from struct kvm_memslots data structure=
s */
>  static void kvm_free_memslot(struct kvm *kvm, struct kvm_memory_slot *sl=
ot)
>  {
> +       if (slot->flags & KVM_MEM_PRIVATE)
> +               kvm_gmem_unbind(slot);
> +

Should this be called after kvm_arch_free_memslot()? Arch-specific ode
might need some of the data before the unbinding, something I thought
might be necessary at one point for the pKVM port when deleting a
memslot, but realized later that kvm_invalidate_memslot() ->
kvm_arch_guest_memory_reclaimed() was the more logical place for it.
Also, since that seems to be the pattern for arch-specific handlers in
KVM.

>         kvm_destroy_dirty_bitmap(slot);
>
>         kvm_arch_free_memslot(kvm, slot);

...

Cheers,
/fuad
