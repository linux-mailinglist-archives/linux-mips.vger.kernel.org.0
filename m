Return-Path: <linux-mips+bounces-5561-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8969777D5
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2024 06:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6C2C2828EC
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2024 04:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBEF1C2DC1;
	Fri, 13 Sep 2024 04:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZ6H9uT4"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936191B12C2;
	Fri, 13 Sep 2024 04:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726201175; cv=none; b=X+Qni7V0oSpEdLO0VnLIXFm7K7bwyrCVVFcTwIzQ+8LMFIz2HtpWosNZZZeJGK+uc29FykyJdrXmwPbrfp4dShDijPZahDsL3cV9VW4q3p0q6f940+MAugr8UMK0OWBV4k4eqVju+J1LSmZmoO5tob8L5aKH99CAakmRAgCQ4KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726201175; c=relaxed/simple;
	bh=BwZAQlawwtJ/q87nXgJJXJ+mqLNITzvaxgQH1UqKaf4=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=F5sdwDArMkAUKvKW1WJZMXeeSybFpGwniZuateWsP4vUa4z+FygYcc0nzLYEshbN7UDyZtE+h/ZnR1X0Cmd7vbG1XlHi1i+Rf5fb9VwheVYqt6h/K4+wprT6sWnjJrd9LDV8HRwlH6M+/qXV20TGDDBVfz/GInjyc4LZjPGSh9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZ6H9uT4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE3C4C4CEC0;
	Fri, 13 Sep 2024 04:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726201175;
	bh=BwZAQlawwtJ/q87nXgJJXJ+mqLNITzvaxgQH1UqKaf4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=FZ6H9uT4fyCdVibC10b6uoEoGdvwNMCBLVgZ7+F3ysLcGOoOknjntS5FCtPe8irMU
	 6rIW1RjPbFzbTEQJDapFqx+ayVE9GuuJ6UD0NVDc5wqRklHnQNggAtdbJfzfsK7ivi
	 jMpPIhvvz2+u5cfHWwW7IHY8Zt7f8RMw95mAcqsRbLlgRPUi2TJ0AlOMuBQYcYcIsr
	 IVX61M+DoonaSzMp5Rc0QNtZTUHzkQXZnjR1lV2u6BIao26mXQYoWhx5eHZ6ya8CHQ
	 UgO3gnC9AD1SMxSNognQSBKeHPtUiXLmm0g/MI0mIXkTtmZGPcvMpQUoULsa2fr+Nl
	 m5xfjMsJUNmPQ==
Date: Thu, 12 Sep 2024 23:19:33 -0500
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
Cc: tsbogend@alpha.franken.de, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, lee@kernel.org, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20240913024948.1317786-2-chris.packham@alliedtelesis.co.nz>
References: <20240913024948.1317786-1-chris.packham@alliedtelesis.co.nz>
 <20240913024948.1317786-2-chris.packham@alliedtelesis.co.nz>
Message-Id: <172620117395.1580323.932321359938489958.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: Add Realtek switch


On Fri, 13 Sep 2024 14:49:47 +1200, Chris Packham wrote:
> Add device tree schema for the Realtek switch. Currently the only
> supported feature is the syscon-reboot which is needed to be able to
> reboot the board.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v2:
>     - use filename that matches the compatible
>     - put maintainers after title
>     - remove unnecessary label in example
>     - Rework description to focus on what is implemented rather than what
>       may be implemented in the future.
> 
>  .../bindings/mfd/realtek,rtl9302c-switch.yaml | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl9302c-switch.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/realtek,rtl9302c-switch.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/mfd/realtek,switch.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/realtek,rtl9302c-switch.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240913024948.1317786-2-chris.packham@alliedtelesis.co.nz

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


