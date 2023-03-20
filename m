Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 023FF6C0F9B
	for <lists+linux-mips@lfdr.de>; Mon, 20 Mar 2023 11:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjCTKtD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Mar 2023 06:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbjCTKs0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Mar 2023 06:48:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C7D26CE4
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679309078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i/zfm/iMBqjihSZrFF9A/S4gBRsOTN99Y8OwQCdHpx4=;
        b=VxmvtzQbBAEQcjdZTKbISqnq8vFLpcjmMu/7Xtx5ZkMHPMI3/fRRMfDPULPun1nRj3G6ce
        PRe4Z3Kj1Efy3uOAs72Q/pP2+MGilMHTcCi4jcvwrK7QsF5oe/i04XyUHgIGJ0jIV9BdCQ
        Oj9aPDgxI0XBmWxdywAvPqdpQN+IbY8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-nLsvgmeBPSOx6k-3Tm2Dsw-1; Mon, 20 Mar 2023 06:41:24 -0400
X-MC-Unique: nLsvgmeBPSOx6k-3Tm2Dsw-1
Received: by mail-wm1-f72.google.com with SMTP id j36-20020a05600c1c2400b003ed245a452fso5327808wms.3
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 03:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679308883;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/zfm/iMBqjihSZrFF9A/S4gBRsOTN99Y8OwQCdHpx4=;
        b=hetry+QzbOsmJen4nDoy7Uuykq11ovQUic43kWaqiVEtkgRouKIg67h+LTVcWxto+9
         n6Tdnf6fqO+Mq66PjtVd+/DFC51dGIZaoJLsfr64qk3IARqnaPqjcm4Gwkipnc/3TWvt
         3EK9IJB0MmIWGMgteGkJCHLtzqP+mEbA/Bp818wSmT1yM2AxWmSSutIZYvzSK8+Xj/Le
         PiRDck/kYpMR/W53gc+uPVY8S0Bp/hMy685mbdrgfffzFtWgiRvGaRe7W3EeBUycMfLs
         pgQuCXpXQNDdW1ytKjM00YZiFVw3gDQmKyQa/7VkGu/OflI7/rftEMRp5PcFSjXymuYG
         f41A==
X-Gm-Message-State: AO0yUKUhC7h2rIhB0yMT+GkHO75yKqteJhlcmo+sym1tZ3yH5azpapDa
        neMO2x3BRfcH25WWbo0nyfdnhRixjmCHDpZFuoXoBUD3j9saTEeqmh4v/QauH3Q9MsBI0dkUj2k
        BdQVitBqjlwgaCvNAJEsSFcCWTvyFZA==
X-Received: by 2002:a7b:ce03:0:b0:3ed:5a7d:fcfe with SMTP id m3-20020a7bce03000000b003ed5a7dfcfemr12841651wmc.3.1679308883702;
        Mon, 20 Mar 2023 03:41:23 -0700 (PDT)
X-Google-Smtp-Source: AK7set8VZjkq7GCgobpz8BUvT0F46hv0XS185gY9bV0RE1/Uo0GRuPBNbY0rUOAkJA7byaVeIEmCUA==
X-Received: by 2002:a7b:ce03:0:b0:3ed:5a7d:fcfe with SMTP id m3-20020a7bce03000000b003ed5a7dfcfemr12841637wmc.3.1679308883377;
        Mon, 20 Mar 2023 03:41:23 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:4100:a064:1ded:25ec:cf2f? (p200300cbc7024100a0641ded25eccf2f.dip0.t-ipconnect.de. [2003:cb:c702:4100:a064:1ded:25ec:cf2f])
        by smtp.gmail.com with ESMTPSA id q13-20020a05600c46cd00b003e1202744f2sm16423888wmo.31.2023.03.20.03.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 03:41:22 -0700 (PDT)
Message-ID: <078af8b0-4f4f-41f0-40d8-2beba34d0e76@redhat.com>
Date:   Mon, 20 Mar 2023 11:41:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 14/15] mm: move vmalloc_init() declaration to
 mm/internal.h
Content-Language: en-US
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Matthew Wilcox <willy@infradead.org>, Mel Gorman <mgorman@suse.de>,
        Michal Hocko <mhocko@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-mm@kvack.org
References: <20230319220008.2138576-1-rppt@kernel.org>
 <20230319220008.2138576-15-rppt@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230319220008.2138576-15-rppt@kernel.org>
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
> vmalloc_init() is called only from mm_core_init(), there is no need to
> declare it in include/linux/vmalloc.h
> 
> Move vmalloc_init() declaration to mm/internal.h
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

