Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64D6D7E0EC5
	for <lists+linux-mips@lfdr.de>; Sat,  4 Nov 2023 11:28:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231809AbjKDK2j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Nov 2023 06:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjKDK2i (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 4 Nov 2023 06:28:38 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5F0D45;
        Sat,  4 Nov 2023 03:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699093715; x=1730629715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5TP8v/J0LaSvm65b/oAssWoyHA+UqQe21NaYSLdqziw=;
  b=foGeNAp0gbxaUJ9/YsLvEz8DKYJl5tcAeoh7PLnYxdlRQfGTvVJIvoH/
   XpA9z1GmvXZMlBjf/lHuFLq+pXl8qn74JPPdGHpVUqWHKKeb9qfTS93r8
   j+5DOEvayTRcVHosAJ5/lR3j0LHbk6iWcG1YaT61LiG4I9j2CfpvCgYs6
   dehAI6a72P+2O7QIw2CDhPNFfbYGdIKmHEic+F+esqdEfj+G78ehZENx1
   oqy2dla4absGwqhR4tC3Vd1g6avCoqkKkRFmwhrxYjEzrIUxLwbqbJF2o
   uCjC4afLNyV9SP9ReMgny2iIexaGPFqUURPrtEVE+EjOeLmTKeq+1Hm8F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="453377379"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="453377379"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 03:28:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="796860179"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="796860179"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orsmga001.jf.intel.com with ESMTP; 04 Nov 2023 03:28:23 -0700
Date:   Sat, 4 Nov 2023 18:26:55 +0800
From:   Xu Yilun <yilun.xu@linux.intel.com>
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
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
Message-ID: <ZUYcb6no9ADYytrx@yilunxu-OptiPlex-7050>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-17-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027182217.3615211-17-seanjc@google.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> +KVM_SET_USER_MEMORY_REGION2 is an extension to KVM_SET_USER_MEMORY_REGION that
> +allows mapping guest_memfd memory into a guest.  All fields shared with
> +KVM_SET_USER_MEMORY_REGION identically.  Userspace can set KVM_MEM_PRIVATE in
> +flags to have KVM bind the memory region to a given guest_memfd range of
> +[guest_memfd_offset, guest_memfd_offset + memory_size].  The target guest_memfd
                                                        ^
The range end should be exclusive, is it?

> +must point at a file created via KVM_CREATE_GUEST_MEMFD on the current VM, and
> +the target range must not be bound to any other memory region.  All standard
> +bounds checks apply (use common sense).
> +
>  ::
>  
>    struct kvm_userspace_memory_region2 {
> @@ -6087,9 +6096,24 @@ applied.
>  	__u64 guest_phys_addr;
>  	__u64 memory_size; /* bytes */
>  	__u64 userspace_addr; /* start of the userspace allocated memory */
> +  __u64 guest_memfd_offset;
> +	__u32 guest_memfd;
> +	__u32 pad1;
> +	__u64 pad2[14];
>    };
>  

[...]

> +static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
> +{
> +	const char *anon_name = "[kvm-gmem]";
> +	struct kvm_gmem *gmem;
> +	struct inode *inode;
> +	struct file *file;
> +	int fd, err;
> +
> +	fd = get_unused_fd_flags(0);
> +	if (fd < 0)
> +		return fd;
> +
> +	gmem = kzalloc(sizeof(*gmem), GFP_KERNEL);
> +	if (!gmem) {
> +		err = -ENOMEM;
> +		goto err_fd;
> +	}
> +
> +	/*
> +	 * Use the so called "secure" variant, which creates a unique inode
> +	 * instead of reusing a single inode.  Each guest_memfd instance needs
> +	 * its own inode to track the size, flags, etc.
> +	 */
> +	file = anon_inode_getfile_secure(anon_name, &kvm_gmem_fops, gmem,
> +					 O_RDWR, NULL);
> +	if (IS_ERR(file)) {
> +		err = PTR_ERR(file);
> +		goto err_gmem;
> +	}
> +
> +	file->f_flags |= O_LARGEFILE;
> +
> +	inode = file->f_inode;
> +	WARN_ON(file->f_mapping != inode->i_mapping);

Just curious, why should we check the mapping fields which is garanteed in
other subsystem?

> +
> +	inode->i_private = (void *)(unsigned long)flags;
> +	inode->i_op = &kvm_gmem_iops;
> +	inode->i_mapping->a_ops = &kvm_gmem_aops;
> +	inode->i_mode |= S_IFREG;
> +	inode->i_size = size;
> +	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
> +	mapping_set_unmovable(inode->i_mapping);
> +	/* Unmovable mappings are supposed to be marked unevictable as well. */
> +	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
> +
> +	kvm_get_kvm(kvm);
> +	gmem->kvm = kvm;
> +	xa_init(&gmem->bindings);
> +	list_add(&gmem->entry, &inode->i_mapping->private_list);
> +
> +	fd_install(fd, file);
> +	return fd;
> +
> +err_gmem:
> +	kfree(gmem);
> +err_fd:
> +	put_unused_fd(fd);
> +	return err;
> +}

[...]

> +int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
> +		  unsigned int fd, loff_t offset)
> +{
> +	loff_t size = slot->npages << PAGE_SHIFT;
> +	unsigned long start, end;
> +	struct kvm_gmem *gmem;
> +	struct inode *inode;
> +	struct file *file;
> +
> +	BUILD_BUG_ON(sizeof(gfn_t) != sizeof(slot->gmem.pgoff));
> +
> +	file = fget(fd);
> +	if (!file)
> +		return -EBADF;
> +
> +	if (file->f_op != &kvm_gmem_fops)
> +		goto err;
> +
> +	gmem = file->private_data;
> +	if (gmem->kvm != kvm)
> +		goto err;
> +
> +	inode = file_inode(file);
> +
> +	if (offset < 0 || !PAGE_ALIGNED(offset))
> +		return -EINVAL;

Should also "goto err" here.

> +
> +	if (offset + size > i_size_read(inode))
> +		goto err;
> +
> +	filemap_invalidate_lock(inode->i_mapping);
> +
> +	start = offset >> PAGE_SHIFT;
> +	end = start + slot->npages;
> +
> +	if (!xa_empty(&gmem->bindings) &&
> +	    xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT)) {
> +		filemap_invalidate_unlock(inode->i_mapping);
> +		goto err;
> +	}
> +
> +	/*
> +	 * No synchronize_rcu() needed, any in-flight readers are guaranteed to
> +	 * be see either a NULL file or this new file, no need for them to go
> +	 * away.
> +	 */
> +	rcu_assign_pointer(slot->gmem.file, file);
> +	slot->gmem.pgoff = start;
> +
> +	xa_store_range(&gmem->bindings, start, end - 1, slot, GFP_KERNEL);
> +	filemap_invalidate_unlock(inode->i_mapping);
> +
> +	/*
> +	 * Drop the reference to the file, even on success.  The file pins KVM,
> +	 * not the other way 'round.  Active bindings are invalidated if the
                             ^
around?

Thanks,
Yilun

> +	 * file is closed before memslots are destroyed.
> +	 */
> +	fput(file);
> +	return 0;
> +
> +err:
> +	fput(file);
> +	return -EINVAL;
> +}
