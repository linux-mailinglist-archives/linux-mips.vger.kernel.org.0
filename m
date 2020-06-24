Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166B52070C6
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 12:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390254AbgFXKG5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 06:06:57 -0400
Received: from mout.web.de ([217.72.192.78]:39809 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389824AbgFXKG5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 06:06:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1592993198;
        bh=+L5SJ+Mb0nBjlK0ctZLEvDVG/oVzLLk6PJLWbMMjy2c=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=PXEf7icYhkcJdGvHc7ofXX0HeZqdpxiJ84VkK9Gam7Qi9b+CoUqrNuTfsm4jajOvn
         Yf05JB/arJVaiRyaXL11reEuUKTdOvk7uN/NjECcEWMigQoXaK/Vo7Wr7jJwVx6VUr
         1JdKxdcpm9rN9grboEP0RmkcHvIFeAE+86QfFaeA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.175.204]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MDMvE-1jfkYl3Niw-00ASwM; Wed, 24
 Jun 2020 12:06:37 +0200
Subject: Re: [1/7] irqchip: Fix potential resource leaks
To:     Tiezhu Yang <yangtiezhu@loongson.cn>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Huacai Chen <chenhc@lemote.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Xuefeng Li <lixuefeng@loongson.cn>
References: <65e734f7-c43c-f96b-3650-980e15edba60@web.de>
 <d2111f53-ca52-fedf-0257-71f0aa89b093@loongson.cn>
 <9ca22645-8bf3-008f-fe55-d432f962cac3@web.de>
 <bd28aef9-ba70-0539-bdc3-6ce7162cefca@loongson.cn>
 <cc6b95ec-691e-f010-4a04-add39d706c4b@web.de>
 <423f83e0-c533-c346-ab8b-f2c6ccc828a2@loongson.cn>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <37ff7ca4-dc7c-6a43-94a3-9628efe69b25@web.de>
Date:   Wed, 24 Jun 2020 12:06:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <423f83e0-c533-c346-ab8b-f2c6ccc828a2@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IMXO4KnNZn56RfwHXoAlmnOVJ7e/JmzCywNtaOrj30jcikpRvXC
 92Er4hLX74IuKKmz4gpIAixxJsP7TwP9vvfDl6rM0R3kYtS4su4UTW0QYsjig43bG1o31ac
 HpR73xqrCJktGrYMoatu4ovkExJYbrmso1GIv2Pw6XjogQWVPBBlBm0eewMQRpkUgECFhUv
 +k+7Wo0hkVuO9A3ol1RVA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Fepz/melSM4=:TJTSE4zHHAK4c1TGOdb5kZ
 mluub4p+3ztCL9Xl/mYpDy0+2IONNC603nC2lJlxpk0DTrilUQTcKn/sZJJgzAI6SnCgZJHB5
 /FzhkmCMGJGdMe7mblw6KOJXj/55YPbKRtJulrHazBmSP8+0LIRY5jZqygmajXYeCbPxqLLsT
 mAxgISNatHxSlyhaqCqcDIFz3MI8HUZ59etjUwSL8PwA1YQHEpsnQ2IQNsrviGe1ypB1na9d9
 S8q41TTgAWY4GLQ29oxfVp53tNlL1Vfd69y3NJK3m9mAxtT1NRvG1o0B4jwo3GENU62gDd9tC
 cZZUyeT10Lb+p/Nu3ckAEUHc7phineiPO6GBimu6Mwtxrr5Beu29Y3pR4oR+EqEhKsHorBFn3
 db+lj4pp2DWTd/ebiP1wDXWnaYz9IEQh4D5vkK9i7/aHBjAXER/ngoq24Q89z8jG3O7LoL+TR
 +TynufQrpz7Kw8hOUA+jbwzXZZBVmNGc3HpEOL8Q1ugxMAeV+RynKYx0HRHtymav3IBvQIJeg
 +tG0ybgpRjlLRNewBvuxzG15JqowzuIzSPt/lQCgC+hUHW88QCGNNZRrE5S2SdFcYHU8JqmtF
 q54ufB6+JhiX678AA2k+YN1zWpoBaQILDshtZp/6gQkCbZngnpvS9OR35waNuLqTAJltYUAIr
 ikNBYhoOHrBnZNmd4JE33MUo9PWT20hWcSCPnG50dCM/XV2ii9YL4u8DAzqhl6dPGswESZpNa
 lHOfxhQONT0rKygYoKtvlmKliJy6iCPkY4QoEamNBuuA8xMCRW6NGya0ijczeX/493sJn9UVM
 CtFq6D/texxfIREuTdQfqR8i176GUF8syNO8/1lJJlvkQaJNuYnT5hfnHLBuZfX1UKdycVtYM
 INSLShUHzGMAzSKg6a5+DYs8ZF6aKpnuT2N56QOtt9G/72BBV9AywQFwJAGt3TrpaerC15FWD
 +I5UokxnDRd/MZB3E5IM0zatc0GdERANYcG954kH5+kXuMR6Raan7QEP+BtH35GnijO96p1Mr
 +Hze5HY3Jq+gXe0oNTp/CI5rZ1StGfs/Y93GcxUo2AsWgH5yYBKLjdWCxkAM3+upFppWlZNaN
 I4eHiFi3/sZy8Tqq1fAr1B/Z/ro3ES3G+B8SnmATmK3diQVytsswKS86EecGye5agOhufOHXs
 aI2keFb1Yg6kaI7bQ11WUHrcnxh8DeI3cH4oI+M5KokPvane07bRZESqKPxue9pdgywFfP7AV
 0ndT779mBIaAR/uyz
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

>> Were any known software analysis tools involved for the detection of
>> questionable source code places?
>
> kmemleak can detect memory leak,
> but I do not know how to detect other kind of leaks.

How do you think about to extend source code analysis tools accordingly?


> I think consciously release resource in the error path can avoid leaks.

Is it often too easy to overlook relevant function calls?

Regards,
Markus
