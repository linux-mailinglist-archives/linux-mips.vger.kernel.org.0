Return-Path: <linux-mips+bounces-8533-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DA0A838C2
	for <lists+linux-mips@lfdr.de>; Thu, 10 Apr 2025 07:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 986AC1B66BB2
	for <lists+linux-mips@lfdr.de>; Thu, 10 Apr 2025 05:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DA6201278;
	Thu, 10 Apr 2025 05:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITKeJONK"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0493A1C3BEB;
	Thu, 10 Apr 2025 05:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744264742; cv=none; b=CfeeebpdG/oO4SVcKrlIID+HpmDh0htrl98g51iKOCMyJi8aQE6TeLVYxtghF6B3Y0Bg/iCipZVXhNBrvASHPyyN58vAPALSlGm42OuvS28usA0fCK+9NSCbgbnRc8aZ/xKvBBN4WADZPfMNT/DeoVH07zfijYd04jlsSfN3n/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744264742; c=relaxed/simple;
	bh=R82zvc4UByRSYaU6yirttXWHx1OZxM0W1b4gSccb2K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uK/laiZF5c1FPHk3d2fYH3BCYie7Km4gAA+o4QZ6+d1GMEzuXHIQrAxpWXbD4weFKmRHbfRyIt2Oi/qdap4YK6olxm1FAVQmvG1xY5dbAFE4JXw9ToFIoXYjhSMgwb8STNn9tLzfX+qo9a8PPHxXqvvbcFvn6ETZdWBmWmjlBnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITKeJONK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BE9C4CEDD;
	Thu, 10 Apr 2025 05:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744264741;
	bh=R82zvc4UByRSYaU6yirttXWHx1OZxM0W1b4gSccb2K4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ITKeJONKRdNaKQB6Uid4gIvO4M4EnSlwh7V6RNH9MquMFXzpOSnTTnbqSsBclc7D/
	 IYMH7Tynx+X/Hgu8TkAkLEYuv0H5qSZQA+7BWncVo+Knb91kAXFxIMiHIzqBVr8FGB
	 FCYcUqICQfogpq7xfHIYATgEOua7VhomZ5YnukwSEOLDiPEWG1ZPQllG6FFqeB/8cu
	 wR7ji/Y8ePNDa+OK9jTHMzNSSXrOqXnLPmhfLGzCNO058j8edct/fLOjONC8KiW7G1
	 wVXDhYDg4TUKhprJI6bLLj4zj2gtFGk+onWukFbVhYGoP7Ztarc9k7FcNM47PG7vI5
	 Qb8zd0oo2+k3Q==
Date: Thu, 10 Apr 2025 07:58:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-mips@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: dt-bindings: Add Realtek ALC203 Codec
Message-ID: <20250410-merciful-hypnotic-lorikeet-ee1e28@shite>
References: <20250409-loongson1-ac97-v2-0-65d5db96a046@gmail.com>
 <20250409-loongson1-ac97-v2-2-65d5db96a046@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250409-loongson1-ac97-v2-2-65d5db96a046@gmail.com>

On Wed, Apr 09, 2025 at 06:29:32PM GMT, Keguang Zhang wrote:
> Add devicetree binding document for Realtek ALC203 codec.
> 
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
>  .../devicetree/bindings/sound/realtek,alc203.yaml  | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


