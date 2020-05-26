Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1552B1E2E88
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 21:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404079AbgEZT3x (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 15:29:53 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:43207 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403856AbgEZT3v (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 15:29:51 -0400
Received: by mail-io1-f65.google.com with SMTP id h10so23334523iob.10;
        Tue, 26 May 2020 12:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1udivP7wbmjRGQdrVG+bvSIgJ6k6K6sg5R0YTrdV/ZI=;
        b=t4kC1jI7UiO4MZhJGkDRBUWQHV+9KoeFICr9vrDYhQOaoCuIv1xL9MybaaNyj/hY74
         slBKtgm+RhZroQTHDrEgfRaJrzlhu0vMeW6j4FT/ld0ZSl3deXO6mHpQT94rXXvJaHt8
         wG8MSmqWHrl84DeKLkzevdIPtfVfXxON0er/gpV7Zj1RknVLoplOQUx6OWH3h9D6YMYa
         eMBhdd4JTxUNCdBs5Uxi8yfTVUdjxEGKkV3F0hgusWxPCdqTMuQbeCgf6jgPg/sG0i0k
         hiR3us/Gq1Gad7DEG+1cQsBeEj+QX6rC+CRANcosBlTmwXthckUewY8Vo0cl4y9It/wR
         QAKw==
X-Gm-Message-State: AOAM533VX0b6tEowLTOYYjmVyWNQAgPAEuTdHj0KUOekpDGLMcaOErPq
        l14RVi5xRDLv7WRbeL3Bs5Z2j3U=
X-Google-Smtp-Source: ABdhPJyZBBk1sBbHouc7difwqpQlE+8v91JyFKG3/W2+MNks24BN0vbpZp7iptfxgr4ZzF78fd0cYA==
X-Received: by 2002:a02:dc8:: with SMTP id 191mr2522550jax.95.1590521389948;
        Tue, 26 May 2020 12:29:49 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id r9sm420424ilm.10.2020.05.26.12.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 12:29:49 -0700 (PDT)
Received: (nullmailer pid 224310 invoked by uid 1000);
        Tue, 26 May 2020 19:29:47 -0000
Date:   Tue, 26 May 2020 13:29:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, tsbogend@alpha.franken.de,
        paulburton@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com,
        tglx@linutronix.de, daniel.lezcano@linaro.org,
        keescook@chromium.org, paul@crapouillou.net, krzk@kernel.org,
        hns@goldelico.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, yanfei.li@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: Re: [PATCH v8 4/6] dt-bindings: MIPS: Document Ingenic SoCs binding.
Message-ID: <20200526192947.GA140311@bogus>
References: <1589898923-60048-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1589898923-60048-6-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1589898923-60048-6-git-send-email-zhouyanjie@wanyeetech.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 19, 2020 at 10:35:21PM +0800, 周琰杰 (Zhou Yanjie) wrote:
> Document the available properties for the SoC root node and the
> CPU nodes of the devicetree for the Ingenic XBurst SoCs.
> 
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> Tested-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>     v1->v2:
>     Change the two Document from txt to yaml.
>     
>     v2->v3:
>     Fix formatting errors.
>     
>     v3->v4:
>     Fix bugs in the two yaml files.
>     
>     v4->v5:
>     No change.
>     
>     v5->v6:
>     Rewrite the two yaml files.
>     
>     v6->v7:
>     1.Update compatible strings in "ingenic,cpu.yaml".
>     2.Fix formatting errors, and enum for compatible strings.
>     3.Remove unnecessary "ingenic,soc.yaml".
>     
>     v7->v8:
>     No change.
> 
>  .../bindings/mips/ingenic/ingenic,cpu.yaml         | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
> new file mode 100644
> index 00000000..afb0207
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/ingenic/ingenic,cpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for Ingenic XBurst family CPUs
> +
> +maintainers:
> +  - 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> +
> +description:
> +  Ingenic XBurst family CPUs shall have the following properties.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +
> +      - description: Ingenic XBurst®1 CPU Cores
> +        items:

This is a single compatible string, right? If so, drop items. 

> +          enum:
> +            - ingenic,xburst-mxu1.0
> +            - ingenic,xburst-fpu1.0-mxu1.1
> +            - ingenic,xburst-fpu2.0-mxu2.0
> +
> +      - description: Ingenic XBurst®2 CPU Cores
> +        items:
> +          enum:
> +            - ingenic,xburst2-fpu2.1-mxu2.1-smt

Just: const: ingenic,xburst2-fpu2.1-mxu2.1-smt

Continuing to append CPU features isn't going to scale well. Does 
'xburst2' imply certain features? If so, not really any need to have 
them be explicit.

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - device_type
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    cpus {
> +    	#address-cells = <1>;
> +    	#size-cells = <0>;
> +
> +    	cpu0: cpu@0 {
> +    		device_type = "cpu";
> +    		compatible = "ingenic,xburst-fpu1.0-mxu1.1";
> +    		reg = <0>;
> +    	};
> +
> +    	cpu1: cpu@1 {
> +    		device_type = "cpu";
> +    		compatible = "ingenic,xburst-fpu1.0-mxu1.1";
> +    		reg = <1>;
> +    	};
> +    };
> +...
> -- 
> 2.7.4
> 
