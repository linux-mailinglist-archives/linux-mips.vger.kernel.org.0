Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B08A7DF45C
	for <lists+linux-mips@lfdr.de>; Thu,  2 Nov 2023 14:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbjKBNzp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 Nov 2023 09:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbjKBNzo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 Nov 2023 09:55:44 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC59C182
        for <linux-mips@vger.kernel.org>; Thu,  2 Nov 2023 06:55:39 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-4a40c8dd9b0so416310e0c.0
        for <linux-mips@vger.kernel.org>; Thu, 02 Nov 2023 06:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698933339; x=1699538139; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Yb/48Ns1tpOy5twJOpAhL4i1qPmUF1LLO7pfzUXbus=;
        b=FuZ9OSc+DNLYTFx2ZAnHD26IiNmPDELlQgibZwwNBWqFj+xZKbh3rEmPDk4dwlN5ps
         f6N7kvONIFqMk6YxGh7uH5M6yu0LP5pjEgj30EZ5tpJgCP3ZK+aeMjykv2uYHLZkRSj4
         9KDe2OWSfOnF7tE3VaApiMt5qbuLd6DPNxIGyz/9Gid/YMyH5LdpXNUNj/ZotkWrmJLX
         CFi3qdF6FLhCom1Ak1TKi1cOFDxvT3spVbXTG+D9KSjLNjgTns/DMtFwd99veQIsMnS3
         t1bKhgEdcCH+ZF2lLeUJu+RfdirKBzoHRRp66wNhPytJ1D/Sx4HcIwjWCRHr72bVucoV
         z1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698933339; x=1699538139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Yb/48Ns1tpOy5twJOpAhL4i1qPmUF1LLO7pfzUXbus=;
        b=Psv9NYAlJmtAeXP7TskRs1Pja4Pz65RzVgNplGh5BcUxLV/cXjcMtoqBLW28TjrF4j
         impMd/xcYgXEk47OoxpSelXfOVb9San8OWcrq0cacPpUevqErxipF+SiU8jOn8HKVkbn
         ysYB6Mt1MVXSxQIJpWwHh/7EMfWJL2rHzs0Ch3Go3qYPzIH6RC6LYRaRIlMAM8uTc8XU
         LbUsunJXdZUH11SvWYl0U8U/cRL1RKSN+rCQwZq3tEpMduxlRwNGTtITMdG2UaA6Xoc7
         kYChDBLuhtYpghgnD20+tI279w6gQv8fdQThFHR82IwWnvxZ757Fi8pLIffQeZaY4HXX
         CVIw==
X-Gm-Message-State: AOJu0YwgjkFLTaEnl61jAmCF6S2n5h1oNvjUUhsEjbC2BKeBEmXDbvwh
        NRkWoEG1yKAIfkF7fgx9fw2ODCnfTIgQ6iIKDphc5g==
X-Google-Smtp-Source: AGHT+IHGemWDnkL7WTN8LWokDsgbdlhg4M3963xhuFMSCwbYM702stLA5BFN7Yk4qTk9o3bsEJ0EqjHFUXiDw4OizcA=
X-Received: by 2002:a1f:984f:0:b0:49d:a52a:4421 with SMTP id
 a76-20020a1f984f000000b0049da52a4421mr16094320vke.4.1698933338782; Thu, 02
 Nov 2023 06:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-11-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-11-seanjc@google.com>
From:   Fuad Tabba <tabba@google.com>
Date:   Thu, 2 Nov 2023 13:55:03 +0000
Message-ID: <CA+EHjTx4dQwU3CWzoib_x1tgw66HCtBEiGW_7E8yZxttem6+vw@mail.gmail.com>
Subject: Re: [PATCH v13 10/35] KVM: Add a dedicated mmu_notifier flag for
 reclaiming freed memory
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
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 27, 2023 at 7:22=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Handle AMD SEV's kvm_arch_guest_memory_reclaimed() hook by having
> __kvm_handle_hva_range() return whether or not an overlapping memslot
> was found, i.e. mmu_lock was acquired.  Using the .on_unlock() hook
> works, but kvm_arch_guest_memory_reclaimed() needs to run after dropping
> mmu_lock, which makes .on_lock() and .on_unlock() asymmetrical.
>
> Use a small struct to return the tuple of the notifier-specific return,
> plus whether or not overlap was found.  Because the iteration helpers are
> __always_inlined, practically speaking, the struct will never actually be
> returned from a function call (not to mention the size of the struct will
> be two bytes in practice).
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


