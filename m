Return-Path: <linux-mips+bounces-5638-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B945984EE5
	for <lists+linux-mips@lfdr.de>; Wed, 25 Sep 2024 01:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C757F1F239B7
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2024 23:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735EC13E043;
	Tue, 24 Sep 2024 23:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WjnCnYMA"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4232A1865F7;
	Tue, 24 Sep 2024 23:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727220088; cv=none; b=a7IFB+RdfZED5ik1mZ2lahAe+ZSyCT0BeC8iHroy9WefP7ozpJqSfijunx4oJyWhG6tjMsVhi8vI0FYwpl65vzW5jORxoAGzaXgL0hQygQ5WLDcp6PQdwPnBARzGr0kIs6fbyJu6JUKhS7v7h3E9Ljz0fC25cBzxjiuA1QQamGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727220088; c=relaxed/simple;
	bh=lr4vECzgqXsBRGAc4wmmfXegNRhdFyDsQ+2g5rYn83k=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=qTDEm8Guu2Q//Ulbbo3yzH9uqgVr5FtkhKfshxQJqgY2XhBXziFFuDVbOvcrLhCOCxGOzLISqG5PponmTzXYd/vMoHokaLKywEPuXrdx2nljkxqzIaEQWgsEM3iYtglQNAm64aW9uSLGHCSsj8tnUz/9TK6HvTvL3G8QpXs9K48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WjnCnYMA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899FFC4CEC4;
	Tue, 24 Sep 2024 23:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727220087;
	bh=lr4vECzgqXsBRGAc4wmmfXegNRhdFyDsQ+2g5rYn83k=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=WjnCnYMAJUFroe0/pvzMt3ERnU4bW+tkhK14SE9ypZged7uF2Hk5ApY6J62lq1Xuw
	 +Yf6xvz2WciRfNg+UYR1je+i5YQKYg1xNiByv6UtWMZok7aIyUkpJu6FSJInbWtmrC
	 Jl9F5ww74/3hDKmgPQ8QZq5UcF+9rLNLQRAEdO8lBfJDfvoy6JLsBTCpie65OyOy31
	 O3hBX2jhGBhqV5m8kcvBUPlaJQoxvbU+il3+uXcO2K89psD+9tpYvpy1aDBcQPsM+9
	 EcqMOJ+9N5xanPFLfSgXTG8nO3UwBGtjjksaNqYZnzePE/3p2MIXg6e77NJF1zK3LX
	 s/qSeFhrC4/VQ==
Date: Tue, 24 Sep 2024 18:21:26 -0500
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
Cc: devicetree@vger.kernel.org, tsbogend@alpha.franken.de, lee@kernel.org, 
 linux-kernel@vger.kernel.org, krzk@kernel.org, linux-mips@vger.kernel.org, 
 conor+dt@kernel.org
In-Reply-To: <20240924221626.3290531-1-chris.packham@alliedtelesis.co.nz>
References: <9abd5e65-da40-4283-b60e-46be5f89e858@alliedtelesis.co.nz>
 <20240924221626.3290531-1-chris.packham@alliedtelesis.co.nz>
Message-Id: <172722008668.561416.13765711287255233220.robh@kernel.org>
Subject: Re: [RFC PATCH v4.5] dt-bindings: mfd: Add Realtek RTL9300 switch
 peripherals


On Wed, 25 Sep 2024 10:16:26 +1200, Chris Packham wrote:
> Add device tree schema for the Realtek RTL9300 switches. The RTL9300
> family is made up of the RTL9301, RTL9302B, RTL9302C and RTL9303. These
> have the same SoC differ in the Ethernet switch/SERDES arrangement.
> 
> Currently the only supported features are the syscon-reboot and i2c
> controllers. The syscon-reboot is needed to be able to reboot the board.
> The I2C controllers are slightly unusual because they each own an SCL
> pin (GPIO 8 for the first controller, GPIO 17 for the second) but have 8
> common SDA pins which can be assigned to either controller (but not
> both).
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> This is my initial attempt at addressing Krzysztof's comments from my two
> series. I expect there may still be a bit of discussion on the binding so I'm
> just sending this on it's own rather than the whole series.
> 
>  .../bindings/i2c/realtek,rtl9300-i2c.yaml     |  98 ++++++++++++++++
>  .../bindings/mfd/realtek,rtl9300-switch.yaml  | 110 ++++++++++++++++++
>  2 files changed, 208 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl9300-switch.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/realtek,rtl9300-switch.example.dtb: ethernet-switch@1b000000: 'reboot' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/realtek,rtl9300-switch.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/realtek,rtl9300-switch.example.dtb: ethernet-switch@1b000000: '#address-cells', '#size-cells', 'i2c@36c', 'i2c@388', 'reboot@c' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/realtek,rtl9300-switch.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/realtek,rtl9300-switch.example.dtb: reboot@c: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/reset/syscon-reboot.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240924221626.3290531-1-chris.packham@alliedtelesis.co.nz

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


