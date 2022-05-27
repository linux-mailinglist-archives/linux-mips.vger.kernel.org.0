Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1C0536387
	for <lists+linux-mips@lfdr.de>; Fri, 27 May 2022 15:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352731AbiE0NtP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 May 2022 09:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352788AbiE0NtO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 27 May 2022 09:49:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C8FAA5F248
        for <linux-mips@vger.kernel.org>; Fri, 27 May 2022 06:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653659350;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=u3wM6LMtd0WRKF0TJX2qWAIusndSWh4uKD1DEnhNev8=;
        b=Ujcn1rZd+cNfkrWDF5AvU/7W9LItKVDVvmYNqJyT1jpvT6Q8yXFUOkydyJvBGFK+emj1gw
        zsjwQlXmOwiFfALh4SmBletrGJUpI+V6PE6LR3HwD3422enSvrc1DtDwyd+QxUuxzzGwv2
        Gb8Wy2Pa422iiXhWVgoihFeq85ATl0o=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-YTCn8zrlOeSWIFailoRMGA-1; Fri, 27 May 2022 09:49:09 -0400
X-MC-Unique: YTCn8zrlOeSWIFailoRMGA-1
Received: by mail-il1-f200.google.com with SMTP id j5-20020a922005000000b002d1c2659644so3109226ile.8
        for <linux-mips@vger.kernel.org>; Fri, 27 May 2022 06:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u3wM6LMtd0WRKF0TJX2qWAIusndSWh4uKD1DEnhNev8=;
        b=qIHfJrEf+UdfiFbxXYSHH0kNK/1LlmGKea8vNRqqImTTCy3CHLMc7rBGMsFhbRdgu7
         zpEcgsq2q8iBp2vSZL7vt3vwftqbbI4LB1MLxSEcGqSoV2Wio7+PCY8przXfiPHDij1d
         W58ZSJfKiEZv5UKK0L0kJZxOMxZY1v23dJZ2HPrqrJOOA2ruVvQ+mBPXhffM32yKLEex
         OCjXXqvkRRMy/LQPUXo0/CoQT0mcymqkeg+wYHlkK4qh4N3GN8PpWMN/gX7aR7LPusRu
         6jbGUyFq3kUdAGs7J5L0rLtco41zmfoayab0EzC3OqLw84/qaT1W+HN/dX/vKHmYicTp
         JzOg==
X-Gm-Message-State: AOAM531RxJmfpZmriFAShv+hAMSVOAItawppfJ/e9fxFTcJBGIG9kaT0
        oEtL3gcsCBf4/CLsqVX1QfQpq6qdN8eOVz3izXlm9OlAFQXhjysae2Q/1KXe7m2qr0rZDfPBlKe
        W2nqjAh41yGZ5wyyTAgE8BA==
X-Received: by 2002:a05:6602:1584:b0:664:ab0f:5339 with SMTP id e4-20020a056602158400b00664ab0f5339mr10502552iow.146.1653659347405;
        Fri, 27 May 2022 06:49:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCqN3qwLLuYZMqrMI7aGsb6Zn5OHs31WIJQ3aUgDc8PhP19ReX/GZlaKbEBJ1PdD9YunS6AA==
X-Received: by 2002:a05:6602:1584:b0:664:ab0f:5339 with SMTP id e4-20020a056602158400b00664ab0f5339mr10502527iow.146.1653659347005;
        Fri, 27 May 2022 06:49:07 -0700 (PDT)
