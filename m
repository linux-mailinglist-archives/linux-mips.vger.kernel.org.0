Return-Path: <linux-mips+bounces-7903-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E919A401D4
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 22:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B8F23BA2D6
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 21:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9A8253F2E;
	Fri, 21 Feb 2025 21:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dp60rGrq"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0EE253336;
	Fri, 21 Feb 2025 21:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740171988; cv=none; b=p5T1rc2J88RgdclZoLZ6dPbuxrCIc/NI3DPbP3OQgjd5FTCwab8DDNg4xSeUdlKnCfEmma+LiFTEhdgvTLDe9HwTaEeWdNhiQBmRpGXo9KNe0NMDmBaVHbhBnlNR8scwsbsBclFCH8LDF6uOoI+nww/nbohjozeH6eazjLEHuBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740171988; c=relaxed/simple;
	bh=qmjNEUFgu/ZxCPLIcQrJ7jiCisWI5FZVUdmhNrXSM5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hG06Ez03niDhp6w2d10Fb0uqlMV0a05PiRDq3b1W4Qwda9lhh1ikOFSwScsRhQhO0imoynsMeItbxRPqeY6i8GDXyENKLGv5slDrSuZ5zyh3/MpEUmouqWvn1VTKgCyJzgR6goHETvG70Za10aGPxlAL1voQpQuavdm1WQA3qkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dp60rGrq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01FC4C4CED6;
	Fri, 21 Feb 2025 21:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740171988;
	bh=qmjNEUFgu/ZxCPLIcQrJ7jiCisWI5FZVUdmhNrXSM5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dp60rGrq6U1l67hpl/CYzbZ3zyyZo6W5wWv3Y/1JEPznaiaiORw56TUo+qaqoP5gu
	 5RYvlC/SQ7V7N3uh7aTiqHWlUFV6OhPwWoUZFsDPIUtpJWU2eigIr67Zbj1CwBtY3Q
	 rskyK8M8V18bs8XHHhKRYVcwoAHhufOLrOLN6y+esIrLAyCe9wN8yn5rHnmceSCvNL
	 /uOZ92pylNx/daZvi33/rEi/TiPYiJUy4bZlAvx5DNCXdbegksVwb/tB2t9+EwdlS7
	 VD187nIanJ50eG0aZwqOt0c3N3NuEactEAX68WDySsJYrTWi0BJlk16KCINZ5P2X1a
	 PkXYbEYOTfT/A==
Date: Fri, 21 Feb 2025 15:06:26 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: conor+dt@kernel.org, tsbogend@alpha.franken.de, davem@davemloft.net,
	pabeni@redhat.com, netdev@vger.kernel.org, kuba@kernel.org,
	andrew+netdev@lunn.ch, devicetree@vger.kernel.org, lee@kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org, edumazet@google.com
Subject: Re: [RESEND PATCH net-next 2/5] dt-bindings: net: Add switch ports
 and interrupts to RTL9300
Message-ID: <174017197206.81138.17349230717480144240.robh@kernel.org>
References: <20250218195216.1034220-1-chris.packham@alliedtelesis.co.nz>
 <20250218195216.1034220-3-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218195216.1034220-3-chris.packham@alliedtelesis.co.nz>


On Wed, 19 Feb 2025 08:52:13 +1300, Chris Packham wrote:
> Add bindings for the ethernet-switch and interrupt properties for the
> RTL9300.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     This is tecnically v7 of [1] changes from that are:
>     - Use ethernet-switch.yaml#/$defs/ethernet-ports
>     - Enforce "ethernet-ports" be used instead of just "ports"
>     - Add interrupts for the switch block
> 
>     [1] - https://lore.kernel.org/lkml/20250204030249.1965444-2-chris.packham@alliedtelesis.co.nz/
> 
>  .../bindings/net/realtek,rtl9301-switch.yaml  | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


