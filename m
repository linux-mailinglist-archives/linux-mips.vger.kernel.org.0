Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B33CE132145
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jan 2020 09:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgAGIVQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 7 Jan 2020 03:21:16 -0500
Received: from terminus.zytor.com ([198.137.202.136]:44923 "EHLO
        mail.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726485AbgAGIVQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 7 Jan 2020 03:21:16 -0500
Received: from [IPv6:2601:646:8600:3281:c17a:5ef:6afe:4c48] ([IPv6:2601:646:8600:3281:c17a:5ef:6afe:4c48])
        (authenticated bits=0)
        by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id 0078K3ZN3264752
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
        Tue, 7 Jan 2020 00:20:03 -0800
Authentication-Results: mail.zytor.com; dkim=permerror (bad message/signature format)
From:   "H. Peter Anvin" <hpa@zytor.com>
Message-Id: <202001070820.0078K3ZN3264752@mail.zytor.com>
Date:   Tue, 07 Jan 2020 00:19:53 -0800
User-Agent: K-9 Mail for Android
In-Reply-To: <CAK8P3a17GshP1KmCpvCkWGDGJLC_JrGUFQZTLbfe5+sSwTjyxw@mail.gmail.com>
References: <20200102145552.1853992-1-arnd@arndb.de> <20200102145552.1853992-3-arnd@arndb.de> <87woa410nx.fsf@mpe.ellerman.id.au> <CAK8P3a17GshP1KmCpvCkWGDGJLC_JrGUFQZTLbfe5+sSwTjyxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Subject: Re: [PATCH v3 02/22] compat: provide compat_ptr() on all architectures
To:     Arnd Bergmann <arnd@arndb.de>,
        Michael Ellerman <mpe@ellerman.id.au>
CC:     "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Robert Richter <rric@kernel.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        the arch/x86 maintainers <x86@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linuxppc-dev@zytor.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

<linuxppc-dev@lists.ozlabs.org>,oprofile-list@lists.sf.net,linux-s390 <linux-s390@vger.kernel.org>,sparclinux <sparclinux@vger.kernel.org>
From: hpa@zytor.com
Message-ID: <41625F06-D755-4C82-86DF-A9415FEEE13D@zytor.com>

On January 7, 2020 12:08:31 AM PST, Arnd Bergmann <arnd@arndb.de> wrote:
>On Tue, Jan 7, 2020 at 3:05 AM Michael Ellerman <mpe@ellerman.id.au>
>wrote:
>> Arnd Bergmann <arnd@arndb.de> writes:
>> > +
>> > +static inline compat_uptr_t ptr_to_compat(void __user *uptr)
>> > +{
>> > +     return (u32)(unsigned long)uptr;
>> > +}
>>
>> Is there a reason we cast to u32 directly instead of using
>compat_uptr_t?
>
>Probably Al found this to be more explicit at the time when he
>introduced
>it on all the architectures in 2005. I just moved it here and kept the
>definition.
>
>       Arnd

Did compat_uptr_t exist back then?
-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
