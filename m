Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5414E13B650
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2020 01:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728791AbgAOAED (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jan 2020 19:04:03 -0500
Received: from forward101o.mail.yandex.net ([37.140.190.181]:52163 "EHLO
        forward101o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726495AbgAOAED (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 14 Jan 2020 19:04:03 -0500
Received: from mxback25j.mail.yandex.net (mxback25j.mail.yandex.net [IPv6:2a02:6b8:0:1619::225])
        by forward101o.mail.yandex.net (Yandex) with ESMTP id 2B73E3C01446;
        Wed, 15 Jan 2020 03:03:59 +0300 (MSK)
Received: from iva8-6403930b9beb.qloud-c.yandex.net (iva8-6403930b9beb.qloud-c.yandex.net [2a02:6b8:c0c:2c9a:0:640:6403:930b])
        by mxback25j.mail.yandex.net (mxback/Yandex) with ESMTP id wzJH2vWcK5-3wU0wH5c;
        Wed, 15 Jan 2020 03:03:59 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1579046639;
        bh=U1yeE+6PNkzLSEHV/lmBHZ+D39YAzSVkTdd4zGgzOag=;
        h=From:To:Subject:CC:References:Date:In-Reply-To:Message-ID;
        b=r3pBSmdSK1xDjz9U895uDkZGJQEmrJ9z1vU+OgzEYTn6+XU8nKrhzKUMXcyD9AZra
         L1hxTGw53eMLUmRNQphJbEhNUc3VFWmvphgRtJhDR1wrUN6xLY7s1fWZq5W2D4XIr1
         VjOyRSti/dUe+NFBQiuqivd59AOX/yb/nZ40IIyA=
Authentication-Results: mxback25j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by iva8-6403930b9beb.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id n2I95QOlNV-3uWKriqf;
        Wed, 15 Jan 2020 03:03:56 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Date:   Wed, 15 Jan 2020 08:03:45 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <20200114233025.y4azwvivqo7kg7i5@pburton-laptop>
References: <20200113101251.37471-1-jiaxun.yang@flygoat.com> <20200114233025.y4azwvivqo7kg7i5@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] irqchip: mips-cpu: Remove eoi operation
To:     Paul Burton <paulburton@kernel.org>
CC:     linux-mips@vger.kernel.org, chenhc@lemote.com,
        paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net,
        maz@kernel.org, linux-kernel@vger.kernel.org
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <8AEFA134-76BC-4AE9-9229-718B5C58B862@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B41=E6=9C=8815=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=887=
:30:25, Paul Burton <paulburton@kernel=2Eorg> =E5=86=99=E5=88=B0:
>Hi Jiaxun,
>
>On Mon, Jan 13, 2020 at 06:12:51PM +0800, Jiaxun Yang wrote:
>> The eoi opreation in mips_cpu_irq_controller caused chained_irq_enter
>> falsely consider CPU IP interrupt as a FastEOI type IRQ=2E So the
>interrupt
>> won't be masked during in handler=2E Which might lead to spurious
>interrupt=2E
>>=20
>> Thus we simply remove eoi operation for mips_cpu_irq_controller,
>>=20
>> Signed-off-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
>> ---
>>  drivers/irqchip/irq-mips-cpu=2Ec | 1 -
>>  1 file changed, 1 deletion(-)
>>=20
>> diff --git a/drivers/irqchip/irq-mips-cpu=2Ec
>b/drivers/irqchip/irq-mips-cpu=2Ec
>> index 95d4fd8f7a96=2E=2E0ad7f1f9a58b 100644
>> --- a/drivers/irqchip/irq-mips-cpu=2Ec
>> +++ b/drivers/irqchip/irq-mips-cpu=2Ec
>> @@ -55,7 +55,6 @@ static struct irq_chip mips_cpu_irq_controller =3D {
>>  	=2Eirq_mask	=3D mask_mips_irq,
>>  	=2Eirq_mask_ack	=3D mask_mips_irq,
>>  	=2Eirq_unmask	=3D unmask_mips_irq,
>> -	=2Eirq_eoi	=3D unmask_mips_irq,
>>  	=2Eirq_disable	=3D mask_mips_irq,
>>  	=2Eirq_enable	=3D unmask_mips_irq,
>>  };
>
>This one scares me; something doesn't seem right=2E The irq_eoi (n=C3=A9e=
 eoi)
>callback was first added way back in commit 1417836e81c0 ("[MIPS] use
>generic_handle_irq, handle_level_irq, handle_percpu_irq")=2E The commit
>message there states that the motivation was to allow use of
>handle_percpu_irq(), and indeed handle_percpu_irq() does:
>
>    irq_ack() (ie=2E mask)
>    invoke the handler(s)
>    irq_eoi() (ie=2E unmask)
>
>By removing the irq_eoi callback I don't see how we'd ever unmask the
>interrupt again=2E=2E?

Hi Paul,
Sorry I didn't discover that by myself as all of my drivers are using chai=
ned handler=2E

So how should we deal with the chained case?
Probably we need a check in percpu IRQ handler to determine whether it's o=
r not
level type?

>
>Thanks,
>    Paul

--=20
Jiaxun Yang
