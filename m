Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85A1866AC74
	for <lists+linux-mips@lfdr.de>; Sat, 14 Jan 2023 17:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbjANQJ6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Jan 2023 11:09:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbjANQJy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Jan 2023 11:09:54 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 180AE903A
        for <linux-mips@vger.kernel.org>; Sat, 14 Jan 2023 08:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673712593;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q3R4pvBr6dG+A0u3o+nBNguX6qX9S+oXSEacD+sP77s=;
        b=GiwweEttUaTM1RlRzjvyt7ioZXLQ9IbjLgzhiYpIFKqzgO7gGAFq52uKyWqQV+fltExHSO
        rPnwXwgq0j0hMfnTBS3leQrbWTcmZvD1dmlW+DXv7hxj4mkjDpqXZl90d9NejHWfLhvM+n
        veUVeMe6h7hYhaxyUhHLUTbaiCa0OtA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-70-ecBZuhOEPAGSTCIn663maQ-1; Sat, 14 Jan 2023 11:09:39 -0500
X-MC-Unique: ecBZuhOEPAGSTCIn663maQ-1
Received: by mail-wm1-f69.google.com with SMTP id n9-20020a05600c3b8900b003d9f14e904eso10028955wms.9
        for <linux-mips@vger.kernel.org>; Sat, 14 Jan 2023 08:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3R4pvBr6dG+A0u3o+nBNguX6qX9S+oXSEacD+sP77s=;
        b=kgaP9EuQJWVqedxk63sgOdYt5kFN2Qd95uQITaXldwr9YtzMA/4Fj+BEyxOcUhEMZF
         wrZWvl5MKgWk37c5E8eiM5Kx9NTxXbFluFz2pQqB6eC1xaMa2HMopW1qq8JR+VNE52QZ
         zZ+OvlVqyXbVKDjhrKxsD4YF4Tr/+SzbnQnc5flotlN+TY4jAnqqcJ9AbJ1Ym3Z5INfS
         nPFAP64vPoes2pAxm+OAtuEqcnFEB7HmiYvZkv4EmO7oh6Nz4VULj4Mpkm0K/rpFT+rS
         s8Ky7fdOQLNGFb9av8pk5DGSt31z1F9VmeYyYXk/gqelF5M5uW4NQ8qoN1q/toWbiKoY
         6KPw==
X-Gm-Message-State: AFqh2kqeiFr5HYwMZkLn4xRv1q/45tWTLGc/oW5+gH3ZZBAFbj7KJiBT
        CXRyd1Z3XWdNmGxmQlPYBHGWuSoDMdcvrv7fnvIojunrClyM6mot+91+w7MA0dLoBaqAgPqEsT6
        TFVLyPhPYdG+fJlfpPtwYnA==
X-Received: by 2002:a05:600c:348b:b0:3d1:f16b:30e6 with SMTP id a11-20020a05600c348b00b003d1f16b30e6mr62422479wmq.28.1673712578433;
        Sat, 14 Jan 2023 08:09:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtvXECQ77f+OwG9Mdcw6TdAWlLhcG76s2TeMh5Hr9A1VofwYXs3lPZWG9daADyc7xNo4jh7zQ==
X-Received: by 2002:a05:600c:348b:b0:3d1:f16b:30e6 with SMTP id a11-20020a05600c348b00b003d1f16b30e6mr62422426wmq.28.1673712578037;
        Sat, 14 Jan 2023 08:09:38 -0800 (PST)
Received: from ?IPV6:2003:cb:c71c:9800:fa4a:c1fc:a860:85af? (p200300cbc71c9800fa4ac1fca86085af.dip0.t-ipconnect.de. [2003:cb:c71c:9800:fa4a:c1fc:a860:85af])
        by smtp.gmail.com with ESMTPSA id q18-20020adfdfd2000000b002bdc129c8f6sm10260315wrn.43.2023.01.14.08.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jan 2023 08:09:37 -0800 (PST)
Message-ID: <6aaad548-cf48-77fa-9d6c-db83d724b2eb@redhat.com>
Date:   Sat, 14 Jan 2023 17:09:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To:     linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Yang Shi <shy828301@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Nadav Amit <namit@vmware.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
        x86@kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
References: <20230113171026.582290-1-david@redhat.com>
 <20230113171026.582290-2-david@redhat.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH mm-unstable v1 01/26] mm/debug_vm_pgtable: more
 pte_swp_exclusive() sanity checks
In-Reply-To: <20230113171026.582290-2-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 13.01.23 18:10, David Hildenbrand wrote:
> We want to implement __HAVE_ARCH_PTE_SWP_EXCLUSIVE on all architectures.
> Let's extend our sanity checks, especially testing that our PTE bit
> does not affect:
> * is_swap_pte() -> pte_present() and pte_none()
> * the swap entry + type
> * pte_swp_soft_dirty()
> 
> Especially, the pfn_pte() is dodgy when the swap PTE layout differs
> heavily from ordinary PTEs. Let's properly construct a swap PTE from
> swap type+offset.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---

The following fixup for !CONFIG_SWAP on top, which makes it compile for me and
passes when booting on x86_64 with CONFIG_DEBUG_VM_PGTABLE:

...
[    0.347112] Loaded X.509 cert 'Build time autogenerated kernel key: ee6afc0578f6475656fec8a4f9d02832'
[    0.350112] debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table helpers
[    0.351217] page_owner is disabled
...


 From 6a6162e8af62a4b3f7b9d823fdfae86de3f34a9d Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Sat, 14 Jan 2023 16:47:12 +0100
Subject: [PATCH] fixup: mm/debug_vm_pgtable: more pte_swp_exclusive() sanity
  checks

generic_max_swapfile_size() is only available with CONFIG_SWAP -- which
makes sense, because without SWAP there are no swap files. Let's
simply probe manually which bits we can obtain after storing them in a
PTE, and properly call it "max swap offset", which is more generic for
a swap entry.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
  mm/debug_vm_pgtable.c | 8 +++++---
  1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 3da0cc380c35..af59cc7bd307 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -810,15 +810,17 @@ static void __init pmd_swap_soft_dirty_tests(struct pgtable_debug_args *args) {
  
  static void __init pte_swap_exclusive_tests(struct pgtable_debug_args *args)
  {
-	unsigned long max_swapfile_size = generic_max_swapfile_size();
+	unsigned long max_swap_offset;
  	swp_entry_t entry, entry2;
  	pte_t pte;
  
  	pr_debug("Validating PTE swap exclusive\n");
  
+	/* See generic_max_swapfile_size(): probe the maximum offset */
+	max_swap_offset = swp_offset(pte_to_swp_entry(swp_entry_to_pte(swp_entry(0, ~0UL))));
+
  	/* Create a swp entry with all possible bits set */
-	entry = swp_entry((1 << MAX_SWAPFILES_SHIFT) - 1,
-			  max_swapfile_size - 1);
+	entry = swp_entry((1 << MAX_SWAPFILES_SHIFT) - 1, max_swap_offset);
  
  	pte = swp_entry_to_pte(entry);
  	WARN_ON(pte_swp_exclusive(pte));
-- 
2.39.0



-- 
Thanks,

David / dhildenb

