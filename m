Return-Path: <linux-mips+bounces-3997-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6860F91B0B5
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 22:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D2B21F242E3
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 20:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA52E19F499;
	Thu, 27 Jun 2024 20:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UpJOHbOj"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E55D19F46D;
	Thu, 27 Jun 2024 20:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719521047; cv=none; b=AMjMVQR0Bf6OmgWxmOHKT0t8Cn4JfLSXEf/6ZD901gsNFzWE+bFw60Ej1CpHT/zxdwT6VzCflgR+/bqemINMXyJ5vSEJArDxyWK7/c2vpbFGZE1nlE9t9ZpCy6ME8JtCuXY4YrDXMf8aiDRI1sHI1Z4zlMMOjZDagUSSbMPVHMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719521047; c=relaxed/simple;
	bh=KRz3Wwjp0DZmm5tZweJgQynTTMc/MpaTAzpm85PtvWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GY2DkI924kT2zwHGjMkj65ZqGG7jCupoUi81PC58o3SoPdSQYSGh/AMoSdwv68AKGTFdPbm9WLGTkNbRKNC64MNCq7bxJx49OPOpZAe16O5XjA2wJgf2+pIdR/iG9QY5YRCjAosxugbWREzlTsb7KTgBIHT2FO/jiWUEOROc74Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpJOHbOj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB32EC2BD10;
	Thu, 27 Jun 2024 20:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719521047;
	bh=KRz3Wwjp0DZmm5tZweJgQynTTMc/MpaTAzpm85PtvWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UpJOHbOjOekA4y+xp1K8M6hbKgsiq82JNdPsM1YZYZsSF2p0thpeC+584G2HSQJEd
	 TMkGd7jvx+sPOkbQFTZ7n7JZ1Bh187tVL98dTXRlqxkTTyfLz65ylkybQwX0JwyIoK
	 TISF2ph1KxNhmSTLt5WXR+yFrpnavdA3ds/+F2V0UI4SXG2jw7pwGqDVFl2ZUKWXZs
	 f75WfemHe4VELewXS46B2j9eTwSGAfenyysP8TthggnsDMIHbg78BgOqi1v0R+sDBU
	 LPS9+hFuwZ9XqK+TB7pwUC3fDiPQtYVTvF9t9oynnVlZIQxMyB3qxKLX8Zv6puM+8c
	 9bN6wjQSvr2fA==
Date: Thu, 27 Jun 2024 14:44:05 -0600
From: Rob Herring <robh@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"paulburton@kernel.org" <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v3 7/8] dt-bindings: mfd: Add img,boston-platform-regs
Message-ID: <20240627204405.GA479596-robh@kernel.org>
References: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
 <20240618-boston-syscon-v3-7-c47c06647a26@flygoat.com>
 <6d3fbd07-72a0-43fd-a1e5-c39e3a833bc1@kernel.org>
 <51557e31-0a59-4278-a8c1-25cf66fa3c3f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51557e31-0a59-4278-a8c1-25cf66fa3c3f@app.fastmail.com>

On Wed, Jun 19, 2024 at 12:20:54PM +0100, Jiaxun Yang wrote:
> 
> 
> 在2024年6月19日六月 上午10:28，Krzysztof Kozlowski写道：
> > On 18/06/2024 17:11, Jiaxun Yang wrote:
> >> This compatible has been used in arch/mips/boot/dts/img/boston.dts
> >> for a while but never documented properly.
> >> 
> >
> >> diff --git a/Documentation/devicetree/bindings/mfd/img,boston-platform-regs.yaml b/Documentation/devicetree/bindings/mfd/img,boston-platform-regs.yaml
> >> new file mode 100644
> >> index 000000000000..79cae87c6758
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/mfd/img,boston-platform-regs.yaml
> >> @@ -0,0 +1,74 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/mfd/img,boston-platform-regs.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Imagination Technologies Boston Platform Registers
> >> +
> >> +maintainers:
> >> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    items:
> >> +      - const: img,boston-platform-regs
> >> +      - const: syscon
> >> +      - const: simple-mfd
> >
> >
> > Fix U-boot to populate devices instead of relying on simple-mfd.
> 
> Hi Krzysztof,
> 
> I believe U-Boot's implementation is correct. As per simple-mfd binding:
> 
> ```
> simple-mfd" - this signifies that the operating system should
>   consider all subnodes of the MFD device as separate devices akin to how
>   "simple-bus" indicates when to see subnodes as children for a simple
>   memory-mapped bus.
> ```
> 
> This reads to me as "if you want sub nodes to be populated as devices
> you need this."
> 
> In our case there are "clock" and "reset" node sub nodes which should be
> probed as regular device, so it's true for us.
> 
> Linux managed to work without "simple-mfd" only because clock subsystem
> is bypassing regular OF population process. Semantically we need this.

I'm confused. Neither u-boot nor linux .dts files have 'simple-mfd' for 
this binding. So why do you need it? Why are we changing a platform 
that's had 1 dts change since 2018?

If anything, add it in a separate patch and we can discuss it there 
instead of a conversion.

> Besides Linux as upstream of devicetree source had accepted U-Boot
> only stuff here, such as "bootph-all" property.

Yes, and there are things we've rejected. See Arm FFA threads if you 
want to waste a few hours reading.

Rob