Received: from xz-m1.local (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
        by smtp.gmail.com with ESMTPSA id x25-20020a029719000000b0032b3a7817d6sm563254jai.154.2022.05.27.06.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 06:49:06 -0700 (PDT)
Date:   Fri, 27 May 2022 09:49:01 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Heiko Carstens <hca@linux.ibm.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Richard Henderson <rth@twiddle.net>,
        David Hildenbrand <david@redhat.com>,
        Matt Turner <mattst88@gmail.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Michal Simek <monstr@monstr.eu>,
        Russell King <linux@armlinux.org.uk>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        linux-riscv@lists.infradead.org,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonas Bonn <jonas@southpole.se>, Will Deacon <will@kernel.org>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        openrisc@lists.librecores.org, linux-s390@vger.kernel.org,
        Ingo Molnar <mingo@redhat.com>,
        linux-m68k@lists.linux-m68k.org,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Chris Zankel <chris@zankel.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Alistair Popple <apopple@nvidia.com>,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        Vlastimil Babka <vbabka@suse.cz>,
        Thomas Gleixner <tglx@linutronix.de>,
        sparclinux@vger.kernel.org,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Stafford Horne <shorne@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Mackerras <paulus@samba.org>,
        linux-arm-kernel@lists.infradead.org,
        Sven Schnelle <svens@linux.ibm.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-xtensa@linux-xtensa.org, Nicholas Piggin <npiggin@gmail.com>,
        linux-sh@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
        Borislav Petkov <bp@alien8.de>, linux-mips@vger.kernel.org,
        Max Filippov <jcmvbkbc@gmail.com>,
        Helge Deller <deller@gmx.de>, Vineet Gupta <vgupta@kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-um@lists.infradead.org, linux-alpha@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-ia64@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dinh Nguyen <dinguyen@kernel.org>, Guo Ren <guoren@kernel.org>,
        linux-snps-arc@lists.infradead.org,
        Hugh Dickins <hughd@google.com>, Rich Felker <dalias@libc.org>,
        Andy Lutomirski <luto@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        linuxppc-dev@lists.ozlabs.org, Brian Cain <bcain@quicinc.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        linux-parisc@vger.kernel.org,
        "David S . Miller" <davem@davemloft.net>,
        Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v3] mm: Avoid unnecessary page fault retires on shared
 memory types
Message-ID: <YpDWzX8dyh1259Mo@xz-m1.local>
References: <20220524234531.1949-1-peterx@redhat.com>
 <YpDCzvLER9AYJJc8@osiris>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YpDCzvLER9AYJJc8@osiris>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Heiko,

