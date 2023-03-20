Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F24F26C104E
	for <lists+linux-mips@lfdr.de>; Mon, 20 Mar 2023 12:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbjCTLIp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Mar 2023 07:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbjCTLI1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Mar 2023 07:08:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B687D97
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 04:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679310198;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lIFtl/CdbkvqlgRRGw1TYckYM/MRLzEp0Cl1ZbWEyfY=;
        b=ZgnJM4LUjbNTChLaM0qBcH/kZ9FTI0CabhXOjkCvPbq6pVPM5F7xxqphwsldSMXZnhQGrM
        OQXukCPhQRR27MTfhdxX9BFVjeNsR3Fyl1fmoH0lV+TLL1FKcbkeKfgmp2zhfoJZbgSmkZ
        BgaIthDfAja9o+IX7kjmPSOC2KUw+6A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-Yt1ka_v7Pnq0lH01V8a7DQ-1; Mon, 20 Mar 2023 06:41:44 -0400
X-MC-Unique: Yt1ka_v7Pnq0lH01V8a7DQ-1
Received: by mail-wm1-f70.google.com with SMTP id j36-20020a05600c1c2400b003ed245a452fso5328218wms.3
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 03:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679308903;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIFtl/CdbkvqlgRRGw1TYckYM/MRLzEp0Cl1ZbWEyfY=;
        b=1jvUlHLJ4EChtB+3SH1/p6tM2IFeyxVcWhwe9nlXJgyjJS90fu1D1KxQRHPJkElZV2
         hP/bT/3duVSrWvy47V+oSePvqT/tnBYUdkT+CCD9i1hLl68V47P8tQPLgEiLT86JXo7Q
         qZEKcZUrejtlWD2kfb45T5NePIjm3gqRLIoh6+Vfv2gTgpDbV4jBbfH4AaefQGU/PtNU
         MMG6h2keAW3fSLMUorqA8id17Mf54GcWa1PzIZbxgXBRj+UE84vCY6+aWdkA3r/QYQ4w
         sAEzVKLRAUTLPeUuv49AlA4lL059d6FNzGUv8NCzTDtZuq518Abt4mWqwy2+7IP1p3Se
         TkXw==
X-Gm-Message-State: AO0yUKWJj7dBVPDwOJj54NZdomVFVaOSNuWZKieqTwUrYqA86VYVqqoY
        GWRioPFHkcNNyVIBLINddIRTkujgAN0fACRbS/aTkazqzyYvJVkGesCk/Jj/Zb0XAYmo6FH6gqa
        BEtIvJbWDJfdTSqETTSMOmg==
X-Received: by 2002:adf:cc8b:0:b0:2d0:776:b766 with SMTP id p11-20020adfcc8b000000b002d00776b766mr12583482wrj.8.1679308903299;
        Mon, 20 Mar 2023 03:41:43 -0700 (PDT)
X-Google-Smtp-Source: AK7set/e1XYwRgb6akZTCg38dL9NExXXfVLSEf9eOFyMKKinU7dW/+58ajB7iwrsP5RR7BUj+5JVlg==
X-Received: by 2002:adf:cc8b:0:b0:2d0:776:b766 with SMTP id p11-20020adfcc8b000000b002d00776b766mr12583467wrj.8.1679308902986;
        Mon, 20 Mar 2023 03:41:42 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:4100:a064:1ded:25ec:cf2f? (p200300cbc7024100a0641ded25eccf2f.dip0.t-ipconnect.de. [2003:cb:c702:4100:a064:1ded:25ec:cf2f])
        by smtp.gmail.com with ESMTPSA id b18-20020adff912000000b002c567881dbcsm8514466wrr.48.2023.03.20.03.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 03:41:42 -0700 (PDT)
Message-ID: <79a78108-efa6-860f-03a6-d791171f8dcc@redhat.com>
Date:   Mon, 20 Mar 2023 11:41:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 15/15] MAINTAINERS: extend memblock entry to include MM
 initialization
Content-Language: en-US
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Matthew Wilcox <willy@infradead.org>, Mel Gorman <mgorman@suse.de>,
        Michal Hocko <mhocko@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-mm@kvack.org
References: <20230319220008.2138576-1-rppt@kernel.org>
 <20230319220008.2138576-16-rppt@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230319220008.2138576-16-rppt@kernel.org>
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
> and add mm/mm_init.c to memblock entry in MAINTAINERS
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

