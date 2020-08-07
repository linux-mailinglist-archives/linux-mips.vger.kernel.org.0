Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8E323F218
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 19:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgHGRnc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 13:43:32 -0400
Received: from out28-4.mail.aliyun.com ([115.124.28.4]:55838 "EHLO
        out28-4.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgHGRnc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Aug 2020 13:43:32 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1861833|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_news_journal|0.00622845-0.000313575-0.993458;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03298;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=7;RT=7;SR=0;TI=SMTPD_---.IE6KE1K_1596822207;
Received: from 192.168.10.205(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IE6KE1K_1596822207)
          by smtp.aliyun-inc.com(10.147.41.143);
          Sat, 08 Aug 2020 01:43:28 +0800
Subject: Re: [PATCH 13/13] MAINTAINERS: Update paths to Ingenic platform code
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20200803170124.231110-1-paul@crapouillou.net>
 <20200803170124.231110-14-paul@crapouillou.net>
 <827893b5-6e6b-0842-949d-8d7e801b4f84@wanyeetech.com>
Message-ID: <b0d421eb-760b-998d-7024-3a906248a34a@wanyeetech.com>
Date:   Sat, 8 Aug 2020 01:43:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <827893b5-6e6b-0842-949d-8d7e801b4f84@wanyeetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


在 2020/8/8 上午1:22, Zhou Yanjie 写道:
> Hi Paul,
>
> 在 2020/8/4 上午1:01, Paul Cercueil 写道:
>> Support for Ingenic chips has been moved to the generic MIPS platform.
>> Update the paths accordingly.
>
> The modification to "cu1830-neo_defconfig" seems to be missed here.
>
Sorry, this should be a reply to [12/13]  :(
> Thanks and best regards!
>
>>
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> ---
>>   MAINTAINERS | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index bddc79ae76e6..1d89029cb89a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -8508,8 +8508,8 @@ INGENIC JZ47xx SoCs
>>   M:    Paul Cercueil <paul@crapouillou.net>
>>   S:    Maintained
>>   F:    arch/mips/boot/dts/ingenic/
>> -F:    arch/mips/include/asm/mach-jz4740/
>> -F:    arch/mips/jz4740/
>> +F:    arch/mips/generic/board-ingenic.c
>> +F:    arch/mips/ingenic/Kconfig
>>   F:    drivers/clk/ingenic/
>>   F:    drivers/dma/dma-jz4780.c
>>   F:    drivers/gpu/drm/ingenic/
