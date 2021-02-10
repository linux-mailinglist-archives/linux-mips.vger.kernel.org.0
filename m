Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F237D316F47
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 19:54:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbhBJSxz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 13:53:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28442 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233971AbhBJSwU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Feb 2021 13:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612983053;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sDSZq7ICJ0AfHa8/wG0kYNPnZuec3lptyyORunouOpY=;
        b=gUdk/35TSXVqCNJV4imiiqtRsnnK/erihr+OFlwobMIELohnmAKHA5UAoLQ8UsbpeV8WCI
        lCReLUlm3+AUKat6RuI2Zax5svRJbQis3v8Fp++kzYLvKTky+EQR1iLcc0Tk/ecorprwb3
        H+LmpaJmF2VFeVsWCtMvqCCjshqNAg8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-XZ2RXzyyMWyxoLkiVpGXxg-1; Wed, 10 Feb 2021 13:50:49 -0500
X-MC-Unique: XZ2RXzyyMWyxoLkiVpGXxg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78E83195D56B;
        Wed, 10 Feb 2021 18:50:47 +0000 (UTC)
Received: from llong.remote.csb (ovpn-115-20.rdu2.redhat.com [10.10.115.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 934655D6D1;
        Wed, 10 Feb 2021 18:50:45 +0000 (UTC)
Subject: Re: [PATCH] locking/arch: Move qrwlock.h include after qspinlock.h
To:     Paolo Bonzini <pbonzini@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Ben Gardon <bgardon@google.com>
References: <20210210144556.10932-1-longman@redhat.com>
 <1d7d564c-cc73-372b-be8b-1cfd51cf476c@redhat.com>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <382d4c4b-6dc8-75bc-f223-01aef8a2ef90@redhat.com>
Date:   Wed, 10 Feb 2021 13:50:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1d7d564c-cc73-372b-be8b-1cfd51cf476c@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/10/21 1:28 PM, Paolo Bonzini wrote:
> On 10/02/21 15:45, Waiman Long wrote:
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
>
> arch/sparc/include/asm/spinlock_64.h is missing.  Also, the include in 
> kernel/locking/qrwlock.c is not necessary (it may be there for 
> aesthetic reasons, but it complicates thing in this case).

Sorry for missing arch/sparc/include/asm/spinlock_64.h. I was just 
focusing on asm/spinlock.h and not aware that there are other variants 
there.

It is true that the asm/qrwlock.h include in qrwlock.c is not really 
necessary. I can't recall why it was there.

>
> I'll send a v2 that is based on the kvm/next tree.
>
> Paolo
>
Thanks for taking care of that.

Cheers,
Longman

