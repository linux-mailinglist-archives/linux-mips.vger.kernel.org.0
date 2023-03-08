Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10C086B10DA
	for <lists+linux-mips@lfdr.de>; Wed,  8 Mar 2023 19:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjCHSPd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Mar 2023 13:15:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjCHSPc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Mar 2023 13:15:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F54282362
        for <linux-mips@vger.kernel.org>; Wed,  8 Mar 2023 10:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678299241;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oqVUMBgLdWuWEkEiWBuCdYbN5kgycGc8p0MkzJipZw8=;
        b=GPeTbRNinbIQjNht+2WkSJvZjMljWhc3tvMCLobN+t7xTVl0036sptF60yhErT4VnZzL8u
        TWY0d7l2ZGdyKKdjVmZScWt2N6mpnNhizTIsG3QiDXWVg/aJRLUUGA3T5dwphREjcUjpu0
        OjZxZq/JVQhsNjMeEZsc4Q4970A8Org=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-J4c3GMsuM5CvkSq_QtBHug-1; Wed, 08 Mar 2023 13:13:59 -0500
X-MC-Unique: J4c3GMsuM5CvkSq_QtBHug-1
Received: by mail-wr1-f69.google.com with SMTP id 15-20020a056000156f00b002ca79db6d42so3063883wrz.18
        for <linux-mips@vger.kernel.org>; Wed, 08 Mar 2023 10:13:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678299239;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqVUMBgLdWuWEkEiWBuCdYbN5kgycGc8p0MkzJipZw8=;
        b=XPoLMVdAj2FLrKDFTk6imnm6IWWSXZr0826J6zKaXvGdyYV8KxiRWEr+ysvip2UnZP
         S7hO1WIP4rBupSRtXlI6F67cHlzHH64tX8w5AX3OSi7VV4DYrvEJgkQZ0ucPxSYWFmZq
         Quj+EdJwVbqZuYYduzdNqhOFZlsC2yv4g+SPA8VbMFWyjkeBGb3WgZ3lrtaXYQmNTZEb
         3LZwf5iZxCI7motOUDFa0jTmbF393moIElGIY1jn3CkOkfYJ9vr/ShFYRngY9b3M7y8b
         2ZDrWp9iQvSD2ETR9LjM1pGLFBBt29YOnyhfeAjELyjxPEJwi1bNxO+i30+fWFVWHpdY
         acVg==
X-Gm-Message-State: AO0yUKUTW/8JBQkkqcUgrUbT4bLnJWHC298CFAzLncaEu2Wj3pGbZJ3Z
        lieDYLuq9VdIVQPFPaHtGR++z7pjm1r7LFZ/BP4FN69ntvjU9tSc9A+FCMII0gKHLzsDsBttEI6
        TfRrLIMIfxLJFGiNijplJVw==
X-Received: by 2002:a05:600c:1e8d:b0:3e2:669:757 with SMTP id be13-20020a05600c1e8d00b003e206690757mr16617466wmb.10.1678299238876;
        Wed, 08 Mar 2023 10:13:58 -0800 (PST)
X-Google-Smtp-Source: AK7set+WPqgI4NzGQjNxiuwyUBe8i9sylAhAstDgZK0opmz/cBRzcC+hzIeoGWHq+f4Os0qszuvRgQ==
X-Received: by 2002:a05:600c:1e8d:b0:3e2:669:757 with SMTP id be13-20020a05600c1e8d00b003e206690757mr16617435wmb.10.1678299238573;
        Wed, 08 Mar 2023 10:13:58 -0800 (PST)
Received: from ?IPV6:2003:cb:c71b:cb00:d372:1da8:9e9e:422d? (p200300cbc71bcb00d3721da89e9e422d.dip0.t-ipconnect.de. [2003:cb:c71b:cb00:d372:1da8:9e9e:422d])
        by smtp.gmail.com with ESMTPSA id n4-20020a05600c4f8400b003e20fa01a86sm201680wmq.13.2023.03.08.10.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 10:13:58 -0800 (PST)
Message-ID: <a5c9b925-57ac-eeab-6258-0ff9fed16af7@redhat.com>
Date:   Wed, 8 Mar 2023 19:13:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] mm: add PTE pointer parameter to
 flush_tlb_fix_spurious_fault()
Content-Language: en-US
To:     Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-power <linuxppc-dev@lists.ozlabs.org>,
        linux-x86 <x86@kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>
References: <20230306161548.661740-1-gerald.schaefer@linux.ibm.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230306161548.661740-1-gerald.schaefer@linux.ibm.com>
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

On 06.03.23 17:15, Gerald Schaefer wrote:
> s390 can do more fine-grained handling of spurious TLB protection faults,
> when there also is the PTE pointer available.
> 
> Therefore, pass on the PTE pointer to flush_tlb_fix_spurious_fault() as
> an additional parameter.
> 
> This will add no functional change to other architectures, but those with
> private flush_tlb_fix_spurious_fault() implementations need to be made
> aware of the new parameter.
> 
> Reviewed-by: Alexander Gordeev <agordeev@linux.ibm.com>
> Signed-off-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

