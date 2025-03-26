Return-Path: <linux-mips+bounces-8366-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8C2A711FF
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 09:05:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0689173C64
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 08:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3BA119F10A;
	Wed, 26 Mar 2025 08:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8hle48v"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B577D1885B4;
	Wed, 26 Mar 2025 08:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742976342; cv=none; b=ZNuk2/VVlclDF7BN9X4NUZeQxGDpaWZvDZQrbSc5iMS60u8N6koGRJUin5LY5rk8CBRiy4/DXWjXkN2hEAHV1cB1VOGRz2vvvm9DmMsycK25PFU974wvJw94N/5ZT6waDtIZDTkjjtOxTPyAYWq3ZvSFJ8OUhOVNhoD62pTUg7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742976342; c=relaxed/simple;
	bh=BbuDQ9m7pQGkk6s5okxeVhNbH74XzMaJE5uxlc+ba4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOVlsG3l7hbjWEqRVD5phFpx/FMbmvB5Vpw1saB6CcVucZauUS5G15iwrSy+Lt5boYFqOSQdn23hs0wsvTY5xJ0z3I6qMOP2N0NItyDMuxaGe+2hwJXUGs2cCKgWFVaMBeB/ZwESLUemc/Y+ROYYclkM6fJd74TLME5j19S0KsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8hle48v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0529BC4CEE2;
	Wed, 26 Mar 2025 08:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742976342;
	bh=BbuDQ9m7pQGkk6s5okxeVhNbH74XzMaJE5uxlc+ba4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L8hle48v1huyNe4zr7WHd9h8j0yGRwYryyXm7WHy8u07+eBly/G0I3fxADCwoLrgR
	 bPtdtLCW9QwLNMVRsKtOkMUdPrB4i/gYr6vkkbt16gTBbSPcH2a9CYrk1hbVesHOtZ
	 15k8oQLuXfHFo5rsaotpvmAVJN2/Lh4pbmlUe71OcnS1/V0DPHk3kCoM4DKy6nsXiI
	 4WfyF6ZGh9prI19KklAXOTXaNIQhiCSA+8wEUcapNWWBekIV6DeYDLN823uQI76YXx
	 e3VZ5ZYQjMfQSeaIdMMhZ0fjkZKhrkV6sum2msXdLtgmGz+dQUGkm3eatqeoAcvkQm
	 SSuLgz4r/vHzA==
Date: Wed, 26 Mar 2025 09:05:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	benjamin.larsson@genexis.eu
Subject: Re: [PATCH v2 06/10] dt-bindings: mips: Add EcoNet platform binding
Message-ID: <20250326-woodoo-imaginary-crow-0b5a74@krzk-bin>
References: <20250325134349.2476458-1-cjd@cjdns.fr>
 <20250325134349.2476458-7-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250325134349.2476458-7-cjd@cjdns.fr>

On Tue, Mar 25, 2025 at 01:43:45PM +0000, Caleb James DeLisle wrote:
> Document the top-level device tree binding for EcoNet MIPS-based SoCs.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../devicetree/bindings/mips/econet.yaml      | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/econet.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


