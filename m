Return-Path: <linux-mips+bounces-3975-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15522919EC3
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 07:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5797287F3D
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 05:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC18A1CA9E;
	Thu, 27 Jun 2024 05:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ssMgWk2p"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD881C2AD;
	Thu, 27 Jun 2024 05:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466680; cv=none; b=umS7yfwqCFt6LlDL/iZuBHQ/EeWEHjFChpYWk4up6MxhdGWZ55uZjADaKT3d41ID7uVqztDlH+UEvHRmTPK35+TMDXTZ1LXN8ms3+I4KB33bTHfoW3PSTGwgXdXTKxmfQ4JbPvj20mla0krH3P1cffSrvmKvysROPTzGatxhpbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466680; c=relaxed/simple;
	bh=3WT/rR8DVWsgB7SqkR4qilHgXUMUozxNxRpqv6b4Ywo=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=dDZPU3cI2kcdZtj6P5vDdYDk6+iVp+noOK6OULkHgKpZddOgG1esMeo4OZCyNSO6V6dYkZo06WJBdT9tm4RxeK6l6IEr4mqOBEABEr/uhpayC75Q9lqwfvx1XKb4cPeuZs5Dh1Gr/fjRzh2FIMhs6eJr9xthRWSqcvVxAq+i4qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ssMgWk2p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB853C2BBFC;
	Thu, 27 Jun 2024 05:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719466680;
	bh=3WT/rR8DVWsgB7SqkR4qilHgXUMUozxNxRpqv6b4Ywo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ssMgWk2pusBuyLhMyLFvvIrjrhDCsRtccsk0xmlalB7isZN2HhmQTKMkVGK4tmWkd
	 aJIPkw83ZwPzeuJBn/5y5V2tHdTkKleS2rSSsRuD1spL3WknuPWRbQpSWeuDGU7CDP
	 08oXaa5uYQny2dD1v3J6cY5LJXXGHMqP9inzaRgZxkKVUITeTY0JNQT63zbK6+iQqR
	 VP6ohOxBy+/+2GTZYrjgtzlvgl180gYFBKCoF/uQ4f5gjaeaJ8HFXxNRRyn2zh9SDX
	 NFHZVOtmVLTzH30v8rF/aC3LWSkroZ3Nxu17x7ghG9wRWUbv35LFcC6oLDBhLILnYS
	 0x0ZiNgONq9fQ==
Date: Wed, 26 Jun 2024 23:37:58 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: krzk+dt@kernel.org, ericwouds@gmail.com, bert@biot.com, 
 conor+dt@kernel.org, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, sander@svanheule.net, tglx@linutronix.de, 
 paulburton@kernel.org, john@phrozen.org, kabel@kernel.org, 
 daniel.lezcano@linaro.org, peterz@infradead.org, mail@birger-koblitz.de, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240627043317.3751996-7-chris.packham@alliedtelesis.co.nz>
References: <20240627043317.3751996-1-chris.packham@alliedtelesis.co.nz>
 <20240627043317.3751996-7-chris.packham@alliedtelesis.co.nz>
Message-Id: <171946667846.1784649.14059031623063461479.robh@kernel.org>
Subject: Re: [PATCH v3 6/9] dt-bindings: interrupt-controller:
 realtek,rtl-intc: Add rtl9300-intc


On Thu, 27 Jun 2024 16:33:14 +1200, Chris Packham wrote:
> Add a compatible string for the interrupt controller found on the
> rtl930x SoCs. The interrupt controller has registers for VPE1 so these
> are added as a second reg cell.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v3:
>     - Use items to describe the regs property
>     Changes in v2:
>     - Set reg:maxItems to 2 to allow for VPE1 registers on the rtl9300. Add
>       a condition to enforce the old limit on other SoCs.
>     - Connor and Krzysztof offered acks on v1 but I think the changes here
>       are big enough to void those.
> 
>  .../interrupt-controller/realtek,rtl-intc.yaml | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-intc.example.dtb: interrupt-controller@3000: reg: [[12288, 24]] is too short
	from schema $id: http://devicetree.org/schemas/interrupt-controller/realtek,rtl-intc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240627043317.3751996-7-chris.packham@alliedtelesis.co.nz

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


