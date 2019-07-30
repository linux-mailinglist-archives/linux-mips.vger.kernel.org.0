Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1E07A415
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2019 11:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbfG3J04 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Jul 2019 05:26:56 -0400
Received: from sender-pp-o92.zoho.com ([135.84.80.237]:25442 "EHLO
        sender-pp-o92.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729020AbfG3J04 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Jul 2019 05:26:56 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564478802; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=g4GBX0zjUqPghOUaZdN8hDcN6Ciq87XF2OS+vOd8iAhiE8amWj+4qhZEHSya4p+i72aUNvmfrwFz9DFn9beyaLtDS+Aqi0Dr9DKloY878leEaWKAlQFugZrJ/OfA4gO59pw13Bgvg8Dbvyrd6ypsIDezz0B+iOxcCaYsHLgUuJU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1564478802; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=ASKwkj0b5qg5Fwxkz3wYNADsEou8Um77UtYwS51eowk=; 
        b=O07PNCCJFUFWjxb42LXn+Tuqh7eaSnrE7sE7+aZI/yWFApYTh0vYpQJBiH6J2j6iZC30tH0F/VEHeg3pHfeCxjA4gptPd7o+xqSIIc0Vi6rapBbUvk0AGEoqllYjPWlDxjwWOpDrKX3sLp51LMpwG4BJrkfyL59mh5/7n05eD/A=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=eNewHd+DC3QHjVzaOiZIxPefbajvaQt1P0vdVP23LE5U4ej0+H+OGWOrYRmDAqTZc7k24grXD5gN
    V5SFgOHI4piSTWk2KGO82nZzDk+rcB16VHWFVomV87Zvuvf6WRte  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564478802;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        l=2316; bh=ASKwkj0b5qg5Fwxkz3wYNADsEou8Um77UtYwS51eowk=;
        b=L6DSmzQpRjEQFpemZIj+HFhAMTzWjDprAdGag2faKe7EPVVYFPp9oTAE8h+IcMuF
        MAStIBT2fPWr1wkqAN8tLZPeZb3ZlrXxK7LacX5b0fIvdE3wscxORkLkfXAuXd2355a
        M0wOTI76Au7un7kSfFxZspnWWkJ9Cd7cSpZbYXVc=
Received: from [192.168.88.139] (171.221.113.137 [171.221.113.137]) by mx.zohomail.com
        with SMTPS id 1564478800053174.88358763329188; Tue, 30 Jul 2019 02:26:40 -0700 (PDT)
Subject: Re: [PATCH 4/4 v4] irqchip: Ingenic: Add support for new Ingenic
 Socs.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1564335273-22931-1-git-send-email-zhouyanjie@zoho.com>
 <1564335273-22931-5-git-send-email-zhouyanjie@zoho.com>
 <1564421133.6633.1@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, tglx@linutronix.de, mark.rutland@arm.com,
        jason@lakedaemon.net, marc.zyngier@arm.com
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5D3FE309.7020103@zoho.com>
Date:   Tue, 30 Jul 2019 14:26:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1564421133.6633.1@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,
It seems very strange to appear another soc model in one soc's devicetree,
and before submitting this patch I referred to some other irq drivers.=20
Similar
usage was found in irq-sunxi-nmi.c and irq-omap-intc.c, and the original
irq-ingenic.c was declare jz4770, jz4775, jz4780 in the same way. So I=20
followed
the same method to add the declare of jz4760/x1000/x1500, this may be a=20
little
better.

On 2019=E5=B9=B407=E6=9C=8830=E6=97=A5 01:25, Paul Cercueil wrote:
>
>
> Le dim. 28 juil. 2019 =C3=A0 13:34, Zhou Yanjie <zhouyanjie@zoho.com> a=
=20
> =C3=A9crit :
>> Add support for probing the irq-ingenic driver on the JZ4760/JZ4760B
>> and the X1000/X1000E and the X1500 Socs from Ingenic.
>>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>> ---
>>  drivers/irqchip/irq-ingenic.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/irqchip/irq-ingenic.c=20
>> b/drivers/irqchip/irq-ingenic.c
>> index 8430f5a..b72430c 100644
>> --- a/drivers/irqchip/irq-ingenic.c
>> +++ b/drivers/irqchip/irq-ingenic.c
>> @@ -173,6 +173,11 @@ static int __init intc_2chip_of_init(struct=20
>> device_node *node,
>>  {
>>      return ingenic_intc_of_init(node, 2);
>>  }
>> +IRQCHIP_DECLARE(jz4760_intc, "ingenic,jz4760-intc",=20
>> intc_2chip_of_init);
>> +IRQCHIP_DECLARE(jz4760b_intc, "ingenic,jz4760b-intc",=20
>> intc_2chip_of_init);
>>  IRQCHIP_DECLARE(jz4770_intc, "ingenic,jz4770-intc",=20
>> intc_2chip_of_init);
>>  IRQCHIP_DECLARE(jz4775_intc, "ingenic,jz4775-intc",=20
>> intc_2chip_of_init);
>>  IRQCHIP_DECLARE(jz4780_intc, "ingenic,jz4780-intc",=20
>> intc_2chip_of_init);
>> +IRQCHIP_DECLARE(x1000_intc, "ingenic,x1000-intc", intc_2chip_of_init);
>> +IRQCHIP_DECLARE(x1000e_intc, "ingenic,x1000e-intc",=20
>> intc_2chip_of_init);
>> +IRQCHIP_DECLARE(x1500_intc, "ingenic,x1500-intc", intc_2chip_of_init);
>
> All these compatible strings point to the exact same behaviour. It was
> already a mistake to have the three "ingenic,jz47[70,75,80]-intc" here;
> there should have been only one, e.g. "ingenic,jz4770-intc" and the other
> two SoCs using it as a fallback compatible.
>
> I think you don't need to add these, and in your devicetree just use
> "ingenic,jz4780-intc" as a fallback compatible.
>
> Cheers,
> -Paul
>
>



