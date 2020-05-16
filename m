Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE341D647E
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2020 00:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbgEPWdJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 May 2020 18:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726290AbgEPWdJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 16 May 2020 18:33:09 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF864C061A0C;
        Sat, 16 May 2020 15:33:08 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id hi11so2840447pjb.3;
        Sat, 16 May 2020 15:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vj3ZKk5i0HEzrSyFnN96bWdCY5i8K/6dkf5RChzT2ig=;
        b=ZexPATSHr7TALdW5suzyO0HE9DmxJQXNVHQ0JYd3NgIX/IZ0oCHjwnG0InSE40wRkY
         oxyal/oLFc0JhbpQqvIrfCEeGgUpVJV+GGU3iHCGwGRQq+zFWcgiE0onR5j/uJFtYKXu
         f0vU3LvSwcsRbyPK/k35OqSiFkk2ARLROQvkc07gSiGk9q1VqPHncuDmJC3Zz/e5NEBi
         N2RixgwTrQI6Dpk4/oJl0LJJykwxI0dqRNcVy8OxUq388yjIWGHs0NMrVPlJiuk6UECl
         NX9zX08qdEGrKDSrLmDEZrNnRxqqjpaHSDmsxnAMxOdv9+w3HJtGo7DYt/Q8BDDMwjlF
         6vAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=vj3ZKk5i0HEzrSyFnN96bWdCY5i8K/6dkf5RChzT2ig=;
        b=KA6rklDxiQD/Yo64+90ejd1xKqf9Wzt9BcCEg6x45fZyCXDOPnGiX5dnGB1A9BXb7q
         ihWs/T39gP4ks3E0meGLQddpgBhnBe037tvZDlnc26TtOkw/7dWGJy5y17v9Iwdl1YUr
         ULoXtzCszXnkGtye89Hh/GY0Vme5eMTqNLpvCHH41sZbbUT4gz8jx1hqnsc4CiYQeuzU
         zuw+hh2JfsEVJJ4NdykZq7MbF5gxuumMfg+x4a39ZKYsTprma1nhkrdaAOAnxF5Gfyg9
         HukBCd+5Y01L7PzliwTFnVshUODUexJZz2csInmFkAi7FIRHMXZblHMea/j2paqBwXYF
         IOoA==
X-Gm-Message-State: AOAM532W5vuncHvxNppMHEcVbMVOrKgwK0KIo0F9LuQ8vP5KdKP7zYwy
        1xUpvfsprcs/+n4lPqM+tts=
X-Google-Smtp-Source: ABdhPJwpG0/yP7Vs4M/H3HPMY6d7xUvEDfPCG28ANMmHTAEHrZxhJBJVmBjSecSOTX5/ONZsU65JGA==
X-Received: by 2002:a17:902:bc86:: with SMTP id bb6mr9492182plb.243.1589668388271;
        Sat, 16 May 2020 15:33:08 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id dw12sm4633881pjb.31.2020.05.16.15.33.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 16 May 2020 15:33:07 -0700 (PDT)
Date:   Sat, 16 May 2020 15:33:06 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     ira.weiny@intel.com
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, dri-devel@lists.freedesktop.org,
        Christian Koenig <christian.koenig@amd.com>,
        Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH V3 07/15] arch/kunmap_atomic: Consolidate duplicate code
Message-ID: <20200516223306.GA161252@roeck-us.net>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
 <20200507150004.1423069-8-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507150004.1423069-8-ira.weiny@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 07, 2020 at 07:59:55AM -0700, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> Every single architecture (including !CONFIG_HIGHMEM) calls...
> 
> 	pagefault_enable();
> 	preempt_enable();
> 
> ... before returning from __kunmap_atomic().  Lift this code into the
> kunmap_atomic() macro.
> 
> While we are at it rename __kunmap_atomic() to kunmap_atomic_high() to
> be consistent.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

This patch results in:

Starting init: /bin/sh exists but couldn't execute it (error -14)

when trying to boot microblazeel:petalogix-ml605 in qemu.

Bisect log attached.

Guenter

---
# bad: [bdecf38f228bcca73b31ada98b5b7ba1215eb9c9] Add linux-next specific files for 20200515
# good: [2ef96a5bb12be62ef75b5828c0aab838ebb29cb8] Linux 5.7-rc5
git bisect start 'HEAD' 'v5.7-rc5'
# good: [3674d7aa7a8e61d993886c2fb7c896c5ef85e988] Merge remote-tracking branch 'crypto/master'
git bisect good 3674d7aa7a8e61d993886c2fb7c896c5ef85e988
# good: [87f6f21783522e6d62127cf33ae5e95f50874beb] Merge remote-tracking branch 'spi/for-next'
git bisect good 87f6f21783522e6d62127cf33ae5e95f50874beb
# good: [5c428e8277d5d97c85126387d4e00aa5adde4400] Merge remote-tracking branch 'staging/staging-next'
git bisect good 5c428e8277d5d97c85126387d4e00aa5adde4400
# good: [f68de67ed934e7bdef4799fd7777c86f33f14982] Merge remote-tracking branch 'hyperv/hyperv-next'
git bisect good f68de67ed934e7bdef4799fd7777c86f33f14982
# bad: [54acd2dc52b069da59639eea0d0c92726f32fb01] mm/memblock: fix a typo in comment "implict"->"implicit"
git bisect bad 54acd2dc52b069da59639eea0d0c92726f32fb01
# good: [784a17aa58a529b84f7cc50f351ed4acf3bd11f3] mm: remove the pgprot argument to __vmalloc
git bisect good 784a17aa58a529b84f7cc50f351ed4acf3bd11f3
# good: [6cd8137ff37e9a37aee2d2a8889c8beb8eab192f] khugepaged: replace the usage of system(3) in the test
git bisect good 6cd8137ff37e9a37aee2d2a8889c8beb8eab192f
# bad: [6987da379826ed01b8a1cf046b67cc8cc10117cc] sparc: remove unnecessary includes
git bisect bad 6987da379826ed01b8a1cf046b67cc8cc10117cc
# good: [bc17b545388f64c09e83e367898e28f60277c584] mm/hugetlb: define a generic fallback for is_hugepage_only_range()
git bisect good bc17b545388f64c09e83e367898e28f60277c584
# bad: [9b5aa5b43f957f03a1f4a9aff5f7924e2ebbc011] arch-kmap_atomic-consolidate-duplicate-code-checkpatch-fixes
git bisect bad 9b5aa5b43f957f03a1f4a9aff5f7924e2ebbc011
# good: [0941a38ff0790c1004270f952067a5918a4ba32d] arch/kmap: remove redundant arch specific kmaps
git bisect good 0941a38ff0790c1004270f952067a5918a4ba32d
# good: [56e635a64c2cbfa815c851af10e0f811e809977b] arch-kunmap-remove-duplicate-kunmap-implementations-fix
git bisect good 56e635a64c2cbfa815c851af10e0f811e809977b
# bad: [60f96b2233c790d4f1c49317643051f1670bcb29] arch/kmap_atomic: consolidate duplicate code
git bisect bad 60f96b2233c790d4f1c49317643051f1670bcb29
# good: [7b3708dc3bf72a647243064fe7ddf9a76248ddfd] {x86,powerpc,microblaze}/kmap: move preempt disable
git bisect good 7b3708dc3bf72a647243064fe7ddf9a76248ddfd
# first bad commit: [60f96b2233c790d4f1c49317643051f1670bcb29] arch/kmap_atomic: consolidate duplicate code
