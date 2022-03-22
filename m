Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB164E36BA
	for <lists+linux-mips@lfdr.de>; Tue, 22 Mar 2022 03:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235427AbiCVCfY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Mar 2022 22:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235297AbiCVCfY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Mar 2022 22:35:24 -0400
Received: from 189.cn (ptr.189.cn [183.61.185.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 75411DFA3;
        Mon, 21 Mar 2022 19:33:55 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.41:48144.976236044
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
        by 189.cn (HERMES) with SMTP id 784681002BB;
        Tue, 22 Mar 2022 10:33:48 +0800 (CST)
Received: from  ([172.27.8.53])
        by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id f99435236ca14be49c68a89810849220 for robh@kernel.org;
        Tue, 22 Mar 2022 10:33:54 CST
X-Transaction-ID: f99435236ca14be49c68a89810849220
X-Real-From: 15330273260@189.cn
X-Receive-IP: 172.27.8.53
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
Message-ID: <f7eb61bc-6784-c77a-083f-7408c0a17e05@189.cn>
Date:   Tue, 22 Mar 2022 10:33:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 5/7] dt-bindings: display: Add Loongson display
 controller
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>,
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
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Ilia Mirkin <imirkin@alum.mit.edu>,
        Qing Zhang <zhangqing@loongson.cn>,
        suijingfeng <suijingfeng@loongson.cn>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20220321162916.1116541-1-15330273260@189.cn>
 <20220321162916.1116541-6-15330273260@189.cn>
 <YjkITWpbnCmhKaX+@robh.at.kernel.org>
From:   Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <YjkITWpbnCmhKaX+@robh.at.kernel.org>
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


On 2022/3/22 07:20, Rob Herring wrote:
> On Tue, Mar 22, 2022 at 12:29:14AM +0800, Sui Jingfeng wrote:
>> From: suijingfeng <suijingfeng@loongson.cn>
>>
> Needs a commit message.
>
>> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
>> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
> Same person? Don't need both emails.

Yes,  suijingfeng@loongson.cn is my company's email. But it can not be 
used to send patches to dri-devel,

when send patches with this email, the patch will not be shown on patch 
works.

Emails  are either blocked or got  rejected  by loongson's mail server.  
It can only receive emails

from you and other people, but not dri-devel. so have to use my personal 
email(15330273260@189.cn) to send patches.

>> ---
>>   .../loongson/loongson,display-controller.yaml | 230 ++++++++++++++++++
>>   1 file changed, 230 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>> new file mode 100644
>> index 000000000000..7be63346289e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>> @@ -0,0 +1,230 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/loongson/loongson,display-controller.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Loongson LS7A1000/LS2K1000/LS2K0500 Display Controller Device Tree Bindings
>> +
>> +maintainers:
>> +  - Sui Jingfeng <suijingfeng@loongson.cn>
>> +
>> +description: |+
>> +
>> +  Loongson display controllers are simple which require scanout buffers
>> +  to be physically contiguous. LS2K1000/LS2K0500 is a SOC, only system
>> +  memory is available. LS7A1000/LS7A2000 is bridge chip which is equipped
>> +  with a dedicated video RAM which is 64MB or more, precise size can be
>> +  read from the PCI BAR 2 of the GPU device(0x0014:0x7A15) in the bridge
>> +  chip.
>> +
>> +  LSDC has two display pipes, each way has a DVO interface which provide
>> +  RGB888 signals, vertical & horizontal synchronisations, data enable and
>> +  the pixel clock. LSDC has two CRTC, each CRTC is able to scanout from
>> +  1920x1080 resolution at 60Hz. Each CRTC has two FB address registers.
>> +
>> +  For LS7A1000, there are 4 dedicated GPIOs whose control register is
>> +  located at the DC register space. They are used to emulate two way i2c,
>> +  One for DVO0, another for DVO1.
>> +
>> +  LS2K1000 and LS2K0500 SoC grab i2c adapter from other module, either
>> +  general purpose GPIO emulated i2c or hardware i2c in the SoC.
>> +
>> +  LSDC's display pipeline have several components as below description,
>> +
>> +  The display controller in LS7A1000:
>> +     ___________________                                     _________
>> +    |            -------|                                   |         |
>> +    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monitor |
>> +    |  _   _     -------|        ^             ^            |_________|
>> +    | | | | |    -------|        |             |
>> +    | |_| |_|    | i2c0 <--------+-------------+
>> +    |            -------|
>> +    |   DC IN LS7A1000  |
>> +    |  _   _     -------|
>> +    | | | | |    | i2c1 <--------+-------------+
>> +    | |_| |_|    -------|        |             |             _________
>> +    |            -------|        |             |            |         |
>> +    |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
>> +    |            -------|                                   |_________|
>> +    |___________________|
>> +
>> +  Simple usage of LS7A1000 with LS3A4000 CPU:
>> +
>> +    +------+            +-----------------------------------+
>> +    | DDR4 |            |  +-------------------+            |
>> +    +------+            |  | PCIe Root complex |   LS7A1000 |
>> +       || MC0           |  +--++---------++----+            |
>> +  +----------+  HT 3.0  |     ||         ||                 |
>> +  | LS3A4000 |<-------->| +---++---+  +--++--+    +---------+   +------+
>> +  |   CPU    |<-------->| | GC1000 |  | LSDC |<-->| DDR3 MC |<->| VRAM |
>> +  +----------+          | +--------+  +-+--+-+    +---------+   +------+
>> +       || MC1           +---------------|--|----------------+
>> +    +------+                            |  |
>> +    | DDR4 |          +-------+   DVO0  |  |  DVO1   +------+
>> +    +------+   VGA <--|ADV7125|<--------+  +-------->|TFP410|--> DVI/HDMI
>> +                      +-------+                      +------+
>> +
>> +  The display controller in LS2K1000/LS2K0500:
>> +     ___________________                                     _________
>> +    |            -------|                                   |         |
>> +    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monitor |
>> +    |  _   _     -------|        ^              ^           |_________|
>> +    | | | | |           |        |              |
>> +    | |_| |_|           |     +------+          |
>> +    |                   <---->| i2c0 |<---------+
>> +    |   DC IN LS2K1000  |     +------+
>> +    |  _   _            |     +------+
>> +    | | | | |           <---->| i2c1 |----------+
>> +    | |_| |_|           |     +------+          |            _________
>> +    |            -------|        |              |           |         |
>> +    |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
>> +    |            -------|                                   |_________|
>> +    |___________________|
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^display-controller@[0-9a-f],[0-9a-f]$"
>> +
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - loongson,ls7a1000-dc
>> +              - loongson,ls2k1000-dc
>> +              - loongson,ls2k0500-dc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +  i2c-gpio@0:
>> +    description: |
>> +      Built-in GPIO emulate i2c exported for external display bridge
> If you have i2c-gpio, that belongs at the DT top-level, not here.
>
>> +      configuration, onitor detection and edid read back etc, for ls7a1000
>> +      only. Its compatible must be lsdc,i2c-gpio-0. The reg property can be
> No, there's a defined i2c-gpio compatible already.

This is different from the i2c-gpio already defined under drivers/i2c/busses/i2c-gpio.c,
By design, my i2c-gpio is vendor specific properties, lsdc device driver create the i2c
adapter at runtime. These are 4 dedicated GPIOs whose control register is located at the
LSDC register space, not general purpose GPIOs with separate control register resource.
So i think it is the child node of display-controller@6,1, it belongs to LSDC.
It seems that put it at the DT top-level break the hierarchy and relationship.

>> +      used to specify a I2c adapter bus number, if you don't specify one
>> +      i2c driver core will dynamically assign a bus number. Please specify
> Bus numbers are a linux detail not relevant to DT binding.
>
>> +      it only when its bus number matters. Bus number greater than 6 is safe
>> +      because ls7a1000 bridge have 6 hardware I2C controller integrated.
>> +
>> +  i2c-gpio@1:
>> +    description: |
>> +      Built-in GPIO emulate i2c exported for external display bridge
>> +      configuration, onitor detection and edid read back etc, for ls7a1000
>> +      only. Its compatible must be lsdc,i2c-gpio-1.
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: output port node connected with DPI panels or external encoders, with only one endpoint.
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: output port node connected with DPI panels or external encoders, with only one endpoint.
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    bus {
>> +
>> +        #address-cells = <3>;
>> +        #size-cells = <2>;
>> +        #interrupt-cells = <2>;
>> +
>> +        display-controller@6,1 {
>> +            compatible = "loongson,ls7a1000-dc";
>> +            reg = <0x3100 0x0 0x0 0x0 0x0>;
>> +            interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            i2c-gpio@0 {
>> +                compatible = "lsdc,i2c-gpio-0";
>> +                reg = <6>;
>> +                sda = <0>;
>> +                scl = <1>;
>> +            };
>> +
>> +            i2c-gpio@1 {
>> +                compatible = "lsdc,i2c-gpio-1";
>> +                reg = <7>;
>> +                sda = <2>;
>> +                scl = <3>;
>> +            };
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +                port@0 {
>> +                    reg = <0>;
>> +                    endpoint {
>> +                            remote-endpoint = <&vga_encoder_in>;
>> +                    };
>> +                };
>> +                port@1 {
>> +                    reg = <1>;
>> +                    endpoint {
>> +                            remote-endpoint = <&dvi_encoder_in>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    bus {
>> +
>> +        #address-cells = <3>;
>> +        #size-cells = <2>;
>> +        #interrupt-cells = <2>;
>> +
>> +        display-controller@6,0 {
>> +            compatible = "loongson,ls2k1000-dc";
>> +            reg = <0x3100 0x0 0x0 0x0 0x0>;
>> +            interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +                port@0 {
>> +                    reg = <0>;
>> +                    endpoint {
>> +                            remote-endpoint = <&panel_in>;
>> +                    };
>> +                };
>> +                port@1 {
>> +                    reg = <1>;
>> +                    endpoint {
>> +                            remote-endpoint = <&hdmi_encoder_in>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>> +...
>> -- 
>> 2.25.1
>>
>>
