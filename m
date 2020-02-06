Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 387ED154E8B
	for <lists+linux-mips@lfdr.de>; Thu,  6 Feb 2020 23:04:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgBFWEG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Feb 2020 17:04:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33989 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727499AbgBFWEC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Feb 2020 17:04:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581026642;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dz1uoo006UjtoREFQWYnwIS83IIptUYIWImaDlSbYB4=;
        b=OtZPbKzWNEiYGadDkglDvcdNtFQxrhshx2oc0i0bxXjY8QKGwYnbiHdWWkrrA/T7FbDFu3
        P/KechaVpvoGdoebPJ+OV6BmOWSYh0HgDiZrKYC++m2f4Pi/KLAbmAz3CjjvCIYVAkw4xX
        K2clHPYio2kYsaSvkATq2yu126uf9C0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-Y0VrQl-DMTGOPn1Smrnvbg-1; Thu, 06 Feb 2020 17:03:59 -0500
X-MC-Unique: Y0VrQl-DMTGOPn1Smrnvbg-1
Received: by mail-qv1-f71.google.com with SMTP id ce2so4589164qvb.23
        for <linux-mips@vger.kernel.org>; Thu, 06 Feb 2020 14:03:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dz1uoo006UjtoREFQWYnwIS83IIptUYIWImaDlSbYB4=;
        b=p8PMgZFcarrPQDU22HuvqV0QlZiRQgoOMa+YDrzjuqLQgInr4cZGnzWSh6EPysDVjX
         xlti6prPXUlyfkUa/d9Bqs7GT9a9ZK1c7tWVC0vKKREVzs5SrL39kr9jaCQyaQraga4j
         s1r9i1itzR1OY8xR6bXzbiOxc6Xsus+1wrv1Qo5pGo7pOF20kcsKkBLvf4X3ig8f5iN4
         lj0lz1ipu0xyNIHinwaRjSSyWBnRo4Hg8fyiL+xab9dicucsVrcGZ+oFAU6Q65N+O1t4
         7/EbtcVwe0gi3dbX82V94O5fZuy4wYkgsIZ+yqnFtgMXD11l24C4N6M+XDk6Fh50D21u
         G/7Q==
X-Gm-Message-State: APjAAAUhWtDAYtSuPW4DXgLn+vO8KgYpXoOxW5lnbu9fUoXNiJVRaC/c
        hz3PGirpZ5zFUr25E4XI9lec6RseG1/pSN9FNuDMDa15+s2tNrU8rYH3ALms9kGEh3HajFK9cGI
        eNyz//cVMDze7GuZvAA2DVA==
X-Received: by 2002:ac8:7396:: with SMTP id t22mr4707011qtp.269.1581026639166;
        Thu, 06 Feb 2020 14:03:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqwu2LJdikIjEQUWHwIaSDYrGQrBVVncwkTn7Iy+PzbVsPREs+ohxiEeOt5zr/YlX26hX6iftw==
X-Received: by 2002:ac8:7396:: with SMTP id t22mr4706974qtp.269.1581026638877;
        Thu, 06 Feb 2020 14:03:58 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c8:32::2])
        by smtp.gmail.com with ESMTPSA id i7sm312515qki.83.2020.02.06.14.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 14:03:58 -0800 (PST)
Date:   Thu, 6 Feb 2020 17:03:55 -0500
From:   Peter Xu <peterx@redhat.com>
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     James Hogan <jhogan@kernel.org>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Wanpeng Li <wanpengli@tencent.com>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
        Joerg Roedel <joro@8bytes.org>,
        Cornelia Huck <cohuck@redhat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        kvmarm@lists.cs.columbia.edu, Jim Mattson <jmattson@google.com>
Subject: Re: [PATCH v4 16/19] KVM: Ensure validity of memslot with respect to
 kvm_get_dirty_log()
Message-ID: <20200206220355.GH700495@xz-x1>
References: <20191217204041.10815-1-sean.j.christopherson@intel.com>
 <20191217204041.10815-17-sean.j.christopherson@intel.com>
 <20191224181930.GC17176@xz-x1>
 <20200114182506.GF16784@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200114182506.GF16784@linux.intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 14, 2020 at 10:25:07AM -0800, Sean Christopherson wrote:
> On Tue, Dec 24, 2019 at 01:19:30PM -0500, Peter Xu wrote:
> > On Tue, Dec 17, 2019 at 12:40:38PM -0800, Sean Christopherson wrote:
> > > +int kvm_get_dirty_log(struct kvm *kvm, struct kvm_dirty_log *log,
> > > +		      int *is_dirty, struct kvm_memory_slot **memslot)
> > >  {
> > >  	struct kvm_memslots *slots;
> > > -	struct kvm_memory_slot *memslot;
> > >  	int i, as_id, id;
> > >  	unsigned long n;
> > >  	unsigned long any = 0;
> > >  
> > > +	*memslot = NULL;
> > > +	*is_dirty = 0;
> > > +
> > >  	as_id = log->slot >> 16;
> > >  	id = (u16)log->slot;
> > >  	if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_USER_MEM_SLOTS)
> > >  		return -EINVAL;
> > >  
> > >  	slots = __kvm_memslots(kvm, as_id);
> > > -	memslot = id_to_memslot(slots, id);
> > > -	if (!memslot->dirty_bitmap)
> > > +	*memslot = id_to_memslot(slots, id);
> > > +	if (!(*memslot)->dirty_bitmap)
> > >  		return -ENOENT;
> > >  
> > > -	n = kvm_dirty_bitmap_bytes(memslot);
> > > +	kvm_arch_sync_dirty_log(kvm, *memslot);
> > 
> > Should this line belong to previous patch?
> 
> No.
> 
> The previous patch, "KVM: Provide common implementation for generic dirty
> log functions", is consolidating the implementation of dirty log functions
> for architectures with CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y.
> 
> This code is being moved from s390's kvm_vm_ioctl_get_dirty_log(), as s390
> doesn't select KVM_GENERIC_DIRTYLOG_READ_PROTECT.  It's functionally a nop
> as kvm_arch_sync_dirty_log() is empty for PowerPC, the only other arch that
> doesn't select KVM_GENERIC_DIRTYLOG_READ_PROTECT.
> 
> Arguably, the call to kvm_arch_sync_dirty_log() should be moved in a
> separate prep patch.  It can't be a follow-on patch as that would swap the
> ordering of kvm_arch_sync_dirty_log() and kvm_dirty_bitmap_bytes(), etc...
> 
> My reasoning for not splitting it to a separate patch is that prior to this
> patch, the common code and arch specific code are doing separate memslot
> lookups via id_to_memslot(), i.e. moving the kvm_arch_sync_dirty_log() call
> would operate on a "different" memslot.   It can't actually be a different
> memslot because slots_lock is held, it just felt weird.
> 
> All that being said, I don't have a strong opinion on moving the call to
> kvm_arch_sync_dirty_log() in a separate patch; IIRC, I vascillated between
> the two options when writing the code.  If anyone wants it to be a separate
> patch I'll happily split it out.

(Sorry to respond so late)

I think the confusing part is the subject, where you only mentioned
the memslot change.  IMHO you can split the change to make it clearer,
or at least would you mind mention that kvm_arch_sync_dirty_log() move
in the commit message?  Thanks,

-- 
Peter Xu

