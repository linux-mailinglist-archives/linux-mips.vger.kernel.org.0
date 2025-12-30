Return-Path: <linux-mips+bounces-12646-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B55FCE8872
	for <lists+linux-mips@lfdr.de>; Tue, 30 Dec 2025 03:15:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C75F3010ABD
	for <lists+linux-mips@lfdr.de>; Tue, 30 Dec 2025 02:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A394715667D;
	Tue, 30 Dec 2025 02:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B02oGBSU"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7310214A91;
	Tue, 30 Dec 2025 02:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767060918; cv=none; b=dv9mQx9S5Ohv5bwLsTBSvQT4PrIIuAgHQqnj3V3ouQVtC3tZ1NjadUcjFQNruFXG2Mys3BR02iiJqkFWcPt7G383kUigsoGfP4c/3M5QuP7C8Pm1BqlBWIS1OtJLGA64fr/gvPJW6TbLYGp/A/SSN5KV+qhuAyQuhHKZWCFbfgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767060918; c=relaxed/simple;
	bh=JNI2MePbdP6GtqWxz2KZDYZy4d6p+uLEaKHWa2PVAk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnvC13zlC8io8Bpj9NfDemQCTDcyarqtlKrbjyDTbPX9+SD1lo/wC2VkvsXuSupExPo2F5iR24A2d85ZYz+rCS/uc4y7Gr0MMyLbkfAKMGSmBKeM6i3fREJ0WMUeXM5/1iGB8amwzRkoyRzV9cgG4n+SZtBilTe8MrY2PMoXMiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B02oGBSU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26CE2C4CEF7;
	Tue, 30 Dec 2025 02:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767060918;
	bh=JNI2MePbdP6GtqWxz2KZDYZy4d6p+uLEaKHWa2PVAk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B02oGBSUFIwiAvUHf/5DPdfucPQbVJ0Ae/sGH95x4oPClU/kZJY1d6C74HG50IZTl
	 SMxMCKy3KL/yoHDedqhB7cMbGV8CoKx8vzGCc5V74Wt4K9+iH5qHct8vWguxsM6KeB
	 ENMCxLVs9vpFsWEnc2ssvFolmM7Hv7cjPUSiGCirgWQ08r+NNC4FEH9gAP7TNyGgf9
	 THAdhPAlgCCII/lefgdgP5J85fMg6NMvX56XcrT3rKlfI+6TBqSf534g04p4Cq5zg/
	 Kr397PNBx+tdgNvMRRleR+DNHzNbF4P7TBNT8XQKeMhud8EfIRwonJH0VLbkA6Vv3V
	 IFGlFU2oEFuYw==
Date: Mon, 29 Dec 2025 20:15:17 -0600
From: Rob Herring <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Xiaochuang Mao <maoxiaochuan@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH v1 1/2] dt-binding: rtc: loongson: Document
 Loongson-2K0300 compatible
Message-ID: <20251230021517.GA3156793-robh@kernel.org>
References: <cover.1766471839.git.zhoubinbin@loongson.cn>
 <36544ba0d847bca639632ea0c74907de90975f80.1766471839.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36544ba0d847bca639632ea0c74907de90975f80.1766471839.git.zhoubinbin@loongson.cn>

On Tue, Dec 23, 2025 at 02:42:12PM +0800, Binbin Zhou wrote:
> Add "loongson,ls2k0300-rtc" dedicated compatible to represent the RTC
> interface of the Loongson-2K0300 chip.
> 
> Its hardware design is similar to that of the Loongson-1B, but it does
> not support the alarm feature.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../devicetree/bindings/rtc/loongson,rtc.yaml       | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> index f89c1f660aee..aac91c79ffdb 100644
> --- a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> @@ -23,6 +23,7 @@ properties:
>            - loongson,ls1b-rtc
>            - loongson,ls1c-rtc
>            - loongson,ls7a-rtc
> +          - loongson,ls2k0300-rtc
>            - loongson,ls2k1000-rtc
>        - items:
>            - enum:
> @@ -42,6 +43,18 @@ required:
>  
>  unevaluatedProperties: false
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - loongson,ls1c-rtc

This seems unrelated?

> +          - loongson,ls2k0300-rtc
> +
> +then:
> +  properties:
> +    interrupts: false
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
> -- 
> 2.47.3
> 

