Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0178B156129
	for <lists+linux-mips@lfdr.de>; Fri,  7 Feb 2020 23:24:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbgBGWYq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Feb 2020 17:24:46 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:55046 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727031AbgBGWYp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Feb 2020 17:24:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581114284;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JRnjR1s6c5pJE2ossLQbJM2NZYkPQ/exCWBRJ0Gziy8=;
        b=JVIH2sFE1+gNZomg8s9GDeK4Ckm08xmCey9ElrWa7O/3f1y9MikpVs/FomADQNGzb2wbK3
        43ZfT0am7/dpuTiQnkp5BkvRuvyIWYKJs5g0fWpZY8zv2Acty4IYNaeZ0FjqFYduNph7RB
        G0IJuj7kYpz4q1WHRHigop43r5JI+IQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-ueE_T7g9OR2MjTHRrrH6Kg-1; Fri, 07 Feb 2020 17:24:42 -0500
X-MC-Unique: ueE_T7g9OR2MjTHRrrH6Kg-1
Received: by mail-qk1-f197.google.com with SMTP id b23so453735qkg.17
        for <linux-mips@vger.kernel.org>; Fri, 07 Feb 2020 14:24:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JRnjR1s6c5pJE2ossLQbJM2NZYkPQ/exCWBRJ0Gziy8=;
        b=EZXgdc4Fu2BX+jA2hbeYrRfaq8YCr+E15BYyFCNP9K0aPx2wvmefsEcaBuwB3HQS1T
         8RkxMjpI7/I0jRlBz7K55riD4K6K4EzyPoBBf3KqX0mlH7jjQuAP5R8PZD86zY6wrxe5
         UHQry0idG+1BxJjwFQOVtcp3WC2ku4tM9v5LQ7j/fVH1z0t/TCc5vs7hAmmPKfIsgGZR
         Cd+HIdAaIQFg+CCACCCIz4HHAhRZCM/WnM0Gr7gtpmCWCwbcRa5F3QmF9coqMVXFcuio
         Fp2P5nJ6XUWzIm3RhPM62z6C4vIhy5WYC9lFKvNEfnX8oDDUM7VnigJISd1K0DCwB4Eu
         bS7A==
X-Gm-Message-State: APjAAAVzVNVvb/5dYWbijm92omeGN0txLZ5MiG8+bk5Pdmiyexcb+NDh
        sJDnVvTQ1W2XqeVZH6cNy5wMJbBESNACOtrG2GUjGTxNHLkXkTIMewRixTZ2kQJkdRzanNAs337
        KwL6bQCFk+hqhAZPJw2jTzQ==
X-Received: by 2002:a37:c53:: with SMTP id 80mr1117253qkm.285.1581114282356;
        Fri, 07 Feb 2020 14:24:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqxdmbvsmW8pfTDFhkNFpJOBOyIyACeKZQZlqIgbOpE5taqn1c19m2GAF/qQjzf2ieRiXzn8Xg==
X-Received: by 2002:a37:c53:: with SMTP id 80mr1117228qkm.285.1581114282106;
        Fri, 07 Feb 2020 14:24:42 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c8:32::2])
        by smtp.gmail.com with ESMTPSA id j1sm1933090qkl.86.2020.02.07.14.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 14:24:41 -0800 (PST)
Date:   Fri, 7 Feb 2020 17:24:38 -0500
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
Subject: Re: [PATCH v5 17/19] KVM: Terminate memslot walks via used_slots
Message-ID: <20200207222438.GH720553@xz-x1>
References: <20200121223157.15263-1-sean.j.christopherson@intel.com>
 <20200121223157.15263-18-sean.j.christopherson@intel.com>
 <20200206210944.GD700495@xz-x1>
 <20200207183325.GI2401@linux.intel.com>
 <20200207203909.GE720553@xz-x1>
 <20200207211016.GN2401@linux.intel.com>
 <20200207214623.GF720553@xz-x1>
 <20200207220325.GO2401@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200207220325.GO2401@linux.intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Feb 07, 2020 at 02:03:25PM -0800, Sean Christopherson wrote:
> On Fri, Feb 07, 2020 at 04:46:23PM -0500, Peter Xu wrote:
> > On Fri, Feb 07, 2020 at 01:10:16PM -0800, Sean Christopherson wrote:
> > > On Fri, Feb 07, 2020 at 03:39:09PM -0500, Peter Xu wrote:
> > > > On Fri, Feb 07, 2020 at 10:33:25AM -0800, Sean Christopherson wrote:
> > > > > On Thu, Feb 06, 2020 at 04:09:44PM -0500, Peter Xu wrote:
> > > > > > On Tue, Jan 21, 2020 at 02:31:55PM -0800, Sean Christopherson wrote:
> > > > > > > @@ -9652,13 +9652,13 @@ int __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa, u32 size)
> > > > > > >  		if (IS_ERR((void *)hva))
> > > > > > >  			return PTR_ERR((void *)hva);
> > > > > > >  	} else {
> > > > > > > -		if (!slot->npages)
> > > > > > > +		if (!slot || !slot->npages)
> > > > > > >  			return 0;
> > > > > > >  
> > > > > > > -		hva = 0;
> > > > > > > +		hva = slot->userspace_addr;
> > > > > > 
> > > > > > Is this intended?
> > > > > 
> > > > > Yes.  It's possible to allow VA=0 for userspace mappings.  It's extremely
> > > > > uncommon, but possible.  Therefore "hva == 0" shouldn't be used to
> > > > > indicate an invalid slot.
> > > > 
> > > > Note that this is the deletion path in __x86_set_memory_region() not
> > > > allocation.  IIUC userspace_addr won't even be used in follow up code
> > > > path so it shouldn't really matter.  Or am I misunderstood somewhere?
> > > 
> > > No, but that's precisely why I don't want to zero out @hva, as doing so
> > > implies that '0' indicates an invalid hva, which is wrong.
> > > 
> > > What if I change this to 
> > > 
> > > 			hva = 0xdeadull << 48;
> > > 
> > > and add a blurb in the changelog about stuff hva with a non-canonical value
> > > to indicate it's being destroyed.
> > 
> > IMO it's fairly common to have the case where "when A is XXX then
> > parameters B is invalid" happens in C.
> 
> I'm not arguing that's not the case.  My point is that there's nothing
> special about '0', so why use it?  E.g. "hva = 1" would also be ok from a
> functional perspective, but more obviously "wrong".

I think the answer is as simple as the original author thought 0 was
better than an arbitrary number on the stack, which I agree. :-)

-- 
Peter Xu

