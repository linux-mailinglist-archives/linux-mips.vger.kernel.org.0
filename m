Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C848E6C10A1
	for <lists+linux-mips@lfdr.de>; Mon, 20 Mar 2023 12:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjCTLUL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Mar 2023 07:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbjCTLTt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Mar 2023 07:19:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC09114
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 04:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679311142;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d5Cqw8xYVMyTrqoeKuBmgrncFG33vYGVqLPAeqleY0o=;
        b=T3mRg1y6jlPOeftY6Y4ZLRZAjBScX71mwrweNhaP3HB2f+HDS0jnH26BrMfPeBvJySMd7j
        azNIZrKJwPaQw6CxPeLe8Stnw4S1WTDF+iIq4f2Kn/wbOYo1zBv23q+X7oj+5xZJgkCZGX
        mnohgiXSgjU7cc/kSZKWrMbtghwWxnY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-xCToOUZ5PxGEp5tGe_DqoQ-1; Mon, 20 Mar 2023 07:19:00 -0400
X-MC-Unique: xCToOUZ5PxGEp5tGe_DqoQ-1
Received: by mail-wm1-f69.google.com with SMTP id r35-20020a05600c322300b003edce6ff3b4so1377221wmp.4
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 04:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679311139;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5Cqw8xYVMyTrqoeKuBmgrncFG33vYGVqLPAeqleY0o=;
        b=HpJsEwi3o8674ZvtApiGegSh10fQuJFHb3y0isvUMpCWreLxYsScmSkLrbJ2qaLNMo
         Mg5YQ3b1Yw/JbNubIVaC6wvZVHZ92W+zQLE0olMiWQc4OUe99N4MQcyj2l4bVE0OPq7M
         2GOFxRLipVkUyjKUpGrJRYGckElryoSlmbeU/q4dMVvwn/074tu4kKzE1hodsbmLztsS
         VTgI/lqwx18re3PMOUPd6Vs21WN6yZdt1qd/yS+uscLb9RoouK/5EcYoElknNAHstxhu
         qRcAqsyKJnHeLJU7OCPmvQ2XIETiyytk+C6yyuhW7hUBxFZUU7FSUarrjdfB7uFJf6nf
         HAkg==
X-Gm-Message-State: AO0yUKV/x2nt8D9ueMwA82qfv5roDVLGQQWs9WN4s4TFk2aUrEBvpos5
        g+tRYLI1nna0wxfZye/VsfsGbJqR4v3VCGDs/O9zjCt3AnLXMDHDlwyfo3x6a9kSUqTjWj1lJ5W
        4/Xu2YRUis/NbcVX8S13pPA==
X-Received: by 2002:a05:600c:511c:b0:3ed:2b49:eefc with SMTP id o28-20020a05600c511c00b003ed2b49eefcmr20689782wms.3.1679311139591;
        Mon, 20 Mar 2023 04:18:59 -0700 (PDT)
X-Google-Smtp-Source: AK7set82VSuwnaz4hkV82Nd6dkRw4hW71fp6Wp7E0YSw98TeR4MBxsU3Xlxtt9VoJClH+S0CJFmHOA==
X-Received: by 2002:a05:600c:511c:b0:3ed:2b49:eefc with SMTP id o28-20020a05600c511c00b003ed2b49eefcmr20689763wms.3.1679311139256;
        Mon, 20 Mar 2023 04:18:59 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:4100:a064:1ded:25ec:cf2f? (p200300cbc7024100a0641ded25eccf2f.dip0.t-ipconnect.de. [2003:cb:c702:4100:a064:1ded:25ec:cf2f])
        by smtp.gmail.com with ESMTPSA id z26-20020a1c4c1a000000b003eb3933ef10sm10097337wmf.46.2023.03.20.04.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 04:18:58 -0700 (PDT)
Message-ID: <b4508aaa-735b-33c0-c8e1-f71cfd0ebf78@redhat.com>
Date:   Mon, 20 Mar 2023 12:18:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 10/15] mm: move init_mem_debugging_and_hardening() to
 mm/mm_init.c
Content-Language: en-US
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-mm@kvack.org
References: <20230319220008.2138576-1-rppt@kernel.org>
 <20230319220008.2138576-11-rppt@kernel.org>
 <496d8ba6-dea6-159e-3e98-75d8dee58a12@redhat.com>
 <ZBhAtRKwR3PdmL1l@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <ZBhAtRKwR3PdmL1l@kernel.org>
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

On 20.03.23 12:17, Mike Rapoport wrote:
> On Mon, Mar 20, 2023 at 11:39:29AM +0100, David Hildenbrand wrote:
>> On 19.03.23 23:00, Mike Rapoport wrote:
>>> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>>>
>>> init_mem_debugging_and_hardening() is only called from mm_core_init().
>>>
>>
>> While at it, maybe rename it to ..._init() like most other such functions in
>> there?
> 
> Makes sense, but I wouldn't want to post v2 only for this.

We can fixup on top, sure.

-- 
Thanks,

David / dhildenb

