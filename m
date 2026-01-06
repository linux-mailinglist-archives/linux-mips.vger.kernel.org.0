Return-Path: <linux-mips+bounces-12767-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA03CFACCB
	for <lists+linux-mips@lfdr.de>; Tue, 06 Jan 2026 20:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED72C317D2D1
	for <lists+linux-mips@lfdr.de>; Tue,  6 Jan 2026 19:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE713570BA;
	Tue,  6 Jan 2026 19:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TENB6TSd"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0363563CE;
	Tue,  6 Jan 2026 19:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767726796; cv=none; b=XV7ihe4sye3B9MYD2+Swx/8qxvOK+/DISE9VAZNBY6Vy0N904sFSjIszj7+qrWACnLmBpXEzrIYMB+Eq0GWAcftZoFS7paE9KIxLpPrR87Yq8m4OVx67KJt5jXY1Ehfq29rK5DZF9/QSDDCqIM8QZxxHJf+/sgaqJWcpiCw5xFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767726796; c=relaxed/simple;
	bh=oRV7uASzLSPyjmehrCI9sYuS/Z1kDRwlMYPRhCxUruk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3mgBREIKNXhCoO6eagMcC25cqEIjGPFRyCRvtBY9EUBss6IAb0cNGiS9Q3YCZ/6Ju3qPmvtLdV131IzrhC/i5r34mUrJx8Bq0yyLG1QzqMWM+uPPUCRCabIumyjDfqbSugeVr70oOITxckPn8zCQmoIWtV1AKiMvq2shAdedKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TENB6TSd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AAEAC116C6;
	Tue,  6 Jan 2026 19:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767726795;
	bh=oRV7uASzLSPyjmehrCI9sYuS/Z1kDRwlMYPRhCxUruk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TENB6TSdV2ob1EN7wwsKQNES7z+6PZ0pEFi8kilXSKE7Rq0Mi5wH2OFiBN5Ky54xo
	 0gKYz52CiJXpXCvLTVdepUPyD6yTfTfrc3693c2d+5I5eYtwVGZGPYvXFE5dpVCTSR
	 t2iHTpAhicMIuOF2HJgfUxl+Ytzz4vXgIVatgy24IutE2JYUKn0Ai0FQzr0JPby9jX
	 pf/iNYGPxRU82y7Dfb+I8DNIFa6BK/oQGqyUQzQPLSXnNqT9X6eitniCnAc7CyR70O
	 D5sSovV0orE6j8ZE7QNC0i6mU4mq28Yklyx0TZ2/ZmeN+iOLmaWH0igM8/Mx0z5lB+
	 n7YPErqJu8kxg==
Date: Tue, 6 Jan 2026 13:13:14 -0600
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
Subject: Re: [PATCH v2 2/3] dt-binding: rtc: loongson: Document
 Loongson-2K0300 compatible
Message-ID: <20260106191314.GA2568583-robh@kernel.org>
References: <cover.1767663073.git.zhoubinbin@loongson.cn>
 <8876bebaf08121bb5edd2500f5289284b75df011.1767663073.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8876bebaf08121bb5edd2500f5289284b75df011.1767663073.git.zhoubinbin@loongson.cn>

On Tue, Jan 06, 2026 at 09:33:32AM +0800, Binbin Zhou wrote:
> Add "loongson,ls2k0300-rtc" dedicated compatible to represent the RTC
> interface of the Loongson-2K0300 chip.
> 
> Its hardware design is similar to that of the Loongson-1B, but it does
> not support the alarm feature.

But you are requiring the interrupt property for it? Isn't it no alarm 
feature means no interrupt?

> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  Documentation/devicetree/bindings/rtc/loongson,rtc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> index 8a2520f963d8..b62419c33fd5 100644
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
> @@ -49,6 +50,7 @@ if:
>          contains:
>            enum:
>              - loongson,ls1c-rtc
> +            - loongson,ls2k0300-rtc
>  
>  then:
>    required:
> -- 
> 2.47.3
> 

