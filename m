Return-Path: <linux-mips+bounces-9714-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF714B0018E
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jul 2025 14:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1202F588255
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jul 2025 12:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66472505CE;
	Thu, 10 Jul 2025 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsdvWBz7"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E4F24DD0E;
	Thu, 10 Jul 2025 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150133; cv=none; b=MhwyXigSU4Z0uB09o1myAxn09evtIHr7E0fNOuW4QmS7AFxNCn73ctTKHGh0aZ5fNzX+zHfN+U7WaEOiyhDoYj8I1JX4gCXQOmi3m+iQfMBrCfcCAMDDlw8JNSJdxP7yw6XhEd0qo3C4xMZ3wcISIEAWeQs3n8xTNUnG0S0Gy4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150133; c=relaxed/simple;
	bh=RL/6ANPwi6UKglQC8ac9FUIdIPVKu0PQhcdSbch3M0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dnT6TEWbvdZAquv5u9by0iR/fp20BTSLIN96vn6VE74Yej4E/91E0Mv4GLBmXNjDGfikLuqYYWnySsqk+cEWjTD/rjBppB8m/ikYjjUnoQTa8msF8uVh83UeGKl2hH7jDZPCCdQ2W8g8zE3lvDWWbpyjOO+g3K30sXykHgNRipg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsdvWBz7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2313C4CEE3;
	Thu, 10 Jul 2025 12:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752150133;
	bh=RL/6ANPwi6UKglQC8ac9FUIdIPVKu0PQhcdSbch3M0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GsdvWBz7NRomh5L0Hge7vbx59oDkEXFMinF2jkQKVcjpz8hWnX1113Wqb1+YYzIRw
	 ta6NVpy0xjgFoqC30PHbJtJJ/BMMQwwu7nsTGAJQG2Vr9RipvM7ecveWXzKDeFSqZO
	 toMQ4clkteCcTJ5bhEN++vUMy9IAcdFhvY2of+0Hkm1EOlPUceCobeF9Iamq2yOsbY
	 AxaL265yfyyqlt7Cbg7DoCXW2lqyVthOMIZ1VF0PmbKOgT1UC+w35EjOIvAmAKPUxX
	 4hRBS2HT+KHpvT9oYVro4aqaSQquif0Z8GBOwewvobea8Mp6jYNbzPtQl56yiAsx00
	 mNHicMQPMMoXA==
Date: Thu, 10 Jul 2025 14:22:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/9] dt-bindings: mips: loongson: Add CQ-T300B board
Message-ID: <20250710-wondrous-nebulous-ermine-9c3fdb@krzk-bin>
References: <20250709-loongson1-arch-v2-0-bcff6e518c09@gmail.com>
 <20250709-loongson1-arch-v2-2-bcff6e518c09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250709-loongson1-arch-v2-2-bcff6e518c09@gmail.com>

On Wed, Jul 09, 2025 at 07:05:53PM +0800, Keguang Zhang wrote:
> Document loongson,cq-t300b, a board based on Loongson-1C.
> 
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
>  Documentation/devicetree/bindings/mips/loongson/devices.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Adding these one by one is quite a churn. Just squash them.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


