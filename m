Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC47E7E34F9
	for <lists+linux-mips@lfdr.de>; Tue,  7 Nov 2023 06:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233360AbjKGFrz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Nov 2023 00:47:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjKGFrz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Nov 2023 00:47:55 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B67B92;
        Mon,  6 Nov 2023 21:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699336072; x=1730872072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oqZ5JQNUaGOSPFfGCcRkwAJc+NX/2BP9g4PZc+AIHn4=;
  b=Jznw8oNqapngi7iGnOQu2xN4sNeE8X/jdC9wrmA2lSe8u5Q/1IfD3g/y
   8aF4U6kHAKS135rOsiYEmfXVcFJBBefvKYgLPYNOkMuNrJfwmlZWxtDvg
   SR0Up5AhFdQtMS4/pDe3CooBwTrYgU8A8ldzq+4QvVm8LdV12mqDWK8l7
   4AeP1Ta6LX4v0gGKNkjdUKaXHTslWSBdaCo/odSYBSEbPCRHXi7J8yTAJ
   Wk+9SW1sacDiMvPg6NsA4PxZvdSHCOJ/T027rNJcLLpSbmvTCDXtgWg2w
   zLRNlcPt6bal/frB4sTwzwZ/JePZLyEXIuNKmUjQiSPXH+U9njDRzHpM9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="10978160"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="10978160"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 21:47:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="832964536"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="832964536"
Received: from yy-desk-7060.sh.intel.com (HELO localhost) ([10.239.159.76])
  by fmsmga004.fm.intel.com with ESMTP; 06 Nov 2023 21:47:40 -0800
Date:   Tue, 7 Nov 2023 13:47:40 +0800
From:   Yuan Yao <yuan.yao@linux.intel.com>
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
        Fuad Tabba <tabba@google.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Anish Moorthy <amoorthy@google.com>,
        David Matlack <dmatlack@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
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
Subject: Re: [PATCH 08/34] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
Message-ID: <20231107054739.pamcdd2z564c6xv3@yy-desk-7060>
References: <20231105163040.14904-1-pbonzini@redhat.com>
 <20231105163040.14904-9-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231105163040.14904-9-pbonzini@redhat.com>
User-Agent: NeoMutt/20171215
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Nov 05, 2023 at 05:30:11PM +0100, Paolo Bonzini wrote:
> From: Sean Christopherson <seanjc@google.com>
>
> Introduce a "version 2" of KVM_SET_USER_MEMORY_REGION so that additional
> information can be supplied without setting userspace up to fail.  The
> padding in the new kvm_userspace_memory_region2 structure will be used to
> pass a file descriptor in addition to the userspace_addr, i.e. allow
> userspace to point at a file descriptor and map memory into a guest that
> is NOT mapped into host userspace.
>
> Alternatively, KVM could simply add "struct kvm_userspace_memory_region2"
> without a new ioctl(), but as Paolo pointed out, adding a new ioctl()
> makes detection of bad flags a bit more robust, e.g. if the new fd field
> is guarded only by a flag and not a new ioctl(), then a userspace bug
> (setting a "bad" flag) would generate out-of-bounds access instead of an
> -EINVAL error.
>
> Cc: Jarkko Sakkinen <jarkko@kernel.org>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Fuad Tabba <tabba@google.com>
> Message-Id: <20231027182217.3615211-9-seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  Documentation/virt/kvm/api.rst | 22 +++++++++++++
>  arch/x86/kvm/x86.c             |  2 +-
>  include/linux/kvm_host.h       |  4 +--
>  include/uapi/linux/kvm.h       | 13 ++++++++
>  virt/kvm/kvm_main.c            | 57 +++++++++++++++++++++++++++++-----
>  5 files changed, 87 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 7025b3751027..bdea1423c5f8 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -1340,6 +1340,7 @@ yet and must be cleared on entry.
>  	__u64 guest_phys_addr;
>  	__u64 memory_size; /* bytes */
>  	__u64 userspace_addr; /* start of the userspace allocated memory */
> +	__u64 pad[16];

Looks incorrect to add padding part in kvm_userspace_memory_region,
only need to apply on kvm_userspace_memory_region2 below.