>  virt/kvm/kvm_main.c | 53 +++++++++++++++++++++++++++++++--------------
>  1 file changed, 37 insertions(+), 16 deletions(-)
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 3f5b7c2c5327..2bc04c8ae1f4 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -561,6 +561,19 @@ struct kvm_mmu_notifier_range {
>         bool may_block;
>  };
>
> +/*
> + * The inner-most helper returns a tuple containing the return value fro=
m the
> + * arch- and action-specific handler, plus a flag indicating whether or =
not at
> + * least one memslot was found, i.e. if the handler found guest memory.
> + *
> + * Note, most notifiers are averse to booleans, so even though KVM track=
s the
> + * return from arch code as a bool, outer helpers will cast it to an int=
. :-(
> + */
> +typedef struct kvm_mmu_notifier_return {
> +       bool ret;
> +       bool found_memslot;
> +} kvm_mn_ret_t;
> +
>  /*
>   * Use a dedicated stub instead of NULL to indicate that there is no cal=
lback
>   * function/handler.  The compiler technically can't guarantee that a re=
al
> @@ -582,22 +595,25 @@ static const union kvm_mmu_notifier_arg KVM_MMU_NOT=
IFIER_NO_ARG;
>              node;                                                       =
    \
>              node =3D interval_tree_iter_next(node, start, last))      \
>
> -static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
> -                                                 const struct kvm_mmu_no=
tifier_range *range)
> +static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *k=
vm,
> +                                                          const struct k=
vm_mmu_notifier_range *range)
>  {
> -       bool ret =3D false, locked =3D false;
> +       struct kvm_mmu_notifier_return r =3D {
> +               .ret =3D false,
> +               .found_memslot =3D false,
> +       };
>         struct kvm_gfn_range gfn_range;
>         struct kvm_memory_slot *slot;
>         struct kvm_memslots *slots;
>         int i, idx;
>
>         if (WARN_ON_ONCE(range->end <=3D range->start))
> -               return 0;
> +               return r;
>
>         /* A null handler is allowed if and only if on_lock() is provided=
. */
>         if (WARN_ON_ONCE(IS_KVM_NULL_FN(range->on_lock) &&
>                          IS_KVM_NULL_FN(range->handler)))
> -               return 0;
> +               return r;
>
>         idx =3D srcu_read_lock(&kvm->srcu);
>
> @@ -631,8 +647,8 @@ static __always_inline int __kvm_handle_hva_range(str=
uct kvm *kvm,
>                         gfn_range.end =3D hva_to_gfn_memslot(hva_end + PA=
GE_SIZE - 1, slot);
>                         gfn_range.slot =3D slot;
>
> -                       if (!locked) {
> -                               locked =3D true;
> +                       if (!r.found_memslot) {
> +                               r.found_memslot =3D true;
>                                 KVM_MMU_LOCK(kvm);
>                                 if (!IS_KVM_NULL_FN(range->on_lock))
>                                         range->on_lock(kvm);
> @@ -640,14 +656,14 @@ static __always_inline int __kvm_handle_hva_range(s=
truct kvm *kvm,
>                                 if (IS_KVM_NULL_FN(range->handler))
>                                         break;
>                         }
> -                       ret |=3D range->handler(kvm, &gfn_range);
> +                       r.ret |=3D range->handler(kvm, &gfn_range);
>                 }
>         }
>
> -       if (range->flush_on_ret && ret)
> +       if (range->flush_on_ret && r.ret)
>                 kvm_flush_remote_tlbs(kvm);
>
> -       if (locked) {
> +       if (r.found_memslot) {
>                 KVM_MMU_UNLOCK(kvm);
>                 if (!IS_KVM_NULL_FN(range->on_unlock))
>                         range->on_unlock(kvm);
> @@ -655,8 +671,7 @@ static __always_inline int __kvm_handle_hva_range(str=
uct kvm *kvm,
>
>         srcu_read_unlock(&kvm->srcu, idx);
>
> -       /* The notifiers are averse to booleans. :-( */
> -       return (int)ret;
> +       return r;
>  }
>
>  static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
> @@ -677,7 +692,7 @@ static __always_inline int kvm_handle_hva_range(struc=
t mmu_notifier *mn,
>                 .may_block      =3D false,
>         };
>
> -       return __kvm_handle_hva_range(kvm, &range);
> +       return __kvm_handle_hva_range(kvm, &range).ret;
>  }
>
>  static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_noti=
fier *mn,
> @@ -696,7 +711,7 @@ static __always_inline int kvm_handle_hva_range_no_fl=
ush(struct mmu_notifier *mn
>                 .may_block      =3D false,
>         };
>
> -       return __kvm_handle_hva_range(kvm, &range);
> +       return __kvm_handle_hva_range(kvm, &range).ret;
>  }
>
>  static bool kvm_change_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *r=
ange)
> @@ -798,7 +813,7 @@ static int kvm_mmu_notifier_invalidate_range_start(st=
ruct mmu_notifier *mn,
>                 .end            =3D range->end,
>                 .handler        =3D kvm_mmu_unmap_gfn_range,
>                 .on_lock        =3D kvm_mmu_invalidate_begin,
> -               .on_unlock      =3D kvm_arch_guest_memory_reclaimed,
> +               .on_unlock      =3D (void *)kvm_null_fn,
>                 .flush_on_ret   =3D true,
>                 .may_block      =3D mmu_notifier_range_blockable(range),
>         };
> @@ -830,7 +845,13 @@ static int kvm_mmu_notifier_invalidate_range_start(s=
truct mmu_notifier *mn,
>         gfn_to_pfn_cache_invalidate_start(kvm, range->start, range->end,
>                                           hva_range.may_block);
>
> -       __kvm_handle_hva_range(kvm, &hva_range);
> +       /*
> +        * If one or more memslots were found and thus zapped, notify arc=
h code
> +        * that guest memory has been reclaimed.  This needs to be done *=
after*
> +        * dropping mmu_lock, as x86's reclaim path is slooooow.
> +        */
> +       if (__kvm_handle_hva_range(kvm, &hva_range).found_memslot)
> +               kvm_arch_guest_memory_reclaimed(kvm);
>
>         return 0;
>  }
> --
> 2.42.0.820.g83a721a137-goog
>
