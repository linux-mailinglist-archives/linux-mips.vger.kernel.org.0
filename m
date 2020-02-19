Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04561164243
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2020 11:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgBSKiW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Feb 2020 05:38:22 -0500
Received: from out28-76.mail.aliyun.com ([115.124.28.76]:49501 "EHLO
        out28-76.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgBSKiW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Feb 2020 05:38:22 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08794115|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0546757-0.00261561-0.942709;DS=CONTINUE|ham_regular_dialog|0.41055-0.0161671-0.573283;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03267;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=9;RT=9;SR=0;TI=SMTPD_---.GpgTeGr_1582108696;
Received: from 192.168.10.227(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GpgTeGr_1582108696)
          by smtp.aliyun-inc.com(10.147.41.187);
          Wed, 19 Feb 2020 18:38:16 +0800
Subject: Re: [RFC v4 2/6] Bindings: nvmem: add bindings for JZ4780 efuse
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <cover.1581958529.git.hns@goldelico.com>
 <86b78db4d607e0bdda6def018bc7f73207ce82e8.1581958529.git.hns@goldelico.com>
 <20200218212609.GA30081@bogus>
 <CFE9AEF5-FFF9-44A9-90D8-DE6AC7E7DD4F@goldelico.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-mips@vger.kernel.org,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5E4D1017.4060707@wanyeetech.com>
Date:   Wed, 19 Feb 2020 18:38:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CFE9AEF5-FFF9-44A9-90D8-DE6AC7E7DD4F@goldelico.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

On 2020年02月19日 13:48, H. Nikolaus Schaller wrote:
>> Am 18.02.2020 um 22:26 schrieb Rob Herring <robh@kernel.org>:
>>
>> On Mon, Feb 17, 2020 at 05:55:26PM +0100, H. Nikolaus Schaller wrote:
>>> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>>>
>>> This patch brings support for the JZ4780 efuse. Currently it only expose
>>> a read only access to the entire 8K bits efuse memory.
>>>
>>> Tested-by: Mathieu Malaterre <malat@debian.org>
>>> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>>> Signed-off-by: Mathieu Malaterre <malat@debian.org>
>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>> ---
>>> .../bindings/nvmem/ingenic,jz4780-efuse.txt     | 17 +++++++++++++++++
>>> 1 file changed, 17 insertions(+)
>>> create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.txt
>> Please convert to a DT schema.
> Is there someone of you who can help to do that?
>
> DT schemas are still like a Chinese dialect for me (i.e. I can decipher with help but neither speak nor write).
>
> BR and thanks,
> Nikolaus

I am also suffering from this, and I am going to ask Paul for advice.

>
>>> diff --git a/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.txt b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.txt
>>> new file mode 100644
>>> index 000000000000..339e74daa9a9
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.txt
>>> @@ -0,0 +1,17 @@
>>> +Ingenic JZ EFUSE driver bindings
>>> +
>>> +Required properties:
>>> +- "compatible"		Must be set to "ingenic,jz4780-efuse"
>>> +- "reg"			Register location and length
>>> +- "clocks"		Handle for the ahb clock for the efuse.
>>> +- "clock-names"		Must be "bus_clk"
>> 'clk' is redundant. How about 'ahb'?

How about replace "bus_clk" with "efuse"? Other SoCs (like T21, X1000, 
X1500, X1830, X2000) has a dedicated bit in the CLKGR register to 
control the EFUSE clock.
A corresponding "XXX_CLK_EFUSE" is provided in the "xxx-cgu.c" driver.

Thanks and best regards!

>>> +
>>> +Example:
>>> +
>>> +efuse: efuse@134100d0 {
>>> +	compatible = "ingenic,jz4780-efuse";
>>> +	reg = <0x134100d0 0x2c>;
>>> +
>>> +	clocks = <&cgu JZ4780_CLK_AHB2>;
>>> +	clock-names = "bus_clk";
>>> +};
>>> -- 
>>> 2.23.0
>>>

