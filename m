Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7F24BD31F
	for <lists+linux-mips@lfdr.de>; Mon, 21 Feb 2022 02:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245439AbiBUBfw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Feb 2022 20:35:52 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245415AbiBUBfr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 20 Feb 2022 20:35:47 -0500
Received: from 189.cn (ptr.189.cn [183.61.185.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 99F05517C9;
        Sun, 20 Feb 2022 17:35:24 -0800 (PST)
HMM_SOURCE_IP: 10.64.8.41:59176.1663655395
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
        by 189.cn (HERMES) with SMTP id 5D66F1002D0;
        Mon, 21 Feb 2022 09:35:18 +0800 (CST)
Received: from  ([172.27.8.53])
        by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id f2243942f83d46459f7c4749d8fdeb27 for robh@kernel.org;
        Mon, 21 Feb 2022 09:35:22 CST
X-Transaction-ID: f2243942f83d46459f7c4749d8fdeb27
X-Real-From: 15330273260@189.cn
X-Receive-IP: 172.27.8.53
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
Message-ID: <29c663c4-a790-9b0a-627a-7153db51351c@189.cn>
Date:   Mon, 21 Feb 2022 09:35:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v8 2/3] MIPS: Loongson64: dts: update the display
 controller device node
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        suijingfeng <suijingfeng@loongson.cn>, Li Yi <liyi@loongson.cn>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Qing Zhang <zhangqing@loongson.cn>,
        Zack Rusin <zackr@vmware.com>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        Ilia Mirkin <imirkin@alum.mit.edu>
References: <20220216181712.1493400-1-15330273260@189.cn>
 <20220216181712.1493400-3-15330273260@189.cn>
 <1645115995.354636.3365322.nullmailer@robh.at.kernel.org>
From:   Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <1645115995.354636.3365322.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
        FROM_LOCAL_HEX,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2022/2/18 00:39, Rob Herring wrote:
> On Thu, 17 Feb 2022 02:17:11 +0800, Sui Jingfeng wrote:
>> From: suijingfeng <suijingfeng@loongson.cn>
>>
>> The display controller is a pci device, its PCI vendor id is 0x0014
>> its PCI device id is 0x7a06.
>>
>> 1) In order to let the lsdc kms driver to know which chip the DC is
>>     contained in, we add different compatible for different chip.
>>
>> 2) Add display controller device node for ls2k1000 SoC
>>
>> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
>> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
>> ---
>>   .../loongson/loongson,display-controller.yaml | 114 ++++++++++++++++++
>>   .../display/loongson/loongson-drm.txt         |  16 +++
>>   .../boot/dts/loongson/loongson64-2k1000.dtsi  |   8 ++
>>   arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   7 +-
>>   4 files changed, 140 insertions(+), 5 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>>   create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson-drm.txt
>>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml: $id: relative path/filename doesn't match actual path or filename
> 	expected: http://devicetree.org/schemas/display/loongson/loongson,display-controller.yaml#
> Error: Documentation/devicetree/bindings/display/loongson/loongson,display-controller.example.dts:22.30-31 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/display/loongson/loongson,display-controller.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1398: dt_binding_check] Error 2
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/1593886
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>
Ok, I know that now, thank for you point it to me.
