Return-Path: <linux-mips+bounces-12697-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E1ECEE640
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 12:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C8953005BB6
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 11:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F652F5308;
	Fri,  2 Jan 2026 11:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2c0+Fbj"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243562E091D;
	Fri,  2 Jan 2026 11:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767353998; cv=none; b=uC3KWPNHclZa+mDfeUZlcsvmKzJId/2WCzOnn+rT336pxBBaluEtl8oTtIIqbOMnQvFKDHOjPD7LTCLsC7WOf7vZGvRlvfNKXyDztZHqtthPzbcvrSCCXS1TFMFo58P57rLU4rLUuv/wSxmF48Dp96RC/3xm+xhbUeyZjmO0+T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767353998; c=relaxed/simple;
	bh=RIuKksoiIttHYtaOPePhnyywTncoVbvOBkuFklXk5u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIlZ0HzCCpY5nvhIuUPOau5Hg2Yk+XLH6HAjyYZNvDtakvVuaQeATEPPRHkmLM1C+6XQFQiMkxGk0H54bcdcNvE8K/d1zIv8MlywWtP4vKJu1IV69NX67w0a2Vt1aITO1vnkCx+a5Z9eX+0b9oHQ5PCYz6mMyp3Y6NszrK9TThU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2c0+Fbj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0B8C116B1;
	Fri,  2 Jan 2026 11:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767353997;
	bh=RIuKksoiIttHYtaOPePhnyywTncoVbvOBkuFklXk5u4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R2c0+FbjKVU34koV/+tCZSlHrjdvF+OnIeYXbFtqYUNMDfv6alETUBifxxduDWn8s
	 foAxCji/VgTMwIrmlWMesT8JsYZSW8WSxd1oa71DhK0bKJBgvbdw4PQ/PaeEqKyD7H
	 ssnxdu6afTTlGoVR51KE+NAeNYTSVw2fHBZ5DxEeQquM50J1e8AdIIoE7TLE6Dzgae
	 FCqw/AIMYBv4XyjARsTo+jkubBRvKk9Xmteb27tNDfgHUTCqZGYt3bqc2aYr8o6HRX
	 L/g2beYTzb7YvhFmfFK38TQJxPjppDydj+t/IiB8a6zhxc6ael8UFr5mNNfbBCrGPs
	 sekt34Ht9Cs4A==
Date: Fri, 2 Jan 2026 12:39:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: ansuelsmth@gmail.com, herbert@gondor.apana.org.au, davem@davemloft.net, 
	chester.a.unal@arinc9.com, sergio.paracuellos@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	tsbogend@alpha.franken.de, angelogioacchino.delregno@collabora.com, 
	linux-crypto@vger.kernel.org, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: crypto: Add support for Mediatek
 MT7621 SoC
Message-ID: <20260102-prudent-woodlouse-from-saturn-56634f@quoll>
References: <20260101172052.1862252-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260101172052.1862252-1-olek2@wp.pl>

On Thu, Jan 01, 2026 at 06:20:04PM +0100, Aleksander Jan Bajkowski wrote:
> Add compatible for Mediatek MT7621 SoC. The implementation is exactly the
> same os in the Airoha SoC.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
> v2:
>  - Corrected commit description
> ---
>  .../bindings/crypto/inside-secure,safexcel-eip93.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
> index 997bf9717f9e..8ccff64f5c1c 100644
> --- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
> +++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
> @@ -33,6 +33,9 @@ properties:
>        - items:
>            - const: airoha,en7581-eip93
>            - const: inside-secure,safexcel-eip93ies
> +      - items:
> +          - const: mediatek,mt7621-eip93

Why this is not part of enum with other entry using the same fallback?

Best regards,
Krzysztof


