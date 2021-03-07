Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3564B33000D
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 11:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbhCGKNF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 05:13:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231521AbhCGKM6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 7 Mar 2021 05:12:58 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F821C06174A;
        Sun,  7 Mar 2021 02:12:58 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id r15-20020a05600c35cfb029010e639ca09eso2003665wmq.1;
        Sun, 07 Mar 2021 02:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3TyMkmxOQJC06CnnXdLtP1kErcHt4cRYBk9nQQy+GeI=;
        b=uxyeYM8AUgSlp920JR9NYDFKLPqhUH5yf9AsNbuMlXsJLnAr+ez8kZbh7dpd9E3b0L
         yUCIs5vlLGCf6z+wNoJxf5ZxQaSNZDi1TCzmVVxzb0WlBTXa3WwEh2+qPcAwwKywgPPD
         nBYnkKZ1vY+USShFP/OYIRGnVEuNhJw584SajEYHplJgL/G6GlZ5SpjYB/1CeNY19WJS
         14wtWsu27Z579i33uS07F9Z1UyZp19xXqJCKn5hyV8KoueIkp4K44/+4MipR2NsUqI82
         F9wlLuXGSPK4L0NhGPgVMIG0+jpLhRcQv578EKuIegRw2EBFV2es2DGBRls5qMjhH+03
         YWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3TyMkmxOQJC06CnnXdLtP1kErcHt4cRYBk9nQQy+GeI=;
        b=NvTVftR9dWBcRqtT7DBFDTByByHSdNhUEb/kQEumoFlzKS5StIvCwn+M69up3s4uKT
         OS3I20UIM0miLoe09dS+Gw3Hz5FYH9a9i8X0YAjAMiK7fjQNSn34MKMYiBliq93Mi6Dl
         zch+lGLjje8FbVjn8Bv5kH7yfyXQCziBcysHfxpTAuVgCZVasg/KfFDdINQ2+MINyPNR
         I0jUTb9ND+joAO9rcYn0NOKm/DHL3IE5RbCXw3Ri4KP8ZnAd2B8olcXawc3cOo5ubz5e
         J8Ko3iNKD/jufwQMvAEZU1H0pcdZiLWvBfjS5a3vTUMk6/ANtIHAnUX9eYIjes7yL3XK
         hLLw==
X-Gm-Message-State: AOAM533gD/RggJFLClnDwSnmBQ2+YwE4WhgNy5wA7sE7wIh8N68O70on
        Q7Q3giscXUfENCjuMobIZHXfh4puR8VbxA==
X-Google-Smtp-Source: ABdhPJzf0o08F5ddr6PfN7/kVgikpHIOXR+G4FuQokr3vP6H99fCBlDIGqxxTBuStCrVj7wNJsKjmA==
X-Received: by 2002:a1c:318b:: with SMTP id x133mr17274165wmx.154.1615111976756;
        Sun, 07 Mar 2021 02:12:56 -0800 (PST)
Received: from [192.168.1.10] (224.red-2-138-103.dynamicip.rima-tde.net. [2.138.103.224])
        by smtp.gmail.com with ESMTPSA id f22sm12665506wmb.31.2021.03.07.02.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Mar 2021 02:12:56 -0800 (PST)
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: document
 BCM6345 external interrupt controller
To:     Rob Herring <robh@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org
References: <20210223204340.312-1-noltari@gmail.com>
 <20210224075640.20465-1-noltari@gmail.com>
 <20210224075640.20465-2-noltari@gmail.com>
 <20210306201404.GB1137882@robh.at.kernel.org>
From:   =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Message-ID: <889b9814-40d4-e012-ff7c-39b00f8c623a@gmail.com>
Date:   Sun, 7 Mar 2021 11:12:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210306201404.GB1137882@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

El 06/03/2021 a las 21:14, Rob Herring escribió:
> On Wed, Feb 24, 2021 at 08:56:39AM +0100, Álvaro Fernández Rojas wrote:
>> Document the binding for the BCM6345 external interrupt controller.
>>
>> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>   v3: pass dt_binding_check.
>>   v2: fix title typo.
>>
>>   .../brcm,bcm6345-ext-intc.yaml                | 78 +++++++++++++++++++
>>   1 file changed, 78 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml
>> new file mode 100644
>> index 000000000000..a691510e78b7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml
>> @@ -0,0 +1,78 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm6345-ext-intc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Broadcom BCM6345 external interrupt controller
>> +
>> +maintainers:
>> +  - Álvaro Fernández Rojas <noltari@gmail.com>
>> +  - Jonas Gorski <jonas.gorski@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - brcm,bcm6318-ext-intc
>> +      - brcm,bcm6345-ext-intc
>> +
>> +  "#interrupt-cells":
>> +    const: 2
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 0
>> +
>> +  interrupt-controller: true
>> +
>> +  interrupts:
>> +    description: Specifies the interrupt line(s) in the interrupt-parent
>> +      controller node. Valid values depend on the type of parent interrupt
>> +      controller.
>> +    maxItems: 4
>> +
>> +  brcm,field-width:
>> +    description: Interrupt controller field width (the default is 4).
> 
> default: 4
> 
>> +    maxItems: 1
> 
> All uint32's are 1 item.

Ok, so I should remove this :)

> 
> What's the set or range of values?

Only BCM6348 needs to set this value to 5, other BCM63xx use the default 
value of 4 (BCM3368, BCM6318, BCM6328, BCM6338, BCM6345, BCM6358, 
BCM6362, BCM6368, BCM63268).

> 
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +required:
>> +  - "#address-cells"
>> +  - compatible
>> +  - reg
>> +  - "#interrupt-cells"
>> +  - interrupt-controller
>> +  - interrupts
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    interrupt-controller@10000018 {
>> +      #address-cells = <0>;
>> +      compatible = "brcm,bcm6345-ext-intc";
>> +      reg = <0x10000018 0x4>;
>> +
>> +      interrupt-parent = <&periph_intc>;
>> +      #interrupt-cells = <2>;
>> +
>> +      interrupt-controller;
>> +      interrupts = <24>, <25>, <26>, <27>;
>> +    };
>> +
>> +  - |
>> +    interrupt-controller@fffe0014 {
>> +      #address-cells = <0>;
>> +      compatible = "brcm,bcm6345-ext-intc";
>> +      reg = <0xfffe0014 0x4>;
>> +
>> +      interrupt-controller;
>> +      #interrupt-cells = <2>;
>> +
>> +      interrupt-parent = <&cpu_intc>;
>> +      interrupts = <3>, <4>, <5>, <6>;
>> +
>> +      brcm,field-width = <5>;
>> +    };
>> -- 
>> 2.20.1
>>

Best regards,
Álvaro.
