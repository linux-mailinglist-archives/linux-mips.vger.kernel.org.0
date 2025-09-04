Return-Path: <linux-mips+bounces-11018-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C03E1B436F1
	for <lists+linux-mips@lfdr.de>; Thu,  4 Sep 2025 11:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63614189B070
	for <lists+linux-mips@lfdr.de>; Thu,  4 Sep 2025 09:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDF32EF64A;
	Thu,  4 Sep 2025 09:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TugX8JIo"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF49228153C;
	Thu,  4 Sep 2025 09:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756977740; cv=none; b=nqpPr2P1i4434zLaqnXaj1BwCHLRvaJ1H8KQ5jb6XAPMM+DSfTuY8Zo5fbWAJVyj/glhbPZaTiQuV4E5fS7DdEpj6iEiLVNcw3veh9dAHX2rDNbfv24moCzTe3pwuEYMsPaegOdxZ02hhh997ov+ZpNxDbEpWBRcwYRVMoB9cn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756977740; c=relaxed/simple;
	bh=ZBli1CLfk0jyZcth89W+Mzqnjou5NAQEZiszYyfsEds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RlV7oKa52raJWleHInc7MG6kz/avbutipkPYd8UISP3nasFt2o59D7iVT7hnZDMm+6tkR+c8uNKq/iJnQfS2uf7Kr7rYeP+yI/ajj3kfBUhgm4BNaBVYWFfxC0WHq81nsNti3ySlJqCtCnBaJmsUL/odmFEb7Y+70jZeAC/QCB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TugX8JIo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3879C4CEF0;
	Thu,  4 Sep 2025 09:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756977739;
	bh=ZBli1CLfk0jyZcth89W+Mzqnjou5NAQEZiszYyfsEds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TugX8JIoEQG5nJJz1HnpsOtxJQnGwTS7C+gNPcyvCpiXUo7gvxLrw59pPCKDsx4Yn
	 QfUdvuorOSkvVpORSI5BrR3cwIdq1lusBmdvT5YNRXk6jjJM9cptbCPD4ICEzcc7wE
	 OJAnFYqWi5sszXX17K/1T23buoPsLjsEckRL3jawtlG+x6TvDfb1kd/1vj3WSSVrQy
	 AZOWWvYdWFgOqIYi3jrbSK0CjLcyK4xszbozXbGzmUriG71qWWts5ce0kSRIlCVgmm
	 ozj+MaqMMipdyyGJwKXzV+vuLaK13tXuavRVW+iEu8eK3hh5MKCyaQuLorREdt6PIh
	 IZ35fZheDxckQ==
Date: Thu, 4 Sep 2025 11:22:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Sari Khoury <sari.khoury@mobileye.com>
Subject: Re: [PATCH 03/19] dt-bindings: soc: mobileye: add eyeQ7H compatibles
Message-ID: <20250904-pristine-unicorn-of-greatness-40eca6@kuoka>
References: <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com>
 <20250903-clk-eyeq7-v1-3-3f5024b5d6e2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250903-clk-eyeq7-v1-3-3f5024b5d6e2@bootlin.com>

On Wed, Sep 03, 2025 at 02:47:10PM +0200, Beno=C3=AEt Monin wrote:
>  patternProperties:
>    '-pins?$':
> @@ -265,6 +279,88 @@ required:
>  additionalProperties: false
> =20
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mobileye,eyeq5-olb
> +              - mobileye,eyeq6l-olb
> +              - mobileye,eyeq6h-acc-olb
> +              - mobileye,eyeq6h-central-olb
> +              - mobileye,eyeq6h-east-olb
> +              - mobileye,eyeq6h-west-olb
> +              - mobileye,eyeq6h-south-olb
> +              - mobileye,eyeq6h-ddr0-olb
> +              - mobileye,eyeq6h-ddr1-olb
> +              - mobileye,eyeq7h-south-olb
> +              - mobileye,eyeq7h-periph-east-olb
> +              - mobileye,eyeq7h-ddr0-olb
> +              - mobileye,eyeq7h-ddr1-olb
> +              - mobileye,eyeq7h-mips0-olb
> +              - mobileye,eyeq7h-mips1-olb
> +              - mobileye,eyeq7h-mips2-olb
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1

Drop

> +          maxItems: 1
> +        clock-names:
> +          items:
> +            - const: ref
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mobileye,eyeq7h-east-olb
> +              - mobileye,eyeq7h-west-olb
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: ref
> +            - const: ref_100p0
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mobileye,eyeq7h-periph-west-olb
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: ref_100p0
> +            - const: ref_106p6_w
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mobileye,eyeq7h-acc0-olb
> +              - mobileye,eyeq7h-acc1-olb
> +              - mobileye,eyeq7h-xnn0-olb
> +              - mobileye,eyeq7h-xnn1-olb
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: ref_100p0
> +            - const: ref_106p6_e

That's the same as previous ref_106p6_w.

These are not names of clocks. These are names of inputs.


> +
>      # Compatibles exposing a single reset domain.
>    - if:
>        properties:
> @@ -274,6 +370,12 @@ allOf:
>                - mobileye,eyeq6h-acc-olb
>                - mobileye,eyeq6h-east-olb
>                - mobileye,eyeq6h-west-olb
> +              - mobileye,eyeq7h-east-olb
> +              - mobileye,eyeq7h-west-olb
> +              - mobileye,eyeq7h-periph-east-olb
> +              - mobileye,eyeq7h-periph-west-olb
> +              - mobileye,eyeq7h-ddr0-olb
> +              - mobileye,eyeq7h-ddr1-olb
>      then:
>        properties:
>          '#reset-cells':
> @@ -289,6 +391,11 @@ allOf:
>              enum:
>                - mobileye,eyeq5-olb
>                - mobileye,eyeq6l-olb
> +              - mobileye,eyeq7h-south-olb
> +              - mobileye,eyeq7h-acc0-olb
> +              - mobileye,eyeq7h-acc1-olb
> +              - mobileye,eyeq7h-xnn0-olb
> +              - mobileye,eyeq7h-xnn1-olb
>      then:
>        properties:
>          '#reset-cells':
> @@ -306,6 +413,9 @@ allOf:
>                - mobileye,eyeq6h-south-olb
>                - mobileye,eyeq6h-ddr0-olb
>                - mobileye,eyeq6h-ddr1-olb
> +              - mobileye,eyeq7h-mips0-olb
> +              - mobileye,eyeq7h-mips1-olb
> +              - mobileye,eyeq7h-mips2-olb
>      then:
>        properties:
>          '#reset-cells': false
> @@ -350,3 +460,18 @@ examples:
>          clock-names =3D "ref";
>        };
>      };
> +  - |
> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      system-controller0@45000000 {
> +        compatible =3D "mobileye,eyeq7h-acc0-olb", "syscon";

No need for new example for difference in one property.

Best regards,
Krzysztof