On Fri, May 27, 2022 at 02:23:42PM +0200, Heiko Carstens wrote:
> On Tue, May 24, 2022 at 07:45:31PM -0400, Peter Xu wrote:
> > I observed that for each of the shared file-backed page faults, we're very
> > likely to retry one more time for the 1st write fault upon no page.  It's
> > because we'll need to release the mmap lock for dirty rate limit purpose
> > with balance_dirty_pages_ratelimited() (in fault_dirty_shared_page()).
> > 
> > Then after that throttling we return VM_FAULT_RETRY.
> > 
> > We did that probably because VM_FAULT_RETRY is the only way we can return
> > to the fault handler at that time telling it we've released the mmap lock.
> > 
> > However that's not ideal because it's very likely the fault does not need
> > to be retried at all since the pgtable was well installed before the
> > throttling, so the next continuous fault (including taking mmap read lock,
> > walk the pgtable, etc.) could be in most cases unnecessary.
> > 
> > It's not only slowing down page faults for shared file-backed, but also add
> > more mmap lock contention which is in most cases not needed at all.
> > 
> > To observe this, one could try to write to some shmem page and look at
> > "pgfault" value in /proc/vmstat, then we should expect 2 counts for each
> > shmem write simply because we retried, and vm event "pgfault" will capture
> > that.
> > 
> > To make it more efficient, add a new VM_FAULT_COMPLETED return code just to
> > show that we've completed the whole fault and released the lock.  It's also
> > a hint that we should very possibly not need another fault immediately on
> > this page because we've just completed it.
> > 
> > This patch provides a ~12% perf boost on my aarch64 test VM with a simple
> > program sequentially dirtying 400MB shmem file being mmap()ed and these are
> > the time it needs:
> > 
> >   Before: 650.980 ms (+-1.94%)
> >   After:  569.396 ms (+-1.38%)
> > 
> > I believe it could help more than that.
> > 
> > We need some special care on GUP and the s390 pgfault handler (for gmap
> > code before returning from pgfault), the rest changes in the page fault
> > handlers should be relatively straightforward.
> > 
> > Another thing to mention is that mm_account_fault() does take this new
> > fault as a generic fault to be accounted, unlike VM_FAULT_RETRY.
> > 
> > I explicitly didn't touch hmm_vma_fault() and break_ksm() because they do
> > not handle VM_FAULT_RETRY even with existing code, so I'm literally keeping
> > them as-is.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> ...
> > diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
> > index e173b6187ad5..9503a7cfaf03 100644
> > --- a/arch/s390/mm/fault.c
> > +++ b/arch/s390/mm/fault.c
> > @@ -339,6 +339,7 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
> >  	unsigned long address;
> >  	unsigned int flags;
> >  	vm_fault_t fault;
> > +	bool need_unlock = true;
> >  	bool is_write;
> >  
> >  	tsk = current;
> > @@ -433,6 +434,13 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
> >  			goto out_up;
> >  		goto out;
> >  	}
> > +
> > +	/* The fault is fully completed (including releasing mmap lock) */
> > +	if (fault & VM_FAULT_COMPLETED) {
> > +		need_unlock = false;
> > +		goto out_gmap;
> > +	}
> > +
> >  	if (unlikely(fault & VM_FAULT_ERROR))
> >  		goto out_up;
> >  
> > @@ -452,6 +460,7 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
> >  		mmap_read_lock(mm);
> >  		goto retry;
> >  	}
> > +out_gmap:
> >  	if (IS_ENABLED(CONFIG_PGSTE) && gmap) {
> >  		address =  __gmap_link(gmap, current->thread.gmap_addr,
> >  				       address);
> > @@ -466,7 +475,8 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
> >  	}
> >  	fault = 0;
> >  out_up:
> > -	mmap_read_unlock(mm);
> > +	if (need_unlock)
> > +		mmap_read_unlock(mm);
> >  out:
> 
> This seems to be incorrect. __gmap_link() requires the mmap_lock to be
> held. Christian, Janosch, or David, could you please check?

Thanks for pointing that out.  Indeed I see the clue right above the
comment of __gmap_link():

/*
 * ...
 * The mmap_lock of the mm that belongs to the address space must be held
 * when this function gets called.
 */
int __gmap_link(struct gmap *gmap, unsigned long gaddr, unsigned long vmaddr)

A further fact is it'll walk the pgtable right afterwards, assuming
gmap->mm will definitely be the current mm or it'll definitely go wrong.

I'll change s390 to retake the lock with the new COMPLETE retcode, so at
least it'll avoid one pgtable work procedure even if the lock overhead was
kept.

With that, one more possible further optimization for s390 only will be
conditionally not taking that lock when !CONFIG_PGSTE, but I have totally
no idea whether that'll be a common use case, so I plan to leave that for
later in all cases.

Actually after doing that the whole changeset of s390 is even more
straightforward:

---8<---
diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
index e173b6187ad5..4608cc962ecf 100644
--- a/arch/s390/mm/fault.c
+++ b/arch/s390/mm/fault.c
@@ -433,6 +433,17 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
                        goto out_up;
                goto out;
        }
+
+       /* The fault is fully completed (including releasing mmap lock) */
+       if (fault & VM_FAULT_COMPLETED) {
+               /*
+                * Gmap will need the mmap lock again, so retake it.  TODO:
+                * only conditionally take the lock when CONFIG_PGSTE set.
+                */
+               mmap_read_lock(mm);
+               goto out_gmap;
+       }
+
        if (unlikely(fault & VM_FAULT_ERROR))
                goto out_up;
 
@@ -452,6 +463,7 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
                mmap_read_lock(mm);
                goto retry;
        }
+out_gmap:
        if (IS_ENABLED(CONFIG_PGSTE) && gmap) {
                address =  __gmap_link(gmap, current->thread.gmap_addr,
                                       address);
---8<---

Thanks,

-- 
Peter Xu

