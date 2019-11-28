Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96B7D10C8BA
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 13:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfK1MdV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 07:33:21 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:30415 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfK1MdV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 07:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574944399;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=tIp70kebePqIW6GMgmJLG0stkjm844/NZk1Ye36TnNM=;
        b=AwmM/gQXq8J/Xo21AapcPUuH4PQ05OpCPYWx/LRe/DytUPTILBez5vqV676T19A3XH
        ZZu/0uiHiVXha6ZETuvrKy8lJuiCwpZK4PzyeYDacWp+Ed2ITY7wrExgX5kwCIAKjqGo
        GX0kXmJhpfTwEqvy7pAAmnnK6Q3BVwn/bZ4xmLoHq4eCko1CuLpqT2V3wyBFPVMeomvl
        NKVdVoYoS2ER8rIOlf9jA4HH0Kw4dnJHRDniLyyKXFf+1nBW0dda0RF/0ZiTv20dMRoT
        getRWT+IdJD9e3ac7HLu2TFE3E3dgH2e2GTQw4rx+YmteLd4PmfTHiuLaBgmrSK4yHmQ
        Fx0A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAiw43upSE="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 45.0.2 DYNA|AUTH)
        with ESMTPSA id y07703vASCXHJWi
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 28 Nov 2019 13:33:17 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: MIPS: bug: gettimeofday syscall broken on CI20 board
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <7b6275c7-ab2b-a647-6bf7-d5e1c4523c98@arm.com>
Date:   Thu, 28 Nov 2019 13:33:17 +0100
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        MIPS Creator CI20 Development 
        <mips-creator-ci20-dev@googlegroups.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D1CE4D1E-9A42-4FAE-90A9-615C38B979C0@goldelico.com>
References: <18788C50-F29B-4BD7-89F6-B056FF490214@goldelico.com> <703DC004-96E8-463D-8870-3CC410FE1C5E@goldelico.com> <3190d1a4-96c4-1843-3ae1-bae3a97af9fb@arm.com> <8D151C34-41A1-4DFE-92D6-D1B27AEC8730@goldelico.com> <dbf536da-77a6-30a0-a380-9463f604d1a8@arm.com> <AD919A0B-2629-4E8A-8A7A-1E4A868F8BC4@goldelico.com> <7b6275c7-ab2b-a647-6bf7-d5e1c4523c98@arm.com>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Vincenzo,

> Am 28.11.2019 um 13:21 schrieb Vincenzo Frascino =
<vincenzo.frascino@arm.com>:
>=20
> On 28/11/2019 12:11, H. Nikolaus Schaller wrote:
>>=20
>>> Am 28.11.2019 um 12:51 schrieb Vincenzo Frascino =
<vincenzo.frascino@arm.com>:
>>>=20
>>> Hi Nikolaus,
>>>=20
>>> On 27/11/2019 13:53, H. Nikolaus Schaller wrote:
>>> [...]
>>>=20
>>>>> vdso_data and mips_vdso_data before are not part of the ABI hence =
they are not
>>>>> bind by a contract with the userspace.
>>>>>=20
>>>>> This means that they can change at any point and if a userspace =
software relies
>>>>> on a specific layout of these data structures is doing something =
wrong.
>>>>=20
>>>> Maybe the libs are clever enough to find that out dynamically but I =
have no
>>>> idea about how gettimeofday() and user-space VDSO is implemented to =
handle such
>>>> changes.
>>>>=20
>>> As I said userspace applications and libraries should not rely on =
the layout of
>>> vdso_data because this is not part of the ABI.
>>>=20
>>> The only thing that userspace requires is to "know" that =
gettimeofday() exists,
>>> than it is gettimeofday() that internally accesses the data =
structure.
>>=20
>> Well, with user-space I include the lib that provides the =
gettimeofday() syscall
>> and reads out the memory region where the VDSO data structure is =
provided by the
>> kernel. And that part comes from Debian. Somehow it does differently =
with 4.19
>> than 5.4. So I summarise all non-kernel code with the term =
"user-space".
>>=20
>=20
> The the lib that provides the gettimeofday() changes accordingly with =
vdso_data.
> 5.4 and 4.19 have 2 different vdso libraries as well.

Yes, that is what I have assumed what happens. How do these libs go into =
an existing
and working root-file-system with Debian Stretch?

Is it part of the linux kernel tree so that some make option can build =
it and we can
install it like kernel modules (sorry for these beginners questions. I =
never did care
about VDSO before I ran into this problem)?

Is there a mechanism that Debian Stretch knows about the newer library
and can automatically find out which one to install.

This is what I mean with breaking user-space ABI.

Or must the user know about that and do a manual install of the vdso =
libs from external
sources?

If that is the case there should be at least a CONFIG option to provide =
the
older vdso_data or the option to completely disable VDSO for =
gettimeofday()
so that the library falls back to a traditional syscall.

BR and thanks,
Nikolaus



