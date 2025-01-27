Return-Path: <linux-mips+bounces-7611-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42985A1DC7E
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jan 2025 20:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97F50161C27
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jan 2025 19:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D20919066D;
	Mon, 27 Jan 2025 19:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gvk0PWtI"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F281718F2EF;
	Mon, 27 Jan 2025 19:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738005025; cv=none; b=fAseiYRFI9Qm7BCxbgXuXKNPEhYXQ7fWZydz5idTtd8GEQVrt3KVgAh/BT4mdBdREQNtFURjTGrmMmM6Udrtk0YDGI+Em2ojk5nNxtX5SrnIdWemQW/1qOZdwST4Yzogu4mdxrkI4sK5tVJod42qLibQ3CRqXXTQjXJpchDHojI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738005025; c=relaxed/simple;
	bh=X94lK3V/Fj6hpoRE42JLuvJwqVqjWC8XWjv0P5rafyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsgLPgvIdayMlwxjNH3tzi5DkIU3553xJ+zvs8CQ/n6LGg/wThgn5N8wB043QpULRPlxkzDGiYIq7jiY/QznjBT/GueuwYDJ7K7gB1r56y3cmSD1Jj/wVRZ6IEKspRZ5joF/1iILsS0NGUz5UKkpF9YGllPZpIGliVEyuMjUG90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gvk0PWtI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E405C4CED2;
	Mon, 27 Jan 2025 19:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738005024;
	bh=X94lK3V/Fj6hpoRE42JLuvJwqVqjWC8XWjv0P5rafyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gvk0PWtIGAWmC9OZGJwbMjMunPtiC9a2S6qfH3PuVCaMcPQX25JcHzMXeV5PM1fMI
	 dTxMQZb6Z6pxwvPMSSM0pxvQj2+X+NsdX3iSARyh5ebZaroLKQsXR/uobsrYDLGptu
	 nDnacjh6Vk6bpCs6XzdNkURBK6ZIDJB+lVDrAR05eb26z69awdNioFy5uggG2eDlGY
	 Nh6yl4J14V3ZWawOLxZjhMochZ9f8vWFUeRg3gXkIXPPHOqmEQ1lCR2sPWH5hg1n8d
	 gxf9wpoyR22J5oHfbkd/M9BFBqR7Y7VsShbxMgOtORa6ze3mq3f9AwsfLkKLoXLzte
	 DfDdrKx24baqw==
Date: Mon, 27 Jan 2025 13:10:23 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Aleksandar Rikalo <arikalo@gmail.com>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: mips: mips-cm: Add a new compatible
 string for EyeQ6
Message-ID: <173800502284.693501.69494037886244544.robh@kernel.org>
References: <20250123-cluster-hci-broken-v3-0-8a7ec57cbf68@bootlin.com>
 <20250123-cluster-hci-broken-v3-2-8a7ec57cbf68@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123-cluster-hci-broken-v3-2-8a7ec57cbf68@bootlin.com>


On Thu, 23 Jan 2025 12:01:55 +0100, Gregory CLEMENT wrote:
> The CM3.5 used on EyeQ6 reports that Hardware Cache Initialization is
> complete, but in reality it's not the case. It also incorrectly
> indicates that Hardware Cache Initialization is supported. This new
> compatible string allows warning about this broken feature that cannot
> be detected at runtime.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mips/mti,mips-cm.yaml | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


