Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8374212929D
	for <lists+linux-mips@lfdr.de>; Mon, 23 Dec 2019 09:07:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725822AbfLWIHp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Dec 2019 03:07:45 -0500
Received: from out28-75.mail.aliyun.com ([115.124.28.75]:43820 "EHLO
        out28-75.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725810AbfLWIHp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 23 Dec 2019 03:07:45 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.09333964|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.139352-0.00420118-0.856447;DS=CONTINUE|ham_enroll_verification|0.00822306-0.000359199-0.991418;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16370;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=8;RT=8;SR=0;TI=SMTPD_---.GN20IFV_1577088451;
Received: from 192.168.10.110(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GN20IFV_1577088451)
          by smtp.aliyun-inc.com(10.147.41.231);
          Mon, 23 Dec 2019 16:07:32 +0800
Subject: Re: [BUG] CI20: interrupt-controller@10001000 didn't like hwirq-0x0
 to VIRQ8 mapping (rc=-19)
To:     Paul Cercueil <paul@crapouillou.net>, Marc Zyngier <maz@kernel.org>
References: <8BA39E30-53CB-47DB-8890-465ACB760402@goldelico.com>
 <1576861276.3.1@crapouillou.net>
 <4ea8fd0952b940b37a174fded9b5ebda@www.loen.fr>
 <1576862814.3.2@crapouillou.net>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        MIPS Creator CI20 Development 
        <mips-creator-ci20-dev@googlegroups.com>,
        Zhou Yanjie <zhouyanjie@zoho.com>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5E0075C4.60800@wanyeetech.com>
Date:   Mon, 23 Dec 2019 16:07:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1576862814.3.2@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Paul,

On 2019年12月21日 01:26, Paul Cercueil wrote:
> Hi Marc,
>
> I wasn't aware of the bug, that's why there is no tag.
> I can send a V2 with a fix tag (and Cc linux-stable) if Nikolaus 
> reports it working.
>

I also encountered similar problem on X1000. After applying the patch, 
the problem is resolved. You can add:

Tested-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>


Thanks and best regards!

> -Paul
>
>
> Le ven., déc. 20, 2019 at 17:09, Marc Zyngier <maz@kernel.org> a écrit :
>> On 2019-12-20 17:01, Paul Cercueil wrote:
>>> Hi Nikolaus,
>>>
>>> Try with this: https://lkml.org/lkml/2019/11/22/1831
>>>
>>> And don't hesitate to add your Tested-by :)
>>
>> Is that an actual fix? It wasn't tagged as such, which is why
>> I didn't send it right away... It'd  be good to find out.
>>
>> Thanks,
>>
>>         M.
>> -- 
>> Jazz is not dead. It just smells funny...
>

