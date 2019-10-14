Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C01D4D59F8
	for <lists+linux-mips@lfdr.de>; Mon, 14 Oct 2019 05:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729808AbfJND3p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 13 Oct 2019 23:29:45 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25444 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729725AbfJND3p (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 13 Oct 2019 23:29:45 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1571023742; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=C124AKHAe9uJtyXjBLUVgNCJN2KsG7G1+f8I2D6rCcwjiJ2ndZBm6MpuF0sVhPaKMgkMPqqVKDuEViXxkqZWNNmDzvD0Ib3CGy6ZOncQZ9SoLOjR6RaMi1FKQHVO4Of/27iFJqOxAh5GnCAJ52/JFUcyobvMJqMpqW14UgpdcZw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1571023742; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=b4RqJU9fbu5y2OZD/3klgivELdy1yMHPoFExbrseIpk=; 
        b=ZXIIShLwzvHV/qOEvDIz4NRtIZgGyql0zS33+v4JNjwVtqRYgPfcays8tVsL84khclFzK+Olg4jxV/L4l79suUOcEguVR8kYqvl2mTvm8KD+kRZ67CJjpWVUc6N7GAtuPlLUqTaASxB5LRz2/GcdkgZz8IeTCmXhcNFL3LWnMJw=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=rVmHDCo2p9d1UoE2BFqSpECg3WQsDqLSJKx5T9Th6J5pStQpmSN8g6X+u1JNuviOGAriqXWVl5Bg
    4f0pi/+7zFurgeLR5HtJvudoPs77OY+nm+VX5s7b+w1xa90ZX7eT  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1571023742;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        l=704; bh=b4RqJU9fbu5y2OZD/3klgivELdy1yMHPoFExbrseIpk=;
        b=b5ih93pGW1qNEThvHdpIw5N3YxTAz58tuBvKEJoS54xZopJQ+poWoyE0iTxboo50
        fez8m0hsISiZiTp6HeSgbWaWBw6Ckh01jFIdh/E3LSCa6MWIwEIHzy4S03hv05DrJ/d
        gTe07cDhFtdCbPzvda58uGQ4bKlp+GUncdajQJaE=
Received: from [192.168.88.140] (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1571023739794947.8001937635913; Sun, 13 Oct 2019 20:28:59 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] Serial: Ingenic: Add support for the X1000.
To:     Greg KH <gregkh@linuxfoundation.org>
References: <1548667176-119830-1-git-send-email-zhouyanjie@zoho.com>
 <1548695029-11900-1-git-send-email-zhouyanjie@zoho.com>
 <1548695029-11900-2-git-send-email-zhouyanjie@zoho.com>
 <20191012073531.GA2036970@kroah.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, mark.rutland@arm.com,
        syq@debian.org, ulf.hansson@linaro.org, linus.walleij@linaro.org,
        armijn@tjaldur.nl, tglx@linutronix.de, yuehaibing@huawei.com,
        malat@debian.org, ezequiel@collabora.com, paul@crapouillou.net,
        linux-serial@vger.kernel.org, jslaby@suse.com,
        jiaxun.yang@flygoat.com, 772753199@qq.com
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5DA3EB68.4050305@zoho.com>
Date:   Mon, 14 Oct 2019 11:28:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20191012073531.GA2036970@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Greg,

I'm sorry, maybe it was a problem when I git send-email,
causing the wrong patch to be sent to you. Just ignore
the email about the serial patch please.

Best regards!

On 2019=E5=B9=B410=E6=9C=8812=E6=97=A5 15:35, Greg KH wrote:
> On Sat, Oct 12, 2019 at 01:13:23PM +0800, Zhou Yanjie wrote:
>> Add support for probing the 8250_ingenic driver on the
>> X1000 Soc from Ingenic.
>>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>> ---
>>   drivers/tty/serial/8250/8250_ingenic.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
> <snip>
>
> you seem to have two patches merged into one here, please fix up and
> resend.
>
> thanks,
>
> greg k-h



