Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 330CC35E351
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 17:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240288AbhDMP7V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 11:59:21 -0400
Received: from mout.gmx.net ([212.227.15.18]:39639 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230329AbhDMP7U (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Apr 2021 11:59:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1618329525;
        bh=iYyhv4n/xH0gG7lodjk/C9Ce5EuMLxxM/84KpBHRoKM=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=frvaoejW3zpBS+3+B9TDLFqWtXoXAOoHkvy1kM41D06bQYzoYp9TKhJCOBPFLDc7i
         VqoLphXXkH4Iks/idt16T+zd8uc8y/2ZW5D032DR6m7PyAC0mIRwknh8/kJQwI4XmM
         ZgDi01uZZW8A0onX7wf3rpRDEEc2bKQP9oPrKlYw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.161.89]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHGCo-1lJ5sb0NBg-00DHjB; Tue, 13
 Apr 2021 17:58:45 +0200
Subject: Re: [PATCH 4/5] uapi: always define F_GETLK64/F_SETLK64/F_SETLKW64 in
 fcntl.h
To:     Christoph Hellwig <hch@lst.de>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <20210412085545.2595431-1-hch@lst.de>
 <20210412085545.2595431-5-hch@lst.de>
 <da779585-60c6-2f4b-feaf-db45e1eef262@gmx.de> <20210413154646.GC27287@lst.de>
From:   Helge Deller <deller@gmx.de>
Message-ID: <7fcbc112-265a-c3bd-e76f-a73c6e2c936c@gmx.de>
Date:   Tue, 13 Apr 2021 17:58:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413154646.GC27287@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:C88EAdTfuc58L2a2yYNhTQqFHnyOdBg6Xb2BP7ID0mysn8PlQjb
 953K2AyCzUkRW/hR28yHfJ2saxvP5z54dZyl2YTe9NWVZ5LzRitHCds7hoSP1qd83wPk2Dd
 0TIk56P7jaHWYfuPyaQRQkPd5bFvslOwJ25s8OjMUxIKnhBkkTrEex1LsA7AMa3IEn1yH/W
 IiLzCHxbkDHFWt8kTW+PQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5xit/pHCsio=:PllnEYJzneVTfHzzF8zff7
 V0cmoOUWkFt1R2FzzbRP2tq8SVQeE1irT7eMONSZnZZgzV4O07ulzcQjTi6bhkBZiwfa2CxmU
 CuGCAYzeu2bys2oKHOLpFSqijPxTWTEMmxqCC74PBJoDTne9lhv16EaRtL0uLfv7AtEi+Wypv
 KaM78ra1L40d4Z8e4RAzpL4W+uJHT4/FXAupXO30zjwB7v7Vs3Y0K10CF3DBpXhpbXIrhS7Gz
 gHFAhdTsncO2KA6UJQwn96sqdLFxjO+EHvrapsCGTnKgkQM7Q7XC3nWYLKtl64Yn/4iOfu0nR
 1TVeb1JiHSfZKYTfYiE+BfmipRADtsXFYyTFAdHh66zsOk8O/t9vCXnJq9yuyF8aKbZ/qq5ie
 +ilN4Jnu6X5LLmv72/c+8XUKgphm4zHkWPWR/g8qsEZGKcJDwURQXVYy6/90JY/Xs9gnLI3be
 QAynh0lfTfuxRokzUYaM+E1f0twkUkOQHH2hbKMtPIXq4pz+bVaFfTnCt73s7UIdccq+krkNH
 R0DEmnkeMslLzR3TtQKFBoC6IPKxdsgMhP3MBYMY4L/uC8UxlraV72szMlVd3A1+i9c6Ltgls
 oQKSE1YHFOU1LFii9L+ohKlw2XzT0lAr2SOETIkQBahI5IgYiLGLtfjCvcDrdUHeqq2eKAAjB
 Vq5T591Tm4R0o2fNq/Oj9MoScV84GbYUfI3mo9X7bg7PDVkQRRXbt6nNANgPEIwvKWFeeE7/H
 KXPKcxJZO3oR4rjFg0FQoqus66xWDwvHRyTOwj6zUwcR1EgSzVy+u6Y2uX+N8uR+PYuaqW35b
 F+IVuF7j42WieAmrwwXlOuZvBmnUio8GOmC3mC+gSJoaj31KtdOakpj6M5SFQNovlksX+fTEQ
 l7s08lGoU86pNBUPWgnzmrqOFO58dE1aswoLx4iHe2UKBJ8oxRfJ6TaGEoGMXtx8dJNLuLoY8
 jNrM3E0qlrHXies3v5bEVi+o7cMmEw92XHKSuFWlT4sU+1tt9iope797I7GwYAwT1+YOKPjVr
 DAxuBCI9iVK0Np/7Kl6NBPt+T/RaiFZbFEzxriCW2CC3P4MBb/03ClDYdbkAYdwccRfo37bVl
 RomiqGsJVXW2omMumlOtmPwoxx5rfiBOhWrsCpmM5eyc4N4E9vv8Re7YkeyaWDawknFT2Trkw
 Mx4PxCPooOFtuAKNkFGu7UOxcYlKO0bQGnFALnyfvCF1rqsn807qJtuO4UimkUaShCyyI=
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 4/13/21 5:46 PM, Christoph Hellwig wrote:
> On Tue, Apr 13, 2021 at 05:43:18PM +0200, Helge Deller wrote:
>> On 4/12/21 10:55 AM, Christoph Hellwig wrote:
>>> The F_GETLK64/F_SETLK64/F_SETLKW64 commands are only implemented for
>>> 32-bit syscall APIs, but we also need them for compat handling on 64-b=
it
>>> kernels.
>>
>> Ok.
>>
>>> Given that redefining them is rather error prone, as shown by parisc
>>> getting the opcodes wrong currently, just use the existing definitions
>>> for the compat handling.
>>
>> Can you please show me where parisc gets it currently wrong?
>> I'm somehow blind to see it and of course I'd like to fix it in
>> stable kernel series if that's true...
>
> Looking again I think my comment was wrong, I thought parisc would
> fall back to the asm-generic version with different code points for
> the compat case, but parisc actually already defines the constants
> unconditionally like this patch does for everyone else.  So I'll
> retract that part of the comment.

Ok, good.
Thanks for checking!

Helge
