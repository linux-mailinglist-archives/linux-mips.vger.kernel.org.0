Return-Path: <linux-mips+bounces-288-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AB07F94F2
	for <lists+linux-mips@lfdr.de>; Sun, 26 Nov 2023 19:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44D6A280F22
	for <lists+linux-mips@lfdr.de>; Sun, 26 Nov 2023 18:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314D6FBF7;
	Sun, 26 Nov 2023 18:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A649DB;
	Sun, 26 Nov 2023 10:57:17 -0800 (PST)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-586a516755aso2039694eaf.0;
        Sun, 26 Nov 2023 10:57:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701025036; x=1701629836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZ3lIuB7TROofp/XK5RdQNDCfQK42fsDiRba7dlWv/k=;
        b=SF/nibQYLKKrKhCgZsIfNi7yzbx/N3Th12nHaON9A65N9r5zwBCtqJeaMnw5Hsj37X
         mQi7T55WAkE5wGr+EH8SL/5ZpBc7j9IHcwqkad0DDrEAPUF/M8JHjiBDAAGjUd3KGk37
         8lqat6NuIBgGLwdBcyaw9oUg31q1Ht6Apb/drlmHIojlmiSVFzwXWIBQEbJ4lx7INep1
         dcHZuLYfjDvRqQkK5QAuWBN/m2+W5DumReUJr51Lac9N+TERY14V54XGvurDTb3kTh2J
         vs0eRD2J8pzQX/p+nVqSJuwMcz+1UcYw2vSi8+9D6J1xsPwPnomZ8UrQoAHux1nNqnFK
         zRGw==
X-Gm-Message-State: AOJu0Yy8ndy8zgPc5Qpn1oZqyhz7DZqawQn2147nehL8/sk9GGOjCAFZ
	kn7i5RK95x0E25SCj7kZTPRRoyytlQ==
X-Google-Smtp-Source: AGHT+IESXXGngd5rzDZYKrntqszcw4kI01HKt8M15eBOcGYLERrYrKvMVn5jnWZHZAVQh+aU5SCtPQ==
X-Received: by 2002:a05:6870:d85:b0:1ef:781a:1f2e with SMTP id mj5-20020a0568700d8500b001ef781a1f2emr4561901oab.1.1701025036682;
        Sun, 26 Nov 2023 10:57:16 -0800 (PST)
Received: from herring.priv ([2607:fb91:9e5:15e5:aee2:7746:1955:d879])
        by smtp.gmail.com with ESMTPSA id s4-20020a056808208400b003b83bb8dbcesm236011oiw.30.2023.11.26.10.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 10:57:15 -0800 (PST)
Received: (nullmailer pid 31839 invoked by uid 1000);
	Sun, 26 Nov 2023 18:57:13 -0000
Date: Sun, 26 Nov 2023 11:57:13 -0700
From: Rob Herring <robh@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: linux-mips@vger.kernel.org, Paul Burton <paulburton@kernel.org>, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Rob Herring <robh+dt@kernel.org>, =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH v2 16/21] dt-bindings: mips: Add bindings for Mobileye
 SoCs
Message-ID: <170102463021.19577.17303058490928522192.robh@kernel.org>
References: <20231123152639.561231-1-gregory.clement@bootlin.com>
 <20231123152639.561231-17-gregory.clement@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123152639.561231-17-gregory.clement@bootlin.com>


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

With the indentation fixed:

Reviewed-by: Rob Herring <robh@kernel.org>


