Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6842E368EBF
	for <lists+linux-mips@lfdr.de>; Fri, 23 Apr 2021 10:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhDWIUN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 23 Apr 2021 04:20:13 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58640 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229456AbhDWIUM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 23 Apr 2021 04:20:12 -0400
Received: from [10.0.2.15] (unknown [58.249.121.165])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL+4Pg4JgZNQMAA--.4973S3;
        Fri, 23 Apr 2021 16:19:28 +0800 (CST)
Subject: =?UTF-8?B?UmU6IOWbnuWkje+8miBbUEFUQ0hdIE1JUFM6RFRTOkZpeCBsYWJlbCBu?=
 =?UTF-8?Q?ame_and_interrupt_number_of_ohci_for_Loongson-2K?=
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Qing Zhang <zhangqing@loongson.cn>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     devicetree <devicetree@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20210423015234.23870-1-maoxiaochuan@loongson.cn>
 <1053fddf-479a-6014-ca2c-110c19574f84@loongson.cn>
 <tencent_A816CB57EADAD19FD3FFC04C3598E81B5608@qq.com>
 <6abcefbe-0e49-4e68-abc1-b9535d5467ea@www.fastmail.com>
From:   Xiaochuan Mao <maoxiaochuan@loongson.cn>
Message-ID: <24218389-e2d8-6e91-d72d-f0d961e3f9b8@loongson.cn>
Date:   Fri, 23 Apr 2021 16:19:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6abcefbe-0e49-4e68-abc1-b9535d5467ea@www.fastmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxL+4Pg4JgZNQMAA--.4973S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AF1xAw48tFW7Zr1xCw1Utrb_yoW8Ww17pr
        s3Aa1IgF4DJr1Ikw42kr1j9F1jq34UJrn5XFn8Cas5GFWqvwn5Jry8ZrW0qry2qry7Ca1U
        Zry2qr429as8ArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
        Y487MxkIecxEwVAFwVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
        C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
        wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
        v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E
        87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
        IFyTuYvjfU0yxRDUUUU
X-CM-SenderInfo: xpdr5xxdrfx3ldqnw6o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2021/4/23 下午12:02, Jiaxun Yang wrote:
>
> On Fri, Apr 23, 2021, at 10:47 AM, maoxiaochuan wrote:
>> Ok, I will send a another patch for it.
> Please correct your email client setup.
>
>
> https://www.kernel.org/doc/html/latest/process/email-clients.html
thanks for your suggest.
>>  
>> 祝好
>>  
>>
>>
>> ------------------ 原始邮件 ------------------
>> *发件人:* "zhangqing"<zhangqing@loongson.cn>; 
>> *发送时间:* 2021年4月23日(星期五) 上午10:37
>> *收件人:* "xiaochuan mao"<maoxiaochuan@loongson.cn>; "Rob 
>> Herring"<robh+dt@kernel.org>; "Thomas 
>> Bogendoerfer"<tsbogend@alpha.franken.de>; "Jiaxun 
>> Yang"<jiaxun.yang@flygoat.com>; 
>> *抄送:* "devicetree"<devicetree@vger.kernel.org>; 
>> "linux-mips"<linux-mips@vger.kernel.org>; 
>> "linux-kernel"<linux-kernel@vger.kernel.org>; 
>> *主题:* Re: [PATCH] MIPS:DTS:Fix label name and interrupt number of ohci 
>> for Loongson-2K
>>
>>
>> On 04/23/2021 09:52 AM, xiaochuan mao wrote:
>>> from Loongson-2K1000 user manual know that under pci bus
>>> the device num is 4, function number is 2 and register is 0x2200
>>> is ohci. the ohci interrupt number is 51. because Loongson-2K1000 has
>>> 64 interrupt sources, 0-31 correspond to the device tree liointc0 device
>>>   node, and the other correspond to liointc1 node. so it should be
>>> number 19 correspon to liointc1.
>>>
>>> Signed-off-by: xiaochuan mao <maoxiaochuan@loongson.cn>
>>>
>> Hi, xiaozhuan
>>
>>
>> Thanks for the patch, this is my mistake.
>>
>> Can you correct the GPL-3.0 of this file to GPL-2.0 by the way?
>>
>> Thanks
>>
>> -Qing
>
-- 
--xiaochuan

