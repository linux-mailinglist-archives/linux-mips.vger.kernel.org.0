Return-Path: <linux-mips+bounces-87-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 696C87EE614
	for <lists+linux-mips@lfdr.de>; Thu, 16 Nov 2023 18:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A003B20B2F
	for <lists+linux-mips@lfdr.de>; Thu, 16 Nov 2023 17:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028A2446DF;
	Thu, 16 Nov 2023 17:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DCF91A8;
	Thu, 16 Nov 2023 09:41:30 -0800 (PST)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3b3ec45d6e9so682696b6e.0;
        Thu, 16 Nov 2023 09:41:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700156489; x=1700761289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABfkYaj47jaES+mQXWgRNK27QJ0O5U/rrf/a7dbWEMg=;
        b=ZkDTnOx6JgTZaXP3xOxUb2OfEER7S6JN2+9XZ7vz/eiJMNoF245sTXFr6UdYeo5y2q
         VSqKHFoWJQAdNl9AyhIkdeAKC7B8d4D+Xp9cSxkbl53TTigECc/4YQHMtodAKU0pdL1S
         BkH7IbWmeyoUlqHWbr+eDkik+ts/Yy18Fr2C4yjny/VooNos3ZFgzY9/rG7GQmAYwYHx
         CuSP6vfYvP2jLB4i85VI+WgoX9oIJpJ6rU8pJ/W+IBV/i7pbl/fUqlhH7h6gRhzq4fmO
         3rOItHR9G6JsOqCTb+SBrGs4cZ148s11IE0hoO9EOFriLxNcpHJ6RdH4E4/79gMAuctO
         h+1g==
X-Gm-Message-State: AOJu0YzhL7by0q0ZG5rbm5OVkF4VkouNFWK1Dc27zJTLOfRLnRdIWm1M
	8UZKHua2wUqNhqIgKEzGVA==
X-Google-Smtp-Source: AGHT+IE6t3oIR0pf1vfQIwTEe5MVblRWpnxB1ypu8pSSJiWzA0ah9nyrvXeg+GJHD3IVeuYLd+lTLg==
X-Received: by 2002:aca:f03:0:b0:3b2:f27a:8a52 with SMTP id 3-20020aca0f03000000b003b2f27a8a52mr17997456oip.41.1700156489652;
        Thu, 16 Nov 2023 09:41:29 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v19-20020a544493000000b003b2e536a96dsm1899274oiv.24.2023.11.16.09.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 09:41:29 -0800 (PST)
Received: (nullmailer pid 2522272 invoked by uid 1000);
	Thu, 16 Nov 2023 17:41:27 -0000
Date: Thu, 16 Nov 2023 11:41:27 -0600
From: Rob Herring <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: WANG Xuerui <git@xen0n.name>, Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org, lvjianmin@loongson.cn, Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, loongson-kernel@lists.loongnix.cn, Huacai Chen <chenhuacai@loongson.cn>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Binbin Zhou <zhoubb.aaron@gmail.com>, devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 3/5] dt-bindings: interrupt-controller:
 loongson,liointc: Fix dtbs_check warning for interrupt-names
Message-ID: <170015648721.2522214.13442341316883618917.robh@kernel.org>
References: <cover.1699521866.git.zhoubinbin@loongson.cn>
 <a162081f9b707580700a2b10719300511c6e6baf.1699521866.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a162081f9b707580700a2b10719300511c6e6baf.1699521866.git.zhoubinbin@loongson.cn>


On Mon, 13 Nov 2023 10:36:45 +0800, Binbin Zhou wrote:
> The Loongson-2K0500/2K1000 CPUs have 64 interrupt sources as inputs, and
> a route-mapped node handles up to 32 interrupt sources, so two liointc
> nodes are defined in dts{i}.
> 
> Of course, we have to make sure that the routing outputs ("intx") of the
> two nodes do not conflict, i.e. "int0" can only be used as a routing
> output for one of them. Therefore, "interrupt-names" should be defined
> as "pattern".
> 
> In addition, since "interrupt-names" and "interrupts" are one-to-one
> correspondence, we pass it to get the corresponding interrupt number in
> the driver. Setting it to "required" does not break ABI, because it
> is already logically represented as "required".
> 
> This fixes dtbs_check warning:
> 
> DTC_CHK arch/loongarch/boot/dts/loongson-2k0500-ref.dtb
> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1fe11440: interrupt-names:0: 'int0' was expected
>         From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: interrupt-controller@1fe11440: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
>         From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> DTC_CHK arch/loongarch/boot/dts/loongson-2k1000-ref.dtb
> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: interrupt-controller@1fe01440: interrupt-names:0: 'int0' was expected
>         From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: interrupt-controller@1fe01440: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
>         From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> 
> Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../bindings/interrupt-controller/loongson,liointc.yaml    | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


