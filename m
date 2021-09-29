Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE53B41CA20
	for <lists+linux-mips@lfdr.de>; Wed, 29 Sep 2021 18:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345734AbhI2Qb4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Sep 2021 12:31:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57823 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345805AbhI2Qbz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Sep 2021 12:31:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632933014;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LzEA/AMsDC+zBVogDRmix14O9ZRH28vVpD1t8BFMOTQ=;
        b=OHBmXcXFal572r+La62x/Pn62V3aPieYOB7wpdnX+fdQtLC0NoStUv+jiupRblcNaL3ueG
        KAyzB/qmCFYPkPzJ99/RNGLkOgQmgI6ENjA0Hl59ZGewjTj0IjWYZ6sXmWRuGDsqkZZI1A
        WaMksgp254vi7iOLDxJkYraotUwtBZw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-VmI0NIa2M5uxzwvgxSEJXQ-1; Wed, 29 Sep 2021 12:30:12 -0400
X-MC-Unique: VmI0NIa2M5uxzwvgxSEJXQ-1
Received: by mail-wr1-f70.google.com with SMTP id j15-20020a5d564f000000b00160698bf7e9so807601wrw.13
        for <linux-mips@vger.kernel.org>; Wed, 29 Sep 2021 09:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=LzEA/AMsDC+zBVogDRmix14O9ZRH28vVpD1t8BFMOTQ=;
        b=N8kisVDkfJgTtWdnFrLlhQTu5mE/6CGQvvAzM5fkBWyj0kTTylk/EAegTU/uQ1vUgy
         nfccJUy42xd1JsHe0HVMEXUeHP633d3C0hdmxL22hPRg/sptQX8BsN/KILyDXSzMDB+n
         Y9JkejHRvcT5n+p9K1RqAK6jFNshp4m/QVEnyptysFtRU9gqu25wTRHcCqthsA43n6US
         5cnTr+U6xRnD3E5eeL8NcmZ0LfRsl1kFzHHVZAvPOQ4lVfioYQngpPrrWdV/NVWfc3xI
         YVDt8p2y0wLDw21GsVwwMdRuWz3bBUUnCdbqNjuExuiov6HyLXojsUYIypPYgNrl+XLo
         6IAQ==
X-Gm-Message-State: AOAM532uqrASR+NfPgstquaiHS421yeXBfGgEqNo/wdt/KGmrRjVkaKR
        6oCuhj9GYK+DeJwmBcwAx/tOeuz/u7i6GnRq5DP9U0aZyXbR2Jsk0F6LwvIlvCqNF2VOJsur7ON
        apvHlpQjbfarln3udhxRHMA==
X-Received: by 2002:a05:6000:184c:: with SMTP id c12mr1026245wri.150.1632933011557;
        Wed, 29 Sep 2021 09:30:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWpbhPpbSmBcJNqivlDLJZ/UTUefLQTk4gKa/CcEn6HHHOoDfx1bOgZbQtRoI/dHj6OAlJWg==
X-Received: by 2002:a05:6000:184c:: with SMTP id c12mr1026220wri.150.1632933011388;
        Wed, 29 Sep 2021 09:30:11 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c3b.dip0.t-ipconnect.de. [79.242.60.59])
        by smtp.gmail.com with ESMTPSA id m21sm354405wmq.37.2021.09.29.09.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 09:30:10 -0700 (PDT)
Subject: Re: [PATCH v1 2/4] memblock: allow to specify flags with
 memblock_add_node()
To:     Mike Rapoport <rppt@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Jianyong Wu <Jianyong.Wu@arm.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-snps-arc@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-mm@kvack.org,
        kexec@lists.infradead.org
References: <20210927150518.8607-1-david@redhat.com>
 <20210927150518.8607-3-david@redhat.com> <YVSTkGdh2nQWQp+U@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <3651c7d0-f7b6-63ff-216a-b74176623a6f@redhat.com>
Date:   Wed, 29 Sep 2021 18:30:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YVSTkGdh2nQWQp+U@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 29.09.21 18:25, Mike Rapoport wrote:
> On Mon, Sep 27, 2021 at 05:05:16PM +0200, David Hildenbrand wrote:
>> We want to specify flags when hotplugging memory. Let's prepare to pass
>> flags to memblock_add_node() by adjusting all existing users.
>>
>> Note that when hotplugging memory the system is already up and running
>> and we don't want to add the memory first and apply flags later: it
>> should happen within one memblock call.
> 
> Why is it important that the system is up and why it should happen in a
> single call?
> I don't mind adding flags parameter to memblock_add_node() but this
> changelog does not really explain the reasons to do it.

"After memblock_add_node(), we could race with anybody performing a 
search for MEMBLOCK_NONE, like kexec_file -- and that only happens once 
the system is already up and running. So we want both steps to happen 
atomically."

I can add that to the patch description.

(I think it still won't be completely atomic because memblock isn't 
properly implementing locking yet, but that's a different story)

-- 
Thanks,

David / dhildenb

