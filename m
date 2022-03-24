Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E03554E5CF2
	for <lists+linux-mips@lfdr.de>; Thu, 24 Mar 2022 02:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346362AbiCXBxh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Mar 2022 21:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237924AbiCXBxh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Mar 2022 21:53:37 -0400
Received: from 189.cn (ptr.189.cn [183.61.185.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B0F4D931B5;
        Wed, 23 Mar 2022 18:52:03 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.31:41708.1247416142
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
        by 189.cn (HERMES) with SMTP id CABED1002D0;
        Thu, 24 Mar 2022 09:52:00 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-b7fbf7d79-bwdqx with ESMTP id 1e48b1cf371848ddae794e635af76691 for robh@kernel.org;
        Thu, 24 Mar 2022 09:52:02 CST
X-Transaction-ID: 1e48b1cf371848ddae794e635af76691
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
Message-ID: <3e2ef814-3ced-5a46-6d47-dc2f40ebf990@189.cn>
Date:   Thu, 24 Mar 2022 09:51:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 2/7] MIPS: Loongson64: dts: introduce ls3A4000
 evaluation board
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Roland Scheidegger <sroland@vmware.com>,
        Zack Rusin <zackr@vmware.com>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "David S . Miller" <davem@davemloft.net>,
        Lucas Stach <l.stach@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Ilia Mirkin <imirkin@alum.mit.edu>,
        Qing Zhang <zhangqing@loongson.cn>,
        suijingfeng <suijingfeng@loongson.cn>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20220321162916.1116541-1-15330273260@189.cn>
 <20220321162916.1116541-3-15330273260@189.cn>
 <2644866a-8db2-923e-4227-2aa6d8e375fe@flygoat.com>
 <2c671752-6684-f87b-7b2d-90568d36adde@189.cn>
 <005099b5-33ed-4cb7-f8e4-10e1de780311@flygoat.com>
 <abe784ce-eb9e-0143-dbc3-d415bbedbb81@189.cn>
 <YjsYM0M24VhkCHwG@robh.at.kernel.org>
From:   Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <YjsYM0M24VhkCHwG@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
        FROM_LOCAL_HEX,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2022/3/23 20:53, Rob Herring wrote:
> On Wed, Mar 23, 2022 at 09:53:14AM +0800, Sui Jingfeng wrote:
>> On 2022/3/23 00:06, Jiaxun Yang wrote:
>>>
>>> 在 2022/3/22 13:38, Sui Jingfeng 写道:
>>>> On 2022/3/22 21:05, Jiaxun Yang wrote:
>>>>>
>>>>> 在 2022/3/21 16:29, Sui Jingfeng 写道:
>>>>>> From: suijingfeng <suijingfeng@loongson.cn>
>>>>>>
>>>>>> The board name is LS3A4000_7A1000_EVB_BOARD_V1.4, it consist of 1.8Ghz
>>>>>> mips64r5 4-core CPU and LS7A1000 bridge chip. It has PCIe
>>>>>> GEN2 x8 slot,
>>>>>> therefore can play with discrete graphics card.
>>>>> Hi Jingfeng,
>>>>>
>>>>> As we've discussed before if you are going to introduce new dts
>>>>> then you *MUST*
>>>>> include it in makefile and wire it up in code.
>>>>>
>>>>> A dts file doing nothing lying in the tree is just suspicious.
>>>>>
>>>>> Thanks.
>>>>> - Jiaxun
>>>>>
>>>> Hi, Jiaxun,
>>>>
>>>> I know what you means, but it is the kernel side developer's job.
>>>> I am just a naive graphic driver developer,I can not care so much.
>>>> Below is my private patch which can be used to built specific dts
>>>> into the linux kernel, therefore make the verification easier.
>>> Hi Jingfeng,
>>>
>>> In kernel world we take care all the stuff we touched ourself :-)
>>>
>>> If you are not confident with them please drop those DTS from the
>>> patchset
>>> besides the generic one. I can do the rest for you after getting this
>>> set merged.
>>>
>>> Thanks.
>>> - Jiaxun
>>>
>> Hi, Jiaxun
>>
>> Build all dts into vmlinuz will make the vmlinuz bigger and bigger.
>> How does the kernel get the dtb is another big issue, either from built-in
>> dtb or pass from the firmware(pmon and uefi etc). This should be
>> solved with another patch carefully. Providing board specific dts
>> helps to code review, it helps reviewers understand that there are
>> variant boards and have to be express with different OF graph.
> Built-in DTBs are for legacy bootloaders that don't understand DT. I
> would not expect a new platform to need this.
>
>> Now, there are about 6 dts under arch/mips/boot/dts/loongson/,
>> Suppose loongson have 1000+ different board, do you want built all
>> of them into vmlinuz?
> The point was to add the .dts to Makefile so it builds, not so it is
> built-in. How are you testing those build with dtc and dtschema if not
> added to kbuild?
OK, i see the key point.
> Rob
