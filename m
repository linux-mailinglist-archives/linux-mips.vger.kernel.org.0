Return-Path: <linux-mips+bounces-8265-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3436EA6BEC3
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 16:53:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 381C4189E9B3
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 15:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5AF022C34A;
	Fri, 21 Mar 2025 15:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHILnwct"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D7D223703;
	Fri, 21 Mar 2025 15:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742572325; cv=none; b=rxXi/RghFxPqINJOOkGjX2pfQIIPtvbkiJTSasPCjBAQfmSxU4381Vel/2MdmxBHz190Jle+D4ytokhbpQDG8v7Rs66Iw0vj4i98EPE+/gNqu/UmpAI7Q3yQjyiUTiBHI/FM04XnxtJCt6flwMUM7XiwfZd4TiDmY6pmZ3Nc2fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742572325; c=relaxed/simple;
	bh=+MlNXD+nU/FyW3Z2jZmfsNxmoyYLAZ6DjsTXsGyJU40=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=dkVZlFjnrru9h588GivdgPSYvsdlxRLPwwAt54mdjHiMc/D8EBVQUYCxjZGZ+D8BeUkRg63+5nbjV+C+lHvr2t6KyFqnMelAi4tYNh2bIt4RVkoQv+zSAGO1tiynuUldIkKuuwUAP8rCluXdfc88kcZquWLI4eIvslQwz6uaOKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHILnwct; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5384C4CEE3;
	Fri, 21 Mar 2025 15:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742572324;
	bh=+MlNXD+nU/FyW3Z2jZmfsNxmoyYLAZ6DjsTXsGyJU40=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=hHILnwctpsR2U3NwJKnAltNyE1+kAw+SlNF6GhQl77dNVgUgJ/w6fUOEoY0pSvNsd
	 mRBRjeQZZ8+AC/8P/EoJ6CI7OK26Smdv7OTT9Z13gXK7cUFp6YtQWHJwtknoHVlqia
	 TMmTUOUfX6qV0aPcyDJuXjGz7aqcHdg+1jI+MGR9sISmgnihz46rcCZLUNltUDXs36
	 EhVc5PcmhGRw9ktk+ba3pd7OhigWJa14l814TeQJ74igJrdbvdSoNmUV0Ew6r1ZBD/
	 F4iBX+9jwkCgdKyKoFgTcMKDDX7Ti+fftV+82FoB4UQE6uc/adMXruZr9n3kySxPQQ
	 6dzLZuSOV5JGA==
Date: Fri, 21 Mar 2025 10:52:03 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Thomas Gleixner <tglx@linutronix.de>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, benjamin.larsson@genexis.eu, 
 Daniel Lezcano <daniel.lezcano@linaro.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20250321134633.2155141-3-cjd@cjdns.fr>
References: <20250321134633.2155141-1-cjd@cjdns.fr>
 <20250321134633.2155141-3-cjd@cjdns.fr>
Message-Id: <174257232355.3436156.11164230137695407225.robh@kernel.org>
Subject: Re: [PATCH v1 2/8] dt-bindings: interrupt-controller: Add EcoNet
 EN751221 INTC


On Fri, 21 Mar 2025 13:46:27 +0000, Caleb James DeLisle wrote:
> Document the device tree binding for the interrupt controller in the
> EcoNet EN751221 MIPS SoC.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
> If anyone is aware of a standard name for this "shadow interrupt" pattern,
> please let me know and I will re-send with updated naming.
> ---
>  .../econet,en751221-intc.yaml                 | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.example.dtb: interrupt-controller@1fb40000: 'interrupt-parent' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/econet,en751221-intc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250321134633.2155141-3-cjd@cjdns.fr

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


