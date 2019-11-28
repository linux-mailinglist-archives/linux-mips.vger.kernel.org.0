Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5133E10C3C3
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 06:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbfK1Foi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 00:44:38 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25807 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbfK1Foh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 00:44:37 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574919859; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=BH7JyYOqdQS6xOUIv3hjDBaE7TTQNkFrnQOM08+qyEoyR5TUkySCZuovA1I5qtEJsGGU0UP/hZTJhMc5xxT2m7fz/fVaKbUJzBuQLGQ7oYCNtKx5GJJLiUdWfnynxOHVtEuuiHtkw75YyFbMJ/J7sif9JIpoHxN78OJ9ae19OqU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574919859; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=wlcW9ql9ymxbT2eCAktaPwVnrBMGWt3WmQxCIE59kNo=; 
        b=FhSL5e4rbTlxvECc0hWciM1MMuFJVSeN0yUo5f2MNjbHlIsdmlJCQ96JClTAf2IbfZTOmU0pY7XY1oZP/vI33M1Wh3IhIEplTk2o9JsWVeKeUO3ewfzW8DpCJx85fL6uxZqDOTZGrB6t+nwRVGxvJsCeXqunQTBjIrrZr7rdbSI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=lBCHJiRIvFhUZqNr1O4QsrNCRpDsIY9aa5fM4zsrfiT5SzpUP3lpY75BY+edpRROefN6KOtsOAR4
    ZDZ5sN5NyhahT/70slJRuAghLLqpxNeR+B0VOqUtZvnGTrl8RRQ8  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574919859;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=wlcW9ql9ymxbT2eCAktaPwVnrBMGWt3WmQxCIE59kNo=;
        b=Pvze9OfuY6b+BkbJ/efBp5mfHCVTfMAL6gKdlJ8622tbpHzBCDp8y/0jOaVIssFL
        ZMOKRXqlbWJ2D4jIWWXjTL1l7iUXZwR6qBG8qcRBte/J525IFLoKiB5F6PGdup0XQNN
        Gqed/u6kUs9Tt9fraH9WwvEH0pighTKSLPuFMAhM=
Received: from [192.168.88.130] (125.71.5.36 [125.71.5.36]) by mx.zohomail.com
        with SMTPS id 1574919858757240.6881108728262; Wed, 27 Nov 2019 21:44:18 -0800 (PST)
Subject: Re: [PATCH 4/5] dt-bindings: clock: Add USB OTG clock for X1000.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1574825576-91028-1-git-send-email-zhouyanjie@zoho.com>
 <1574825576-91028-5-git-send-email-zhouyanjie@zoho.com>
 <1574875148.3.3@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        syq@debian.org, sernia.zhou@foxmail.com, zhenwenjin@gmail.com
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5DDF5EA9.8030007@zoho.com>
Date:   Thu, 28 Nov 2019 13:44:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1574875148.3.3@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2019=E5=B9=B411=E6=9C=8828=E6=97=A5 01:19, Paul Cercueil wrote:
> Hi Zhou,
>
>
> Le mer., nov. 27, 2019 at 11:32, Zhou Yanjie <zhouyanjie@zoho.com> a=20
> =C3=A9crit :
>> Add the USB OTC clock bindings for the X1000 Soc from Ingenic.
>>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>> ---
>>  include/dt-bindings/clock/x1000-cgu.h | 23 ++++++++++++-----------
>>  1 file changed, 12 insertions(+), 11 deletions(-)
>>
>> diff --git a/include/dt-bindings/clock/x1000-cgu.h=20
>> b/include/dt-bindings/clock/x1000-cgu.h
>> index bbaebaf..c401fce 100644
>> --- a/include/dt-bindings/clock/x1000-cgu.h
>> +++ b/include/dt-bindings/clock/x1000-cgu.h
>> @@ -29,16 +29,17 @@
>>  #define X1000_CLK_MSCMUX    14
>>  #define X1000_CLK_MSC0        15
>>  #define X1000_CLK_MSC1        16
>> -#define X1000_CLK_SSIPLL    17
>> -#define X1000_CLK_SSIMUX    18
>> -#define X1000_CLK_SFC        19
>> -#define X1000_CLK_I2C0        20
>> -#define X1000_CLK_I2C1        21
>> -#define X1000_CLK_I2C2        22
>> -#define X1000_CLK_UART0        23
>> -#define X1000_CLK_UART1        24
>> -#define X1000_CLK_UART2        25
>> -#define X1000_CLK_SSI        26
>> -#define X1000_CLK_PDMA        27
>
> You can't do that. These macros are ABI now, since they are used in=20
> the devicetree. Just use the next valid number for your OTG clock.
>

My fault, I will fix this in v2.

> Cheers,
> -Paul
>
>> +#define X1000_CLK_OTG        17
>> +#define X1000_CLK_SSIPLL    18
>> +#define X1000_CLK_SSIMUX    19
>> +#define X1000_CLK_SFC        20
>> +#define X1000_CLK_I2C0        21
>> +#define X1000_CLK_I2C1        22
>> +#define X1000_CLK_I2C2        23
>> +#define X1000_CLK_UART0        24
>> +#define X1000_CLK_UART1        25
>> +#define X1000_CLK_UART2        26
>> +#define X1000_CLK_SSI        27
>> +#define X1000_CLK_PDMA        28
>>
>>  #endif /* __DT_BINDINGS_CLOCK_X1000_CGU_H__ */
>> --=20
>> 2.7.4
>>
>>
>
>



