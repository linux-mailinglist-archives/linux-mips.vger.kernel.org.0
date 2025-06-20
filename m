Return-Path: <linux-mips+bounces-9438-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2EFAE1522
	for <lists+linux-mips@lfdr.de>; Fri, 20 Jun 2025 09:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C65FC19E510C
	for <lists+linux-mips@lfdr.de>; Fri, 20 Jun 2025 07:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C27D22655E;
	Fri, 20 Jun 2025 07:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ein+OS6N"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3203017583;
	Fri, 20 Jun 2025 07:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750405326; cv=none; b=iSpcq0sm75NwspqPMC3o58IM9dAOn44KFVypvWYUR3WKBHl/IYM4enN2Ql9zVm7nigjUG9jtnnRb3y4wT1lZF/eHUtW9NatTnbDIv09afZbi7SWIKcIQFdYPKRjWL+z0Ut+PwPJb0K+229M9Y6sU6+0XZkH7vn0P6jBbyKBjEvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750405326; c=relaxed/simple;
	bh=XDGhdfJ2GDjIwyasCPs1pwvht9cQsGHx14Q6KUZPIow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDp5qzKEdv6sdfF48yqeFQj0XcX5h+GAxIpsOubJ8MiuSlVggQ+gOY+ctmS/ZQJ5mJArmatWbQgoRYmN8l9JKC67w/NP8By4QndS6czRyaVYNSPk26RbEWZZybKjwMkkLmNZAYW/OJUURhUnvj0Apeiv9+Frxj54X9NN7CDu1W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ein+OS6N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64726C4CEE3;
	Fri, 20 Jun 2025 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750405326;
	bh=XDGhdfJ2GDjIwyasCPs1pwvht9cQsGHx14Q6KUZPIow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ein+OS6NHeNXyFnK3gwtOW01HJGG4iJWdN3kQ+5FMkAMEs/++OwsKH4KI+sumTeAd
	 FZWsa22CZ1B0VEHncR7IPYMW6Fl+K36+jjMAWEMzlPhXWvrXyw3tGBfFVQ7qQytVd+
	 H0qP4f5fhT64fP0uGoao+nq6hY8JyDjxhdE/F12b6lAaWLuzS3f8tCOdy3IEyMFbWx
	 L88qD0Lep6SZflYgfwAhtMfzu6lpD8QQKg9+Y9Z6OnRxdRxxTrqtPk348IeKg1plM/
	 J4bwkjkcqjiWv8x8+kZDuRhIInyWvER4gjuL6egtT24G3bmq46kApagi0v5fOD/WwQ
	 ULDg12JHOjaRQ==
Date: Fri, 20 Jun 2025 09:42:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ezra Buehler <ezra@easyb.ch>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Reto Schneider <reto.schneider@husqvarnagroup.com>, 
	Rob Herring <robh@kernel.org>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
	Stefan Roese <sr@denx.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: mediatek,mtmips-sysc: Adapt
 compatible for MT7688 boards
Message-ID: <20250620-unnatural-bloodhound-of-tenacity-4133bd@kuoka>
References: <20250619203502.1293695-1-ezra@easyb.ch>
 <20250619203502.1293695-2-ezra@easyb.ch>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619203502.1293695-2-ezra@easyb.ch>

On Thu, Jun 19, 2025 at 10:34:59PM GMT, Ezra Buehler wrote:
> From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> 
> As the MT7628 and MT7688 are identical in most respects, mt7628a.dtsi is
> used for both SoCs. To prevent "Kernel panic - not syncing: unable to
> get CPU clock, err=-2" and allow an MT7688-based board to boot, the
> following must be allowed:
> 
>     compatible = "ralink,mt7628-sysc", "ralink,mt7688-sysc", "syscon";
> 
> Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> ---
>  .../bindings/clock/mediatek,mtmips-sysc.yaml  | 27 ++++++++++---------
>  1 file changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
> index 83c1803ffd16..3fabaa8acc10 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
> @@ -26,18 +26,21 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - ralink,mt7620-sysc
> -          - ralink,mt7628-sysc
> -          - ralink,mt7688-sysc

I do not understand why this is removed and commit msg explains nothing
about it. Re-add it back.

Best regards,
Krzysztof


