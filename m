Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 732963169B4
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 16:04:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbhBJPEh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 10:04:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47779 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231956AbhBJPEU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Feb 2021 10:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612969373;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5MXaPbc/42qFdop710unD1yxd2cY2cL3Z6ntoAVSBA8=;
        b=UKlGJIUSkH2H6cWNTvKUezqPuA7PSCchVZznyY/1cE4Km7uS/bUeZMwQlAW8MypADr1xT+
        6KM1bJgO5VKjYESZiDtmlSGka9a6twDeMwVj10j3+CQvBCgEx9P6RS5M5QQ54mvlz69RWU
        sA0wiVyl9HHqWn241CZsytxnExTwxtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-bQQyr9rGOxeqh9cI2Wqvww-1; Wed, 10 Feb 2021 10:02:45 -0500
X-MC-Unique: bQQyr9rGOxeqh9cI2Wqvww-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED8B4427CF;
        Wed, 10 Feb 2021 15:02:42 +0000 (UTC)
Received: from llong.remote.csb (ovpn-115-20.rdu2.redhat.com [10.10.115.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 470F460C15;
        Wed, 10 Feb 2021 15:02:41 +0000 (UTC)
Subject: Re: [next] [mips] spinlock.h:17:28: error: redefinition of
 'queued_spin_unlock'
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-mips@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Paul Burton <paul.burton@mips.com>, Will Deacon <will@kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>
References: <CA+G9fYtkWdeL7-nfXW8+VbaCK7swinU_Ksn67RW4FFD+cx8VYg@mail.gmail.com>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <8e1322cf-4498-43b6-1dbd-665b7f016815@redhat.com>
Date:   Wed, 10 Feb 2021 10:02:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CA+G9fYtkWdeL7-nfXW8+VbaCK7swinU_Ksn67RW4FFD+cx8VYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/10/21 12:30 AM, Naresh Kamboju wrote:
> While building Linux next tag 20210209 mips uImage.gz failed with below configs
>
>    - mips (cavium_octeon_defconfig) with gcc-8, gcc-9 and gcc-10 - FAILED
>    - mips (malta_defconfig) with gcc-8, gcc-9 and gcc-10 - FAILED
>    - mips (nlm_xlp_defconfig) with gcc-8, gcc-9 and gcc-10 - FAILED
>    - mips (defconfig) with gcc-8, gcc-9 and gcc-10 - FAILED
>
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=mips
> CROSS_COMPILE=mips-linux-gnu- 'CC=sccache mips-linux-gnu-gcc'
> 'HOSTCC=sccache gcc' uImage.gz
> In file included from /include/linux/spinlock.h:90,
>                   from /include/linux/ipc.h:5,
>                   from /include/uapi/linux/sem.h:5,
>                   from /include/linux/sem.h:5,
>                   from /include/linux/compat.h:14,
>                   from /arch/mips/kernel/asm-offsets.c:12:
> /arch/mips/include/asm/spinlock.h:17:28: error: redefinition of
> 'queued_spin_unlock'
>     17 | #define queued_spin_unlock queued_spin_unlock
>        |                            ^~~~~~~~~~~~~~~~~~
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>
> build link,
> https://builds.tuxbuild.com/1oF9lkBAeWM2WvR11O2Yun8ERNT/
>
I have just posted a patch to reorder qspinlock.h and qrwlock.h include 
ordering. Hopefully that can fix the compilation problem though I don't 
have a mips building environment to verify that.

Cheers,
Longman

