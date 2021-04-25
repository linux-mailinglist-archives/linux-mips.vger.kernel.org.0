Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7E9636A705
	for <lists+linux-mips@lfdr.de>; Sun, 25 Apr 2021 14:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbhDYMGh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 25 Apr 2021 08:06:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60510 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229659AbhDYMGg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 25 Apr 2021 08:06:36 -0400
Received: from [10.0.2.15] (unknown [58.249.121.165])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb8sYW4Vg5LQNAA--.23169S3;
        Sun, 25 Apr 2021 20:05:45 +0800 (CST)
Subject: Re: [PATCH] MIPS:DTS:Correct device id and class code of pcie for
 Loongnon-2K
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Qing Zhang <zhangqing@loongson.cn>
Cc:     devicetree@vger.kernel.org,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org
References: <20210425052817.27373-1-maoxiaochuan@loongson.cn>
 <8cd60ba7-b0db-450f-8285-eb5429c4f3ec@www.fastmail.com>
From:   Xiaochuan Mao <maoxiaochuan@loongson.cn>
Message-ID: <60a86212-d0d4-7c3f-8ccd-20532fbf4b0c@loongson.cn>
Date:   Sun, 25 Apr 2021 20:05:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8cd60ba7-b0db-450f-8285-eb5429c4f3ec@www.fastmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dxb8sYW4Vg5LQNAA--.23169S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCF1Uuw1rZryrWF4rCryUZFb_yoW5ArW8pF
        13Gayj9r4kuF1Syr43AFWv9F47GrZIkFn5trnYqr1UArWqq3yq9r1UJr4xGrs5JFs8Aw4F
        vF95XF1xGF1xt3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
        r21lc2xSY4AK67AK6ryUMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
        8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
        xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
        8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E
        87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
        IFyTuYvjfU038nUUUUU
X-CM-SenderInfo: xpdr5xxdrfx3ldqnw6o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2021/4/25 下午6:39, Jiaxun Yang wrote:
>
> On Sun, Apr 25, 2021, at 1:28 PM, Xiaochuan Mao wrote:
>> from Loongson-2K user manual know that Loongson-2K have two
>> pcie controller pcie0 and pcie1, pcie0 have four port named port0~port3
>> and pcie1 have 2 port named port0~port1. the device id of port0 is 7a19
>> in each pcie controller and others are 7a09. and their class code is 0b0300.
> The manual is obviously incorrect.
>
> class0604 is PCI to PCI bridge that matches. hardware. 0b03 is undefined.
>
> Thanks.
thanks your suggest ,  is my mistake .
>> Signed-off-by: Xiaochuan Mao <maoxiaochuan@loongson.cn>
>> ---
>>  .../boot/dts/loongson/loongson64-2k1000.dtsi  | 40 +++++++++----------
>>  1 file changed, 20 insertions(+), 20 deletions(-)
>>
>> diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi 
>> b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>> index 569e814def83..a95121359080 100644
>> --- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>> +++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>> @@ -150,8 +150,8 @@
>>  			pci_bridge@9,0 {
>>  				compatible = "pci0014,7a19.0",
>>  						   "pci0014,7a19",
>> -						   "pciclass060400",
>> -						   "pciclass0604";
>> +						   "pciclass0b0300",
>> +						   "pciclass0b03";
>>  
>>  				reg = <0x4800 0x0 0x0 0x0 0x0>;
>>  				#interrupt-cells = <1>;
>> @@ -163,10 +163,10 @@
>>  			};
>>  
>>  			pci_bridge@a,0 {
>> -				compatible = "pci0014,7a19.0",
>> -						   "pci0014,7a19",
>> -						   "pciclass060400",
>> -						   "pciclass0604";
>> +				compatible = "pci0014,7a09.0",
>> +						   "pci0014,7a09",
>> +						   "pciclass0b0300",
>> +						   "pciclass0b03";
>>  
>>  				reg = <0x5000 0x0 0x0 0x0 0x0>;
>>  				#interrupt-cells = <1>;
>> @@ -178,10 +178,10 @@
>>  			};
>>  
>>  			pci_bridge@b,0 {
>> -				compatible = "pci0014,7a19.0",
>> -						   "pci0014,7a19",
>> -						   "pciclass060400",
>> -						   "pciclass0604";
>> +				compatible = "pci0014,7a09.0",
>> +						   "pci0014,7a09",
>> +						   "pciclass0b0300",
>> +						   "pciclass0b03";
>>  
>>  				reg = <0x5800 0x0 0x0 0x0 0x0>;
>>  				#interrupt-cells = <1>;
>> @@ -193,10 +193,10 @@
>>  			};
>>  
>>  			pci_bridge@c,0 {
>> -				compatible = "pci0014,7a19.0",
>> -						   "pci0014,7a19",
>> -						   "pciclass060400",
>> -						   "pciclass0604";
>> +				compatible = "pci0014,7a09.0",
>> +						   "pci0014,7a09",
>> +						   "pciclass0b0300",
>> +						   "pciclass0b03";
>>  
>>  				reg = <0x6000 0x0 0x0 0x0 0x0>;
>>  				#interrupt-cells = <1>;
>> @@ -210,8 +210,8 @@
>>  			pci_bridge@d,0 {
>>  				compatible = "pci0014,7a19.0",
>>  						   "pci0014,7a19",
>> -						   "pciclass060400",
>> -						   "pciclass0604";
>> +						   "pciclass0b0300",
>> +						   "pciclass0b03";
>>  
>>  				reg = <0x6800 0x0 0x0 0x0 0x0>;
>>  				#interrupt-cells = <1>;
>> @@ -223,10 +223,10 @@
>>  			};
>>  
>>  			pci_bridge@e,0 {
>> -				compatible = "pci0014,7a19.0",
>> -						   "pci0014,7a19",
>> -						   "pciclass060400",
>> -						   "pciclass0604";
>> +				compatible = "pci0014,7a09.0",
>> +						   "pci0014,7a09",
>> +						   "pciclass0b0300",
>> +						   "pciclass0b03";
>>  
>>  				reg = <0x7000 0x0 0x0 0x0 0x0>;
>>  				#interrupt-cells = <1>;
>> -- 
>> 2.17.1
>>
>>
>
-- 
--xiaochuan

