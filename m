Return-Path: <linux-mips+bounces-13359-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AE6qIKrwp2mWlwAAu9opvQ
	(envelope-from <linux-mips+bounces-13359-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 09:43:22 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7261FCC5D
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 09:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23C9E304B03A
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2026 08:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E13391838;
	Wed,  4 Mar 2026 08:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfR5j+Gg"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E18C364EA3;
	Wed,  4 Mar 2026 08:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613576; cv=none; b=D8sqC139S3XloOJE6SNjkGC2KWjqR+64UeGe9EkRDFcMVIDAZMJZw1wFDRWmB9FOxbzgGoCposs2eJ26xMoJwM37cURaCMDRjtKkW9diezn2ZzpKMGUGy+XkOpOp+3bMnkfmp3ARh0NCrUmPMFROH1bKOiNku0LYT3wpVanC1Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613576; c=relaxed/simple;
	bh=BW1MAMlh/nk9MxeyiUabogHzZOl5p0qUa7BasAromto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cX7jRRs/KxCzPTqtQUbQn1VRASgg6FZDSMCd+awJWxvfTDd8i95HQu/CaNInZfyPHEGJ0JRZbwM3+Tw0Q+0VzJ71aKg4ssyjuyDLfwpx0xtYsmFmu0oLJ5RKG7LSHJbX2GFYZG3atwRPvK6yq2Izw8AGYwypegIFfPIx0n3sp3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfR5j+Gg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31FECC19425;
	Wed,  4 Mar 2026 08:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772613575;
	bh=BW1MAMlh/nk9MxeyiUabogHzZOl5p0qUa7BasAromto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfR5j+GgtqBCJg9fn4WlhlRXNMZoren5zEMp9IawERa7OzBlNPqY3ntehvva1btFW
	 8xsJbUsmmWUhHnyf+jBxr2ja0Z8XZPiZal3Ylk/3mOuZJejvLg3d75YRVyKtZdprcg
	 du8ajEQ+Ke7oW16KjYjfs9lxtrhRAWfHdC2W7FfL0ikdn7SSR3xv6tA9gxGOn+61Uc
	 aJoEXQO1hg25LbX54rzdUD9KMQBbAsnJUoTM2OgDHwScrid+WkGTn1iv8KsLAC7UNK
	 PXbWKWLa+44L3myxtKVDYzc3noL5tTlb/+Kj7FWnBEPU6Tksq/+2cPWi+vHz59pIZ2
	 X/LjKrskKwZJA==
Date: Wed, 4 Mar 2026 09:39:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tsbogend@alpha.franken.de, ryder.lee@mediatek.com, 
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	bhelgaas@google.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	p.zabel@pengutronix.de, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	nbd@nbd.name, ansuelsmth@gmail.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/8] dt-bindings: clock, reset: Add econet EN751221
 bindings
Message-ID: <20260304-accomplished-helpful-orca-5d6b81@quoll>
References: <20260303190948.694783-1-cjd@cjdns.fr>
 <20260303190948.694783-2-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260303190948.694783-2-cjd@cjdns.fr>
X-Rspamd-Queue-Id: DA7261FCC5D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13359-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,baylibre.com,kernel.org,alpha.franken.de,mediatek.com,google.com,linaro.org,pengutronix.de,collabora.com,nbd.name,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1fb00000:email,cjdns.fr:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:url]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 07:09:41PM +0000, Caleb James DeLisle wrote:
> Add clock and reset bindings for EN751221 as well as
> a "chip-scu" which is an additional regmap that is used
> by the clock driver as well as others. This split of the
> SCU across two register areas is the same as the Airoha
> AN758x family.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../bindings/clock/airoha,en7523-scu.yaml     | 19 ++++++-
>  .../mips/econet,en751221-chip-scu.yaml        | 41 ++++++++++++++++
>  MAINTAINERS                                   |  3 ++
>  .../dt-bindings/clock/econet,en751221-scu.h   | 15 ++++++
>  .../dt-bindings/reset/econet,en751221-scu.h   | 49 +++++++++++++++++++
>  5 files changed, 126 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml
>  create mode 100644 include/dt-bindings/clock/econet,en751221-scu.h
>  create mode 100644 include/dt-bindings/reset/econet,en751221-scu.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index a8471367175b..e60e54273393 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> @@ -32,6 +32,7 @@ properties:
>        - enum:
>            - airoha,en7523-scu
>            - airoha,en7581-scu
> +          - econet,en751221-scu
>  
>    reg:
>      items:
> @@ -67,7 +68,10 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          const: airoha,en7581-scu
> +          items:

Drop items, it's just enum

> +            - enum:
> +                - airoha,en7581-scu
> +                - econet,en751221-scu
>      then:
>        properties:
>          reg:
> @@ -98,3 +102,16 @@ examples:
>                #reset-cells = <1>;
>        };
>      };
> +
> +  - |
> +    soc {
> +      #address-cells = <1>;
> +      #size-cells = <1>;

No need for new example, especially without any differences. You already
have there two.

> +
> +      scuclk2: clock-controller@1fb00000 {
> +        compatible = "econet,en751221-scu";
> +        reg = <0x1fb00000 0x970>;
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml b/Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml
> new file mode 100644
> index 000000000000..7c7c8cf8d2a5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/econet,en751221-chip-scu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: EcoNet Chip SCU Controller for EN751221 SoC
> +
> +maintainers:
> +  - Caleb James DeLisle <cjd@cjdns.fr>
> +
> +description:
> +  The EcoNet chip-scu block provides a configuration interface for clock,
> +  io-muxing and other functionalities used by multiple controllers (e.g. clock,
> +  pinctrl, ecc) on EN751221 SoC.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: econet,en751221-chip-scu
> +      - const: syscon

And it does not fit existing syscon bindings file, because ... ?

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      syscon@1fa20000 {
> +        compatible = "econet,en751221-chip-scu", "syscon";
> +        reg = <0x1fa20000 0x388>;
> +      };
> +    };

...

> +
> +#define EN751221_MAX_CLKS	6

Drop, not a binding.

> +
> +#endif /* _DT_BINDINGS_CLOCK_ECONET_EN751221_SCU_H_ */
> diff --git a/include/dt-bindings/reset/econet,en751221-scu.h b/include/dt-bindings/reset/econet,en751221-scu.h
> new file mode 100644

Best regards,
Krzysztof


