Return-Path: <linux-mips+bounces-7859-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B24A3C197
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 15:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 393307A868B
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 14:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62BC1EFFA3;
	Wed, 19 Feb 2025 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvS+xiVG"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F741E520A;
	Wed, 19 Feb 2025 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739973998; cv=none; b=sDGBVfPyPdPvDl0fF4Jb7L0T3FzXV2I2YTzY8L8DlsExpgDygJqeMQ3kUkSc31uOfXP/N29s0R1Q8+kDZCCQ/ghsfdb7T+eavwBbOaEoK9Z2Svog4xFSPmV8jVQSkmmYd25ciBQqoe/GhJoKNq688xgVvcUrVGiQDRX/xCYx6pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739973998; c=relaxed/simple;
	bh=BcIYev34/H5KdZyk/gL0x2bpmggeWZsheUrrtj9CCFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPhOHV6mmgjqRcrR34CvDwCKX032RRzumbUtdAKrj5SBA+5BCBqfwtePp1W0gmo8QP8m54L1IomnIwXx9rXzjPT0MOF2hsHrpPn6MzxzWkm1apX/viZxbRYdwAFmlqUmDBmgw2Oeogp13WQYILFDvQ5OzftusUhtLPi5St0329I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvS+xiVG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAEF1C4CED1;
	Wed, 19 Feb 2025 14:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739973998;
	bh=BcIYev34/H5KdZyk/gL0x2bpmggeWZsheUrrtj9CCFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IvS+xiVGhM7cXpY80CIZFSln5mDYng4e33aJhKTXiSJ4mkR16DG64mhQknqbIXHP9
	 f6H4QpiRLvsmHd7bsbcIHxbJHuxonOLfBGmfoYAHBQOJTuCNFlrr7JoL0+1TO8HOrs
	 PYNJFeLNwR7mSPlZn6vreiCi/e1MgXRawCvBWuTfnvDTqnfhHnJTHC/MZ37PNob7py
	 z/HrVzxvfOZGZ584tR7DaywqTF/5Jj/GptSmaM47shFFZJVnECD8+naPO5ct3Ef7nF
	 Hs3Uj2ZPWun8bdU5ZOlXsKgsQ0VF7x4vv7aVQ7kOsxnUkYUqd027jH/2KP5X58wgqY
	 k5l585sqhCFuw==
Date: Wed, 19 Feb 2025 08:06:36 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, linux-mips@vger.kernel.org,
	tsbogend@alpha.franken.de, andrew+netdev@lunn.ch, pabeni@redhat.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	netdev@vger.kernel.org, kuba@kernel.org, edumazet@google.com,
	lee@kernel.org, davem@davemloft.net
Subject: Re: [RESEND PATCH net-next 3/5] dt-bindings: net: Add Realtek MDIO
 controller
Message-ID: <173997391420.2383401.13425265155310657100.robh@kernel.org>
References: <20250218195216.1034220-1-chris.packham@alliedtelesis.co.nz>
 <20250218195216.1034220-4-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218195216.1034220-4-chris.packham@alliedtelesis.co.nz>


On Wed, 19 Feb 2025 08:52:14 +1300, Chris Packham wrote:
> Add dtschema for the MDIO controller found in the RTL9300 Ethernet
> switch. The controller is slightly unusual in that direct MDIO
> communication is not possible. We model the MDIO controller with the
> MDIO buses as child nodes and the PHYs as children of the buses. The
> mapping of switch port number to MDIO bus/addr requires the
> ethernet-ports sibling to provide the mapping via the phy-handle
> property.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     This is technically v7 of [1] and [2] which are combined now that
>     rtl9301-switch.yaml under net/ the only change from those is that the
>     $ref: in rtl9301-switch.yaml can now use a relative path
> 
>     I could technically do away with the reg property on the mdio-controller
>     node. I don't currently need to use it in my driver and it looks like
>     the register offsets are the same between the RTL9300 and RTL9310.
> 
>     [1] - https://lore.kernel.org/lkml/20250204030249.1965444-6-chris.packham@alliedtelesis.co.nz/
>     [2] - https://lore.kernel.org/lkml/20250204030249.1965444-4-chris.packham@alliedtelesis.co.nz/
> 
>  .../bindings/net/realtek,rtl9301-mdio.yaml    | 86 +++++++++++++++++++
>  .../bindings/net/realtek,rtl9301-switch.yaml  | 31 +++++++
>  2 files changed, 117 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>




