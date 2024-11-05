Return-Path: <linux-mips+bounces-6671-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 035FA9BCDE0
	for <lists+linux-mips@lfdr.de>; Tue,  5 Nov 2024 14:33:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 330131C21686
	for <lists+linux-mips@lfdr.de>; Tue,  5 Nov 2024 13:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CEE1D63F4;
	Tue,  5 Nov 2024 13:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u1tv1TyE"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F4E1D63E9;
	Tue,  5 Nov 2024 13:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730813605; cv=none; b=aGKflPTnQL56e2tLzltg0b8Z51r3tWNshSGJrEG00HwOUDIHe9iDPw5AvKbWsDTvQtbEshKGFJZUBKKcXKuc3KM7FnR/nNvEVMccARQgjZ2yNuyob/nG2v/mQnQnV3l0wCuCL905+y5duB2ffcSopa9U2/LfMLzBqNUxi3Z8vE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730813605; c=relaxed/simple;
	bh=KT5zF8H18NGC/TLWrYKsVRBqgBnqV8X9qCR3wlC7Y0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2foJr+t2w9EmWyMPi8lmfCeDRCShzYRx9OGpD3yHfmdYxafP0F7518/NGCCqqAzGCuwaYbR43WGfck8IgU6Q0VxuXsjbpwrVzmaNtKQIbVPPVNn5XkwFQ/4DYEG1Xb/pfx4mKGFzuEFySXyQ3hwa+U3eY7aL4sIYuqm+vX/AfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u1tv1TyE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A906FC4CED0;
	Tue,  5 Nov 2024 13:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730813605;
	bh=KT5zF8H18NGC/TLWrYKsVRBqgBnqV8X9qCR3wlC7Y0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u1tv1TyEwKjibGh1x0gjsbRD/lt8MpK0gB2VmVMfRZLB5Dg/ynIzXBqgNeH+cc4qJ
	 uNAv3tGFmIsAOBk4ApEq+f03TEU34E81SpatHnnxAAHCPn3ftPKsMaHLY6FVrrs1Qd
	 9b8QSn86aAgOqtzLWst37UrPAvQQ/JFRSnI+644HCn8Qs30J+3bj/ZJiiFwV7J9RZo
	 GNyfwSQfZtrXkyjh3ndm+AbxUaT6A1fZjM3wT5HZqS9PGM8CqewldJoJO07g9AqJle
	 eCTEW2MADNVoORRCYkBPxUAT+fSVHmOaPjPwwd3AOsW7GUMziavXcnw1eEXg+kOwnE
	 rEMJYfoqyAoPg==
Date: Tue, 5 Nov 2024 07:33:23 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH 01/13] dt-bindings: soc: mobileye: set `#clock-cells =
 <1>` for all compatibles
Message-ID: <20241105133323.GA3064907-robh@kernel.org>
References: <20241031-mbly-clk-v1-0-89d8b28e3006@bootlin.com>
 <20241031-mbly-clk-v1-1-89d8b28e3006@bootlin.com>
 <20241104153727.GA192461-robh@kernel.org>
 <D5DJOUV9NPY4.22MIOBKLAYGA3@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D5DJOUV9NPY4.22MIOBKLAYGA3@bootlin.com>

On Mon, Nov 04, 2024 at 05:46:10PM +0100, Théo Lebrun wrote:
> On Mon Nov 4, 2024 at 4:37 PM CET, Rob Herring wrote:
> > On Thu, Oct 31, 2024 at 04:52:51PM +0100, Théo Lebrun wrote:
> > > Some compatibles expose a single clock. For those, we used to let them
> > > using `#clock-cells = <0>` (ie <&olb> reference rather than <&olb 0>).
> > > 
> > > Switch away from that: enforce a cell for all compatibles. This is more
> > > straight forward, and avoids devicetree changes whenever a compatible
> > > goes from exposing a single clock to multiple ones.
> >
> > Your reasoning is flawed. Changing #clock-cells is an ABI break. So you 
> > should only be changing this if it was just wrong. And if it's not wrong 
> > in some cases, you shouldn't be changing those. The h/w either has 1 
> > clock or multiple and #clocks-cells should match.
> 
> I see your reasoning, and I agree that changing #clock-cells is an ABI
> break. However, there are two things to take into account:
> 
>  - We do not (yet?) have an omniscient view of the hardware. We do not
>    know what every single register in those memory regions do.
> 
>    Some clocks might be lurking in the shadows, especially as we don't
>    support many HW capabilities yet.
> 
>  - The earlier the better. If we discover later down the road that,
>    indeed, some more clocks were hiding, we'll have to do an ABI break.
> 
>    At that point, some people might actually be using the platform.
>    Seeing what we currently have supported upstream versus the amount
>    of HW blocks available in the SoC, I cannot imagine anyone using the
>    platform with an upstream kernel.
> 
> So the choice is:
>  - potential ABI break in the future, once people use the platform, or,
>  - guaranteed ABI break now, when no one is using it.
> 
> I pick option two! Do you agree with the thought process?

Ultimately, it is up to you and the maintainers for the platform to 
decide. I only ask that ABI breaks are called out as ABI breaks with 
reasoning given for the ABI break.

I had no clue whether you have access to RTL or are reverse engineering 
this or something in between.

Please summarize the above explanation for the commit msg.

Rob

