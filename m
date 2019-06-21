Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC854EA93
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2019 16:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbfFUO21 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jun 2019 10:28:27 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:34729 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfFUO20 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jun 2019 10:28:26 -0400
Received: by mail-qk1-f194.google.com with SMTP id t8so4567365qkt.1
        for <linux-mips@vger.kernel.org>; Fri, 21 Jun 2019 07:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QN9JaLjC+aXpYQwYy0rUybeOk/75jD5iu87wcqgiv+A=;
        b=gHewrOsGYjfruRd4d1g7uEoXFq0aPB7SLlglrbzK6BXTkmLdPbiazxpOboA2jm7wrI
         b8d8+E6FX9OR7u+IFNEKrAnJnOqu/5F1VZLUMNCMCU+wgS6y2EkbpkHsbU8+r3JHZVql
         PIegARKFvfPWOqpFRbR76bztPULQ83Vuao8w4HpYbgS5VaeHCUZ/9LZHChOTJFGspzyL
         atunFnhPQ2nD+493uKquWuaHkbcR/Qbt9BLiGb7yOcsFbUDnB07oOdzvU9IpHgGWj6ES
         glaSilKeeyF/aLMWsYWTQY3pAMonUdx/dUq0pDX6f1CXEmbwIgHnehnriMkvZWZLQO1T
         0B5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QN9JaLjC+aXpYQwYy0rUybeOk/75jD5iu87wcqgiv+A=;
        b=p1VfYkrqxfmiq3HKrolE7rJzoNGOXNoHgrobcU8aRmc6ct7fifNSvxjTlAPgVAEr+W
         WxGNaZ09McgjaHmMVweNFv0nzlGxqdroQSTn/OKXq3iF0XA8rMCCuUMR99mdIlL8O/vT
         hFgWF2XFh/3T8u4lnf9sEAlHNBOndNkvAVpU85eI4TSptdovRlIoF8JTipf7iq7dTmN7
         Qhr6KRzfGdKnWk/jRpTvNVBxQp6+Q7QNwdbHFvAoBskbYxHpTFt56CwQm3/IVBfZnt3e
         1Hr08G8zjzX93L+hKXaAZcJH2HmKo0rH0MfUV7yueEQbD0BbmhzJ9UfSmGS/ZMUJQqDt
         LqdA==
X-Gm-Message-State: APjAAAVrEogY/c4Xv0RYahrSVoE4lBXw1vO00ifpOrCSiuxivExM8XfF
        CG26etP5mHO31yTVtb/pcPMvJw==
X-Google-Smtp-Source: APXvYqydWDme2tP2dVS/BqtEvh4YdCf0/vXc8OQrQ6NRAaTCyw2Eaq6p7IUxO9RX+s8DYAJPYZ5q+A==
X-Received: by 2002:a05:620a:1107:: with SMTP id o7mr77780538qkk.324.1561127305462;
        Fri, 21 Jun 2019 07:28:25 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id y14sm1370164qkb.109.2019.06.21.07.28.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2019 07:28:24 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1heKWe-0000lt-CN; Fri, 21 Jun 2019 11:28:24 -0300
Date:   Fri, 21 Jun 2019 11:28:24 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/16] mm: rename CONFIG_HAVE_GENERIC_GUP to
 CONFIG_HAVE_FAST_GUP
Message-ID: <20190621142824.GP19891@ziepe.ca>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-11-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611144102.8848-11-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 11, 2019 at 04:40:56PM +0200, Christoph Hellwig wrote:
> We only support the generic GUP now, so rename the config option to
> be more clear, and always use the mm/Kconfig definition of the
> symbol and select it from the arch Kconfigs.

Looks OK to me

Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>

But could you also roll something like this in to the series? There is
no longer any reason for the special __weak stuff that I can see -
just follow the normal pattern for stubbing config controlled
functions through the header file.

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0e8834ac32b76c..13b1cb573383d5 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1561,8 +1561,17 @@ long get_user_pages_locked(unsigned long start, unsigned long nr_pages,
 long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 		    struct page **pages, unsigned int gup_flags);
 
+#ifdef CONFIG_HAVE_FAST_GUP
 int get_user_pages_fast(unsigned long start, int nr_pages,
 			unsigned int gup_flags, struct page **pages);
+#else
+static inline int get_user_pages_fast(unsigned long start, int nr_pages,
+				      unsigned int gup_flags,
+				      struct page **pages)
+{
+	return get_user_pages_unlocked(start, nr_pages, pages, gup_flags);
+}
+#endif
 
 /* Container for pinned pfns / pages */
 struct frame_vector {
@@ -1668,8 +1677,17 @@ extern int mprotect_fixup(struct vm_area_struct *vma,
 /*
  * doesn't attempt to fault and will return short.
  */
+#ifdef CONFIG_HAVE_FAST_GUP
 int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
 			  struct page **pages);
+#else
+static inline int __get_user_pages_fast(unsigned long start, int nr_pages,
+					int write, struct page **pages)
+{
+	return 0;
+}
+#endif
+
 /*
  * per-process(per-mm_struct) statistics.
  */
diff --git a/mm/util.c b/mm/util.c
index 9834c4ab7d8e86..68575a315dc5ad 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -300,53 +300,6 @@ void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
 }
 #endif
 
-/*
- * Like get_user_pages_fast() except its IRQ-safe in that it won't fall
- * back to the regular GUP.
- * Note a difference with get_user_pages_fast: this always returns the
- * number of pages pinned, 0 if no pages were pinned.
- * If the architecture does not support this function, simply return with no
- * pages pinned.
- */
-int __weak __get_user_pages_fast(unsigned long start,
-				 int nr_pages, int write, struct page **pages)
-{
-	return 0;
-}
-EXPORT_SYMBOL_GPL(__get_user_pages_fast);
-
-/**
- * get_user_pages_fast() - pin user pages in memory
- * @start:	starting user address
- * @nr_pages:	number of pages from start to pin
- * @gup_flags:	flags modifying pin behaviour
- * @pages:	array that receives pointers to the pages pinned.
- *		Should be at least nr_pages long.
- *
- * get_user_pages_fast provides equivalent functionality to get_user_pages,
- * operating on current and current->mm, with force=0 and vma=NULL. However
- * unlike get_user_pages, it must be called without mmap_sem held.
- *
- * get_user_pages_fast may take mmap_sem and page table locks, so no
- * assumptions can be made about lack of locking. get_user_pages_fast is to be
- * implemented in a way that is advantageous (vs get_user_pages()) when the
- * user memory area is already faulted in and present in ptes. However if the
- * pages have to be faulted in, it may turn out to be slightly slower so
- * callers need to carefully consider what to use. On many architectures,
- * get_user_pages_fast simply falls back to get_user_pages.
- *
- * Return: number of pages pinned. This may be fewer than the number
- * requested. If nr_pages is 0 or negative, returns 0. If no pages
- * were pinned, returns -errno.
- */
-int __weak get_user_pages_fast(unsigned long start,
-				int nr_pages, unsigned int gup_flags,
-				struct page **pages)
-{
-	return get_user_pages_unlocked(start, nr_pages, pages, gup_flags);
-}
-EXPORT_SYMBOL_GPL(get_user_pages_fast);
-
 unsigned long vm_mmap_pgoff(struct file *file, unsigned long addr,
 	unsigned long len, unsigned long prot,
 	unsigned long flag, unsigned long pgoff)
