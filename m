Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44719155B61
	for <lists+linux-mips@lfdr.de>; Fri,  7 Feb 2020 17:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbgBGQF4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Feb 2020 11:05:56 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54404 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727048AbgBGQFz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Feb 2020 11:05:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581091554;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Bqsgg9qLeLOSmneB4WSB2dg3BsO/26WgQ0bE3+4CQXQ=;
        b=SWdjhQvl+cjY99onqQfSmtbii2rdFTLZel9iLzpXL6ItSIWJaL793E/VCSuEbyTWlCOEBl
        xR5mK/KPA/inpZSO0FX9t9YFauXybkcUIZG1Upn+bzujrktpBmjYtBfp/dCbrQ5qywruUg
        6txw3wm6FZ/wNBcuSeNthgx6GL9Z3Gg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-_TIU2pjkNqKXd0j6OLYy5g-1; Fri, 07 Feb 2020 11:05:50 -0500
X-MC-Unique: _TIU2pjkNqKXd0j6OLYy5g-1
Received: by mail-qk1-f197.google.com with SMTP id b23so1712191qkg.17
        for <linux-mips@vger.kernel.org>; Fri, 07 Feb 2020 08:05:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bqsgg9qLeLOSmneB4WSB2dg3BsO/26WgQ0bE3+4CQXQ=;
        b=g5/ZtZhVXAwPFads5WJV6A8wIDVeY6lViOqP6dMLsHXxXV88NPZsbUQFfGuJ8bXok0
         Weg3pXCm792rk7s00b/L8rbm6Ww4LMXP9BCk9WSPddyAgK1t01EgaT8doQhQppb3QEHa
         Ob2aOL1oeqoOf5FTloTqMBDvYGt5BYz8xoA0wt5+C2K84x9lK3m5PCRul1pQQX3HVPOX
         zV62r9jKWnLL4yXf65Og5dd0jiOnZ8NlGGxMHXcZvlvL92yA3MKFHV7MbsRB8CoKq4Hw
         5NeHCXNAj1fhaSHe8u/ww7m6mOYVvofSsihfi8KkAlHBX7MWXRTrAULyI5SEyHSTRsAV
         A44Q==
X-Gm-Message-State: APjAAAUw8IoqKemxCE9wzAn6UDIHhn0Vm3+uCRf8laUDgjyNENMqAkpX
        dt6JkER6bvMxkF+CD1e3AoWquyAZ1fDQtmSaeWHv6V+hUEooNM0XZOdl5Yo+ZPAertmKDdPDvSk
        BgU7wMJC3jSH4z0Z/l3pjvg==
X-Received: by 2002:a37:c0c:: with SMTP id 12mr7542952qkm.425.1581091550084;
        Fri, 07 Feb 2020 08:05:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqyBU3fSbdWuwCNOt5og3uav2CnBhaKLUx7zFmWTkehMEXphwviUtToR7q9BtKv4R+OEmMKY/w==
X-Received: by 2002:a37:c0c:: with SMTP id 12mr7542902qkm.425.1581091549699;
        Fri, 07 Feb 2020 08:05:49 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c8:32::2])
        by smtp.gmail.com with ESMTPSA id 69sm1462245qkg.133.2020.02.07.08.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 08:05:48 -0800 (PST)
Date:   Fri, 7 Feb 2020 11:05:46 -0500
From:   Peter Xu <peterx@redhat.com>
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org,
        Christoffer Dall <christoffer.dall@arm.com>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 18/19] KVM: Dynamically size memslot array based on
 number of used slots
Message-ID: <20200207160546.GA707371@xz-x1>
References: <20200121223157.15263-1-sean.j.christopherson@intel.com>
 <20200121223157.15263-19-sean.j.christopherson@intel.com>
 <20200206221208.GI700495@xz-x1>
 <20200207153829.GA2401@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200207153829.GA2401@linux.intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Feb 07, 2020 at 07:38:29AM -0800, Sean Christopherson wrote:
