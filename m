Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 542096C0F8C
	for <lists+linux-mips@lfdr.de>; Mon, 20 Mar 2023 11:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbjCTKpl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Mar 2023 06:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbjCTKpI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Mar 2023 06:45:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05F1112F35
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 03:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679308824;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5Fv8w0AbL4i3rtVaOqAMiK4Y5Lk55ACIoeLlYUsMQaA=;
        b=Ovk/Ye7oBpEaL9Z65FmamvtO1ObKyEef94gUIHHg3x3qrd9N9pRA5xsV0sFo+/e360In8V
        cVIj0sld+O4Lcljs/t0i6yvXQ9rZojsX44ocCTcYnLjIpV0Pp4+6OQMKtxioPJp+MnNo0z
        qiW/3vMx/FohVBhaR/z1AfweR3QzPSE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-eZGyT3FhOXaY219TJk7d_w-1; Mon, 20 Mar 2023 06:40:23 -0400
X-MC-Unique: eZGyT3FhOXaY219TJk7d_w-1
Received: by mail-wm1-f72.google.com with SMTP id i3-20020a05600c354300b003edfa408811so1100365wmq.1
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 03:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679308822;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Fv8w0AbL4i3rtVaOqAMiK4Y5Lk55ACIoeLlYUsMQaA=;
        b=7TtgJmOdMzeeY6WlcRa2pSJaIw0LCMADZR/PGaRWMdAAoP4Zf1JmBa4MqsIVx9ZRgz
         s3uNH0N7/dfNhWCPbq23A/IS0SefwHRQ9P71kGkAm6zFIoh9be7Z8OZu0kOMXTZ2kO37
         LucSeL4GuDGzRyhszQ+Ox1w8IwFQ3/aQ+2FdSho1Iog72qjNfqIf8G5AEgWrysLul8hW
         He62cl7elOz7CCIs0LEeKxjvVNFo77JSsm4JjfNG755NoCfbys73L4kKVQm08DTONdWO
         Add4zrUOR0CosF4/qr3/34wgcKo84p85fgv/hEXZrhxv/6j9HcJG32wPlAMvTuX3ChJe
         PQPw==
X-Gm-Message-State: AO0yUKVq0910in+XSbvGa1A326zEMaQNlGvpqvbR0Q9Wlju2E0gesQeN
        QPicDil5HpkmHpawImRSF5eEvAcMjYvSgwxtBfA4wj8cWen1m2Hv2UuY4qJmJcIFnm4XugoIWul
        19L+XtWJYdUGNtup/P3WjFw==
X-Received: by 2002:a1c:f706:0:b0:3eb:2e27:2d0c with SMTP id v6-20020a1cf706000000b003eb2e272d0cmr9616611wmh.1.1679308822328;
        Mon, 20 Mar 2023 03:40:22 -0700 (PDT)
X-Google-Smtp-Source: AK7set/10g4Z7aB7TI1HoVcnUgopnpX2wy6FwefAdrIqgvU3clik3GvbZHOBAURtPSuVMmg+4a+jYg==
X-Received: by 2002:a1c:f706:0:b0:3eb:2e27:2d0c with SMTP id v6-20020a1cf706000000b003eb2e272d0cmr9616595wmh.1.1679308822052;
        Mon, 20 Mar 2023 03:40:22 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:4100:a064:1ded:25ec:cf2f? (p200300cbc7024100a0641ded25eccf2f.dip0.t-ipconnect.de. [2003:cb:c702:4100:a064:1ded:25ec:cf2f])
        by smtp.gmail.com with ESMTPSA id l15-20020a7bc44f000000b003edef091b17sm3057940wmi.37.2023.03.20.03.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 03:40:21 -0700 (PDT)
Message-ID: <1cb57760-7ca6-a2e9-1f86-366ca8d3145e@redhat.com>
Date:   Mon, 20 Mar 2023 11:40:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 12/15] mm: move mem_init_print_info() to mm_init.c
Content-Language: en-US
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Matthew Wilcox <willy@infradead.org>, Mel Gorman <mgorman@suse.de>,
        Michal Hocko <mhocko@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-mm@kvack.org
References: <20230319220008.2138576-1-rppt@kernel.org>
 <20230319220008.2138576-13-rppt@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230319220008.2138576-13-rppt@kernel.org>
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
> mem_init_print_info() is only called from mm_core_init().
> 
> Move it close to the caller and make it static.
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

