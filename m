Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B086C1561E2
	for <lists+linux-mips@lfdr.de>; Sat,  8 Feb 2020 01:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbgBHASn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Feb 2020 19:18:43 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27324 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727065AbgBHASn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Feb 2020 19:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581121121;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FliTqS6db2UW8mSq2D177P6p0LFTqK9NtxjpkxKtGhE=;
        b=Z5fZWauLRjSF9yHJhWjstu4p0aZ6V8Qet47SbHiHxcvcDYM0axCoP6xa1p/Ne+V88qjdNS
        YWP6ItTIHm3e5Brgi+GO47px7usCkMjUdjFPSDwTjapk4zaG2g+keZz3K3ItHP+VXu02fm
        0uI7VUK+/0wWFrPhAfgCZIum7OPG4M8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-xY9kAkpfOF-fsZpO_W7U7w-1; Fri, 07 Feb 2020 19:18:37 -0500
X-MC-Unique: xY9kAkpfOF-fsZpO_W7U7w-1
Received: by mail-qt1-f198.google.com with SMTP id z11so693401qts.1
        for <linux-mips@vger.kernel.org>; Fri, 07 Feb 2020 16:18:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FliTqS6db2UW8mSq2D177P6p0LFTqK9NtxjpkxKtGhE=;
        b=dtaHnTH8vFc/tvq//DysLnCdS9Tiy+dnwbSsGSxSZ4V+1M5drEJNVHSiGHy8ETfufm
         rEEYe6Q4MzwkuyidSG9UE5VaB8c0vUZGDpiNOAuvXRjD2x+sYDdsBndWXyW1TwZodP5r
         hRNjPnaM1pwGSACpGRXeVSF4OuYL99RcnfulHtdHJTWMaAkfwxEIXiI166eUs47sAcrg
         4BkyNmzX5+wAqj2NhiR52h4iV//GwbevY2NKWP8Loj50ZfqATuMafCakP3Deq0P938vf
         I+mSk7O6u+rGb2wgKLCF14DhJ/zEAKOag619sxxlQCI4WICclgJIqOGpl+/iv22f210f
         PtVQ==
X-Gm-Message-State: APjAAAXrdzUSpucDSiUt66Ulrthu+UpfOLbyjfdWP1rhEv+LcnkjkNyy
        /9vaEeQMEclr47ZZgHyr89hM213Do6E3kGWLHG+RJAku4VGe95K4a5UHrZPAgHfoLJXiprVGuu8
        8+7ugNVS+7G/KrWG2bgvEww==
X-Received: by 2002:a37:8cc:: with SMTP id 195mr1462268qki.456.1581121117033;
        Fri, 07 Feb 2020 16:18:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqzAkXLXCBlBGfr3jniMMbcCpWv44CMlkznbhHCioVsTu+8iTId/2cuSvhY/ok33KerrRsEvMw==
X-Received: by 2002:a37:8cc:: with SMTP id 195mr1462239qki.456.1581121116707;
        Fri, 07 Feb 2020 16:18:36 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c8:32::2])
        by smtp.gmail.com with ESMTPSA id n32sm2271790qtk.66.2020.02.07.16.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 16:18:35 -0800 (PST)
Date:   Fri, 7 Feb 2020 19:18:32 -0500
From:   Peter Xu <peterx@redhat.com>
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     Vitaly Kuznetsov <vkuznets@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
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
Subject: Re: [PATCH v5 15/19] KVM: Provide common implementation for generic
 dirty log functions
Message-ID: <20200208001832.GA823968@xz-x1>
References: <20200121223157.15263-1-sean.j.christopherson@intel.com>
 <20200121223157.15263-16-sean.j.christopherson@intel.com>
 <20200206200200.GC700495@xz-x1>
 <20200206212120.GF13067@linux.intel.com>
 <20200206214106.GG700495@xz-x1>
 <20200207194532.GK2401@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200207194532.GK2401@linux.intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Feb 07, 2020 at 11:45:32AM -0800, Sean Christopherson wrote:
> +Vitaly for HyperV
> 
> On Thu, Feb 06, 2020 at 04:41:06PM -0500, Peter Xu wrote:
> > On Thu, Feb 06, 2020 at 01:21:20PM -0800, Sean Christopherson wrote:
> > > On Thu, Feb 06, 2020 at 03:02:00PM -0500, Peter Xu wrote:
> > > > But that matters to this patch because if MIPS can use
> > > > kvm_flush_remote_tlbs(), then we probably don't need this
> > > > arch-specific hook any more and we can directly call
> > > > kvm_flush_remote_tlbs() after sync dirty log when flush==true.
> > > 
> > > Ya, the asid_flush_mask in kvm_vz_flush_shadow_all() is the only thing
> > > that prevents calling kvm_flush_remote_tlbs() directly, but I have no
> > > clue as to the important of that code.
> > 
> > As said above I think the x86 lockdep is really not necessary, then
> > considering MIPS could be the only one that will use the new hook
> > introduced in this patch...  Shall we figure that out first?
> 
> So I prepped a follow-up patch to make kvm_arch_dirty_log_tlb_flush() a
> MIPS-only hook and use kvm_flush_remote_tlbs() directly for arm and x86,
> but then I realized x86 *has* a hook to do a precise remote TLB flush.
> There's even an existing kvm_flush_remote_tlbs_with_address() call on a
> memslot, i.e. this exact scenario.  So arguably, x86 should be using the
> more precise flush and should keep kvm_arch_dirty_log_tlb_flush().
> 
> But, the hook is only used when KVM is running as an L1 on top of HyperV,
> and I assume dirty logging isn't used much, if at all, for L1 KVM on
> HyperV?
> 
> I see three options:
> 
>   1. Make kvm_arch_dirty_log_tlb_flush() MIPS-only and call
>      kvm_flush_remote_tlbs() directly for arm and x86.  Add comments to
>      explain when an arch should implement kvm_arch_dirty_log_tlb_flush().
> 
>   2. Change x86 to use kvm_flush_remote_tlbs_with_address() when flushing
>      a memslot after the dirty log is grabbed by userspace.
> 
>   3. Keep the resulting code as is, but add a comment in x86's
>      kvm_arch_dirty_log_tlb_flush() to explain why it uses
>      kvm_flush_remote_tlbs() instead of the with_address() variant.
> 
> I strongly prefer to (2) or (3), but I'll defer to Vitaly as to which of
> those is preferable.
> 
> I don't like (1) because (a) it requires more lines code (well comments),
> to explain why kvm_flush_remote_tlbs() is the default, and (b) it would
> require even more comments, which would be x86-specific in generic KVM,
> to explain why x86 doesn't use its with_address() flush, or we'd lost that
> info altogether.
> 

I proposed the 4th solution here:

https://lore.kernel.org/kvm/20200207223520.735523-1-peterx@redhat.com/

I'm not sure whether that's acceptable, but if it can, then we can
drop the kvm_arch_dirty_log_tlb_flush() hook, or even move on to
per-slot tlb flushing.

Thanks,

-- 
Peter Xu

