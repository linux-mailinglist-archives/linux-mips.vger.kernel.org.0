Return-Path: <linux-mips+bounces-8288-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A935FA6C45A
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 21:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D646467CC6
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 20:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEDA4230985;
	Fri, 21 Mar 2025 20:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ImfJjb51"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BABA137C37;
	Fri, 21 Mar 2025 20:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742589469; cv=none; b=qNmRsTPzaOhBUyCdUgLWjjdMYzxcfkCWO2U1+MA1dmB8m7PWbB1HsJALfSC22gT8fmvgnQu94fz8YO0GfUTrZBpwF6ClTvwtX9AszGTOxPhATD53t/5zeH/N8EB1Et+EzU3wweikWYQnYP1gPBOVSwlkpLbOJkhgNhUBtuz/l00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742589469; c=relaxed/simple;
	bh=HO7nlKXbMubdBKs5dA8F12zWcr0vHn01ammSIHUzW1E=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=gHgrGJZ3IwGBHZbVNlkGziOeUrFEcAOKejXN2Lr+vxFrZrp6eOJ+fkNq4FfACTkYizUPjuqRYhEcUVRxLJDZbwpmselVuAXwDfChexriSgeLQi321BEuQI3Tr5VITPKsUkpDnNzs0EPqFPh02BBw02eMpTsLxccrulyOoX9NJDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ImfJjb51; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6B7C4CEE3;
	Fri, 21 Mar 2025 20:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742589468;
	bh=HO7nlKXbMubdBKs5dA8F12zWcr0vHn01ammSIHUzW1E=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ImfJjb51Y/I05j7ropG1vHwEmVkLdCHI/NDFhBHgDVkZ4Pj14dzRN/qxXjF42bUml
	 BEFmXzbwqaUdb97JSLUTfP72S1rEy7dSG4d5KLyojowobIln3NrY/gA+ANtdqBttC5
	 SWY7+IvvjgDva+PkzhY9Q4ulm3xoik68NkZuGi1Q3hrOPX9WoeyU7I1Am2j9LNQEiJ
	 vDk6sz/JoXErERhcL6NXKA6lcD9NQZj9eRn2W2neaYeEZ0Y7T0fCFaDreTlkCDNNOl
	 LcjwQ82/8oqpEN7zYt0bm7P72VQ4G+8v/tt/RtqzH77B97DzAwIJ2KzOJXoiH1pOOf
	 EIBNR+1YXHG7Q==
Date: Fri, 21 Mar 2025 15:37:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Richard Cochran <richardcochran@gmail.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org, 
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, linux-kernel@vger.kernel.org, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-mips@vger.kernel.org, 
 Albert Ou <aou@eecs.berkeley.edu>, Jakub Kicinski <kuba@kernel.org>, 
 devicetree@vger.kernel.org
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
In-Reply-To: <20250321-macb-v1-1-537b7e37971d@bootlin.com>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-1-537b7e37971d@bootlin.com>
Message-Id: <174258946794.3905655.14862807255896065162.robh@kernel.org>
Subject: Re: [PATCH net-next 01/13] dt-bindings: net: cdns,macb: add
 Mobileye EyeQ5 ethernet interface


On Fri, 21 Mar 2025 20:09:32 +0100, Théo Lebrun wrote:
> Add cdns,eyeq5-gem as compatible for the integrated GEM block inside
> Mobileye EyeQ5 SoCs. Add a phandle (and two offset arguments) for
> accessing syscon registers.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  .../devicetree/bindings/net/cdns,macb.yaml          | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/cdns,macb.yaml: properties:mobileye,olb: 'anyOf' conditional failed, one must be fixed:
	'description' is a dependency of '$ref'
	'/schemas/types.yaml#/definitions/phandle-array' does not match '^#/(definitions|\\$defs)/'
		hint: A vendor property can have a $ref to a a $defs schema
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250321-macb-v1-1-537b7e37971d@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


