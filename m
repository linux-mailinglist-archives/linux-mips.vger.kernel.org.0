Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 710227E1F18
	for <lists+linux-mips@lfdr.de>; Mon,  6 Nov 2023 12:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbjKFLBQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Nov 2023 06:01:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231435AbjKFLBO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Nov 2023 06:01:14 -0500
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3BDAD69
        for <linux-mips@vger.kernel.org>; Mon,  6 Nov 2023 03:01:10 -0800 (PST)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-66d24ccc6f2so44900916d6.0
        for <linux-mips@vger.kernel.org>; Mon, 06 Nov 2023 03:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699268470; x=1699873270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/jW8kMjXgRuIy1M2h5sLyMjeudj06HAL2YGYnbzqYU=;
        b=xk/37/Kyvb3Fg0p+JBiy93aO6/TSLlw3zEi7SR7fM3qJjSqlRhd95iSYJJ2lDYDVO3
         AqaK1fIN/jWnxkk7MlLY/ewKay9FOvFj6xi1oyv1QQgM/uSq2RQUpATHv5htNPPA9NrS
         7z9ndrQQo6WCyeIqm8ZrCMgQbX3DmlMKQJiHgcIIjkUcJHcZFs9ih1wPyFZYQ9loAawi
         JNHFoJbJ85GeIxZ5PRNm76VB9MVf8de+Z+ZN7R8TnbfEEZIilJSJudmj754RaFkmnZ6e
         n1KnM4uBdrSq7oqu5ArlM5AWYFuH5/XlDp0sLUrQR7AULfOylj81/JGqd2djHuFMAkcE
         yM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268470; x=1699873270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/jW8kMjXgRuIy1M2h5sLyMjeudj06HAL2YGYnbzqYU=;
        b=FcOL2e9fhBQ+UKJutNmTtum1AaKhaBO9GE0jt4umKGoXo6Jm7kiithydNclMA3jV9N
         9Ukt3kbWglvD1pYfw47i6Xxeus2S5wD2G7FoFnoZIVIXmklVscs/t0xh9y8z4JQA+jyt
         oQsnMbUFwc/XQE5th5asiO7ww/tSlwt0ehfGu3YvPPM7/QwSbUUotVIy/ZFa8uS633lP
         ZgUeMqj2xrohqWSHSJKj+KKfCqqV3NLJSUHbpIjVXEajR3n9Otf3VjIvO65SD8SAKdTY
         Fx3qVgxl22uD6988cHJ6mnKy7feWK3Nfp2Tfm0eifhFYH2KJWm6JGcHH4SByOgRCGBRL
         L1kw==
X-Gm-Message-State: AOJu0Yxzt4a1cGbMtIq/SENY6W5lEBW8Flzycg8xAfvrRAkRbXzKQLcd
        7fgdvvxWmM1RNgpGavJNVBrob4cXTEF+Rc4cLa35Sg==
X-Google-Smtp-Source: AGHT+IFa+nDsKAaimQq1Ix7n3hwLXHpTpfQZZDdbj5Z1OOw4/lGGeIsJrAK++Ef2UwD8IUCAFdqUvFrr7OPKx30gqD8=
X-Received: by 2002:ad4:5ccc:0:b0:66d:593f:9a4c with SMTP id
 iu12-20020ad45ccc000000b0066d593f9a4cmr16991977qvb.2.1699268469649; Mon, 06
 Nov 2023 03:01:09 -0800 (PST)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-24-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-24-seanjc@google.com>
From:   Fuad Tabba <tabba@google.com>
Date:   Mon, 6 Nov 2023 11:00:33 +0000
Message-ID: <CA+EHjTwN8BP+7hDveRyx0d+D3CmQN05kHEpLdi2q27jYBuFzAw@mail.gmail.com>
Subject: Re: [PATCH v13 23/35] KVM: x86: Add support for "protected VMs" that
 can utilize private memory
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

Hi,


On Fri, Oct 27, 2023 at 7:23=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Add a new x86 VM type, KVM_X86_SW_PROTECTED_VM, to serve as a development
> and testing vehicle for Confidential (CoCo) VMs, and potentially to even
> become a "real" product in the distant future, e.g. a la pKVM.
>
> The private memory support in KVM x86 is aimed at AMD's SEV-SNP and
> Intel's TDX, but those technologies are extremely complex (understatement=
),
> difficult to debug, don't support running as nested guests, and require
> hardware that's isn't universally accessible.  I.e. relying SEV-SNP or TD=
X

