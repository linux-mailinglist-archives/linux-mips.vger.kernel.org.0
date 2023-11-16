Return-Path: <linux-mips+bounces-85-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E12577EE60A
	for <lists+linux-mips@lfdr.de>; Thu, 16 Nov 2023 18:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88E29B20B1F
	for <lists+linux-mips@lfdr.de>; Thu, 16 Nov 2023 17:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16E3433BC;
	Thu, 16 Nov 2023 17:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35AE4A5;
	Thu, 16 Nov 2023 09:39:10 -0800 (PST)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1f573a9ed69so565425fac.1;
        Thu, 16 Nov 2023 09:39:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700156349; x=1700761149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMmODC6lTYe45jRABBx+ZhN5Tb2w0g+Vh3f3SnI6Fz8=;
        b=S6M7XHh5H0iYJJkz0Tu/Gxaf1EbneK7LYXsbldTDPqfmdtPbzMbq01OomYK7wmxncu
         zvzGiHpaVIg+TE8rxigw9GjGN+aDXcpfo3gMPBypyrSm4R8rb5Yd7II06crazo2UqEZ9
         X7woTn/5sRzdHd4RV50dxMf9UT9+hth2iNv1/LTKdQc9am8KKd1Z5mkqQY060X2pwbkK
         ZFo0oGb1BtZLwq0iRJ9FmMmJ9Xj6kUsty62jyI9IFRL1Zaxp8Bf7syHMgcSuQMEVgpaL
         2FtuvOfhOVc7LfdyKxhIqrNVl+bQDEQXf/JVX6j3NFLQKEKm5JzvtHZmTHwPBWh0DkQ7
         +zRA==
X-Gm-Message-State: AOJu0Yx1C5HPIWiX+w3ePuRo4DUZ3KKOOjyBcz3EPhm2GAJ2R3vRUlyu
	V3Z3YKi5ZYuVs80hxBsaWg==
X-Google-Smtp-Source: AGHT+IHNw1V0lhfLKn46rO8+iH+9QbhJdtMQ+a2Jse5CJMLrhaAzrFpM8qD8OvQHrhgcPUlMiszj5A==
X-Received: by 2002:a05:6870:b251:b0:1f4:a631:f5fc with SMTP id b17-20020a056870b25100b001f4a631f5fcmr21066531oam.33.1700156349413;
        Thu, 16 Nov 2023 09:39:09 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ni47-20020a05687134af00b001efa91630f6sm2221633oac.6.2023.11.16.09.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 09:39:08 -0800 (PST)
Received: (nullmailer pid 2519555 invoked by uid 1000);
	Thu, 16 Nov 2023 17:39:07 -0000
Date: Thu, 16 Nov 2023 11:39:07 -0600
From: Rob Herring <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, lvjianmin@loongson.cn, WANG Xuerui <git@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: interrupt-controller:
 loongson,liointc: Standardize the naming of 'loongson,parent-int-map'
Message-ID: <20231116173907.GA2446677-robh@kernel.org>
References: <cover.1699521866.git.zhoubinbin@loongson.cn>
 <84cb3df17eee993fc6a10e965b3f438f9034d2de.1699521866.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84cb3df17eee993fc6a10e965b3f438f9034d2de.1699521866.git.zhoubinbin@loongson.cn>

On Mon, Nov 13, 2023 at 10:36:21AM +0800, Binbin Zhou wrote:
> Since the 'loongson,parent_int_map' attribute naming is non-standard, we
> should use 'loongson,parent-int-map' instead.
> Also, 'loongson,parent_int_map' will be marked as deprecated.

Again, as I said last time, it is not worth adding 
'loongson,parent-int-map' and having to support both forms in the kernel 
forever. If you can define a time that we keep 'loongson,parent_int_map' 
that's less than "forever", then may be it would be worth changing.

To put this another way, using '-' instead of '_' is for *new* bindings, 
not existing users.

Rob