>    };
>
>    /* for kvm_userspace_memory_region::flags */
> @@ -6192,6 +6193,27 @@ to know what fields can be changed for the system register described by
>  ``op0, op1, crn, crm, op2``. KVM rejects ID register values that describe a
>  superset of the features supported by the system.
>
> +4.140 KVM_SET_USER_MEMORY_REGION2
> +---------------------------------
> +
> +:Capability: KVM_CAP_USER_MEMORY2
> +:Architectures: all
> +:Type: vm ioctl
> +:Parameters: struct kvm_userspace_memory_region2 (in)
> +:Returns: 0 on success, -1 on error
> +
> +::
> +
> +  struct kvm_userspace_memory_region2 {
> +	__u32 slot;
> +	__u32 flags;
> +	__u64 guest_phys_addr;
> +	__u64 memory_size; /* bytes */
> +	__u64 userspace_addr; /* start of the userspace allocated memory */
> +  };
> +
> +See KVM_SET_USER_MEMORY_REGION.
> +
>  5. The kvm_run structure
>  ========================
>
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 2c924075f6f1..7b389f27dffc 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -12576,7 +12576,7 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
>  	}
>
>  	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
> -		struct kvm_userspace_memory_region m;
> +		struct kvm_userspace_memory_region2 m;
>
>  		m.slot = id | (i << 16);
>  		m.flags = 0;
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 5faba69403ac..4e741ff27af3 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1146,9 +1146,9 @@ enum kvm_mr_change {
>  };
>
>  int kvm_set_memory_region(struct kvm *kvm,
> -			  const struct kvm_userspace_memory_region *mem);
> +			  const struct kvm_userspace_memory_region2 *mem);
>  int __kvm_set_memory_region(struct kvm *kvm,
> -			    const struct kvm_userspace_memory_region *mem);
> +			    const struct kvm_userspace_memory_region2 *mem);
>  void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot);
>  void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen);
>  int kvm_arch_prepare_memory_region(struct kvm *kvm,
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 211b86de35ac..308cc70bd6ab 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -95,6 +95,16 @@ struct kvm_userspace_memory_region {
>  	__u64 userspace_addr; /* start of the userspace allocated memory */
>  };
>
> +/* for KVM_SET_USER_MEMORY_REGION2 */
> +struct kvm_userspace_memory_region2 {
> +	__u32 slot;
> +	__u32 flags;
> +	__u64 guest_phys_addr;
> +	__u64 memory_size;
> +	__u64 userspace_addr;
> +	__u64 pad[16];
> +};
> +
>  /*
>   * The bit 0 ~ bit 15 of kvm_userspace_memory_region::flags are visible for
>   * userspace, other bits are reserved for kvm internal use which are defined
> @@ -1201,6 +1211,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE 228
>  #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
>  #define KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES 230
> +#define KVM_CAP_USER_MEMORY2 231
>
>  #ifdef KVM_CAP_IRQ_ROUTING
>
> @@ -1483,6 +1494,8 @@ struct kvm_vfio_spapr_tce {
>  					struct kvm_userspace_memory_region)
>  #define KVM_SET_TSS_ADDR          _IO(KVMIO,   0x47)
>  #define KVM_SET_IDENTITY_MAP_ADDR _IOW(KVMIO,  0x48, __u64)
> +#define KVM_SET_USER_MEMORY_REGION2 _IOW(KVMIO, 0x49, \
> +					 struct kvm_userspace_memory_region2)
>
>  /* enable ucontrol for s390 */
>  struct kvm_s390_ucas_mapping {
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index dc81279ea385..756b94ecd511 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1580,7 +1580,15 @@ static void kvm_replace_memslot(struct kvm *kvm,
>  	}
>  }
>
> -static int check_memory_region_flags(const struct kvm_userspace_memory_region *mem)
> +/*
> + * Flags that do not access any of the extra space of struct
> + * kvm_userspace_memory_region2.  KVM_SET_USER_MEMORY_REGION_V1_FLAGS
> + * only allows these.
> + */
> +#define KVM_SET_USER_MEMORY_REGION_V1_FLAGS \
> +	(KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)
> +
> +static int check_memory_region_flags(const struct kvm_userspace_memory_region2 *mem)
>  {
>  	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
>
> @@ -1982,7 +1990,7 @@ static bool kvm_check_memslot_overlap(struct kvm_memslots *slots, int id,
>   * Must be called holding kvm->slots_lock for write.
>   */
>  int __kvm_set_memory_region(struct kvm *kvm,
> -			    const struct kvm_userspace_memory_region *mem)
> +			    const struct kvm_userspace_memory_region2 *mem)
>  {
>  	struct kvm_memory_slot *old, *new;
>  	struct kvm_memslots *slots;
> @@ -2086,7 +2094,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
>  EXPORT_SYMBOL_GPL(__kvm_set_memory_region);
>
>  int kvm_set_memory_region(struct kvm *kvm,
> -			  const struct kvm_userspace_memory_region *mem)
> +			  const struct kvm_userspace_memory_region2 *mem)
>  {
>  	int r;
>
> @@ -2098,7 +2106,7 @@ int kvm_set_memory_region(struct kvm *kvm,
>  EXPORT_SYMBOL_GPL(kvm_set_memory_region);
>
>  static int kvm_vm_ioctl_set_memory_region(struct kvm *kvm,
> -					  struct kvm_userspace_memory_region *mem)
> +					  struct kvm_userspace_memory_region2 *mem)
>  {
>  	if ((u16)mem->slot >= KVM_USER_MEM_SLOTS)
>  		return -EINVAL;
> @@ -4568,6 +4576,7 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
>  {
>  	switch (arg) {
>  	case KVM_CAP_USER_MEMORY:
> +	case KVM_CAP_USER_MEMORY2:
>  	case KVM_CAP_DESTROY_MEMORY_REGION_WORKS:
>  	case KVM_CAP_JOIN_MEMORY_REGIONS_WORKS:
>  	case KVM_CAP_INTERNAL_ERROR_DATA:
> @@ -4823,6 +4832,14 @@ static int kvm_vm_ioctl_get_stats_fd(struct kvm *kvm)
>  	return fd;
>  }
>
> +#define SANITY_CHECK_MEM_REGION_FIELD(field)					\
> +do {										\
> +	BUILD_BUG_ON(offsetof(struct kvm_userspace_memory_region, field) !=		\
> +		     offsetof(struct kvm_userspace_memory_region2, field));	\
> +	BUILD_BUG_ON(sizeof_field(struct kvm_userspace_memory_region, field) !=		\
> +		     sizeof_field(struct kvm_userspace_memory_region2, field));	\
> +} while (0)
> +
>  static long kvm_vm_ioctl(struct file *filp,
>  			   unsigned int ioctl, unsigned long arg)
>  {
> @@ -4845,15 +4862,39 @@ static long kvm_vm_ioctl(struct file *filp,
>  		r = kvm_vm_ioctl_enable_cap_generic(kvm, &cap);
>  		break;
>  	}
> +	case KVM_SET_USER_MEMORY_REGION2:
>  	case KVM_SET_USER_MEMORY_REGION: {
> -		struct kvm_userspace_memory_region kvm_userspace_mem;
> +		struct kvm_userspace_memory_region2 mem;
> +		unsigned long size;
> +
> +		if (ioctl == KVM_SET_USER_MEMORY_REGION) {
> +			/*
> +			 * Fields beyond struct kvm_userspace_memory_region shouldn't be
> +			 * accessed, but avoid leaking kernel memory in case of a bug.
> +			 */
> +			memset(&mem, 0, sizeof(mem));
> +			size = sizeof(struct kvm_userspace_memory_region);
> +		} else {
> +			size = sizeof(struct kvm_userspace_memory_region2);
> +		}
> +
> +		/* Ensure the common parts of the two structs are identical. */
> +		SANITY_CHECK_MEM_REGION_FIELD(slot);
> +		SANITY_CHECK_MEM_REGION_FIELD(flags);
> +		SANITY_CHECK_MEM_REGION_FIELD(guest_phys_addr);
> +		SANITY_CHECK_MEM_REGION_FIELD(memory_size);
> +		SANITY_CHECK_MEM_REGION_FIELD(userspace_addr);
>
>  		r = -EFAULT;
> -		if (copy_from_user(&kvm_userspace_mem, argp,
> -						sizeof(kvm_userspace_mem)))
> +		if (copy_from_user(&mem, argp, size))
>  			goto out;
>
> -		r = kvm_vm_ioctl_set_memory_region(kvm, &kvm_userspace_mem);
> +		r = -EINVAL;
> +		if (ioctl == KVM_SET_USER_MEMORY_REGION &&
> +		    (mem.flags & ~KVM_SET_USER_MEMORY_REGION_V1_FLAGS))
> +			goto out;
> +
> +		r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
>  		break;
>  	}
>  	case KVM_GET_DIRTY_LOG: {
> --
> 2.39.1
>
>
>
