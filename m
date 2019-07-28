Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D97D780C0
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jul 2019 19:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbfG1RjZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 28 Jul 2019 13:39:25 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25570 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfG1RjY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 28 Jul 2019 13:39:24 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564335555; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=XsK9eqGfO9QyneAvg9JvLsqRRXp4nCUZwjrZkiHsUSJEf4HWHlr3mGeT5vsqoq/0waQ1Ojnn0c9kXLHWZNsoBW+PofIeHA9VswSE2gBigi929FcSZ3b0SthgwTKxYrPTTJsHb/8srDkPxx36lxn5xdO3y3mV2evcCGKkbFz6OgM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1564335555; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=EVwHbEiiGifKfoO+KrCFNaKJshu4Crq1DoWO+5YurGA=; 
        b=Ulpto2wg9Vux7209jYVI9Yh2DBO/LWdCRzsQpVmq49wr/GtkPK6lehIpyWzWa1N8cr/XnP26+uot3CTsh+WgSsNyidCXojpMTnQSWOzUCHZPd/++fJt/J8Z0PFsX7QnoB3UIUp/rISwGHdLxoOQSOu+tcuGUKF1Ye/ToKuYS4So=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=HCfU15Bd2IFV2jmXzPl2sZ0WH1y7HFMcGBM3jUgZPXDKrNmZBrXow6dBtNdLtFCja/NAPDgo3zgU
    xtIxES+N1qvUOT8bmDYpWnIv7sAlsi/8aDp2uWvLtTixgvEXCJDh  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564335555;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        l=1368; bh=EVwHbEiiGifKfoO+KrCFNaKJshu4Crq1DoWO+5YurGA=;
        b=q1sHDKAJnzZZGjX/7Vl84weg6ujuwYkW4NseQt2jsa0Zfy3U/fozInDzT3c/QTDJ
        9FvNp1O1tGgk+c/rlyFUjVgxZrzacJkkTKb9+O4kf9b5OUKzppLL1Lbj0ynWaoCRJha
        RADmh6Otn1dgv2a8q+v0L5K6tCRLVWzTslXZB0R4=
Received: from [192.168.88.139] (171.221.113.137 [171.221.113.137]) by mx.zohomail.com
        with SMTPS id 1564335554304611.6885982302678; Sun, 28 Jul 2019 10:39:14 -0700 (PDT)
Subject: Re: [PATCH v3 3/8] dt-bindings: interrupt-controller: Add JZ4760 and
 JZ4760B bindings.
To:     Marc Zyngier <marc.zyngier@arm.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
 <1563192595-53546-4-git-send-email-zhouyanjie@zoho.com>
 <865znoor2n.wl-marc.zyngier@arm.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, paul.burton@mips.com,
        tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com,
        jason@lakedaemon.net
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5D3DDDB9.20507@zoho.com>
Date:   Mon, 29 Jul 2019 01:39:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <865znoor2n.wl-marc.zyngier@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Marc,

These patches has been combined in v4.

Thanks

On 2019=E5=B9=B407=E6=9C=8826=E6=97=A5 21:36, Marc Zyngier wrote:
> On Mon, 15 Jul 2019 13:09:50 +0100,
> Zhou Yanjie <zhouyanjie@zoho.com> wrote:
>> Add the interrupt-controller bindings for the JZ4760 Soc and
>> the JZ4760B Soc from Ingenic.
>>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>> ---
>>   Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.tx=
t | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/inge=
nic,intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ingen=
ic,intc.txt
>> index d4373d0..fa1ad54 100644
>> --- a/Documentation/devicetree/bindings/interrupt-controller/ingenic,int=
c.txt
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,int=
c.txt
>> @@ -5,6 +5,8 @@ Required properties:
>>   - compatible : should be "ingenic,<socname>-intc". Valid strings are:
>>       ingenic,jz4740-intc
>>       ingenic,jz4725b-intc
>> +    ingenic,jz4760-intc
>> +    ingenic,jz4760b-intc
>>       ingenic,jz4770-intc
>>       ingenic,jz4775-intc
>>       ingenic,jz4780-intc
>> --=20
>> 2.7.4
>>
>>
> This should be combined with patches 5 and 7. I don't see the need for
> multiple patches. Same thing should happen with patches 4, 6 and 8.
>
> Thanks,
>
> =09M.
>



