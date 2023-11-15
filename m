Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF337E1F2E
	for <lists+linux-mips@lfdr.de>; Mon,  6 Nov 2023 12:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjKFLDx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Nov 2023 06:03:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbjKFLDw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Nov 2023 06:03:52 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38AB9C6
        for <linux-mips@vger.kernel.org>; Mon,  6 Nov 2023 03:03:49 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-66d09b6d007so30993306d6.1
        for <linux-mips@vger.kernel.org>; Mon, 06 Nov 2023 03:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699268628; x=1699873428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQ8TONDIpPhmTy6Gjm0dgeV6egeVVxfnh06xkrQleLY=;
        b=TonV0kcqKq1XY1Ybr3NXfEZUxfWiPs619VEWGjQyvxDcke1wV+eXBbxsGimGZt5nrT
         Bh+NlZWUA+4UZzYVihMFMDzLd1uW9iuuvsDON9B3VlGmg1AsnYauXfFrxr7rc0MeLAd0
         WbDSvbaxbi8sxaVirHWVy19hlezi6XqgnuoUxH+ofN5STYZi7InmsMWNlUt6EChdCDJ9
         MeyNLF5DVIpi4uLkxN52z83Zasid1RCGNmI680HjJ+YK3GbnUjCSdRECrmaaWw5L+fGL
         2RRWgINqlNPQ7BC7k1RyScqYG4RVaa6U+iitbOKUoi5UubBS571J3wl8+TIYOOHP7WhA
         tjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268628; x=1699873428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQ8TONDIpPhmTy6Gjm0dgeV6egeVVxfnh06xkrQleLY=;
        b=i8HfSXbhm3+Y2paNoB29inmS2Xv26lKAnkqLXsOvjpn0JWsu8cXQbqbpZdO8bE2D3x
         SgzI38D72T/OTgOYWZI9Etcw+WOhYhCMG52LnJ4/uifLzbchnYlJwLcvwFWugLfYPmJt
         A6MzhEnLE1Ks0Lr8Q4pWkr+kGYRgegliSyAJUcCBpqLcf6+eYKLRFAGSY1r1IFdvKYGS
         L0jH1sEzbD3YzCLw8WcRKuhMMg/4Ge0E6VpoD9QSqQ0YK7nWUBdxCOqh750lHIJwSwEp
         J5m/tSqkH6/Dk7q94HZo+i6QLAufof7Z9pdyFYUmzENa0uRrZCVNyHaQeMpTUSIpZxga
         FeTw==
X-Gm-Message-State: AOJu0Yzzee0gIrd0aVgmjib96KYoYbFebXplg+QqSV+Y++NzuJ1I0rPf
        HWtyjowz/XTfOtUI+nvYOkztHzx5AjpyUWH9vq0nhs7Z49cn2qVynoGajBBOK2U=
X-Google-Smtp-Source: AGHT+IHHh4fCnCxDMnJOn7/R0pkHJKwXr6C+d2r8s0u73YKLv4MHtUig5I9yHuaqDmXCQ/Y0QVlMeO42z9uduKCvqDI=
X-Received: by 2002:a0c:f1ca:0:b0:66d:28a5:d153 with SMTP id
 u10-20020a0cf1ca000000b0066d28a5d153mr26974988qvl.47.1699268628158; Mon, 06
 Nov 2023 03:03:48 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-24-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-24-pbonzini@redhat.com>
From:   Fuad Tabba <tabba@google.com>
Date:   Mon, 6 Nov 2023 11:03:12 +0000
Message-ID: <CA+EHjTw1RGEKD6Zv_QEtzTLLA4STTQrS4WYCY-HUdScAKXfBGg@mail.gmail.com>
Subject: Re: [PATCH 23/34] KVM: selftests: Convert lib's mem regions to KVM_SET_USER_MEMORY_REGION2
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
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
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Nov 5, 2023 at 4:33=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Use KVM_SET_USER_MEMORY_REGION2 throughout KVM's selftests library so tha=
t
> support for guest private memory can be added without needing an entirely
> separate set of helpers.
>
> Note, this obviously makes selftests backwards-incompatible with older KV=
M
> versions from this point forward.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Message-Id: <20231027182217.3615211-26-seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  .../selftests/kvm/include/kvm_util_base.h     |  2 +-
>  tools/testing/selftests/kvm/lib/kvm_util.c    | 19 ++++++++++---------
>  2 files changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/=
testing/selftests/kvm/include/kvm_util_base.h
> index 967eaaeacd75..9f144841c2ee 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -44,7 +44,7 @@ typedef uint64_t vm_paddr_t; /* Virtual Machine (Guest)=
 physical address */
