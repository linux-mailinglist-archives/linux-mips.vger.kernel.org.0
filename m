Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 822CF10D532
	for <lists+linux-mips@lfdr.de>; Fri, 29 Nov 2019 12:51:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbfK2Lva (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Nov 2019 06:51:30 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:11884 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbfK2Lva (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Nov 2019 06:51:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1575028288;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=iBrSLXEb+4Pgkw+xVYubBkd5BoaeNwNo+XGvH/A6fnk=;
        b=NhIJNFVetoX9piM0+K09imJkWI8u8XEDZDg/lKdCqm1GDsC4mKz2auvrAMLUc9AqXz
        LuXrYbLPYnpKN5jGC/s6gmZPT13pejKHoSHqeMpozLHO/5ehNyjIpNJL+Hil7RFso5wE
        uImZ+OjaGTCgS+FERLksUPc1WElIOdV3SXAkZ/f759JsW6eVKGpG1urtV7YZ/8/DCQ0Z
        I2d8NLsOoy8DYa5gxRfjeJklL3cN5u+vQY9/1xD0o0wM/4OXO8c5pKawZL8TL+N4mYO1
        M6YcsDwnxQC8ZEClk9lLj6sLWy3U/SMqOqDGMgLgdc3XMWI88gcMqmVW7a2SLiz0ZeKZ
        7zYQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/vgwDeoHw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 45.0.2 DYNA|AUTH)
        with ESMTPSA id y07703vATBpKRzN
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 29 Nov 2019 12:51:20 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: MIPS: bug: gettimeofday syscall broken on CI20 board
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <183faf2b-247b-7a1f-a45c-4ae6bbff4320@arm.com>
Date:   Fri, 29 Nov 2019 12:51:19 +0100
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Maarten ter Huurne <maarten@treewalker.org>,
        mips-creator-ci20-dev@googlegroups.com,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BA284BA5-328C-4CF4-AC20-C37396EDCAA4@goldelico.com>
References: <18788C50-F29B-4BD7-89F6-B056FF490214@goldelico.com> <7b6275c7-ab2b-a647-6bf7-d5e1c4523c98@arm.com> <D1CE4D1E-9A42-4FAE-90A9-615C38B979C0@goldelico.com> <4807842.gtHLO0kk0V@hyperion> <01D75E67-EC2E-4C74-B9BB-752773C481A9@goldelico.com> <20191128150721.GA20142@alpha.franken.de> <4F75970F-81DA-4727-8ADC-17CF6D77829B@goldelico.com> <04b509b4-b1ef-3bcb-433e-8eed5772288f@arm.com> <BF04DB35-9DBA-4297-8FCA-BB422A56DFEC@goldelico.com> <9ee8cbab-0655-f4d5-6699-fbe34fbe4d60@arm.com> <183faf2b-247b-7a1f-a45c-4ae6bbff4320@arm.com>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Vincenzo,

> Am 29.11.2019 um 11:53 schrieb Vincenzo Frascino =
<vincenzo.frascino@arm.com>:
>=20
> Hi Nikolaus,
>=20
> On 11/29/19 8:57 AM, Vincenzo Frascino wrote:
>> On 11/28/19 4:47 PM, H. Nikolaus Schaller wrote:
>>> Well, it does not immediately compile because =
CONFIG_MIPS_CLOCK_VSYSCALL is not
>>> set and can not be configured by normal means:
>>>=20
>>> Error:
>>>=20
>>> /Volumes/CaseSensitive/master/lib/vdso/gettimeofday.c: In function =
'__cvdso_gettimeofday':
>>> /Volumes/CaseSensitive/master/lib/vdso/gettimeofday.c:152:4: error: =
implicit declaration of function 'gettimeofday_fallback' =
[-Werror=3Dimplicit-function-declaration]
>>>    return gettimeofday_fallback(tv, tz);
>>=20
>> Oops, I just realized that I had other changes not committed that's =
why it does
>> not build for you directly. Sometimes I get so excited for fixing a =
problem that
>> I forget bits and peaces :) Sorry about that.
>>=20
>> I am happy to hear that this sorts out the issue though. I will send =
out a new
>> series to test.
>>=20
>=20
> Could you please try the patch in attachment? It should be all this =
time.

Yes,
applies well, compiles well and works.

So you can add:

Testes-by: H. Nikolaus Schaller <hns@goldelico.com> # CI20 with JZ4780

>=20
> Thanks!

BR and thanks,
Nikolaus

