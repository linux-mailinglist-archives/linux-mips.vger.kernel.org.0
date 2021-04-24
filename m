Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A61B836A0DC
	for <lists+linux-mips@lfdr.de>; Sat, 24 Apr 2021 13:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbhDXLZH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Apr 2021 07:25:07 -0400
Received: from out28-98.mail.aliyun.com ([115.124.28.98]:39394 "EHLO
        out28-98.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231823AbhDXLZD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Apr 2021 07:25:03 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08041266|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_news_journal|0.0827475-0.00385465-0.913398;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047211;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=16;RT=16;SR=0;TI=SMTPD_---.K3L4-c1_1619263461;
Received: from 192.168.88.128(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.K3L4-c1_1619263461)
          by smtp.aliyun-inc.com(10.147.44.129);
          Sat, 24 Apr 2021 19:24:23 +0800
Subject: Re: [PATCH] Revert "MIPS: make userspace mapping young by default".
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Huang Pei <huangpei@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        paul.burton@mips.com, paul@crapouillou.net, siyanteng@loongson.cn,
        ira.weiny@intel.com, yangtiezhu@loongson.cn, jun.jiang@ingenic.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com,
        sihui.liu@ingenic.com
References: <1618562868-91115-1-git-send-email-zhouyanjie@wanyeetech.com>
 <20210416092003.5754967.19768.9603@loongson.cn>
 <ae06522f-eda8-96d1-6f58-072905afa65c@wanyeetech.com>
 <20210419045610.frhzxskec47s5rmq@ambrosehua-HP-xw6600-Workstation>
 <13e37741-c1b4-2aae-471e-0790adc8db59@wanyeetech.com>
 <20210420024818.r6jf243oglb2ywbr@ambrosehua-HP-xw6600-Workstation>
 <fd1e02ff-0165-7e7e-8bc6-55fb278fc50f@wanyeetech.com>
 <20210423145131.GA11112@alpha.franken.de>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <6d307cf6-0ed5-e9f9-ae1e-8f2e28b23311@wanyeetech.com>
Date:   Sat, 24 Apr 2021 19:24:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20210423145131.GA11112@alpha.franken.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

On 2021/4/23 下午10:51, Thomas Bogendoerfer wrote:
> On Tue, Apr 20, 2021 at 10:03:01PM +0800, Zhou Yanjie wrote:
>> Sorry for my carelessness, the log in the previous email was wrong, please
>> check the log in this email.
>>
>> [   53.684067] --- pte 1 = 07698685
> any chance to print the virtual address to this pte ?
>
>> [   53.687376] --- pte 3 = 07698685
>> [   53.737175] --- pte 1 = 07699685
>> [   53.740412] --- pte 3 = 07699685
>> [   53.744064] --- pte 1 = 076c3685
>> [..]
> could you print PTE, which faults ? And what is mapped there ?
>
>
> so far I haven't seen any ill-effects of the (bisected ?) patch.
> The problem I have with reverting is that IMHO we re-introduce the bug,
> which this patch fixed.


Fortunately, Mr. Huang Pei and I are in the same city. We have done 
off-line communication, and he is very generous to help troubleshoot the 
problem.


Thanks and best regards!


>
> Thomas.
>
