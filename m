Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E447396F44
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jun 2021 10:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233718AbhFAIr2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Jun 2021 04:47:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30034 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233541AbhFAIrU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Jun 2021 04:47:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622537139;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ei1+7YPTwhcGwSC6x5usnbU/cNlmjtRYkQNi6UDFTrc=;
        b=JMtWMkqOud89CFV1m9y15fGRCZZH0lMn1YovydtanVlNpVbWVJKTZoXE+R6lTqDVyWJyRI
        PEfjltyZo1K0T9xTGD4AwqJbDg0fx0SklY5UDStw5qSBvsh5D7W1Gc8y9focEPpGeuTjzH
        se8z7DkyzwCggGrz2+TMW5yCSa+Uee4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-uhKKnI6HNDKJBT1lDCm8Aw-1; Tue, 01 Jun 2021 04:45:37 -0400
X-MC-Unique: uhKKnI6HNDKJBT1lDCm8Aw-1
Received: by mail-wm1-f71.google.com with SMTP id n20-20020a05600c4f94b029017f371265feso849111wmq.5
        for <linux-mips@vger.kernel.org>; Tue, 01 Jun 2021 01:45:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Ei1+7YPTwhcGwSC6x5usnbU/cNlmjtRYkQNi6UDFTrc=;
        b=Rc1ssj0cpKHHMklg5IQcWpE1PK+Zb5WHOROOKhhwqTHCqUSLcHOxH3cifq/8Pgm1rJ
         gq51QrxxELupMSL4N6wZYR+YTqT6muj6E9BK7qKf2RBW7742JP93M7UIsgju3Iy5pQQa
         yqO4+ocyR10QYogd8ZhcPjW1VB2MzlEsAE/tayQelut8Y7zhI4t+XXJNIMb/3vYPhFW6
         x1bel5muzptHsiacBwzrNFVUN0IxmVaDiya6HPPicoDWWUluKdEByNmNUXfxd7KSPScF
         LaH84XY4zihMH5dk4GVjKzIYvDw00Ro4aUpBMF1+p2OUKYOJy3/mt6gIS/zXo1Fsk1n/
         RdKw==
X-Gm-Message-State: AOAM532eCgGJO25QWK1DQST0ct0ki4+HlOHgfzRxKO/PC1nobKM1W2ys
        IcxWrO9Zy0YfuZkes3JgiCmz8GbS2iXbrnZIPJy1HUgYHgY6496bZkZL1nHqACI0Qm0BtCf0Ifz
        8M+U7v4TMk8rjOIjve3iV5g==
X-Received: by 2002:a05:600c:2256:: with SMTP id a22mr3376729wmm.138.1622537136545;
        Tue, 01 Jun 2021 01:45:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw71orUED6J0M5xRL2FPbrXf1zLtQk15md+bXCGp928W5f5vqEbcF2SNwRqRon22LUBP3L6NQ==
X-Received: by 2002:a05:600c:2256:: with SMTP id a22mr3376705wmm.138.1622537136338;
        Tue, 01 Jun 2021 01:45:36 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c69ce.dip0.t-ipconnect.de. [91.12.105.206])
        by smtp.gmail.com with ESMTPSA id e26sm16961562wmh.39.2021.06.01.01.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 01:45:36 -0700 (PDT)
To:     Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-s390@vger.kernel.org
References: <20210531122959.23499-1-rppt@kernel.org>
 <20210531122959.23499-2-rppt@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC/RFT PATCH 1/5] s390: make crashk_res resource a child of
 "System RAM"
Message-ID: <1efc386c-2cb4-164f-7194-497f142f969f@redhat.com>
Date:   Tue, 1 Jun 2021 10:45:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210531122959.23499-2-rppt@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 31.05.21 14:29, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Commit 4e042af463f8 ("s390/kexec: fix crash on resize of reserved memory")
> added a comment that says "crash kernel resource should not be part of the
> System RAM resource" but never explained why. As it looks from the code in
> the kernel and in kexec there is no actual reason for that.

Are you sure?

Looking at kexec-tools: kexec/arch/s390/kexec-s390.c

get_memory_ranges_s390() wants "System RAM" and Crash kernel only with 
"with_crashk=1". Your patch would change that. "Crash kernel" would 
always be included if you make it a child of "System RAM".

Further, get_memory_ranges() and is_crashkernel_mem_reserved() look out 
for "Crash kernel\n" via parse_iomem_single().

However, parse_iomem_single() does not care about ranges that start with 
spaces IIRC via
   sscanf(line, "%llx-%llx : %n" ...

So once you make "Crash kernel" a child of "System RAM", kexec-tools 
would break if I'm not completely wrong.

-- 
Thanks,

David / dhildenb

