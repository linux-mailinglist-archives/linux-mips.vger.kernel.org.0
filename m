Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 832777DBED6
	for <lists+linux-mips@lfdr.de>; Mon, 30 Oct 2023 18:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbjJ3RZq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Oct 2023 13:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232654AbjJ3RZp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Oct 2023 13:25:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A85BA9
        for <linux-mips@vger.kernel.org>; Mon, 30 Oct 2023 10:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698686694;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
        bh=aTBFgLt9uRovWwF2IMctF7UYTEbuVr1QbBbWiOdNkAA=;
        b=FyqgoGcNfkFSSubcs0uncS4Nql82U1hkSTBk8YQ22SWnwdtRDFvnaIOCJ7T2F2X3maUQ4k
        m/t8PfgQPkvCDlchXtt5yivSyc9vRtS+ZhKwwIUcXoI041O+WJQBmaa67PlRwWmlJbgK9s
        uov9G3Z6KXITXghmrzQdnQmXvPCLV+s=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-gUmkg5MBM92OF7CF5SyDvg-1; Mon, 30 Oct 2023 13:24:52 -0400
X-MC-Unique: gUmkg5MBM92OF7CF5SyDvg-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2c5161838d8so50472271fa.1
        for <linux-mips@vger.kernel.org>; Mon, 30 Oct 2023 10:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698686691; x=1699291491;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aTBFgLt9uRovWwF2IMctF7UYTEbuVr1QbBbWiOdNkAA=;
        b=EeaZDShMmK37LnQopcXdzPaP5zAVcr/S+2pqUtIbuNOa2dHMsN/9tLhzP+ojtUEZzr
         vG5vq2wLRvWMR8yoLHidz34pE4npbLU8uxuCt9/7lXxlFI46TORd2TLCJ+BpWOR1jB2a
         zyIqPqtHzBtyW/nSJ7XAUi/tc9H6ya05cj5i44Nfhl7fDEBcKFinYIz8QTQVgtUA0OMV
         k8L9dHGX6n954qBVZfp16hM/kbXO/yAnNtzhG8RXxT1or4J9UxopfYD7LRIEPKDxbpUU
         9ewGyD/YDK6YoohfkrBQ9u11YQacgLlcvYGyfqDb0+VuAUawGKd86Im/bbbqZ27whB6n
         K+wA==
X-Gm-Message-State: AOJu0YzSEb7D9mQjKXkRotcwKzOYf6cTKUDZW38pCfUF/uEj9Qi4P2vC
        ToIQov2oVns2H9t3a9mBRIMEjMFyE2Bp23z7WsFF16BFiyiiNNsbzPrJQXqAlXvJAlD6Ju6cvsP
        d/L1Lx0u9nZ1b8VVjuXCiVQ==
X-Received: by 2002:a05:651c:c98:b0:2c5:13b1:b450 with SMTP id bz24-20020a05651c0c9800b002c513b1b450mr10090919ljb.26.1698686691295;
        Mon, 30 Oct 2023 10:24:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHH4GpuJ4hd8lDIQ6vW1HWByPqqh+IwG7ee+zcxusmVo9be7cbvygAsUC7OMmwHWlxrzIuEsg==
X-Received: by 2002:a05:651c:c98:b0:2c5:13b1:b450 with SMTP id bz24-20020a05651c0c9800b002c513b1b450mr10090869ljb.26.1698686690900;
        Mon, 30 Oct 2023 10:24:50 -0700 (PDT)
Received: from [192.168.1.174] ([151.81.68.207])
        by smtp.googlemail.com with ESMTPSA id n13-20020a05600c500d00b0040772934b12sm13131967wmr.7.2023.10.30.10.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 10:24:49 -0700 (PDT)
Message-ID: <601f24a0-cb55-458e-aa15-3970f2290172@redhat.com>
Date:   Mon, 30 Oct 2023 18:24:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 14/35] mm: Add AS_UNMOVABLE to mark mapping as
 completely unmovable
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Xiaoyao Li <xiaoyao.li@intel.com>,
        Xu Yilun <yilun.xu@intel.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Fuad Tabba <tabba@google.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Anish Moorthy <amoorthy@google.com>,
        David Matlack <dmatlack@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?= =?UTF-8?Q?n?= <mic@digikod.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Vishal Annapurve <vannapurve@google.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Maciej Szmigiero <mail@maciej.szmigiero.name>,
        David Hildenbrand <david@redhat.com>,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>,
        Wang <wei.w.wang@intel.com>,
        Liam Merwick <liam.merwick@oracle.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-15-seanjc@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20231027182217.3615211-15-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/27/23 20:21, Sean Christopherson wrote:
> Add an "unmovable" flag for mappings that cannot be migrated under any
> circumstance.  KVM will use the flag for its upcoming GUEST_MEMFD support,
> which will not support compaction/migration, at least not in the
> foreseeable future.
> 
> Test AS_UNMOVABLE under folio lock as already done for the async
> compaction/dirty folio case, as the mapping can be removed by truncation
> while compaction is running.  To avoid having to lock every folio with a
> mapping, assume/require that unmovable mappings are also unevictable, and
> have mapping_set_unmovable() also set AS_UNEVICTABLE.
> 
> Cc: Matthew Wilcox <willy@infradead.org>
> Co-developed-by: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

I think this could even be "From: Vlastimil", but no biggie.

Paolo

