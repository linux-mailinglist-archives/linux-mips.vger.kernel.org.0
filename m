Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5F256C0F11
	for <lists+linux-mips@lfdr.de>; Mon, 20 Mar 2023 11:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbjCTKha (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Mar 2023 06:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbjCTKhE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Mar 2023 06:37:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9294825E22
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 03:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679308539;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pe6rkmEk2ADSmdXI3iCMoR7JpcLeyJRJ5+kiT86CYAg=;
        b=BPTpTn9uAD+MFthaKSEJfesfSlbtszIoXGaNOw6QowUVI3YNlt7uwdBk1GoOXDRUaL2L/r
        /ivd7IZM0WGoXQKpqpmQs26TIuxcTbwUgUtJ8oIoomwl8XMtd0nCpDpGVaPD2jn00yYYSL
        c7VQR+dd8wVu45ghf8IvJ5u8SOlZmoE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527--Gr3Pu57Mf6CXEt7DaxDYA-1; Mon, 20 Mar 2023 06:35:38 -0400
X-MC-Unique: -Gr3Pu57Mf6CXEt7DaxDYA-1
Received: by mail-wm1-f70.google.com with SMTP id o7-20020a05600c4fc700b003edf85f6bb1so1158093wmq.3
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 03:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679308537;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pe6rkmEk2ADSmdXI3iCMoR7JpcLeyJRJ5+kiT86CYAg=;
        b=NowxpoWs7RHmlyBQAp0KEHbNRMVy7hYv2zveJqW/q+IWZqbOoe1qmw0GK7HnEMuQmJ
         OMPtsJNhAYxLM2gEEAQ+SFpxDerg2E25tKWga79IzG4QinvpzoqsXvbI1gp+/UAJVADq
         Rr+XnRbhV0Pkk/HpXp9/XM3P3bDja/LF3wYx14nBp/jQnpbvW6hs9VrUUsXBQxgHVZZM
         SSL6Aa9u/oEEqrrYDqPKO5HNPF2d6eRzapGw/oGSpcNrksHLBYePmII7buJov9Rb0d+9
         2cUGHp3uvi9ierqQWk3hN/ugdGrKSevMpb3XnxG9YS1RcHm/dh2dDwCiafL5yy7Z9baN
         dC2g==
X-Gm-Message-State: AO0yUKX6taBBowViEdGzdhqqI39KYkKRbUNZImTnZ0/J2uVLYAuIdIHk
        eAa8IIJKEh92OnU8vCRMcvHgB8FF5pg7+SBnCW9oe5BAZZpuQeot0YSPVixxte9N85l/twCHye6
        mEGVSGx91mi4IZANEWnJ1zrY0bZvcmw==
X-Received: by 2002:a7b:cb95:0:b0:3ed:a07b:c58f with SMTP id m21-20020a7bcb95000000b003eda07bc58fmr7056889wmi.28.1679308537190;
        Mon, 20 Mar 2023 03:35:37 -0700 (PDT)
X-Google-Smtp-Source: AK7set/3TPR1DrWAdFp/goD2HID6TlG6sfz5sBEnIyBEIyWBMsfX8EYUU5WgNJIDfi6JKJYrz0M+ng==
X-Received: by 2002:a7b:cb95:0:b0:3ed:a07b:c58f with SMTP id m21-20020a7bcb95000000b003eda07bc58fmr7056867wmi.28.1679308536883;
        Mon, 20 Mar 2023 03:35:36 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:4100:a064:1ded:25ec:cf2f? (p200300cbc7024100a0641ded25eccf2f.dip0.t-ipconnect.de. [2003:cb:c702:4100:a064:1ded:25ec:cf2f])
        by smtp.gmail.com with ESMTPSA id 3-20020a05600c020300b003eddefd8792sm4044642wmi.14.2023.03.20.03.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 03:35:36 -0700 (PDT)
Message-ID: <f9f9d306-ed51-de48-c622-b7e7b5df2821@redhat.com>
Date:   Mon, 20 Mar 2023 11:35:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 07/15] init: fold build_all_zonelists() and
 page_alloc_init_cpuhp() to mm_init()
Content-Language: en-US
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Matthew Wilcox <willy@infradead.org>, Mel Gorman <mgorman@suse.de>,
        Michal Hocko <mhocko@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-mm@kvack.org
References: <20230319220008.2138576-1-rppt@kernel.org>
 <20230319220008.2138576-8-rppt@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230319220008.2138576-8-rppt@kernel.org>
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

On 19.03.23 23:00, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> Both build_all_zonelists() and page_alloc_init_cpuhp() must be called
> after SMP setup is complete but before the page allocator is set up.
> 
> Still, they both are a part of memory management initialization, so move
> them to mm_init().
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

