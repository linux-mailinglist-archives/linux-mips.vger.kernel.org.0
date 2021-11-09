Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF1344A40E
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 02:38:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239142AbhKIBlU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Nov 2021 20:41:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237858AbhKIBlO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Nov 2021 20:41:14 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1D6AC04CAC2
        for <linux-mips@vger.kernel.org>; Mon,  8 Nov 2021 17:17:44 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id p18so17796917plf.13
        for <linux-mips@vger.kernel.org>; Mon, 08 Nov 2021 17:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gT3MUMtIZ0PS90yl0lE9QBzqwoRSMBq2QOt4vNKzTys=;
        b=b13sxWM9K5iisnYPadl4iOffaoys9RijOi3mTsZncT79yh0EYcQ5zP36xW3B53gbfI
         hf38uXQxIRmk/GO8JXWSnV+gRSRIGZYtVYUdIsHAt6HO9GbiW9mBH/HQFPbdGVhmJzAE
         d+5xCaoOiMJhRE25WFHguzeVSIifxnExemfwDQtGBdPF4S9WTr8CvKXghy1m1SqKVnwm
         EERujOqfJ1YA7bmWxiB6FDxmsEbHoK9/PEVJSGjKx5CzfV6eZDPa/bWo0671IUu3X0m3
         XIR3TxcculNhN3pd4DHjS7KL7tM8G3YWRmURA4LG43nJsj/84/En3IvJRGamYai7QoJh
         2EpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gT3MUMtIZ0PS90yl0lE9QBzqwoRSMBq2QOt4vNKzTys=;
        b=FR2VYe/kicqXO5Qb0OdVxSNjy42NbhWfZNyDC2MdXbY6WvbbHlLUuRLUmWBfu2RqSG
         JAVphWePvRC9eja6tKE2Llan+H+v5sn4+Hh+7vWXi0/h6WnUTWcavC0esEmZl/C2TQhx
         tPuDVacisPy/vqcrttWlVHm+CI7d10zU9M1W/zO/5pZwNVuBtu3nBlg2wJVvjAxxNNcM
         vJ3016kDUsuf6rs8sx2jksbfD1SGNqqr1oqaw/nI1C1q73ZDyyi+QO6xXXLHiLP/+Vz7
         AhUfcclPWpxN7cAt/dZzdggtqa62atf5UavECKT+40Fy2S0OiVUDsPwDRafTHl7xvKDJ
         jciQ==
X-Gm-Message-State: AOAM5325d6XYp97M90yT8wzGH4eZi8q9+UrR+LJb8LBJ4ckNws7z8HVK
        SHzybC7IdDNddc+19sx0oUEpHA==
X-Google-Smtp-Source: ABdhPJxdGShKmFpj2IYQOxd+oGtoXe5J3Pj9Ip1XNoCcHBZfb0/9N7iKTadK2twJpq0wRG+MfXG5fA==
X-Received: by 2002:a17:902:6acb:b0:142:76c3:d35f with SMTP id i11-20020a1709026acb00b0014276c3d35fmr3494468plt.89.1636420663931;
        Mon, 08 Nov 2021 17:17:43 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id q13sm18256433pfj.26.2021.11.08.17.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 17:17:43 -0800 (PST)
Date:   Tue, 9 Nov 2021 01:17:39 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Atish Patra <atish.patra@wdc.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ben Gardon <bgardon@google.com>, Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Anup Patel <anup.patel@wdc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5.5 01/30] KVM: Ensure local memslot copies operate on
 up-to-date arch-specific data
Message-ID: <YYnMM17yXMq8cCTn@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-2-seanjc@google.com>
 <6407c2d3-854b-edf6-9990-b54a5baedd0a@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6407c2d3-854b-edf6-9990-b54a5baedd0a@oracle.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 09, 2021, Maciej S. Szmigiero wrote:
> On 04.11.2021 01:25, Sean Christopherson wrote:
> > @@ -1597,6 +1596,26 @@ static int kvm_set_memslot(struct kvm *kvm,
> >   		kvm_copy_memslots(slots, __kvm_memslots(kvm, as_id));
> >   	}
> > +	/*
> > +	 * Make a full copy of the old memslot, the pointer will become stale
> > +	 * when the memslots are re-sorted by update_memslots(), and the old
> > +	 * memslot needs to be referenced after calling update_memslots(), e.g.
> > +	 * to free its resources and for arch specific behavior.  This needs to
> > +	 * happen *after* (re)acquiring slots_arch_lock.
> > +	 */
> > +	slot = id_to_memslot(slots, new->id);
> > +	if (slot) {
> > +		old = *slot;
> > +	} else {
> > +		WARN_ON_ONCE(change != KVM_MR_CREATE);
> > +		memset(&old, 0, sizeof(old));
> > +		old.id = new->id;
> > +		old.as_id = as_id;
> > +	}
> > +
> > +	/* Copy the arch-specific data, again after (re)acquiring slots_arch_lock. */
> > +	memcpy(&new->arch, &old.arch, sizeof(old.arch));
> 
> Had "new" been zero-initialized completely in __kvm_set_memory_region()
> for safety (so it does not contain stack garbage - I don't mean just the
> new.arch field in the "if (!old.npages)" branch in that function but the
> whole struct) this line would be needed only in the "if (slot)" branch
> above (as Ben said).
> 
> Also, when patch 7 from this series removes this memcpy(),
> kvm_arch_prepare_memory_region() does indeed receive this field
> uninitialized - I know only x86 and ppcHV care
> and kvm_alloc_memslot_metadata() or kvmppc_core_prepare_memory_region_hv()
> then overwrites it unconditionally but it feels a bit wrong.
> 
> I am almost certain that compiler would figure out to only actually
> zero the fields that wouldn't be overwritten immediately anyway.
> 
> But on the other hand, this patch is only a fix for code that's going
> to be replaced anyway so perfection here probably isn't that important.

Yeah, that about sums up my feelings about the existing code.  That said, an
individual memslot isn't _that_ big, and memslot updates without the scalable
implementation are dreadfully slow anyways, so I'm leaning strongly toward your
suggestion of zeroing all of new as part of this fix.
