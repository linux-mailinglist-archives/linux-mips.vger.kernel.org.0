Return-Path: <linux-mips+bounces-12713-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E018CEF148
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 18:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65C4F3012DCE
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 17:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE0E2EBBB0;
	Fri,  2 Jan 2026 17:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DB+6042d"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92D72222C4;
	Fri,  2 Jan 2026 17:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767375510; cv=none; b=XNJ2usr09R6LdrN4Knb+JsBtcW6gDfPSR+8zVylxA9rvQ/QrjmO2IcEyR353+ELdOKXZkziek1Bb2KrM18r7v5/CANxK1tdy+Hyr8lld5WnAFmeNi/xlAUEV2iQ5i/Rs+fllI2C9U+oZMLUeEMXg1kGLO6fJegekos730anCPVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767375510; c=relaxed/simple;
	bh=QcknUrYBl8gCUaV1a78vCxQD5n24yW7uv7ymg3UZsKQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=gkBLI6Q0MmIjEKTpVx6bP8h7LOFQ2u4lj5bacvlnvn/xN0xO+Qb1ULykAy7LCttJiz/HapMZbxrspZdVS/qkRzNhCc3sWoPs4++dQjrGVtG0eVqp8i0pApxS/HQmZBygYok215tM636LV55s06wQohg5+FiiTIXaPHnWpQL0oWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DB+6042d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC47C116B1;
	Fri,  2 Jan 2026 17:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767375510;
	bh=QcknUrYBl8gCUaV1a78vCxQD5n24yW7uv7ymg3UZsKQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DB+6042dL0G5ELqyiLR7WjVeG/WEjV3ACWHki7Qc7OmIbo01rSw8/bZk/kVcuej3P
	 B7JwNU4kORP5Lpn9QaFz/M3RoeTLQi+QiVD5xH7A9rN8JotoDRRM9GM9b1RAbhZveB
	 HAfDqvy8V2Zl54xRbkgrrGNV/cadxQwFO6ZDiztHOZfStVkyH0RM/woaGXVc4ocQyv
	 pbLEVDp1x+X/iJiP85H+pFu3sfmPMrd1N6x36g7LKcLO0rhP7nxlXw8nkW855sxCif
	 AzkKT/5CQUc3QmP4CLyppeNJqJOq22f3cPYEBqDZlGisqCA9DGSd2RE+XE3xv7fC0Y
	 NCip/kEY1GsLw==
Date: Fri, 02 Jan 2026 11:38:29 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: matthias.bgg@gmail.com, sergio.paracuellos@gmail.com, 
 tsbogend@alpha.franken.de, linux-crypto@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, ansuelsmth@gmail.com, 
 devicetree@vger.kernel.org, benjamin.larsson@genexis.eu, 
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 conor+dt@kernel.org, herbert@gondor.apana.org.au, krzk+dt@kernel.org, 
 chester.a.unal@arinc9.com, angelogioacchino.delregno@collabora.com, 
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
To: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <20260102155341.3682013-2-olek2@wp.pl>
References: <20260102155341.3682013-1-olek2@wp.pl>
 <20260102155341.3682013-2-olek2@wp.pl>
Message-Id: <176737550920.3990125.15817156622138815627.robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: crypto: eip93: add support for
 Mediatek MT7621 SoC


On Fri, 02 Jan 2026 16:47:34 +0100, Aleksander Jan Bajkowski wrote:
> Add compatible for Mediatek MT7621 SoC. The implementation is exactly the
> same os in the Airoha SoC.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
> v3:
> - Use enum
> v2:
> - Corrected commit description
> ---
>  .../bindings/crypto/inside-secure,safexcel-eip93.yaml         | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml:35:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260102155341.3682013-2-olek2@wp.pl

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