> ---
>   include/linux/pagemap.h | 19 +++++++++++++++++-
>   mm/compaction.c         | 43 +++++++++++++++++++++++++++++------------
>   mm/migrate.c            |  2 ++
>   3 files changed, 51 insertions(+), 13 deletions(-)
> 
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 351c3b7f93a1..82c9bf506b79 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -203,7 +203,8 @@ enum mapping_flags {
>   	/* writeback related tags are not used */
>   	AS_NO_WRITEBACK_TAGS = 5,
>   	AS_LARGE_FOLIO_SUPPORT = 6,
> -	AS_RELEASE_ALWAYS,	/* Call ->release_folio(), even if no private data */
> +	AS_RELEASE_ALWAYS = 7,	/* Call ->release_folio(), even if no private data */
> +	AS_UNMOVABLE	= 8,	/* The mapping cannot be moved, ever */
>   };
>   
>   /**
> @@ -289,6 +290,22 @@ static inline void mapping_clear_release_always(struct address_space *mapping)
>   	clear_bit(AS_RELEASE_ALWAYS, &mapping->flags);
>   }
>   
> +static inline void mapping_set_unmovable(struct address_space *mapping)
> +{
> +	/*
> +	 * It's expected unmovable mappings are also unevictable. Compaction
> +	 * migrate scanner (isolate_migratepages_block()) relies on this to
> +	 * reduce page locking.
> +	 */
> +	set_bit(AS_UNEVICTABLE, &mapping->flags);
> +	set_bit(AS_UNMOVABLE, &mapping->flags);
> +}
> +
> +static inline bool mapping_unmovable(struct address_space *mapping)
> +{
> +	return test_bit(AS_UNMOVABLE, &mapping->flags);
> +}
> +
>   static inline gfp_t mapping_gfp_mask(struct address_space * mapping)
>   {
>   	return mapping->gfp_mask;
> diff --git a/mm/compaction.c b/mm/compaction.c
> index 38c8d216c6a3..12b828aed7c8 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -883,6 +883,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
>   
>   	/* Time to isolate some pages for migration */
>   	for (; low_pfn < end_pfn; low_pfn++) {
> +		bool is_dirty, is_unevictable;
>   
>   		if (skip_on_failure && low_pfn >= next_skip_pfn) {
>   			/*
> @@ -1080,8 +1081,10 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
>   		if (!folio_test_lru(folio))
>   			goto isolate_fail_put;
>   
> +		is_unevictable = folio_test_unevictable(folio);
> +
>   		/* Compaction might skip unevictable pages but CMA takes them */
> -		if (!(mode & ISOLATE_UNEVICTABLE) && folio_test_unevictable(folio))
> +		if (!(mode & ISOLATE_UNEVICTABLE) && is_unevictable)
>   			goto isolate_fail_put;
>   
>   		/*
> @@ -1093,26 +1096,42 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
>   		if ((mode & ISOLATE_ASYNC_MIGRATE) && folio_test_writeback(folio))
>   			goto isolate_fail_put;
>   
> -		if ((mode & ISOLATE_ASYNC_MIGRATE) && folio_test_dirty(folio)) {
> -			bool migrate_dirty;
> +		is_dirty = folio_test_dirty(folio);
> +
> +		if (((mode & ISOLATE_ASYNC_MIGRATE) && is_dirty) ||
> +		    (mapping && is_unevictable)) {
> +			bool migrate_dirty = true;
> +			bool is_unmovable;
>   
>   			/*
>   			 * Only folios without mappings or that have
> -			 * a ->migrate_folio callback are possible to
> -			 * migrate without blocking.  However, we may
> -			 * be racing with truncation, which can free
> -			 * the mapping.  Truncation holds the folio lock
> -			 * until after the folio is removed from the page
> -			 * cache so holding it ourselves is sufficient.
> +			 * a ->migrate_folio callback are possible to migrate
> +			 * without blocking.
> +			 *
> +			 * Folios from unmovable mappings are not migratable.
> +			 *
> +			 * However, we can be racing with truncation, which can
> +			 * free the mapping that we need to check. Truncation
> +			 * holds the folio lock until after the folio is removed
> +			 * from the page so holding it ourselves is sufficient.
> +			 *
> +			 * To avoid locking the folio just to check unmovable,
> +			 * assume every unmovable folio is also unevictable,
> +			 * which is a cheaper test.  If our assumption goes
> +			 * wrong, it's not a correctness bug, just potentially
> +			 * wasted cycles.
>   			 */
>   			if (!folio_trylock(folio))
>   				goto isolate_fail_put;
>   
>   			mapping = folio_mapping(folio);
> -			migrate_dirty = !mapping ||
> -					mapping->a_ops->migrate_folio;
> +			if ((mode & ISOLATE_ASYNC_MIGRATE) && is_dirty) {
> +				migrate_dirty = !mapping ||
> +						mapping->a_ops->migrate_folio;
> +			}
> +			is_unmovable = mapping && mapping_unmovable(mapping);
>   			folio_unlock(folio);
> -			if (!migrate_dirty)
> +			if (!migrate_dirty || is_unmovable)
>   				goto isolate_fail_put;
>   		}
>   
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 2053b54556ca..ed874e43ecd7 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -956,6 +956,8 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
>   
>   		if (!mapping)
>   			rc = migrate_folio(mapping, dst, src, mode);
> +		else if (mapping_unmovable(mapping))
> +			rc = -EOPNOTSUPP;
>   		else if (mapping->a_ops->migrate_folio)
>   			/*
>   			 * Most folios have a mapping and most filesystems

