Return-Path: <linux-mips+bounces-7504-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C7FA15D61
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jan 2025 15:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D82A18869D1
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jan 2025 14:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A1218FC9D;
	Sat, 18 Jan 2025 14:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jy+fX6F6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDFC184;
	Sat, 18 Jan 2025 14:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737211315; cv=none; b=E8txSuWBqnPZnkfispkQYnTc7GU8Qtx/cOlf0vaIjNcEdvxpuBbnxFHpqgtXVqpElLzzFE27iI6lorgtY4KgWsogWkH1OslBnvpRrwdSccrMBJZ9702eXtu65UNlkWHCcRpkbQcL8oXyVzea8Nyu45V6e7xClnoSo0VWAFzIovQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737211315; c=relaxed/simple;
	bh=M7bWewb4ioMWRrmYH3frL7DaC/v7/G7GVzjzmI4GcEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDLmeRIvMmXOJA3mY2XxHLQzquFnUXf9RvTvH+qWUVt79s+52dB6HCA5ZVFeKbRLuAYvHC/veXU9P4WEsbynCmDeZ+xXZ4kei6BBZKvvndWybGHEhHCihQCn+sZmb+zOUtxVl/LW87SgOmu+l75OgRdSxQ+F8n6TRYonnX7/QII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jy+fX6F6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 299B8C4CEDF;
	Sat, 18 Jan 2025 14:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737211314;
	bh=M7bWewb4ioMWRrmYH3frL7DaC/v7/G7GVzjzmI4GcEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jy+fX6F66HrE+Qo3HVIEt+X0dhCmBAMypvrQW/WoLeqIl4OWqjpD9qkx8bTzx2yLL
	 KPsl5mT8MLm7Ybq2U5XL59zLdwA6DMO3EhS++yLZ0bHMyhXqntnwqeLg0cH9Ae2dUR
	 GQKN/+Xj1wo92pCoUIPSCyHK4b3goi4NoSHAnyoZAg5JHUj5YEUog1rlrw9N0iXQR7
	 BXN26ZkwZ1n/4puqgdOs4NkYNFH44WVRebz2IKzrJnwwt0QBTPfT1U/lGyj+wx9tYS
	 nZeneOAZdW9o4W8IBw9oRmJ5iRo8q4yT0XGN736Q7MJZiHwIEXmV8KiG5v9aplh0qc
	 nfLcxZw3dvZIA==
Date: Sat, 18 Jan 2025 15:41:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: mips: mips-cm: Add a new compatible
 string for EyeQ6
Message-ID: <20250118-therapeutic-peach-turaco-99b37e@krzk-bin>
References: <20250116-cluster-hci-broken-v2-0-fc52cfb7a19e@bootlin.com>
 <20250116-cluster-hci-broken-v2-2-fc52cfb7a19e@bootlin.com>
 <20250116153637.GA2567996-robh@kernel.org>
 <87a5bpwz6v.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87a5bpwz6v.fsf@BLaptop.bootlin.com>

On Fri, Jan 17, 2025 at 10:46:00AM +0100, Gregory CLEMENT wrote:
> >> -    const: mti,mips-cm
> >> +    oneOf:
> >> +      - const: mti,mips-cm
> >> +      - const: mti,eyeq6-cm
> >
> > Being a mobileye device, the vendor prefix should be mobileye.
> 
> I chose mti because actually this block is part of the I6500 and
> provided as is by MIPS.

But MIPS or MTI did not create eyeq6, so then product does not fit
vendor.

> 
> >
> >> +        description:
> >> +          On EyeQ6 the HCI (Hardware Cache Initialization) information for
> >> +          the L2 cache in multi-cluster configuration is broken.
> >>  
> >>    reg:
> >>      description:
> >> @@ -25,14 +30,29 @@ properties:
> >>  
> >>  required:
> >>    - compatible
> >> -  - reg
> >>  
> >>  additionalProperties: false
> >>  
> >> +if:
> >> +  properties:
> >> +    compatible:
> >> +      contains:
> >> +        const: mti,eyeq6-cm
> >> +then:
> >> +  properties:
> >> +    reg: false
> >> +else:
> >> +  required:
> >> +    - reg
> >
> > How does one access this block with no registers? Is this some subset of 
> > a larger block? If so, need to define that block first.
> 
> CM stands for Coherence Manager. This component is mandatory when you
> want to do SMP across MIPS core. This is part of the MIPS architecture,
> and the address of the CM is provided by the Coprocessor 0.
> 
> "CP0 is incorporated on the CPU chip and supports the virtual memory
> system and exception handling. CP0 is also referred to as the System
> Control Coprocessor."
> 
> So to summarize, in a functional system, this information doesn't have
> to be exposed through the device tree, as it is available at runtime
> from any MIPS CPU.
> 
> >
> > These 2 blocks don't look related and the only property shared is 
> > 'compatible'. This should be a separate doc.
> 
> As mentioned in the cover letter, I reused the work from Jiaxun, who
> needed to deal with bogus CM but in a different way. In his use case,
> the issue with the CM was that the address in CP0 was wrong. In my case,
> this address is correct; it is only one piece of information reported by
> the CM that is wrong. I don't mind creating a separate doc if you
> still think it is the right thing to do.

So the programming interface in general is the same, but in one case the
reg/address detection does not work reliably?

I guess could stay the same doc, but all this should be explained in
binding description.

Best regards,
Krzysztof


