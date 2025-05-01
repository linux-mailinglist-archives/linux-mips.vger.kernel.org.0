Return-Path: <linux-mips+bounces-8896-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50537AA5D75
	for <lists+linux-mips@lfdr.de>; Thu,  1 May 2025 12:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B425B161763
	for <lists+linux-mips@lfdr.de>; Thu,  1 May 2025 10:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD15F2222A4;
	Thu,  1 May 2025 10:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4kbdGbb"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4C72AD32;
	Thu,  1 May 2025 10:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746097131; cv=none; b=M/W+I9ABTc9zj4ma3dcYOySb6OF6TIb9vd/sR3BkKsNx2BJ8XSRbIqvo/WSTL5s2DsYWy4qm/gKA28vBjbsiPJEUq33zXP0i10mo1tjVd/MfWyM8/n1sojxdt+KuvC1t3aXrXTE6TWZnFrCyPN+JnhyYzWwON8bolUhgIg++inM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746097131; c=relaxed/simple;
	bh=fOPI1vRY7umuBn+S/P9hMul1fSPdaHJ81MJBCEDAOto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlb5vF5JoNEVWXTR43be7Am7UAT8lXUkid5hZN3/qbAqQFJHQ4PI2z53cNuXYKPd2eMdiiXMJ8/NH4hU1WckkJxU7nVTVg+BAiQDrH8rczWyZbxLiEhYf4KATgF1jYoUTdIA0D6v/b6Sbc/qpRzTYJGiD1nSJZEMeJ9y7/d2D3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4kbdGbb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EC4C4CEE3;
	Thu,  1 May 2025 10:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746097131;
	bh=fOPI1vRY7umuBn+S/P9hMul1fSPdaHJ81MJBCEDAOto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G4kbdGbb5Ttos7413Y9NRKDgW9LAD6g3OLKHMJHzdqOkufj89zfhI1K/vK872+YWD
	 Ji3r3IcpHV1lO8l3J9Dc2Lf+aTaW2OFrSj1/KLtwkMY4LzriyrZpcF2k6aGfLgoeDo
	 LVKR5uO8px3oWIpV9WZBwq+SaROVF7vvilxAXMDG7W2Gs+nDl0G1WbDfhqGA2tB2Uw
	 dCJxhavYP92r0DTN9IAV3tAwyP9ii3arplTRgX02vriYnpVg5bSK2ABmigqie0RvVx
	 Mzs3AmGVr/3Ko65RKjUtQgV/p/aplBuDvIz5dx2O6O/4dOGN+LwylQ+71GFQV7tWz5
	 UKdNw5fBPxSNg==
Date: Thu, 1 May 2025 12:58:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, tsbogend@alpha.franken.de, 
	daniel.lezcano@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 1/7] dt-bindings: timer: Add EcoNet EN751221 "HPT" CPU
 Timer
Message-ID: <20250501-ludicrous-idealistic-camel-7bf8aa@kuoka>
References: <20250430133433.22222-1-cjd@cjdns.fr>
 <20250430133433.22222-2-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250430133433.22222-2-cjd@cjdns.fr>

On Wed, Apr 30, 2025 at 01:34:27PM GMT, Caleb James DeLisle wrote:
> Add device tree bindings for the so-called high-precision timer (HPT)
> in the EcoNet EN751221 SoC.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../bindings/timer/econet,en751221-timer.yaml | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> 

What changed? Nothing explains dropping the tag.

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