> On Thu, Feb 06, 2020 at 05:12:08PM -0500, Peter Xu wrote:
> > On Tue, Jan 21, 2020 at 02:31:56PM -0800, Sean Christopherson wrote:
> > > Now that the memslot logic doesn't assume memslots are always non-NULL,
> > > dynamically size the array of memslots instead of unconditionally
> > > allocating memory for the maximum number of memslots.
> > > 
> > > Note, because a to-be-deleted memslot must first be invalidated, the
> > > array size cannot be immediately reduced when deleting a memslot.
> > > However, consecutive deletions will realize the memory savings, i.e.
> > > a second deletion will trim the entry.
> > > 
> > > Tested-by: Christoffer Dall <christoffer.dall@arm.com>
> > > Tested-by: Marc Zyngier <maz@kernel.org>
> > > Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> > > ---
> > >  include/linux/kvm_host.h |  2 +-
> > >  virt/kvm/kvm_main.c      | 31 ++++++++++++++++++++++++++++---
> > >  2 files changed, 29 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > > index 60ddfdb69378..8bb6fb127387 100644
> > > --- a/include/linux/kvm_host.h
> > > +++ b/include/linux/kvm_host.h
> > > @@ -431,11 +431,11 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
> > >   */
> > >  struct kvm_memslots {
> > >  	u64 generation;
> > > -	struct kvm_memory_slot memslots[KVM_MEM_SLOTS_NUM];
> > >  	/* The mapping table from slot id to the index in memslots[]. */
> > >  	short id_to_index[KVM_MEM_SLOTS_NUM];
> > >  	atomic_t lru_slot;
> > >  	int used_slots;
> > > +	struct kvm_memory_slot memslots[];
> > 
> > This patch is tested so I believe this works, however normally I need
> > to do similar thing with [0] otherwise gcc might complaint.  Is there
> > any trick behind to make this work?  Or is that because of different
> > gcc versions?
> 
> array[] and array[0] have the same net affect, but array[] is given special
> treatment by gcc to provide extra sanity checks, e.g. requires the field to
> be the end of the struct.  Last I checked, gcc also doesn't allow array[]
> in unions.  There are probably other restrictions.
> 
> But, it's precisely because of those restrictions that using array[] is
> preferred, as it provides extra protections, e.g. if someone moved memslots
> to the top of the struct it would fail to compile.

However...

xz-x1:tmp $ cat a.c
struct a {
    int s[];
};

int main(void) { }
xz-x1:tmp $ make a
cc     a.c   -o a
a.c:2:9: error: flexible array member in a struct with no named members
    2 |     int s[];
      |         ^
make: *** [<builtin>: a] Error 1

My gcc version is 9.2.1 20190827 (Red Hat 9.2.1-1) (GCC).

>  
> > >  };
> > >  
> > >  struct kvm {
> > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > index 9b614cf2ca20..ed392ce64e59 100644
> > > --- a/virt/kvm/kvm_main.c
> > > +++ b/virt/kvm/kvm_main.c
> > > @@ -565,7 +565,7 @@ static struct kvm_memslots *kvm_alloc_memslots(void)
> > >  		return NULL;
> > >  
> > >  	for (i = 0; i < KVM_MEM_SLOTS_NUM; i++)
> > > -		slots->id_to_index[i] = slots->memslots[i].id = -1;
> > > +		slots->id_to_index[i] = -1;
> > >  
> > >  	return slots;
> > >  }
> > > @@ -1077,6 +1077,32 @@ static struct kvm_memslots *install_new_memslots(struct kvm *kvm,
> > >  	return old_memslots;
> > >  }
> > >  
> > > +/*
> > > + * Note, at a minimum, the current number of used slots must be allocated, even
> > > + * when deleting a memslot, as we need a complete duplicate of the memslots for
> > > + * use when invalidating a memslot prior to deleting/moving the memslot.
> > > + */
> > > +static struct kvm_memslots *kvm_dup_memslots(struct kvm_memslots *old,
> > > +					     enum kvm_mr_change change)
> > > +{
> > > +	struct kvm_memslots *slots;
> > > +	size_t old_size, new_size;
> > > +
> > > +	old_size = sizeof(struct kvm_memslots) +
> > > +		   (sizeof(struct kvm_memory_slot) * old->used_slots);
> > > +
> > > +	if (change == KVM_MR_CREATE)
> > > +		new_size = old_size + sizeof(struct kvm_memory_slot);
> > > +	else
> > > +		new_size = old_size;
> > > +
> > > +	slots = kvzalloc(new_size, GFP_KERNEL_ACCOUNT);
> > > +	if (likely(slots))
> > > +		memcpy(slots, old, old_size);
> > 
> > (Maybe directly copy into it?)
> 
> I don't follow, are you saying do "*slots = *old"?
> 
> @new_size and @old_size are not guaranteed to be the same.  More
> specifically, slots->memslots and old->slots are now flexible arrays with
> potentially different sizes.  Doing "*slots = *old" would only copy the
> standard members, a memcpy() would still be needed for @memlots.
> 
> A more effecient implementation would be:
> 
> 	slots = kvalloc(new_size, GFP_KERNEL_ACCOUNT);
> 	if (likely(slots)) {
> 		memcpy(slots, old, old_size);
> 		if (change == KVM_MR_CREATE)
> 			memset((void *)slots + old_size, 0, new_size - old_size);
> 	}
> 
> to avoid unnecessarily zeroing out the entire thing.  I opted for the
> simpler implementation as this is not performance critical code, for most
> cases @slots won't be all that large, and I wanted to be absolutely sure
> any mixup would hit zeroed memory and not uninitialized memory.

I made a silly mistake on reading "slots" as "old".  Ignore my
comment, sorry!  And please take my R-b for this patch too:

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

