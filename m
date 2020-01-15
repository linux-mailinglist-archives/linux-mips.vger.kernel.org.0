Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81C3013C5DB
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2020 15:23:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgAOOXy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Jan 2020 09:23:54 -0500
Received: from forward102p.mail.yandex.net ([77.88.28.102]:58122 "EHLO
        forward102p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726472AbgAOOXy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Jan 2020 09:23:54 -0500
Received: from mxback20o.mail.yandex.net (mxback20o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::71])
        by forward102p.mail.yandex.net (Yandex) with ESMTP id 970DB1D40469;
        Wed, 15 Jan 2020 17:23:51 +0300 (MSK)
Received: from sas2-b157fac3b6f2.qloud-c.yandex.net (sas2-b157fac3b6f2.qloud-c.yandex.net [2a02:6b8:c08:b282:0:640:b157:fac3])
        by mxback20o.mail.yandex.net (mxback/Yandex) with ESMTP id 0zS5Ncr5gy-NofWPAul;
        Wed, 15 Jan 2020 17:23:51 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1579098231;
        bh=4q3GUyzYikcHKr0WzP0o2oa68vnJeRYttVlZp6EFh8c=;
        h=From:To:Subject:CC:References:Date:In-Reply-To:Message-ID;
        b=graPXtatyA79ochr8IzVjTZkX5hXE7PDUT3xOdVErzRpvqceSF3y1aZYvZ9IgSfkj
         YCELduUT01EOQ0JCPGr3hf4Fv0+WSlqZbQsUfT02gx4highPLNJjOKQm4U/pBRp70O
         a9arh2YUW9XhexuBPIUw/XfKkBfUdIInHLaJw1JQ=
Authentication-Results: mxback20o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by sas2-b157fac3b6f2.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id ywluPV4xqO-NmWCG7hn;
        Wed, 15 Jan 2020 17:23:49 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Date:   Wed, 15 Jan 2020 22:23:29 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <9cd8df72fc3a7dfcdd88eb1fb56bbe35@kernel.org>
References: <20200113101251.37471-1-jiaxun.yang@flygoat.com> <20200114233025.y4azwvivqo7kg7i5@pburton-laptop> <9cd8df72fc3a7dfcdd88eb1fb56bbe35@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] irqchip: mips-cpu: Remove eoi operation
To:     Marc Zyngier <maz@kernel.org>, Paul Burton <paulburton@kernel.org>
CC:     linux-mips@vger.kernel.org, chenhc@lemote.com,
        paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net,
        linux-kernel@vger.kernel.org
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <C7C70199-38CC-473E-B20D-C1782F08CA2E@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B41=E6=9C=8815=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=889=
:40:31, Marc Zyngier <maz@kernel=2Eorg> =E5=86=99=E5=88=B0:
>On 2020-01-14 23:30, Paul Burton wrote:
>> Hi Jiaxun,
>>=20
>> On Mon, Jan 13, 2020 at 06:12:51PM +0800, Jiaxun Yang wrote:
>>> The eoi opreation in mips_cpu_irq_controller caused
>chained_irq_enter
>>> falsely consider CPU IP interrupt as a FastEOI type IRQ=2E So the=20
>>> interrupt
>>> won't be masked during in handler=2E Which might lead to spurious=20
>>> interrupt=2E
>>>=20
>>> Thus we simply remove eoi operation for mips_cpu_irq_controller,
>>>=20
>>> Signed-off-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
>>> ---
>>>  drivers/irqchip/irq-mips-cpu=2Ec | 1 -
>>>  1 file changed, 1 deletion(-)
>>>=20
>>> diff --git a/drivers/irqchip/irq-mips-cpu=2Ec=20
>>> b/drivers/irqchip/irq-mips-cpu=2Ec
>>> index 95d4fd8f7a96=2E=2E0ad7f1f9a58b 100644
>>> --- a/drivers/irqchip/irq-mips-cpu=2Ec
>>> +++ b/drivers/irqchip/irq-mips-cpu=2Ec
>>> @@ -55,7 +55,6 @@ static struct irq_chip mips_cpu_irq_controller =3D {
>>>  	=2Eirq_mask	=3D mask_mips_irq,
>>>  	=2Eirq_mask_ack	=3D mask_mips_irq,
>>>  	=2Eirq_unmask	=3D unmask_mips_irq,
>>> -	=2Eirq_eoi	=3D unmask_mips_irq,
>>>  	=2Eirq_disable	=3D mask_mips_irq,
>>>  	=2Eirq_enable	=3D unmask_mips_irq,
>>>  };
>>=20
>> This one scares me; something doesn't seem right=2E The irq_eoi (n=C3=
=A9e
>eoi)
>> callback was first added way back in commit 1417836e81c0 ("[MIPS] use
>> generic_handle_irq, handle_level_irq, handle_percpu_irq")=2E The commit
>> message there states that the motivation was to allow use of
>> handle_percpu_irq(), and indeed handle_percpu_irq() does:
>>=20
>>     irq_ack() (ie=2E mask)
>>     invoke the handler(s)
>>     irq_eoi() (ie=2E unmask)
>>=20
>> By removing the irq_eoi callback I don't see how we'd ever unmask the
>> interrupt again=2E=2E?
>
>To be completely blunt, the fact that unmask and eoi are implemented
>the
>same way is a clear sign that this is a bit broken=2E
>
>irq_eoi is used if the irqchip tracks the IRQ life-cycle in HW, and
>it's
>not obvious that this is the case=2E The fact that ack is also mapped to=
=20
>mask

It's just a kind of hack to workaround the fact that our current percpu ir=
q handler assumed
all percpu irqs are edge triggered or fasteoi type=2E

However MIPS processor implemented it in level triggered way=2E

My solution would be add a check=2E If neither ack nor eoi exist for the c=
hip,
than we assume it's level triggered and process precpu irq in mask/unmask =
way=2E

Could it be a possible option?

Thanks=2E

>just adds to my feeling=2E=2E=2E
>
>         M=2E

--=20
Jiaxun Yang
