Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74BC92737C4
	for <lists+linux-mips@lfdr.de>; Tue, 22 Sep 2020 02:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728874AbgIVA7T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 20:59:19 -0400
Received: from out28-169.mail.aliyun.com ([115.124.28.169]:34359 "EHLO
        out28-169.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728728AbgIVA7S (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Sep 2020 20:59:18 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1250662|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.581776-0.00187243-0.416352;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03275;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.IaRkK6t_1600736353;
Received: from 192.168.10.195(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IaRkK6t_1600736353)
          by smtp.aliyun-inc.com(10.147.42.253);
          Tue, 22 Sep 2020 08:59:15 +0800
Subject: Re: [PATCH v2 1/2] MIPS: Ingenic: Add system type for new Ingenic
 SoCs.
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     paul@crapouillou.net, paulburton@kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        jiaxun.yang@flygoat.com, Sergey.Semin@baikalelectronics.ru,
        akpm@linux-foundation.org, rppt@kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
References: <20200921174522.33866-1-zhouyanjie@wanyeetech.com>
 <20200921174522.33866-2-zhouyanjie@wanyeetech.com>
 <20200921201329.GA29269@alpha.franken.de>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <d0e662dd-f9aa-db41-7f74-6ced95e0fbc1@wanyeetech.com>
Date:   Tue, 22 Sep 2020 08:59:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20200921201329.GA29269@alpha.franken.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Thomas,

在 2020/9/22 上午4:13, Thomas Bogendoerfer 写道:
> On Tue, Sep 22, 2020 at 01:45:21AM +0800, 周琰杰 (Zhou Yanjie) wrote:
>> @@ -56,9 +64,13 @@ static const struct of_device_id ingenic_of_match[] __initconst = {
>>   	{ .compatible = "ingenic,jz4740", .data = (void *)MACH_INGENIC_JZ4740 },
>>   	{ .compatible = "ingenic,jz4725b", .data = (void *)MACH_INGENIC_JZ4725B },
>>   	{ .compatible = "ingenic,jz4770", .data = (void *)MACH_INGENIC_JZ4770 },
>> +	{ .compatible = "ingenic,jz4775", .data = (void *)MACH_INGENIC_JZ4775 },
>>   	{ .compatible = "ingenic,jz4780", .data = (void *)MACH_INGENIC_JZ4780 },
>>   	{ .compatible = "ingenic,x1000", .data = (void *)MACH_INGENIC_X1000 },
>> +	{ .compatible = "ingenic,x1000e", .data = (void *)MACH_INGENIC_X1000E },
>>   	{ .compatible = "ingenic,x1830", .data = (void *)MACH_INGENIC_X1830 },
>> +	{ .compatible = "ingenic,x2000", .data = (void *)MACH_INGENIC_X2000 },
>> +	{ .compatible = "ingenic,x2000e", .data = (void *)MACH_INGENIC_X2000E },
> I get a warning from checkpatch:
>
> WARNING: DT compatible string "ingenic,x2000e" appears un-documented -- check ./Documentation/devicetree/bindings/


My fault, I will fix this in the next version.

Thanks and best regards!

> Thomas.
>
