Return-Path: <linux-mips+bounces-294-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C001B7FA8FC
	for <lists+linux-mips@lfdr.de>; Mon, 27 Nov 2023 19:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 523FAB20F81
	for <lists+linux-mips@lfdr.de>; Mon, 27 Nov 2023 18:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438193DB8E;
	Mon, 27 Nov 2023 18:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB321B5;
	Mon, 27 Nov 2023 10:28:38 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6ce327458a6so2093604a34.1;
        Mon, 27 Nov 2023 10:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701109718; x=1701714518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lHbAwOVAGp3Jtbt+Xomb+VJp96WXonwddtbec/v2sQ=;
        b=jHdoecg0TSTbyYiCKyb27r7/k6gO4GlUfzlZNmAw0WRGC4LYEciH0JAaz0wo04VPKR
         HmQwMp4U/+hb/R8oXBkhC983zl4HFZRpaYtaIFwFFu4bg+cc/pEfyJHI2tEjp6XHSoyn
         6nDCT8o2KbWMhx+uGLViiJVn1Geu+Mcg1Ce+CqODWfTZXYhHcyXkB9Et0H0DUjOV/wNf
         iuzvCLA5+AcFxmsjRH5TL+B4HbmmSozS6f2dKoSjWmkB0TaJIdaTGmqukprrjPBF2btf
         VZrFwXsFtgbbF3f2w+sS9ZP9KxiH/Qp3xxDSKkVIeUMs5S2SZ3M/GPTTAMDyU2ma6lOS
         KryA==
X-Gm-Message-State: AOJu0YyFHdohBzhXWcfYxXGlNldK9VnhBSbkP8QEVWYYCLY8LExj5+4y
	ScKZHDpgTM7NsZeH5rzfQ6SjxFVvZA==
X-Google-Smtp-Source: AGHT+IH1ioL910ojCs2BJrotcJC6TMmff95P6LzxSW4hHnZG0BZEJks3qA0x9adGeBvdttiowYqtdQ==
X-Received: by 2002:a05:6830:44a9:b0:6d8:1bf7:df43 with SMTP id r41-20020a05683044a900b006d81bf7df43mr4088750otv.14.1701109718072;
        Mon, 27 Nov 2023 10:28:38 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r8-20020a056830448800b006d3127234d7sm1400352otv.8.2023.11.27.10.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 10:28:37 -0800 (PST)
Received: (nullmailer pid 2171552 invoked by uid 1000);
	Mon, 27 Nov 2023 18:28:36 -0000
Date: Mon, 27 Nov 2023 12:28:36 -0600
From: Rob Herring <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, lvjianmin@loongson.cn, WANG Xuerui <git@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: interrupt-controller:
 loongson,liointc: Standardize the naming of 'loongson,parent-int-map'
Message-ID: <20231127182836.GA2150516-robh@kernel.org>
References: <cover.1700449792.git.zhoubinbin@loongson.cn>
 <cae772aa897f6b10c3f5c4c93a256b50c5de4b21.1700449792.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cae772aa897f6b10c3f5c4c93a256b50c5de4b21.1700449792.git.zhoubinbin@loongson.cn>

On Mon, Nov 20, 2023 at 05:06:23PM +0800, Binbin Zhou wrote:
> Since the 'loongson,parent_int_map' attribute naming is non-standard, we
> should use 'loongson,parent-int-map' instead.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../bindings/interrupt-controller/loongson,liointc.yaml   | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> index 00b570c82903..70c125bf8095 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> @@ -54,7 +54,7 @@ properties:
>    '#interrupt-cells':
>      const: 2
>  
> -  loongson,parent_int_map:
> +  loongson,parent-int-map:

Not what I said to do. Now you just break the ABI instead of maintaining 
both names.

Just use loongson,parent_int_map *forever*. Drop this patch.

Rob

