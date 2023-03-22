Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 663516C48F6
	for <lists+linux-mips@lfdr.de>; Wed, 22 Mar 2023 12:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbjCVLUb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Mar 2023 07:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbjCVLU3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Mar 2023 07:20:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A554346E
        for <linux-mips@vger.kernel.org>; Wed, 22 Mar 2023 04:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679483985;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e3/nSZoroy6XHga0RIUuS2iBwJK2UyjAhfIJ68s4VJM=;
        b=ZDVvBvOIRRB95RZtEYG0ZAlo0XMc0yFg4983vmfuOiusb3Hb4MVDAuIxtA4DbKR4aT/ebb
        hDsXv+rBbuGMi2ArOTB5s6hY+pRxVaDh9wd2oEbP2/DRnboBthVeFyAngGz+uCXppQE1Vf
        z4blyV7G6xOEmSDhm1iFBEJdi25WqOQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-r87EBxPiPUqKtLzNroKZOw-1; Wed, 22 Mar 2023 07:19:43 -0400
X-MC-Unique: r87EBxPiPUqKtLzNroKZOw-1
Received: by mail-wm1-f70.google.com with SMTP id j16-20020a05600c1c1000b003edfa11fa91so3738472wms.3
        for <linux-mips@vger.kernel.org>; Wed, 22 Mar 2023 04:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679483982;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3/nSZoroy6XHga0RIUuS2iBwJK2UyjAhfIJ68s4VJM=;
        b=touGg/BN2HgfVRfjmw0iMQJnPxGS6LQmxvIb+TW56L68haelMhvMYLL9fbUAgqCYjb
         E5Elium5TtnBM3MmS+Ks5v1GzeMs0yS1UsF+zEDGRuWvmttF8iXV9mZ/kF6iMRrUlT37
         wr0a+KH9JDz3fnqFKcUXrSdQ7kXRMIDimtxfo/Q1cXPEmZlk+DdOLpBvC31ykk5YUv7F
         z5fCR6uLyLQELlXhAG9FAWxrLTmsc7BhaxzdC+Yzq8m0jFPl5MRr3dTnKY8jdRpr/R+O
         RrYlXXYmN6QnyGuGkHju7sLRW64UONGDy+X/ehz6nUva8FFmrG+X8YItcDtnv2r9W8/y
         zeVQ==
X-Gm-Message-State: AO0yUKWSY2iz7DnYZX9/EZerI9wiciSvOXXuLm1DtPxOLsrS+SdfnGXl
        TZuXkeOI/D/pdUMJ5QrRW7J5Zx1f8SeA204I9yDTR9ScCCunSx7K5TmIPmStgHIH1R+DljBrUCA
        q3tztBQ6LWKIvuhMJMvJCMg==
X-Received: by 2002:adf:f885:0:b0:2d2:39d3:ce7c with SMTP id u5-20020adff885000000b002d239d3ce7cmr4635778wrp.70.1679483982401;
        Wed, 22 Mar 2023 04:19:42 -0700 (PDT)
X-Google-Smtp-Source: AK7set+9yQcW9mnOqm/TbVZZpP3tWHGR1CXLts64jiq/IWPswo5SopyoJGwWUerGNZUby6CY1fUe8w==
X-Received: by 2002:adf:f885:0:b0:2d2:39d3:ce7c with SMTP id u5-20020adff885000000b002d239d3ce7cmr4635761wrp.70.1679483982127;
        Wed, 22 Mar 2023 04:19:42 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:d00:ca74:d9ea:11e0:dfb? (p200300cbc7030d00ca74d9ea11e00dfb.dip0.t-ipconnect.de. [2003:cb:c703:d00:ca74:d9ea:11e0:dfb])
        by smtp.gmail.com with ESMTPSA id d7-20020adffbc7000000b002d5a8d8442asm9363506wrs.37.2023.03.22.04.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 04:19:41 -0700 (PDT)
Message-ID: <95c37e76-74a8-a384-e7f0-4e476ed52e15@redhat.com>
Date:   Wed, 22 Mar 2023 12:19:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 00/14] mm: move core MM initialization to mm/mm_init.c
Content-Language: en-US
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Doug Berger <opendmb@gmail.com>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-mm@kvack.org
References: <20230321170513.2401534-1-rppt@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230321170513.2401534-1-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 21.03.23 18:04, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> Also in git:
> https://git.kernel.org/rppt/h/mm-init/v2
> 
> v2:
> * move init_cma_reserved_pageblock() from cma.c to mm_init.c
> * rename init_mem_debugging_and_hardening() to
>    mem_debugging_and_hardening_init()
> * inline pgtable_init() into mem_core_init()
> * add Acked and Reviewed tags (thanks David, hopefully I've picked them
>    right)

Sorry, I get lazy on large patches and only ACK instead of checking each 
and every line :)

-- 
Thanks,

David / dhildenb

