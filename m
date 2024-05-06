Return-Path: <linux-mips+bounces-3107-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8155B8BC828
	for <lists+linux-mips@lfdr.de>; Mon,  6 May 2024 09:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E5D11F222CF
	for <lists+linux-mips@lfdr.de>; Mon,  6 May 2024 07:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B118B5FEE5;
	Mon,  6 May 2024 07:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kUjdiYdD"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEF76D1A8;
	Mon,  6 May 2024 07:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714979690; cv=none; b=skCI98EW+9CAFlfAPPNrNTs2rzrVyCoQ8OKOt91aY3DxZzgES6OCl2fq37W74LTU9xKeIULnMeKp5NLw5d7CYTqN8o4FJduCsCzRUxGnDicQah6aNzwKEn9eB5kWj33e7DWpsLvyYWEPGlH497Mb6JNfSAjxg7mImiA6QbohSfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714979690; c=relaxed/simple;
	bh=x+K7uJjDWqJHy+R8uwFrBt04oWI3036EKVKiTN1nWl8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DAucwmYMBkn0Eh5H3JLIfIjRgF0KMemBcFfRlnLnsGCIZT5Jvj3HfDANRZZnb/14sKqHqm0tp04Bc3ts3ZrjncoF49bmkgM64F3f7qrGlLGJywoBL0sMgwEQ78bAR+4lKB8EVNJH9pzRsz2wxcdNZFi3kV5Q/ViVKkMjQMUAw7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kUjdiYdD; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FBFFC0005;
	Mon,  6 May 2024 07:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714979686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0dlMWT58sNslF6/PywFTgVb8B4K2AkFKS2JdJ04ybUM=;
	b=kUjdiYdDz9ua+bFQ4PfrO/xM0z6iIZkKKGkpQs2hkepXleMh07irjTNReu4L1Y01qdwi7s
	sJWfQ7GF2ygAMKH6ACP0GV8uAuzYBSPY5/emANHO/7VflPP8Zbi93Kfv94d+iQK3jClQ58
	d3SBob6DbjPHW2rZKnP8xL5Jv+dyMAPtJ6Bd3eE2K07EaH+L/HpCVKMidFFqxgvhJxZspe
	5a6Tn6i1+CflfPpuLt+fqHKRtimS0C+isz68VVCECZ4ZlmxFZbSjm6Q7wKugnXs7Yp0ZN5
	GbRMgfM3UIaKOGpjwGeWR6kvGGw01YBBbIT9V8ZXWhuSmRRiqDY0MasudHCoLA==
Date: Mon, 6 May 2024 09:14:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Cc: keguang.zhang@gmail.com, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <20240506091444.59228fa9@xps-13>
In-Reply-To: <20240430-loongson1-nand-v7-1-60787c314fa4@gmail.com>
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
	<20240430-loongson1-nand-v7-1-60787c314fa4@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hello,

devnull+keguang.zhang.gmail.com@kernel.org wrote on Tue, 30 Apr 2024
19:11:10 +0800:

> From: Keguang Zhang <keguang.zhang@gmail.com>
>=20
> Add devicetree binding document for Loongson-1 NAND Controller.
>=20
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
> Changes in v7:
> - rename the file to loongson,ls1b-nfc.yaml
>=20
> Changes in v6:
> - A newly added patch
> ---
>  .../devicetree/bindings/mtd/loongson,ls1b-nfc.yaml | 66 ++++++++++++++++=
++++++
>  1 file changed, 66 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml=
 b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
> new file mode 100644
> index 000000000000..a69f22b9fd9e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/loongson,ls1b-nfc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson-1 NAND Controller
> +
> +maintainers:
> +  - Keguang Zhang <keguang.zhang@gmail.com>
> +
> +allOf:
> +  - $ref: nand-controller.yaml
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: loongson,ls1b-nfc

What is the rationale behind this choice? Seems like the b variant has
two possible implementations and should always be preceded by a more
specific compatible.

As there is currently no description of this controller upstream, I
would not care too much about any out-of-tree description and directly
go for a clean description.

> +      - items:
> +          - enum:
> +              - loongson,ls1a-nfc
> +              - loongson,ls1c-nfc
> +          - const: loongson,ls1b-nfc
> +
> +  reg:
> +    maxItems: 1
> +
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    const: rxtx
> +
> +patternProperties:
> +  "^nand@[0-3]$":
> +    type: object
> +    $ref: raw-nand-chip.yaml
> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - dmas
> +  - dma-names

Should DMA props be required?

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    nand-controller@1fe78000 {
> +        compatible =3D "loongson,ls1b-nfc";
> +        reg =3D <0x1fe78000 0x40>;
> +
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        dmas =3D <&dma 0>;
> +        dma-names =3D "rxtx";

There is a preferred spacing for DT nodes, see:
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

> +
> +        nand@0 {
> +            reg =3D <0>;
> +            nand-use-soft-ecc-engine;
> +            nand-ecc-algo =3D "hamming";

These two properties are not needed. Unless there is no hardware ECC
capability on this controller and in this case you need to ensure the
properties are present in the schema.

> +        };
> +    };
>=20


Thanks,
Miqu=C3=A8l

