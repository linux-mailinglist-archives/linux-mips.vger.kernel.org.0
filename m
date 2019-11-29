Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C91E810D7AD
	for <lists+linux-mips@lfdr.de>; Fri, 29 Nov 2019 16:09:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbfK2PJy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Nov 2019 10:09:54 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:31896 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbfK2PJx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Nov 2019 10:09:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1575040192;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=0WKSQYG0YP5GIwNWknC0InKQVJvBVr74yYBpeas3RNM=;
        b=Uxyrhx294kdS1ofE8vxCwKw+LJs9d7S++dU237OTHePzyLZ2MVdQvl8yob9IU6SfCm
        2Hx7rerm+w72XgfBH/VZP0pryXdVbZYrhXKlf5WLEU8quc1v9BLYN5757sNh1LLvuCoB
        //Wv3A6+agIuojUt6jUKYmt9Garp2rsFAunWJHLdeyq5BTOIq+RKr7IciQ9dGfV8XxBK
        +HHNeTfkvrBEq9DZzpFYEr0sRjHXJUuBomTU3pKewL9eoSYK6TUviOWOCODC+d7nvvZw
        s+rOPuNGDZzBbIhO50pLW6JSN89iJIRfsVUuA0bh858IC5RHrGJ8RgdCMUNWrQPJRyfj
        nAnQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/vgwDeoHw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 45.0.2 DYNA|AUTH)
        with ESMTPSA id y07703vATF9pTbf
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 29 Nov 2019 16:09:51 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] mips: Fix gettimeofday() in the vdso library
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <0b64c6bb-ffc7-059d-3cb3-012092e0fcf0@arm.com>
Date:   Fri, 29 Nov 2019 16:09:51 +0100
Cc:     Paul Burton <paulburton@kernel.org>,
        mips-creator-ci20-dev@googlegroups.com,
        letux-kernel@openphoenux.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <DCD7A17F-B045-440E-AB66-7F8AB72A19CA@goldelico.com>
References: <20191129143658.12224-1-vincenzo.frascino@arm.com> <307717BD-3233-4313-BAA8-7431F4C78773@goldelico.com> <0b64c6bb-ffc7-059d-3cb3-012092e0fcf0@arm.com>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 29.11.2019 um 15:58 schrieb Vincenzo Frascino =
<vincenzo.frascino@arm.com>:
>=20
> On 11/29/19 2:52 PM, H. Nikolaus Schaller wrote:
>>=20
>>> Am 29.11.2019 um 15:36 schrieb Vincenzo Frascino =
<vincenzo.frascino@arm.com>:
>>>=20
>>> The libc provides a discovery mechanism for vDSO library and its
>>> symbols. When a symbol is not exposed by the vDSOs the libc falls =
back
>>> on the system calls.
>>>=20
>>> With the introduction of the unified vDSO library on mips this =
behavior
>>> is not honored anymore by the kernel in the case of gettimeofday().
>>>=20
>>> The issue has been noticed and reported due to a dhclient failure on =
the
>>> CI20 board:
>>>=20
>>> root@letux:~# dhclient
>>> ../../../../lib/isc/unix/time.c:200: Operation not permitted
>>> root@letux:~#
>>>=20
>>> Restore the original behavior fixing gettimeofday() in the vDSO =
library.
>>>=20
>>> Cc: Paul Burton <paulburton@kernel.org>
>>> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
>>> Testes-by: H. Nikolaus Schaller <hns@goldelico.com> # CI20 with =
JZ4780
>> ^^^ funny typo... -> Tested-by:
>=20
> Ops, I copy-pasted it from your email ;) Can't trust you ;)

No :)

Well, typos happen and nobody seems to notice. My favourite:

5f9e832c137075045d15cd6899ab0505cfb2ca4b

BR,
Nikolaus