nit: "that isn't"

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> for maintaining guest private memory isn't a realistic option.
>
> At the very least, KVM_X86_SW_PROTECTED_VM will enable a variety of
> selftests for guest_memfd and private memory support without requiring
> unique hardware.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  Documentation/virt/kvm/api.rst  | 32 ++++++++++++++++++++++++++++++++
>  arch/x86/include/asm/kvm_host.h | 15 +++++++++------
>  arch/x86/include/uapi/asm/kvm.h |  3 +++
>  arch/x86/kvm/Kconfig            | 12 ++++++++++++
>  arch/x86/kvm/mmu/mmu_internal.h |  1 +
>  arch/x86/kvm/x86.c              | 16 +++++++++++++++-
>  include/uapi/linux/kvm.h        |  1 +
>  virt/kvm/Kconfig                |  5 +++++
>  8 files changed, 78 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.=
rst
> index 38dc1fda4f45..00029436ac5b 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -147,10 +147,29 @@ described as 'basic' will be available.
>  The new VM has no virtual cpus and no memory.
>  You probably want to use 0 as machine type.
>
> +X86:
> +^^^^
> +
> +Supported X86 VM types can be queried via KVM_CAP_VM_TYPES.
> +
> +S390:
> +^^^^^
> +
>  In order to create user controlled virtual machines on S390, check
>  KVM_CAP_S390_UCONTROL and use the flag KVM_VM_S390_UCONTROL as
>  privileged user (CAP_SYS_ADMIN).
>
> +MIPS:
> +^^^^^
> +
> +To use hardware assisted virtualization on MIPS (VZ ASE) rather than
> +the default trap & emulate implementation (which changes the virtual
> +memory layout to fit in user mode), check KVM_CAP_MIPS_VZ and use the
> +flag KVM_VM_MIPS_VZ.
> +
> +ARM64:
> +^^^^^^
> +
>  On arm64, the physical address size for a VM (IPA Size limit) is limited
>  to 40bits by default. The limit can be configured if the host supports t=
he
>  extension KVM_CAP_ARM_VM_IPA_SIZE. When supported, use
> @@ -8650,6 +8669,19 @@ block sizes is exposed in KVM_CAP_ARM_SUPPORTED_BL=
OCK_SIZES as a
>  64-bit bitmap (each bit describing a block size). The default value is
>  0, to disable the eager page splitting.
>
> +8.41 KVM_CAP_VM_TYPES
> +---------------------
> +
> +:Capability: KVM_CAP_MEMORY_ATTRIBUTES
> +:Architectures: x86
> +:Type: system ioctl
> +
> +This capability returns a bitmap of support VM types.  The 1-setting of =
bit @n
> +means the VM type with value @n is supported.  Possible values of @n are=
::
> +
> +  #define KVM_X86_DEFAULT_VM   0
> +  #define KVM_X86_SW_PROTECTED_VM      1
> +
>  9. Known KVM API problems
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_h=
ost.h
> index f9e8d5642069..dff10051e9b6 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1244,6 +1244,7 @@ enum kvm_apicv_inhibit {
>  };
>
>  struct kvm_arch {
> +       unsigned long vm_type;
>         unsigned long n_used_mmu_pages;
>         unsigned long n_requested_mmu_pages;
>         unsigned long n_max_mmu_pages;
> @@ -2077,6 +2078,12 @@ void kvm_mmu_new_pgd(struct kvm_vcpu *vcpu, gpa_t =
new_pgd);
>  void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
>                        int tdp_max_root_level, int tdp_huge_page_level);
>
> +#ifdef CONFIG_KVM_PRIVATE_MEM
> +#define kvm_arch_has_private_mem(kvm) ((kvm)->arch.vm_type !=3D KVM_X86_=
DEFAULT_VM)
> +#else
> +#define kvm_arch_has_private_mem(kvm) false
> +#endif
> +
>  static inline u16 kvm_read_ldt(void)
>  {
>         u16 ldt;
> @@ -2125,14 +2132,10 @@ enum {
>  #define HF_SMM_INSIDE_NMI_MASK (1 << 2)
>
>  # define KVM_MAX_NR_ADDRESS_SPACES     2
> +/* SMM is currently unsupported for guests with private memory. */
> +# define kvm_arch_nr_memslot_as_ids(kvm) (kvm_arch_has_private_mem(kvm) =
? 1 : 2)
>  # define kvm_arch_vcpu_memslots_id(vcpu) ((vcpu)->arch.hflags & HF_SMM_M=
ASK ? 1 : 0)
>  # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role=
).smm)
> -
> -static inline int kvm_arch_nr_memslot_as_ids(struct kvm *kvm)
> -{
> -       return KVM_MAX_NR_ADDRESS_SPACES;
> -}
> -
>  #else
>  # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, 0)
>  #endif
> diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/=
kvm.h
> index 1a6a1f987949..a448d0964fc0 100644
> --- a/arch/x86/include/uapi/asm/kvm.h
> +++ b/arch/x86/include/uapi/asm/kvm.h
> @@ -562,4 +562,7 @@ struct kvm_pmu_event_filter {
>  /* x86-specific KVM_EXIT_HYPERCALL flags. */
>  #define KVM_EXIT_HYPERCALL_LONG_MODE   BIT(0)
>
> +#define KVM_X86_DEFAULT_VM     0
> +#define KVM_X86_SW_PROTECTED_VM        1
> +
>  #endif /* _ASM_X86_KVM_H */
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index 091b74599c22..8452ed0228cb 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -77,6 +77,18 @@ config KVM_WERROR
>
>           If in doubt, say "N".
>
> +config KVM_SW_PROTECTED_VM
> +       bool "Enable support for KVM software-protected VMs"
> +       depends on EXPERT
> +       depends on X86_64
> +       select KVM_GENERIC_PRIVATE_MEM
> +       help
> +         Enable support for KVM software-protected VMs.  Currently "prot=
ected"
> +         means the VM can be backed with memory provided by
> +         KVM_CREATE_GUEST_MEMFD.
> +
> +         If unsure, say "N".
> +
>  config KVM_INTEL
>         tristate "KVM for Intel (and compatible) processors support"
>         depends on KVM && IA32_FEAT_CTL
> diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_inter=
nal.h
> index 86c7cb692786..b66a7d47e0e4 100644
> --- a/arch/x86/kvm/mmu/mmu_internal.h
> +++ b/arch/x86/kvm/mmu/mmu_internal.h
> @@ -297,6 +297,7 @@ static inline int kvm_mmu_do_page_fault(struct kvm_vc=
pu *vcpu, gpa_t cr2_or_gpa,
>                 .max_level =3D KVM_MAX_HUGEPAGE_LEVEL,
>                 .req_level =3D PG_LEVEL_4K,
>                 .goal_level =3D PG_LEVEL_4K,
> +               .is_private =3D kvm_mem_is_private(vcpu->kvm, cr2_or_gpa =
>> PAGE_SHIFT),
>         };
>         int r;
>
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index c4d17727b199..e3eb608b6692 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -4441,6 +4441,13 @@ static int kvm_ioctl_get_supported_hv_cpuid(struct=
 kvm_vcpu *vcpu,
>         return 0;
>  }
>
> +static bool kvm_is_vm_type_supported(unsigned long type)
> +{
> +       return type =3D=3D KVM_X86_DEFAULT_VM ||
> +              (type =3D=3D KVM_X86_SW_PROTECTED_VM &&
> +               IS_ENABLED(CONFIG_KVM_SW_PROTECTED_VM) && tdp_enabled);
> +}
> +
>  int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  {
>         int r =3D 0;
> @@ -4632,6 +4639,11 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, =
long ext)
>         case KVM_CAP_X86_NOTIFY_VMEXIT:
>                 r =3D kvm_caps.has_notify_vmexit;
>                 break;
> +       case KVM_CAP_VM_TYPES:
> +               r =3D BIT(KVM_X86_DEFAULT_VM);
> +               if (kvm_is_vm_type_supported(KVM_X86_SW_PROTECTED_VM))
> +                       r |=3D BIT(KVM_X86_SW_PROTECTED_VM);
> +               break;
>         default:
>                 break;
>         }
> @@ -12314,9 +12326,11 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned l=
ong type)
>         int ret;
>         unsigned long flags;
>
> -       if (type)
> +       if (!kvm_is_vm_type_supported(type))
>                 return -EINVAL;
>
> +       kvm->arch.vm_type =3D type;
> +
>         ret =3D kvm_page_track_init(kvm);
>         if (ret)
>                 goto out;
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 29e9eb51dec9..5b5820d19e71 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1218,6 +1218,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_MEMORY_FAULT_INFO 231
>  #define KVM_CAP_MEMORY_ATTRIBUTES 232
>  #define KVM_CAP_GUEST_MEMFD 233
> +#define KVM_CAP_VM_TYPES 234
>
>  #ifdef KVM_CAP_IRQ_ROUTING
>
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index 08afef022db9..2c964586aa14 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -104,3 +104,8 @@ config KVM_GENERIC_MEMORY_ATTRIBUTES
>  config KVM_PRIVATE_MEM
>         select XARRAY_MULTI
>         bool
> +
> +config KVM_GENERIC_PRIVATE_MEM
> +       select KVM_GENERIC_MEMORY_ATTRIBUTES
> +       select KVM_PRIVATE_MEM
> +       bool
> --
> 2.42.0.820.g83a721a137-goog
>
