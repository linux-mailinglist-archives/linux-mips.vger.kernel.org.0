Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 025107941EC
	for <lists+linux-mips@lfdr.de>; Wed,  6 Sep 2023 19:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbjIFRRw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Sep 2023 13:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243054AbjIFRRs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Sep 2023 13:17:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C29199B
        for <linux-mips@vger.kernel.org>; Wed,  6 Sep 2023 10:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694020627;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CR3YynKXaKiiQJdEERaEXmnpbVzEvFa9RLxlNGmAE/M=;
        b=MWn+GNBmF71fN6BK4qRyTd7YH1rgZEnTx4hUBLEqpw8B1GUn+WAUJ0tNJ5ljTidUZQsBnC
        epyB0nnowsdAN6tSJ1RX2n1/xoXz+bNqhN3zHt0jLsn/on83AfawTjtNDfHQObmK1UP74n
        blM3/jGbAAsFwY5J5ebzqiayTpy9dwU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-B2FUQhByNtq6S5XsD25k5g-1; Wed, 06 Sep 2023 13:17:05 -0400
X-MC-Unique: B2FUQhByNtq6S5XsD25k5g-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3fef3606d8cso997405e9.1
        for <linux-mips@vger.kernel.org>; Wed, 06 Sep 2023 10:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694020625; x=1694625425;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CR3YynKXaKiiQJdEERaEXmnpbVzEvFa9RLxlNGmAE/M=;
        b=PC5GfFtOS4EfCDpVPfesOU2nUK/tBxlag8KQs0u589nZ5J0otiHa2F6SRYNmH88SdN
         G1UqZBBo1alOZfDrD6ePPHJhCkuptn9PJEPuaf9NPUOn4NDvZWgD8bKeq5vzr9ZNZP1h
         COAJ7uDJmZbAw0c0VY2ZuPbhFzsdLjbFwhyA8sSOT64UdUSAW16Hea8Am99FmV8WENf6
         TDZhb/PC4hF3l0Lai0u9hGkbRTUFNJyamc0qV6nrYiXJgfhBTbfjqH2VvDd8oLBCIX33
         75X2jKCGZX8eCWIx2CPYl03p9EIk+ToQYYiYQsa0F8qUZkwlVNfzvYS3wrLCqI1qvXUp
         BHOA==
X-Gm-Message-State: AOJu0YwVOuBMsHcoZ69H0sXLh80QXOjaGxf0/cq4ulFhAxStmrI71Hoo
        B+EwMUsWYCzyJZcIACsG5PlMXemG6ex45fyVn8GT0rY55bdErrxSzYFPPIwPSu5ML9/nlR4FOEC
        fT7uf7urCpj/gl5L43KGrqA==
X-Received: by 2002:a7b:c4ce:0:b0:401:23fc:1f92 with SMTP id g14-20020a7bc4ce000000b0040123fc1f92mr2809013wmk.25.1694020624811;
        Wed, 06 Sep 2023 10:17:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG4o9bck5/tiQkiMkWZdjBFcs77pyDT3CLH5B1kIaOGxIvv2R5B5SW/T3zGzGf0a1B9aicQQ==
X-Received: by 2002:a7b:c4ce:0:b0:401:23fc:1f92 with SMTP id g14-20020a7bc4ce000000b0040123fc1f92mr2808989wmk.25.1694020624418;
        Wed, 06 Sep 2023 10:17:04 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70c:6c00:92a4:6f8:ff7e:6853? (p200300cbc70c6c0092a406f8ff7e6853.dip0.t-ipconnect.de. [2003:cb:c70c:6c00:92a4:6f8:ff7e:6853])
        by smtp.gmail.com with ESMTPSA id x3-20020a1c7c03000000b003fefaf299b6sm88234wmc.38.2023.09.06.10.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 10:17:03 -0700 (PDT)
Message-ID: <6dfbc043-c969-f78d-1e56-5434026246ea@redhat.com>
Date:   Wed, 6 Sep 2023 19:17:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/5] mm/memory_hotplug: use nth_page() in place of
 direct struct page manipulation.
Content-Language: en-US
To:     Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Muchun Song <muchun.song@linux.dev>,
        "Mike Rapoport (IBM)" <rppt@kernel.org>, stable@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
References: <20230906150309.114360-1-zi.yan@sent.com>
 <20230906150309.114360-4-zi.yan@sent.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230906150309.114360-4-zi.yan@sent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 06.09.23 17:03, Zi Yan wrote:
> From: Zi Yan <ziy@nvidia.com>

Subject talks about "nth_page()" but that's not what this patch does.

> 
> When dealing with hugetlb pages, manipulating struct page pointers
> directly can get to wrong struct page, since struct page is not guaranteed
> to be contiguous on SPARSEMEM without VMEMMAP. Use nth_page() to handle
> it properly.

^ dito

> 
> Fixes: eeb0efd071d8 ("mm,memory_hotplug: fix scan_movable_pages() for gigantic hugepages")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/memory_hotplug.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 1b03f4ec6fd2..3b301c4023ff 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1689,7 +1689,7 @@ static int scan_movable_pages(unsigned long start, unsigned long end,
>   		 */
>   		if (HPageMigratable(head))
>   			goto found;
> -		skip = compound_nr(head) - (page - head);
> +		skip = compound_nr(head) - (pfn - page_to_pfn(head));
>   		pfn += skip - 1;
>   	}
>   	return -ENOENT;

I suspect systems without VMEMMAP also don't usually support gigantic 
pages AND hotunplug :)

With the subject+description fixed

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

