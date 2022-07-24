Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C109657F5CC
	for <lists+linux-mips@lfdr.de>; Sun, 24 Jul 2022 17:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230501AbiGXPdR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Jul 2022 11:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiGXPdR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 24 Jul 2022 11:33:17 -0400
Received: from out28-218.mail.aliyun.com (out28-218.mail.aliyun.com [115.124.28.218])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5702C64;
        Sun, 24 Jul 2022 08:33:14 -0700 (PDT)
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07456556|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0166075-7.73192e-05-0.983315;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047198;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=24;RT=24;SR=0;TI=SMTPD_---.OcQouzA_1658676787;
Received: from 192.168.10.152(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.OcQouzA_1658676787)
          by smtp.aliyun-inc.com;
          Sun, 24 Jul 2022 23:33:09 +0800
Subject: Re: [PATCH 2/3] dt-bindings: SPI: Add Ingenic SFC bindings.
To:     Mike Yang <reimu@sudomaker.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mark Brown <broonie@kernel.org>
Cc:     tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, aidanmacdonald.0x0@gmail.com,
        tmn505@gmail.com, paul@crapouillou.net, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        jinghui.liu@ingenic.com, sernia.zhou@foxmail.com
References: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1658508510-15400-3-git-send-email-zhouyanjie@wanyeetech.com>
 <487a93c4-3301-aefd-abba-aabf4cb8ec90@linaro.org>
 <37062a5d-9da3-fbaf-89bd-776f32be36d9@wanyeetech.com>
 <d1a0dd15-3621-14e9-b931-417cefaab017@linaro.org>
 <b5505a46-ce76-d0aa-009e-81d9ba16e1d5@sudomaker.com>
 <YtxLoPOykLDTzTn9@sirena.org.uk>
 <f05045fa-9ecd-d312-0eaa-5d19498453fc@linaro.org>
 <b52a8e97-3b8e-c67b-4440-2d7428edb4fa@sudomaker.com>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <b6232d28-8a24-c769-7d63-d4f7af493375@wanyeetech.com>
Date:   Sun, 24 Jul 2022 23:33:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b52a8e97-3b8e-c67b-4440-2d7428edb4fa@sudomaker.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Mike,

On 2022/7/24 上午4:49, Mike Yang wrote:
> On 7/24/22 04:07, Krzysztof Kozlowski wrote:
>> On 23/07/2022 21:27, Mark Brown wrote:
>>> On Sun, Jul 24, 2022 at 02:47:14AM +0800, Mike Yang wrote:
>>>> On 7/24/22 01:43, Krzysztof Kozlowski wrote:
>>>>> On 23/07/2022 18:50, Zhou Yanjie wrote:
>>>>>> No offense, does it really need to be named that way?
>>>>>> I can't seem to find documentation with instructions on this :(
>>> ...
>>>
>>>>> All bindings are to follow this rule, so I don't understand why you
>>>>> think it is an exception for you?
>>>> Zhou didn't ask you to make an exception. They have a valid
>>>> point and they're asking why.
>>>> You may want to avoid further incidents of this kind by stop
>>>> being bossy and actually writing a guideline of naming these
>>>> .yaml files and publish it somewhere online.
>>> Yeah, I do have to say that I was also completely unaware that
>>> there was any enforced convention here.
>> Indeed, it's not a enforced pattern. But there are many other
>> insignificant ones which we also tend to forget during review, like
>> using words "Device Tree bindings" in title or using unnecessary quotes
>> around "refs" (also in ID of schema). It's not a big deal, but I ask
>> when I notice it.
> Good. Thanks for paying attention to these details.
>
>
>>> Zhou already mentioned he was unable find the naming guidelines of these .yaml files.
>>>
>>> Apparently you think it's unacceptable for new contributors of a certain subsystem to use existing code as examples, and/or they're responsible for figuring out what's a good example and what's a bad one in the existing codebase.
>> It's everywhere in the kernel, what can I say? If you copy existing
>> code, you might copy poor code...
> Still, it shouldn't be a responsibility of new contributors to determine the quality of an existing piece of code, unless there are clear guidelines (i.e. one should use the new "cs-gpios" attribute in SPI controllers).
>
>>>> It might never grow to new devices (because they might be different), so
>>>> that is not really an argument.
>>> It is an argument. A very valid one.
>>>
>>> "they *might* be different". You may want to get your hands on real hardware and try another word. Or at least read the datasheets instead of believing your imagination.
>>>
>>> I would enjoy duplicating the st,stm32-spi.yaml into st,stm32{f,h}{0..7}-spi.yaml if I'm bored at a Sunday afternoon.
>>>
>>>> All bindings are to follow this rule, so I don't understand why you
>>>> think it is an exception for you?
>>> Zhou didn't ask you to make an exception. They have a valid point and they're asking why.
>> Hm, everyone has the same valid point and such recommendation is to
>> everyone, although it is nothing serious.
>>
>>> You may want to avoid further incidents of this kind by stop being bossy and actually writing a guideline of naming these .yaml files and publish it somewhere online.
>> I did not see any incident here... Process of review includes comments
>> and there is nothing bad happening when you receive a comment. No
>> incident...
>
> Okay. After careful inspection of the Ingenic datasheets, now I have the conclusion: The Ingenic X1000, X1021, X1500, X1501, X1520, X1600, X1800, X1830, X2000, X2100, X2500 have the same SFC controller.


Actually, you are also missing out the X1630 and X1660, and the upcoming 
X2600.


>
> X1600 has a newer version (let's say v2) of the SFC, and X2000-2500 have v3. Others have the original version (let's say v1). Each new version introduced new features such as arbitrary DMA sizes, and the rest features are the same.
>
>
> So IMO the name "ingenic,sfc.yaml" is perfectly logical.
>
>
> Regards,
> Mike Yang
