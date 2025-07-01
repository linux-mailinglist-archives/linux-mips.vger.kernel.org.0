Return-Path: <linux-mips+bounces-9584-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E0BAEF0BD
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 10:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C92141BC50FA
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 08:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8859C264625;
	Tue,  1 Jul 2025 08:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o2ZS5y16"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D3A4A0C;
	Tue,  1 Jul 2025 08:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751357896; cv=none; b=AMz+zjSGjxzAywUdvatbdIDhd+4dUQgOJC26tjzD7Gm35vgv1V45V5Ow/V7b+6I4U1EbzcjOqAS4J0fJJNe2xN7GPYmsyS0b50bQhojz+WRE4SQxT74do9C8IHdpdI7a41fkdjxI0LZxH3OPKhYSHZffFjOe/hH8cUH5rSdwfIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751357896; c=relaxed/simple;
	bh=JawAbuKcYWoYST8hWbMbcg8n7XTzLeaxNe5wApabh/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmmvjkUtQVLGQMVAluOT3CvdqOxRIChJ4jNkVfGtZPekDpGerReoHYK5EsN17l2ACmJChC1HcT05bA0IbNn8IZaB+HtT1f9x6PBL+5GMkQnO5S08qD6iDNnXNJAuzsuJDWnpAGGo601Bg5PHpI42+bTFaBR6qQCuHNmBLNV8VCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o2ZS5y16; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BBFC4CEEB;
	Tue,  1 Jul 2025 08:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751357895;
	bh=JawAbuKcYWoYST8hWbMbcg8n7XTzLeaxNe5wApabh/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o2ZS5y16YEMWNAlU4163CjQiZrBNWx6Zza7l5DkjrQ4AW7eYVsTzHSRr5w2TO3vkC
	 x+AzNqw8iQc1Dp0NePGjQzi0yiQODrW6hRIeEYJWOZAq8Jn1rRGuh+5sNmumc7MRPP
	 7TQZvYsYu0650q71rjAFkiUz5JqB906jTLfqSKWrqCJvRedzvbTQRgthFd/jKQ7vWm
	 3bnC7HYVeMJrnX7MvT2/ij73m1xwDjwz5w45/DcRX+Dm7X3d6xEBuHHLWc5e5sjX8o
	 nCNmqyydP90bH0p6cpBUSu87GBHc6/Ni++naIpR//Nkj/UyPzyfwxDisjjx8LDQZql
	 zAqOlPUMGrz8w==
Date: Tue, 1 Jul 2025 10:18:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Samuel Holland <samuel.holland@sifive.com>, Richard Cochran <richardcochran@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Cyrille Pitchen <cyrille.pitchen@atmel.com>, Harini Katakam <harini.katakam@xilinx.com>, 
	Rafal Ozieblo <rafalo@cadence.com>, Haavard Skinnemoen <hskinnemoen@atmel.com>, 
	Jeff Garzik <jeff@garzik.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH net-next v2 02/18] dt-bindings: net: cdns,macb: add
 Mobileye EyeQ5 ethernet interface
Message-ID: <20250701-hulking-idealistic-adder-80ae8f@krzk-bin>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-2-ff8207d0bb77@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250627-macb-v2-2-ff8207d0bb77@bootlin.com>

On Fri, Jun 27, 2025 at 11:08:48AM +0200, Th=C3=A9o Lebrun wrote:
> Add cdns,eyeq5-gem as compatible for the integrated GEM block inside
> Mobileye EyeQ5 SoCs. Add a phandle (and two offset arguments) for
> accessing syscon registers.
>=20
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---
>  .../devicetree/bindings/net/cdns,macb.yaml         | 24 ++++++++++++++++=
++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Docum=
entation/devicetree/bindings/net/cdns,macb.yaml
> index df883354c7e635099885da42e4604e1c31b05c72..6cf43cc50377f23d60ef40bf1=
c8efa22ce1ae0bb 100644
> --- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
> +++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
> @@ -57,6 +57,7 @@ properties:
>            - cdns,np4-macb             # NP4 SoC devices
>            - microchip,sama7g5-emac    # Microchip SAMA7G5 ethernet inter=
face
>            - microchip,sama7g5-gem     # Microchip SAMA7G5 gigabit ethern=
et interface
> +          - mobileye,eyeq5-gem        # Mobileye EyeQ5 SoCs
>            - sifive,fu540-c000-gem     # SiFive FU540-C000 SoC
> =20
>        - items:
> @@ -137,6 +138,17 @@ properties:
>        Node containing PHY children. If this node is not present, then PH=
Ys will
>        be direct children.
> =20
> +  mobileye,olb:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Handle to the OLB system controller that owns registers configurin=
g the
> +      MACB integration.

=2E.. to do what?

Maybe you just miss some sort of phy or power domain provider. Syscon is
not a replacement for that.

Best regards,
Krzysztof


