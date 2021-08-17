Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFCE3EE9AA
	for <lists+linux-mips@lfdr.de>; Tue, 17 Aug 2021 11:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235273AbhHQJYP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Aug 2021 05:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234347AbhHQJYO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Aug 2021 05:24:14 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 076C0C061764;
        Tue, 17 Aug 2021 02:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=X3DDdAYVwn4wn+94kBokpeZebjJzG2TynUbYUcAwRLA=; b=crzVGEeW1O1SVagksiTiekN8BC
        pg08NCYC/ivwRS0JgrEC2G0fvUbghzfd3oCVnQYC8r+cs2Avrh0SkJF1QhvHkJKxeubqZmZ/0hP9h
        FIzDwOKso/hOR4ATj7LoP3kfF57NpvzKTJmHa+hx2xSMP0UdHCVheDmOb57cA/4stXB1NXvakq6BZ
        MHjvKoxvqiIjH3prBxiFgG3z8rJXuMXteshMQA9RKv2GSxcgEnBsWaEv76eDwbChbWqRkOGGX9G1R
        BsgsXjgM3Jxd+3B8NBZMVpSp8aCFgZoatf/Sw5q2EgS+Fp5YHf+DycOkRSJ4BUNOHHEXuAWkDgkUU
        Ed+XUy8g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mFvJA-00AQWc-F4; Tue, 17 Aug 2021 09:22:56 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E5F8E3004B2;
        Tue, 17 Aug 2021 11:22:54 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 8C90F201ABB37; Tue, 17 Aug 2021 11:22:54 +0200 (CEST)
Date:   Tue, 17 Aug 2021 11:22:54 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Huacai Chen <chenhuacai@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Ingo Molnar <mingo@redhat.com>,
        Darren Hart <dvhart@infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Hongchen Zhang <zhanghongchen@loongson.cn>, vbabka@suse.cz,
        Mel Gorman <mgorman@suse.de>, david@redhat.com,
        willy@infradead.org, Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH] futex: Fix fault_in_user_writeable()
Message-ID: <YRt/7tjFCpYn1I3d@hirez.programming.kicks-ass.net>
References: <20210816065417.3987596-1-chenhuacai@loongson.cn>
 <20210816182750.26i535ilc6nef5k6@offworld>
 <874kbpp5zd.ffs@tglx>
 <CAAhV-H5TKLMi0GSQmh9RFK_k5eNRwx8AE8MjMKjJfbnyVYP-+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H5TKLMi0GSQmh9RFK_k5eNRwx8AE8MjMKjJfbnyVYP-+w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 17, 2021 at 09:53:14AM +0800, Huacai Chen wrote:
> Hi, Davidlohr and Thomas,
> 
> On Tue, Aug 17, 2021 at 3:03 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> >
> > On Mon, Aug 16 2021 at 11:27, Davidlohr Bueso wrote:
> > > On Mon, 16 Aug 2021, Huacai Chen wrote:
> > >
> > >>fault_in_user_writeable() should verify R/W access but only verify W. In
> > >>most archs W implies R, but not true in MIPS and LoongArch, so fix it.
> > >
> > > Yuck for a find_vma() in futex.c. If this is a problem in MIPS, shouldn't
> > > the fix be there? Furthermore it's stated that fault_in_user_writeable():
> > >
> > > "Fault in user address and verify RW access"
> >
> > That seems to be wishful thinking given the fact that some architectures
> > do not imply R for FLAG_FAULT_WRITE.
> >
> > > And you guys seem to have proposed it already:
> > >
> > > https://lore.kernel.org/linux-mips/20200630005845.1239974-1-liulichao@loongson.cn/
> This works, but I don't think this is a MIPS problem, so does Thomas
> Bogendoerfer. Because write-only page is valid in MIPS (so Thomas
> rejected this patch).
> 
> >
> > That's surely one way to fix that. If that does not work for whatever
> > reason, then we really don't want this find_vma() hack there, but rather
> > something like:
> I don't know why find_vma() is unacceptable here, there is also
> find_vma() in fixup_user_fault().
> 
> >
> >     if (IS_ENABLED(CONFIG_ARCH_USER_FAULT_VOODOO) && get_user(&tmp, uaddr))
> >         return -EFAULT;
> get_user() may be better than find_vma(), but can we drop
> CONFIG_ARCH_USER_FAULT_VOODOO here? On those "W implies R" archs,
> get_user() always success, this can simplify the logic.

AFAICT that whole W implies R thing goes much deeper,
mm/gup.c:vma_permits_fault() has:

	vm_flags_t vm_flags = write ? VM_WRITE : VM_READ;

So unless someone wants to go fix the core MM and eradicate all such
assumptions, I'd suggest going with the 'easy' route and fix the arch.

This patch is probably broken and will likely break lots of things...

---
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7ca22e6e694a..fc587dbb90b4 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -478,6 +478,7 @@ enum fault_flag {
 	FAULT_FLAG_REMOTE =		1 << 7,
 	FAULT_FLAG_INSTRUCTION =	1 << 8,
 	FAULT_FLAG_INTERRUPTIBLE =	1 << 9,
+	FAULT_FLAG_READ =		1 << 10,
 };
 
 /*
diff --git a/kernel/futex.c b/kernel/futex.c
index fcc0570868b7..2c0970759919 100644
--- a/kernel/futex.c
+++ b/kernel/futex.c
@@ -735,7 +735,7 @@ static int fault_in_user_writeable(u32 __user *uaddr)
 
 	mmap_read_lock(mm);
 	ret = fixup_user_fault(mm, (unsigned long)uaddr,
-			       FAULT_FLAG_WRITE, NULL);
+			       FAULT_FLAG_READ|FAULT_FLAG_WRITE, NULL);
 	mmap_read_unlock(mm);
 
 	return ret < 0 ? ret : 0;
diff --git a/mm/gup.c b/mm/gup.c
index e805c1748bbf..37c8bfbe5196 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1222,11 +1222,17 @@ static long __get_user_pages(struct mm_struct *mm,
 static bool vma_permits_fault(struct vm_area_struct *vma,
 			      unsigned int fault_flags)
 {
+	bool read    = !!(fault_flags & FAULT_FLAG_READ);
 	bool write   = !!(fault_flags & FAULT_FLAG_WRITE);
 	bool foreign = !!(fault_flags & FAULT_FLAG_REMOTE);
-	vm_flags_t vm_flags = write ? VM_WRITE : VM_READ;
+	vm_flags_t vm_flags = 0;
 
-	if (!(vm_flags & vma->vm_flags))
+	if (read)
+		vm_flags |= VM_READ;
+	if (write)
+		vm_flags |= VM_WRITE;
+
+	if ((vma->vm_flags & vm_flags) != vm_flags)
 		return false;
 
 	/*