>  typedef uint64_t vm_vaddr_t; /* Virtual Machine (Guest) virtual address =
*/
>
>  struct userspace_mem_region {
> -       struct kvm_userspace_memory_region region;
> +       struct kvm_userspace_memory_region2 region;
>         struct sparsebit *unused_phy_pages;
>         int fd;
>         off_t offset;
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/s=
elftests/kvm/lib/kvm_util.c
> index f09295d56c23..3676b37bea38 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -453,8 +453,9 @@ void kvm_vm_restart(struct kvm_vm *vmp)
>                 vm_create_irqchip(vmp);
>
>         hash_for_each(vmp->regions.slot_hash, ctr, region, slot_node) {
> -               int ret =3D ioctl(vmp->fd, KVM_SET_USER_MEMORY_REGION, &r=
egion->region);
> -               TEST_ASSERT(ret =3D=3D 0, "KVM_SET_USER_MEMORY_REGION IOC=
TL failed,\n"
> +               int ret =3D ioctl(vmp->fd, KVM_SET_USER_MEMORY_REGION2, &=
region->region);
> +
> +               TEST_ASSERT(ret =3D=3D 0, "KVM_SET_USER_MEMORY_REGION2 IO=
CTL failed,\n"
>                             "  rc: %i errno: %i\n"
>                             "  slot: %u flags: 0x%x\n"
>                             "  guest_phys_addr: 0x%llx size: 0x%llx",
> @@ -657,7 +658,7 @@ static void __vm_mem_region_delete(struct kvm_vm *vm,
>         }
>
>         region->region.memory_size =3D 0;
> -       vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION, &region->region);
> +       vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION2, &region->region);
>
>         sparsebit_free(&region->unused_phy_pages);
>         ret =3D munmap(region->mmap_start, region->mmap_size);
> @@ -1014,8 +1015,8 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
>         region->region.guest_phys_addr =3D guest_paddr;
>         region->region.memory_size =3D npages * vm->page_size;
>         region->region.userspace_addr =3D (uintptr_t) region->host_mem;
> -       ret =3D __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION, &region->regio=
n);
> -       TEST_ASSERT(ret =3D=3D 0, "KVM_SET_USER_MEMORY_REGION IOCTL faile=
d,\n"
> +       ret =3D __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION2, &region->regi=
on);
> +       TEST_ASSERT(ret =3D=3D 0, "KVM_SET_USER_MEMORY_REGION2 IOCTL fail=
ed,\n"
>                 "  rc: %i errno: %i\n"
>                 "  slot: %u flags: 0x%x\n"
>                 "  guest_phys_addr: 0x%lx size: 0x%lx",
> @@ -1097,9 +1098,9 @@ void vm_mem_region_set_flags(struct kvm_vm *vm, uin=
t32_t slot, uint32_t flags)
>
>         region->region.flags =3D flags;
>
> -       ret =3D __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION, &region->regio=
n);
> +       ret =3D __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION2, &region->regi=
on);
>
> -       TEST_ASSERT(ret =3D=3D 0, "KVM_SET_USER_MEMORY_REGION IOCTL faile=
d,\n"
> +       TEST_ASSERT(ret =3D=3D 0, "KVM_SET_USER_MEMORY_REGION2 IOCTL fail=
ed,\n"
>                 "  rc: %i errno: %i slot: %u flags: 0x%x",
>                 ret, errno, slot, flags);
>  }
> @@ -1127,9 +1128,9 @@ void vm_mem_region_move(struct kvm_vm *vm, uint32_t=
 slot, uint64_t new_gpa)
>
>         region->region.guest_phys_addr =3D new_gpa;
>
> -       ret =3D __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION, &region->regio=
n);
> +       ret =3D __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION2, &region->regi=
on);
>
> -       TEST_ASSERT(!ret, "KVM_SET_USER_MEMORY_REGION failed\n"
> +       TEST_ASSERT(!ret, "KVM_SET_USER_MEMORY_REGION2 failed\n"
>                     "ret: %i errno: %i slot: %u new_gpa: 0x%lx",
>                     ret, errno, slot, new_gpa);
>  }
> --
> 2.39.1
>
>
