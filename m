Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 274FF18E6B5
	for <lists+linux-mips@lfdr.de>; Sun, 22 Mar 2020 06:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgCVFeR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 22 Mar 2020 01:34:17 -0400
Received: from out28-195.mail.aliyun.com ([115.124.28.195]:52287 "EHLO
        out28-195.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgCVFeR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 22 Mar 2020 01:34:17 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1313025|-1;CH=green;DM=||false|;DS=CONTINUE|ham_system_inform|0.010799-0.000360341-0.988841;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03302;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.H3Ip5oC_1584855242;
Received: from 192.168.10.227(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.H3Ip5oC_1584855242)
          by smtp.aliyun-inc.com(10.147.41.120);
          Sun, 22 Mar 2020 13:34:03 +0800
Subject: Re: [PATCH v5 08/11] dt-bindings: mips: Add loongson boards
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
References: <20200318062102.8145-1-jiaxun.yang@flygoat.com>
 <20200318062102.8145-9-jiaxun.yang@flygoat.com>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5E76F8C7.5010500@wanyeetech.com>
Date:   Sun, 22 Mar 2020 13:33:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20200318062102.8145-9-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun,

On 2020年03月18日 14:20, Jiaxun Yang wrote:
> Prepare for later dts.
>
> Co-developed-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> --
> v4-v5:
> 	Remove unnecessary kernel details.
> ---
>   .../bindings/mips/loongson/devices.yaml       | 27 +++++++++++++++++++
>   1 file changed, 27 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mips/loongson/devices.yaml
>
> diff --git a/Documentation/devicetree/bindings/mips/loongson/devices.yaml b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> new file mode 100644
> index 000000000000..b1f811e251f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> @@ -0,0 +1,27 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/loongson/devices.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson based Platforms Device Tree Bindings
> +
> +maintainers:
> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> +description: |
> +  Devices with a Loongson CPU shall have the following properties.
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +
> +      - description: Generic Loongson3 4Core + RS780E

Maybe "Quad Core" and "Octal Core" are better.

> +        items:
> +          - const: loongson,loongson3-4core-rs780e
> +
> +      - description: Generic Loongson3 8Core + RS780E
> +        items:
> +          - const: loongson,loongson3-8core-rs780e
> +...

