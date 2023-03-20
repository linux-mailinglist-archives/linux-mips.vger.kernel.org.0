Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E52566C0F0E
	for <lists+linux-mips@lfdr.de>; Mon, 20 Mar 2023 11:36:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbjCTKgs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Mar 2023 06:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbjCTKgc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Mar 2023 06:36:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 465AD1A48A
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 03:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679308500;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7xiGdM8qiWWcZc5Y3ojCQP7Km8IWAa3x8WZuiHZfb+w=;
        b=LNZWYb8O8KWLFz6HrSsUzt989Wt1YZOx9GM6/3fQxjU7Hj00j7l9jeMOoFp765sZFkfc44
        DfceCFllPD7BMCLGd7k1yy2aMpiBlZWpgRI40RuJEZJ89+/+EEMndizTqaWzIKtdXBVBLh
        EydkLI61vTZE6GBIKHKhkrPJzCUqkxI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-VJNkpMLZMnKiUa7vxnTOVA-1; Mon, 20 Mar 2023 06:34:59 -0400
X-MC-Unique: VJNkpMLZMnKiUa7vxnTOVA-1
Received: by mail-wm1-f72.google.com with SMTP id l18-20020a05600c4f1200b003ed35ab903aso7817124wmq.6
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 03:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679308498;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xiGdM8qiWWcZc5Y3ojCQP7Km8IWAa3x8WZuiHZfb+w=;
        b=hM7ZOaxgwuxfXQBCAgM/eT4Lcgzx4cLCZeQfYbcyczYTYWsbr9oy7VNaOInDZsArlA
         B3ZTQ6OQVjE8iD+/HMQY62umNYyl1GkN7JjXMNwNNNUUHSwtQRNO2Z8D1Z+vif/DrELJ
         HveU/eR0w9UXMUZtAIeVpvM6TdlBGLMQm9bWPjQXiVYdd5Nrx4WTidnv1Yy+2u37m+ie
         98Vxb2Ct3nRJ4xszd99Q5yUO0s8M2dQVAD3Ih1ln4MzggylxkPzW9R7N+yZ1pMXv8DtD
         njn34++KwXQhTvtcIeDl1iE7WsnOHBgJRtXMcgDIeqnY5z0wJtWWIg9rRFW/bgc3X/Q/
         Ckrg==
X-Gm-Message-State: AO0yUKUg/wyaQGujBPUuHM6wXVy+PdPTg9mrMQwIE9C42riNKmxvI3cO
        1xJ/iL7KwsILX5o9IdcB6QB8phyZ73ToUN88ogfpouvEHb2KO1mD0YjZszPTk+rq1zOb8g+JoG8
        h6LjumY3+T0VjwVl2yOudPA==
X-Received: by 2002:a05:600c:3ac8:b0:3eb:3f2d:f237 with SMTP id d8-20020a05600c3ac800b003eb3f2df237mr32646780wms.6.1679308498325;
        Mon, 20 Mar 2023 03:34:58 -0700 (PDT)
X-Google-Smtp-Source: AK7set9cavkyeFK3piIOBCtuEs5AUwXm5PrMQ/83PE0I5uSMw3B5E8ySror6anfmRavZagCW6dcC/w==
X-Received: by 2002:a05:600c:3ac8:b0:3eb:3f2d:f237 with SMTP id d8-20020a05600c3ac800b003eb3f2df237mr32646764wms.6.1679308498009;
        Mon, 20 Mar 2023 03:34:58 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:4100:a064:1ded:25ec:cf2f? (p200300cbc7024100a0641ded25eccf2f.dip0.t-ipconnect.de. [2003:cb:c702:4100:a064:1ded:25ec:cf2f])
        by smtp.gmail.com with ESMTPSA id f12-20020a1cc90c000000b003e20cf0408esm10087783wmb.40.2023.03.20.03.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 03:34:57 -0700 (PDT)
Message-ID: <dbd54710-a030-ff08-bd66-1a42c1934138@redhat.com>
Date:   Mon, 20 Mar 2023 11:34:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 06/15] mm/page_alloc: rename page_alloc_init() to
 page_alloc_init_cpuhp()
Content-Language: en-US
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Matthew Wilcox <willy@infradead.org>, Mel Gorman <mgorman@suse.de>,
        Michal Hocko <mhocko@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-mm@kvack.org
References: <20230319220008.2138576-1-rppt@kernel.org>
 <20230319220008.2138576-7-rppt@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230319220008.2138576-7-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 19.03.23 22:59, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> The page_alloc_init() name is really misleading because all this
> function does is sets up CPU hotplug callbacks for the page allocator.
> 
> Rename it to page_alloc_init_cpuhp() so that name will reflect what the
> function does.
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

