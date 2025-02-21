Return-Path: <linux-mips+bounces-7889-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE61A3F6CE
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 15:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EFDA1898BED
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 14:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00FB020E33A;
	Fri, 21 Feb 2025 14:05:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C261433DE;
	Fri, 21 Feb 2025 14:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740146745; cv=none; b=QaB7WwsE9Qo4/vfDVbx4arlImn+3VWOvp3lhqA+IZzh/pU3BnxLkDlHIU4XqnFX9FaH3l8Z2z+Qn2EmXUnSZ7at3Be0Ul5h8UsmneDnNl0JYtx/KWCuTKfebmtKGhtimCMUuEYnEzhm1ECm8991aEDIHAEQRs87f2gpXAwy72WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740146745; c=relaxed/simple;
	bh=YiJ/Qghnk0jq0ET6Vz0pUevyXrZcESw1J1T+Ctvxad8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0Nbnwj5i7TpXJ040QggwdUKEDmvDSJSSrX+NHRcSlxrDon7YSIwhaVLeARxS49EXQGdEetzbfbS9/jVoe6fBXiiAMEP67KLPhKImJbihCi/BjJhB3eUnO07ZK5GiUkxD4QqtZuQPwAgPkG6x0SaY3vllrGgKfsB90Nd7bGmVn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tlTet-00007v-00; Fri, 21 Feb 2025 15:05:39 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id BF6E6C03B4; Fri, 21 Feb 2025 15:04:35 +0100 (CET)
Date: Fri, 21 Feb 2025 15:04:35 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Aleksandar Rikalo <arikalo@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] MIPS: Allow using multi-cluster with a broken HCI.
Message-ID: <Z7iH83W6Og2AA92f@alpha.franken.de>
References: <20250123-cluster-hci-broken-v3-0-8a7ec57cbf68@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123-cluster-hci-broken-v3-0-8a7ec57cbf68@bootlin.com>

On Thu, Jan 23, 2025 at 12:01:53PM +0100, Gregory CLEMENT wrote:
> Hello,
> 
> Some CM3.5 reports indicate that Hardware Cache Initialization is
> complete, but in reality it's not the case. They also incorrectly show
> that Hardware Cache Initialization is supported. Unfortunately, it is
> not possible to detect this issue at runtime and the information has
> to be passed by the device tree.
> 
> In this third version, I rebased on v6.13. I also addressed remarks
> made by Rob and Krzysztof, and endeavored to add more explanation
> about CM, explaining why we now need to represent it in the device
> tree.
> 
> My initial proposal was integrated into the series set by Aleksandar
> here [1]. And the series adding the CM binding was here: [2]. The
> patches 1,2,3, and 5 have no dependencies while patch 4 should depend
> on this series [1]. Actually, those five patches should replace
> patches 10, 11, and 12.
> 
> Gregory
> 
> [1]: https://lore.kernel.org/all/20241028175935.51250-1-arikalo@gmail.com/
> [2]: https://lore.kernel.org/all/20240612-cm_probe-v2-5-a5b55440563c@flygoat.com/
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
> Changes in v3:
> - Provide a more detailed explanation about the CM in the device tree binding.
> - Make the reg property optional for all compatible strings.
> - Use "mobileye" instead of "mti" for the eyeq6-cm compatible string.
> - Address and correct the formatting issues in example and description.
> - Link to v2: https://lore.kernel.org/r/20250116-cluster-hci-broken-v2-0-fc52cfb7a19e@bootlin.com
> 
> Changes in v2:
> - Use compatible string instead of property
> - Link to v1: https://lore.kernel.org/r/20241115-cluster-hci-broken-v1-0-00636800611d@bootlin.com
> 
> ---
> Gregory CLEMENT (5):
>       dt-bindings: mips: Document mti,mips-cm
>       dt-bindings: mips: mips-cm: Add a new compatible string for EyeQ6
>       MIPS: cm: Detect CM quirks from device tree
>       MIPS: CPS: Support broken HCI for multicluster
>       MIPS: mobileye: dts: eyeq6h: Enable cluster support
> 
>  .../devicetree/bindings/mips/mti,mips-cm.yaml      | 57 ++++++++++++++++++++++
>  arch/mips/boot/dts/mobileye/eyeq6h.dtsi            |  4 ++
>  arch/mips/include/asm/mips-cm.h                    | 22 +++++++++
>  arch/mips/kernel/mips-cm.c                         | 14 ++++++
>  arch/mips/kernel/smp-cps.c                         |  5 +-
>  5 files changed, 101 insertions(+), 1 deletion(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

