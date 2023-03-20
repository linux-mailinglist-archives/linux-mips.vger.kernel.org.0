Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 601BB6C0F97
	for <lists+linux-mips@lfdr.de>; Mon, 20 Mar 2023 11:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbjCTKsD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Mar 2023 06:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbjCTKr3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Mar 2023 06:47:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B35D128E52
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 03:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679308980;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=26nymbdY5u8lbHR6tGhq6iWNHbEegWrEQrrqMsFd9eI=;
        b=g8Sdqcp4vdpI4W4YoFAEG9UQlbEQJiDem2jvYW3PZ+qJtLuTGKT0Sk7k/IytTJRjE4FPt4
        EG06ww9TDZ7zOnvdKAbpmbYeMBVOhFuCIbklKS7gFz4+Juo9HdGtUMf007c4I9EymETElV
        Rhw98cyMqzWYBdBnjN/50TDbVM0pOsg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303--2SO9hyWOAuNaNqZiR9Hxg-1; Mon, 20 Mar 2023 06:39:32 -0400
X-MC-Unique: -2SO9hyWOAuNaNqZiR9Hxg-1
Received: by mail-wm1-f71.google.com with SMTP id m30-20020a05600c3b1e00b003ed31d151ecso4244332wms.1
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 03:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679308771;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26nymbdY5u8lbHR6tGhq6iWNHbEegWrEQrrqMsFd9eI=;
        b=YjC6neB8nO7Gw9w1wNDzXWaCKaNtCjMdZ58a1LNGFwqqsJAeLnshE8vW0onODs3xaC
         vVgCtx9Wa0PanN2COsnGCDqE9g1IyTOL9hUkpxzDHhFlzzJcugihvqcPMFeJqDMcQpDn
         6wFBDanJPcOHuEZgUKHP/4H21YUhktF17SBHtuhLkc2lSt/FK8a/AEVhb5tZupuGYWhi
         2hydtmjL+jVUvjYN1uiAoVd++RG/uR69i0qh6OMNiz1tiOunXoLtRIOARZs+Pn1LB53J
         zJ/RS68ee5xDvBaFTZWQvL0de2iW5RNrlunpSm13UN+pQRtl67v/Fu8kuK1ff4nQBBlR
         WWJA==
X-Gm-Message-State: AO0yUKV5V8jYp05IfJnz50034Hdhod87RxEjsOKakys1yAxD6NqrCoXk
        BTxJCrTk2rh8tUowGTWG26+huje6kY4PK52cuY4olC2EsDutTm9m0fpvH5rDalfgQFVmyn4HOHx
        WBR0VGFsntTEl+vhMhPIiWg==
X-Received: by 2002:a05:600c:3ca2:b0:3eb:3104:efec with SMTP id bg34-20020a05600c3ca200b003eb3104efecmr33198194wmb.16.1679308770987;
        Mon, 20 Mar 2023 03:39:30 -0700 (PDT)
X-Google-Smtp-Source: AK7set9NBj44qlarRe5btSusjcRWML7XEeQG/k8kSYzk0ECsow+UousrzVViL3IUmOf4g4r58+RnIQ==
X-Received: by 2002:a05:600c:3ca2:b0:3eb:3104:efec with SMTP id bg34-20020a05600c3ca200b003eb3104efecmr33198180wmb.16.1679308770675;
        Mon, 20 Mar 2023 03:39:30 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:4100:a064:1ded:25ec:cf2f? (p200300cbc7024100a0641ded25eccf2f.dip0.t-ipconnect.de. [2003:cb:c702:4100:a064:1ded:25ec:cf2f])
        by smtp.gmail.com with ESMTPSA id e24-20020a05600c219800b003ed1f111fdesm10006176wme.20.2023.03.20.03.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 03:39:30 -0700 (PDT)
Message-ID: <496d8ba6-dea6-159e-3e98-75d8dee58a12@redhat.com>
Date:   Mon, 20 Mar 2023 11:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 10/15] mm: move init_mem_debugging_and_hardening() to
 mm/mm_init.c
Content-Language: en-US
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Matthew Wilcox <willy@infradead.org>, Mel Gorman <mgorman@suse.de>,
        Michal Hocko <mhocko@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-mm@kvack.org
References: <20230319220008.2138576-1-rppt@kernel.org>
 <20230319220008.2138576-11-rppt@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230319220008.2138576-11-rppt@kernel.org>
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

On 19.03.23 23:00, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> init_mem_debugging_and_hardening() is only called from mm_core_init().
> 

While at it, maybe rename it to ..._init() like most other such 
functions in there?

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

