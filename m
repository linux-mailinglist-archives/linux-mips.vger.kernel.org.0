Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1FC036D28C
	for <lists+linux-mips@lfdr.de>; Wed, 28 Apr 2021 08:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbhD1GyR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 28 Apr 2021 02:54:17 -0400
Received: from mail.loongson.cn ([114.242.206.163]:54432 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230349AbhD1GyQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 28 Apr 2021 02:54:16 -0400
Received: from [10.0.2.15] (unknown [58.249.121.165])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cx6cleBolgstsOAA--.24449S3;
        Wed, 28 Apr 2021 14:53:19 +0800 (CST)
Subject: Re: [v1] MIPS:DTS:Correct device id of pcie for Loongnon-2K
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Qing Zhang <zhangqing@loongson.cn>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210425130915.31001-1-maoxiaochuan@loongson.cn>
 <28bbe1bf-f421-afc7-07d3-e123764afe99@flygoat.com>
From:   Xiaochuan Mao <maoxiaochuan@loongson.cn>
Message-ID: <bce8bedc-30f9-f413-c68a-f5edf85046ee@loongson.cn>
Date:   Wed, 28 Apr 2021 14:53:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <28bbe1bf-f421-afc7-07d3-e123764afe99@flygoat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9Cx6cleBolgstsOAA--.24449S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar1xWF17Kr4kAryxZF4Dtwb_yoW8tr1Dp3
        Z3JFW3GrW8X3y7Wry7WwnxJF45KwsIy3W2qFW8Aw18uFyUZ345XryFyr48C34qyrs3WFyU
        Ja4Ut340qF17Xw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
        IcxG8wCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnU
        UI43ZEXa7VUjHUDJUUUUU==
X-CM-SenderInfo: xpdr5xxdrfx3ldqnw6o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2021/4/25 下午9:49, Jiaxun Yang wrote:
>
> 在 2021/4/25 21:09, Xiaochuan Mao 写道:
>> from Loongson-2K user manual know that Loongson-2K have two
>> pcie controller pcie0 and pcie1, pcie0 have four port named port0~port3
>> and pcie1 have 2 port named port0~port1. the device id of port0 is 7a19
>> in each pcie controller and others are 7a09.
>>
>> Signed-off-by: Xiaochuan Mao <maoxiaochuan@loongson.cn>
>> ---
>> v1:
>> revert class code
>
>
> Could you please help me check the actual hardware?
>
> TBH I remeber I filled it with actual hardware values.

here is the pci info  on the board:

pci_device_match_ids: vendor:0014, device:7A03, class:00020000 , devfn:00001800

pci_device_match_ids: vendor:0014, device:7A03, class:00020000 , devfn:00001900
pci_device_match_ids: vendor:0014, device:7A04, class:000C0380 , devfn:00002000
pci_device_match_ids: vendor:0014, device:7A14, class:000C0320 , devfn:00002100
pci_device_match_ids: vendor:0014, device:7A24, class:000C0310 , devfn:00002200
pci_device_match_ids: vendor:0014, device:7A05, class:00030200 , devfn:00002800
pci_device_match_ids: vendor:0014, device:7A06, class:00030000 , devfn:00003000
pci_device_match_ids: vendor:0014, device:7A07, class:00040300 , devfn:00003800
pci_device_match_ids: vendor:0014, device:7A08, class:00010601 , devfn:00004000
pci_device_match_ids: vendor:0014, device:7A19, class:00060400 , devfn:00004800
pci_device_match_ids: vendor:0014, device:7A09, class:00060400 , devfn:00005000
pci_device_match_ids: vendor:0014, device:7A09, class:00060400 , devfn:00005800
pci_device_match_ids: vendor:0014, device:7A09, class:00060400 , devfn:00006000
pci_device_match_ids: vendor:0014, device:7A19, class:00060400 , devfn:00006800
>
> Btw the tittle should be prefixed with [PATCH v2]
>
> You may generate version suffix with `git format-patch -v2` or try to utilize patch management tools like git-publish[1].
>
> Thanks.
>
> [1]: https://github.com/stefanha/git-publish
>
got it , thanks for suggest.  I'll send v2.

> - Jiaxun
>
>
>> ---
>
> [...]

-- 
--xiaochuan

