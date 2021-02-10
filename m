Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77EC5316A87
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 16:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbhBJPzg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 10:55:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47499 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230005AbhBJPzf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Feb 2021 10:55:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612972446;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/iXYwewC8ykR1ydcobsk8WlvcCmIoiMdSUj9YDWUA9Y=;
        b=NypVXCy8VPhMFAV2swAyhaPVtctTI1dGXmMj/XOCRo+ShyDpT6FhbMmRpdmPA3JywigY8i
        BI96p3JfsCQtMVQzuDl0maM/8fclGn3vYMUEaTfu2lVItEDeBWPr68llU9HXt1W7/3Cq5c
        w3EoY+uTnVfBs5FbWUL++Q2yvJcnBxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-v1nJFLltNMG8bJ8KVCA-_Q-1; Wed, 10 Feb 2021 10:54:02 -0500
X-MC-Unique: v1nJFLltNMG8bJ8KVCA-_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2188801977;
        Wed, 10 Feb 2021 15:54:00 +0000 (UTC)
Received: from llong.remote.csb (ovpn-115-20.rdu2.redhat.com [10.10.115.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 41D9A10013D7;
        Wed, 10 Feb 2021 15:53:59 +0000 (UTC)
Subject: Re: [PATCH] locking/arch: Move qrwlock.h include after qspinlock.h
To:     Guenter Roeck <linux@roeck-us.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Ben Gardon <bgardon@google.com>
References: <20210210144556.10932-1-longman@redhat.com>
 <401dbbe1-096c-8af5-4e21-e355e602272e@roeck-us.net>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <d8f02a3f-4cef-c5d4-7646-fc435cfc9307@redhat.com>
Date:   Wed, 10 Feb 2021 10:53:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <401dbbe1-096c-8af5-4e21-e355e602272e@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/10/21 10:05 AM, Guenter Roeck wrote:
> On 2/10/21 6:45 AM, Waiman Long wrote:
>> The queued rwlock code has a dependency on the current spinlock
>> implementation (likely to be qspinlock), but not vice versa. Including
>> qrwlock.h before qspinlock.h can be problematic when expanding qrwlock
>> functionality.
>>
>> If both qspinlock.h and qrwlock.h are to be included, the qrwlock.h
>> include should always be after qspinlock.h. Update the current set of
>> asm/spinlock.h files to enforce that.
>>
>> Signed-off-by: Waiman Long <longman@redhat.com>
> There should be a Fixes: tag here. If the SHA of the offending commit is not
> stable, there should be a better reference than "The queued rwlock code".
I originally have a Fixes tag when I was modifying the mips' 
asm/spinlock.h file. After I realize that there are more files to 
modify, I take that out. Anyway, the problem was exposed by Ben's 
qrwlock patch. So existing stable releases should still be fine without 
this patch.
>
> This patch fixes the build problem I had observed on mips. I also tested
> xtensa:defconfig and arm64:defconfig with no problems observed.
>
> Tested-by: Guenter Roeck <linux@roeck-us.net>

Thanks for the testing as I don't have a build environment to verify that.

Cheers,
Longman

