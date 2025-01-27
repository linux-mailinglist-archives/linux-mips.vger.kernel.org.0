Return-Path: <linux-mips+bounces-7610-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFEDA1DC79
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jan 2025 20:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B195A7A422C
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jan 2025 19:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA3F15FD13;
	Mon, 27 Jan 2025 19:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPwyS4HO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C2A18FC9F;
	Mon, 27 Jan 2025 19:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738004993; cv=none; b=fl7Dr1LTk7vmYoR5zXNiSqOOo/38d6TiGATFv9CGtjwMvluqLif4yknJ0dW/vqJH5N1W+N9q3JDU5CbYbI4FLNUPDkcaR/TMVnIqGAYV0uMaCD65Nc9sbEGrGWJxhRbJxN92qicFgq5BSIBq+TMqg6xLDZ61HXDk0ywkJ5upEuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738004993; c=relaxed/simple;
	bh=9K0U+p4K8HN8nuuGDMmCFI4QdTCVHdj7rgDjVZ1Q4Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rt7po3n7LodFWzOhvVlh49JsvYVOQBsXT3kF0GEw25XEI+3DSMAG1Eh5zjyM/J1pcZhliJYSAcxLH7ip+RxHY0ZHiT+rYrX4yGwgYhIauIvPLvOR1sXhkegpvF495QBAQ2k/wbyl2N3S/S10HUDjP14iBGP0AVX4cATbN/aBOvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPwyS4HO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6635C4CED2;
	Mon, 27 Jan 2025 19:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738004992;
	bh=9K0U+p4K8HN8nuuGDMmCFI4QdTCVHdj7rgDjVZ1Q4Wk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jPwyS4HObBxJGkwtbt4bwCtcsM/QFew3XqeV0qgGI4j8dKNpJFYefPx2k+D7DEQag
	 jzZPuy4WexiuXngefDBJv8BcQXXuT6xZnl6vgyOY1wuue0tSk9iFgXVzDDYhPOYhue
	 JnxGNDhwh/VMWs7owaCN2jijXqI6BpybMf6W1cQXbA7IFiJxAn2ThjmjSKUlTfn6Us
	 h67Fn1tcCf43eFOIPbTBHfpmJ1WAx7loVFChOVWTZvZROyfEJE7psIiE14XjW//Cd8
	 FYWRtDVoYxVA0YkMsh4MCw1UPBlwbvGP1pQBm27qiycioLF+a7QR7ZDheJT79gvuEf
	 zr5UxrdlAEVfw==
Date: Mon, 27 Jan 2025 13:09:51 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Aleksandar Rikalo <arikalo@gmail.com>, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH v3 1/5] dt-bindings: mips: Document mti,mips-cm
Message-ID: <173800499106.690677.9924240304611104567.robh@kernel.org>
References: <20250123-cluster-hci-broken-v3-0-8a7ec57cbf68@bootlin.com>
 <20250123-cluster-hci-broken-v3-1-8a7ec57cbf68@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123-cluster-hci-broken-v3-1-8a7ec57cbf68@bootlin.com>


On Thu, 23 Jan 2025 12:01:54 +0100, Gregory CLEMENT wrote:
> Add device tree binding documentation for MIPS Coherence Manager. This
> component enables support for SMP by providing each processor in the
> system with a uniform view of memory. The Coherence Manager is
> responsible for establishing the global ordering of requests from all
> elements of the system and sending the correct data back to the
> requester.
> 
> Based on the work of Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  .../devicetree/bindings/mips/mti,mips-cm.yaml      | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


