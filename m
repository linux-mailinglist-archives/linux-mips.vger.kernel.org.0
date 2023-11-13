Return-Path: <linux-mips+bounces-32-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F057E9ECE
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 15:33:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F8101C2090D
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 14:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7543F1DFCA;
	Mon, 13 Nov 2023 14:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7GiyytR"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5467621356;
	Mon, 13 Nov 2023 14:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD0BC433C9;
	Mon, 13 Nov 2023 14:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699886036;
	bh=6DAxemjl0AVTHxHytjTbhgq1BuBFNuktqHNcC4X2p80=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=C7GiyytRkZx3o6iKTHGPfVnDZH8Y9UlNVdS44XxBSHc9tAEarSOm06vmyYOLguL85
	 R0jo9Sb4Z3njUH2hihmk6edT4OO5HpS/h5YXkEPKIsVynj1JSQcAdn3zwLEKQzhEqn
	 DdsJQN/llK3tS0Aa0+VOpkCcneulg70FLiqWRo692XfkRD8bQpkwfQcW2XtG6FrBXZ
	 BJsuhu2xCg0FdYVMDeqE7rkfdcmEs2CCgi6PwFoCrcZyiUlLTWhb0JHoZv+Cbyu/8d
	 SQZ0FPMXbzthj1jjY0+gd71Ola8vBzQ0FbHaOWij6DNjTYihY2P2zQFKdK+/YCyqKs
	 gfWebgDXEQdzA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c50cf61f6dso62802511fa.2;
        Mon, 13 Nov 2023 06:33:56 -0800 (PST)
X-Gm-Message-State: AOJu0YwgyhC32x6inQY/TCb3M0e8sLGGUyiy/9zjdtMcHTe4CszlH1re
	oR4lUKe8PWdoZr0mNy99fjC3Jl1aHNHdny9NpDs=
X-Google-Smtp-Source: AGHT+IF8sszOmCM/pyDPh+LfBIcxgfXipt/rZt6rWmIvK+wpDukDNDxSLIyU7B+lHoQohecY7K0htUXRMO83ELauFmk=
X-Received: by 2002:a05:6512:31c8:b0:50a:71e1:e1ce with SMTP id
 j8-20020a05651231c800b0050a71e1e1cemr5323774lfe.51.1699886034965; Mon, 13 Nov
 2023 06:33:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1699521866.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1699521866.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 13 Nov 2023 22:33:43 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4pzWNJf2Bs0tHRZG=8ibm_JUvfoPQdkurEnqo=L+P1oA@mail.gmail.com>
Message-ID: <CAAhV-H4pzWNJf2Bs0tHRZG=8ibm_JUvfoPQdkurEnqo=L+P1oA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] dt-bindings: interrupt-controller: Fix some
 loongson,liointc warnings
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, devicetree@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-mips@vger.kernel.org, lvjianmin@loongson.cn, 
	WANG Xuerui <git@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For the whole series.

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Mon, Nov 13, 2023 at 10:36=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
>
> Hi all:
>
> Some liointc-related DTBS_CHECK warnings were found when trying to
> introduce the Loongson-2K DTS{I} for LoongArch.
> This patch series attempts to fix those warnings, as well as fixing
> non-standard property naming.
>
> Of course, these fixes also apply to MIPS Loongson-2K1000.
>
> Thanks.
>
> -----
> V4:
> - Add Acked-by tag;
> patch(2/5):
>   - Just add 'maxitem 2' instead of duplicating the list;
> patch(3/5):
>   - Rewite commit message for 'interrupt-names'.
>
> Link to V3:
> https://lore.kernel.org/all/cover.1698717154.git.zhoubinbin@loongson.cn/
>
> V3:
> patch(1/5):
>   - new patch, 'loongson,parent_int_map' renamed to 'loongson,parent-int-=
map';
> patch(2/5)(3/5):
>   - Separate the change points into separate patches;
> patch(4/5):
>  - new patch, make sure both parent map forms can be parsed;
> patch(5/5):
>  - new patch, fix 'loongson,parent_int_map' references in mips loongson
>    dts{i}.
>
> Link to V2:
> https://lore.kernel.org/all/20230821061315.3416836-1-zhoubinbin@loongson.=
cn/
>
> V2:
> 1. Update commit message;
> 2. "interruprt-names" should be "required", the driver gets the parent
> interrupts through it;
> 3. Add more descriptions to explain the rationale for multiple nodes;
> 4. Rewrite if-else statements.
>
> Link to V1:
> https://lore.kernel.org/all/20230815084713.1627520-1-zhoubinbin@loongson.=
cn/
>
> Binbin Zhou (5):
>   dt-bindings: interrupt-controller: loongson,liointc: Standardize the
>     naming of 'loongson,parent-int-map'
>   dt-bindings: interrupt-controller: loongson,liointc: Fix dtbs_check
>     warning for reg-names
>   dt-bindings: interrupt-controller: loongson,liointc: Fix dtbs_check
>     for warning interrupt-names
>   irqchip/loongson-liointc: Fix 'loongson,parent_int_map' parse
>   MIPS: Loongson64: DTS: Fix 'loongson,parent_int_map' references
>
>  .../loongson,liointc.yaml                     | 33 +++++++++++++------
>  .../boot/dts/loongson/loongson64-2k1000.dtsi  |  4 +--
>  .../dts/loongson/loongson64c-package.dtsi     |  2 +-
>  .../dts/loongson/loongson64g-package.dtsi     |  2 +-
>  .../dts/loongson/loongson64v_4core_virtio.dts |  2 +-
>  drivers/irqchip/irq-loongson-liointc.c        |  7 +++-
>  6 files changed, 34 insertions(+), 16 deletions(-)
>
> --
> 2.39.3
>
>

