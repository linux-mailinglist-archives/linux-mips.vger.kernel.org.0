Return-Path: <linux-mips+bounces-9495-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6B5AE7854
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 09:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 242B36A1975
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 07:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4BF1FF1C8;
	Wed, 25 Jun 2025 07:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ou+qBlTJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073181FE444;
	Wed, 25 Jun 2025 07:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750835639; cv=none; b=ixN7/+7/yaL2dA1t7gkDcVF+97BY+rR5wJjtnDtU0hWmuswHMLLzqMoODFv2RtuUQGYNJPyvoA4KIZr/NMz4hyB4PV2bAGa6KgWUz3fyOiCd/yIipcQVGx4uVohwYaLbcA5s1ao1arHmw+GTo6FYblJkatT8ZB9ZDg1j8LQQxqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750835639; c=relaxed/simple;
	bh=ioDOykbRAIMsPtUk0yYrd7nhSgTj1xSX+9JWbbQY5nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cc6uL0wPUVgrFswHb5ayG6yaV1oeR9xD47fFDBypBHKmy+XQr6BVmmO1hJYNZK14fGyZOJZf/o7IaoHhR+iwLx1cii1Ocd8AZLP5PX915682eZwoRfivmuuN3+XUx1vVw0emv6kuApVXuSqc4O57Cj1l01Ov+DkL+Tw0agU/IG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ou+qBlTJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37CCC4CEEA;
	Wed, 25 Jun 2025 07:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835638;
	bh=ioDOykbRAIMsPtUk0yYrd7nhSgTj1xSX+9JWbbQY5nc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ou+qBlTJhEBWipC6ErQ+Vl1iIeTv+Gr03SyqGZpyQ2ekgC6W9m7s99AbODNOQ6pL2
	 EfbgprhAGpASlBZtcWq3eorlHGTHgmT7SWKIxTiL9MhuNyCnCNU9kqz2okCR0VAhZU
	 83ew1ppeva9Hhf+PWUc+f/y6M0xdZJ+irAOSvOTCb/R6d3ZJ8v7dIP+GpDHesUk8UP
	 GAaPKU/4+I8BeaO8jJpCkP5JPXPTc20biudlQjAZD8Dh/p3w/aA1z7bftVGivlK2rA
	 I/160JSHqFszNYfG+iSN1yx+M+wSLrVFU7nCRXYbMMZtxTFN9PY7TV44dw8NfIFHxt
	 od4B6CPVE3GZQ==
Date: Wed, 25 Jun 2025 09:13:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ezra Buehler <ezra@easyb.ch>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Reto Schneider <reto.schneider@husqvarnagroup.com>, 
	Rob Herring <robh@kernel.org>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
	Stefan Roese <sr@denx.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: mediatek,mtmips-sysc: Adapt
 compatible for MT7688 boards
Message-ID: <xzffmdojbio6rgo6a4vhaeuygg7b63lcvx55xs44mkt265d4c2@onnefkldwatt>
References: <20250624115810.37851-1-ezra@easyb.ch>
 <20250624115810.37851-2-ezra@easyb.ch>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250624115810.37851-2-ezra@easyb.ch>

On Tue, Jun 24, 2025 at 01:58:07PM +0200, Ezra Buehler wrote:
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
>  .../bindings/clock/mediatek,mtmips-sysc.yaml  | 28 +++++++++++--------
>  1 file changed, 16 insertions(+), 12 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


