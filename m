Return-Path: <linux-mips+bounces-243-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1737F6490
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 17:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88F23281967
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 16:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C533E480;
	Thu, 23 Nov 2023 16:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9802A2686;
	Thu, 23 Nov 2023 08:57:36 -0800 (PST)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-357cf6725acso3657235ab.3;
        Thu, 23 Nov 2023 08:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700758655; x=1701363455;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FZ8qb96leYWBeEYNvRPViCNjrrMGYEq8mNITgSdMLdo=;
        b=KjTYu/iuVP3SmGpgu9IOIj2SUwZOo5OvJ8mtYKReLE11Q9hsBbvNSWE/bPsq2vCKXD
         KcLdfOmiiZHj8zsBNTqvTXM4y5Yv9/v2ugmgyP9x8ZtzzSL4FoITqhH2Gn7hZKlfBayl
         tgfZOXuPN276xR7zsa5G0Ub7NUzElQZ5a1dtYlMPpXipX6HjWXNX8ZB8PhSpjiCGjwzC
         sZqpljxOdR/UddQDzmUTyp+kZLD9Y1aYppZhTZvHsL7W93Vxps8Vszvg6FT7hl9EhOrv
         uyA7NZoTe0hCErJkAa1wT2AsqaNYp0165WIjklCHcSq2j4XYiXUhlnh8/vhGH64gzJuU
         eTgg==
X-Gm-Message-State: AOJu0YzmSyDmePNbKmWYv2IC1lX0s7Be/SZ1tt20AKjOkEQMAxQoMSxx
	OIviTbJwuWzb7kAPJD7bKslrHw4T3A==
X-Google-Smtp-Source: AGHT+IFzxECFsSo4GLPifEzAf79kWk0gRbrpLrp6x1m2AzG0ellQW7WIhAWTQdJvEqembwRWXneZtQ==
X-Received: by 2002:a05:6e02:b42:b0:34f:70ec:d4cf with SMTP id f2-20020a056e020b4200b0034f70ecd4cfmr267367ilu.8.1700758655486;
        Thu, 23 Nov 2023 08:57:35 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id b17-20020a92c851000000b0035b0b56e0e1sm474965ilq.53.2023.11.23.08.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 08:57:34 -0800 (PST)
Received: (nullmailer pid 1620054 invoked by uid 1000);
	Thu, 23 Nov 2023 16:57:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Paul Burton <paulburton@kernel.org>, =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20231123152639.561231-17-gregory.clement@bootlin.com>
References: <20231123152639.561231-1-gregory.clement@bootlin.com>
 <20231123152639.561231-17-gregory.clement@bootlin.com>
Message-Id: <170075865279.1620038.1272295223287776285.robh@kernel.org>
Subject: Re: [PATCH v2 16/21] dt-bindings: mips: Add bindings for Mobileye
 SoCs
Date: Thu, 23 Nov 2023 09:57:32 -0700


On Thu, 23 Nov 2023 16:26:33 +0100, Gregory CLEMENT wrote:
> Add the yaml bindings for Mobileye SoCs. Currently only EyeQ5 is
> supported
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  .../devicetree/bindings/mips/mobileye.yaml    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/mobileye.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/mips/mobileye.yaml:16:5: [warning] wrong indentation: expected 2 but found 4 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231123152639.561231-17-gregory.clement@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


