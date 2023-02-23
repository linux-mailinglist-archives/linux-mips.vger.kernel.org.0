Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33EBF6A03F6
	for <lists+linux-mips@lfdr.de>; Thu, 23 Feb 2023 09:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233294AbjBWIiz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Feb 2023 03:38:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233226AbjBWIiy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Feb 2023 03:38:54 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E083228216;
        Thu, 23 Feb 2023 00:38:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 845E8B8197A;
        Thu, 23 Feb 2023 08:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2121C433EF;
        Thu, 23 Feb 2023 08:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677141521;
        bh=2xByn5gj+14HGE2qtWBmwdRYXqCL9+KnKTUsW3DEcSk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=AEl4VlGpIRi0DfR5vuvDM63Cpqnpr8dFXv5hpMaGw6x+2PEZwazJqL6Ahlb1WY58H
         MITxLy5wBfldzQ6hdPBAzjzm7JdIJHj4WR2Hjtq0f6jziWoTI9qA/LjwbuCcXRu9WR
         VSVNrIr/m2RyAiSHsy53Xt+k55EyW7/LoRS9ZUHae2BRP/EDFeWTUBIXpFMbxiGGDF
         16WmnHGM9dp0C2nT0Cv14LO+sxFjhjuU+6ow24pCltGLenX/4IL2nbVt5n6TBj/msO
         0oEku0fCYmYgjCU2wcwwqNEKTpuAOYSS5bf5Us2M/UlLSE0/aNFbgzcAUQfkL0AYke
         KsGWnRVi1+GDQ==
Message-ID: <c463de0c-afae-4539-0a03-51ed5071e5ff@kernel.org>
Date:   Thu, 23 Feb 2023 09:38:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] Mips: ls2k1000: dts: add the display controller
 device node
Content-Language: en-US
To:     suijingfeng <suijingfeng@loongson.cn>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230222165514.684729-1-suijingfeng@loongson.cn>
 <f153bb62-ec3c-c16d-5b43-f53b5319c2e6@kernel.org>
 <32a56a81-e9b5-138b-4dff-35c2525cc0b6@loongson.cn>
 <f1cb010c-be28-9b1b-da1f-93d5e2fb213f@kernel.org>
 <9e890c83-495b-87d5-68bf-838c7cf0c003@kernel.org>
 <61df255c-1637-ed60-7542-4b00e41597e6@loongson.cn>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <61df255c-1637-ed60-7542-4b00e41597e6@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 23/02/2023 09:21, suijingfeng wrote:
> 
> On 2023/2/23 16:05, Krzysztof Kozlowski wrote:
>> On 23/02/2023 08:58, Krzysztof Kozlowski wrote:
>>> On 23/02/2023 04:19, Sui jingfeng wrote:
>>>> Hi,
>>>>
>>>> On 2023/2/23 02:32, Krzysztof Kozlowski wrote:
>>>>> On 22/02/2023 17:55, suijingfeng wrote:
>>>>>> The display controller is a pci device, it's pci vendor id is
>>>>>> 0x0014, it's pci device id is 0x7a06.
>>>>>>
>>>>>> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
>>>>>> ---
>>>>>>    .../boot/dts/loongson/loongson64-2k1000.dtsi  | 21 +++++++++++++++++++
>>>>>>    1 file changed, 21 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>>>>>> index 8143a61111e3..a528af3977d9 100644
>>>>>> --- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>>>>>> +++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>>>>>> @@ -31,6 +31,18 @@ memory@200000 {
>>>>>>    			<0x00000001 0x10000000 0x00000001 0xb0000000>; /* 6912 MB at 4352MB */
>>>>>>    	};
>>>>>>    
>>>>>> +	reserved-memory {
>>>>>> +		#address-cells = <2>;
>>>>>> +		#size-cells = <2>;
>>>>>> +		ranges;
>>>>>> +
>>>>>> +		display_reserved: framebuffer@30000000 {
>>>>>> +			compatible = "shared-dma-pool";
>>>>>> +			reg = <0x0 0x30000000 0x0 0x04000000>; /* 64M */
>>>>>> +			linux,cma-default;
>>>>>> +		};
>>>>>> +	};
>>>>>> +
>>>>>>    	cpu_clk: cpu_clk {
>>>>>>    		#clock-cells = <0>;
>>>>>>    		compatible = "fixed-clock";
>>>>>> @@ -198,6 +210,15 @@ sata@8,0 {
>>>>>>    				interrupt-parent = <&liointc0>;
>>>>>>    			};
>>>>>>    
>>>>>> +			display-controller@6,0 {
>>>>>> +				compatible = "loongson,ls2k1000-dc";
>>>>>> +
>>>>>> +				reg = <0x3000 0x0 0x0 0x0 0x0>;
>>>>>> +				interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
>>>>>> +				interrupt-parent = <&liointc0>;
>>>>>> +				memory-region = <&display_reserved>;
>>>>> NAK.
>>>> Err :(,  please give me a chance to explain
>>>>> Test your code against the bindings you send.
>>>> I can guarantee to you that I test may code more than twice. The code
>>>> used to testing is listed at link [1].
>>> I wrote - test against the bindings. I don't believe that it was tested.
>>> Please paste the output of the testing (dtbs_check).
>> OTOH, dtschema has some hickups on loongsoon DTS, so I doubt you could
>> even test it. Anyway, where is above property memory-region described in
>> the bindings?
> 
> Yes, you are right. I forget to write memory-region property.
> 
> but the code provided in  loongson64-2k1000.dtsi is correct.
> 
> I do run dt_binding_check, the results seems good.

dt_binding_check checks the binding. We talk about your DTS.

> 
> there are some problem when make dtbs_check, but it seems not relevant 
> to me.

Yeah, the dtbs_check hash troubles with interrupt cells and it does not
give reasonable warning message.

Best regards,
Krzysztof

