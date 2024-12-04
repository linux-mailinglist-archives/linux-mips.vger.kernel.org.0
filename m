Return-Path: <linux-mips+bounces-6864-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE98E9E3DD6
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 16:08:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C823F1610FA
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 15:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365BB20B20C;
	Wed,  4 Dec 2024 15:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFfvUCi0"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB40B1FECCF;
	Wed,  4 Dec 2024 15:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733324923; cv=none; b=qdTeIKQx68q2NCq/Yry4uQ7/SfMtpFM0do58nMHtw3SLJ9eIO0TfD/a2vHXeOiFUgbHPCGAwi760TmYUSYx35amDcRLc+lEAu9w2MBEe6tHdSMXPEy65qwsZJC3gxyUDLa0BBL6q4OKpSlID4nhCd957/QbqVthGg3HrCCX7pLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733324923; c=relaxed/simple;
	bh=bOvjXR7DjQxVadLJ8k7iTckhKaWL1iANcy3iBDNJkHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGyQPFSHld4IgVPTfTIIiQD2EB9MvE+WnVv3n3oibgDLFFz2hMxJ4YSrueQ37+0+QjshBrzGkITeD5Og/xRNx1VS9ktT+aeskIM5ok5Dm/aIkdwGm5K2Kyu5mhk7VGWjXqV5ojXgUmzj+zGiMYYosiH5uNaNeJWZgG5nEUqhL+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFfvUCi0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FD9C4CECD;
	Wed,  4 Dec 2024 15:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733324922;
	bh=bOvjXR7DjQxVadLJ8k7iTckhKaWL1iANcy3iBDNJkHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZFfvUCi00kT7AGs+VENzQj4lZ40qJZRSZVQtwHYguYtqvdHkBZeIQnqHgFBGfacxg
	 wWn3CMgJGe1o6m6XoHcrAxXEKxCTkW0EfSTAeTVJmJdp/V+R78Efd8PCq5jGHdZ3Ou
	 a9h2NCsL10VbTFwbE22x2ob3QnjxqwMV1adXcy++q+yLqXCa+vIgth8O5tyEN11qTI
	 yusRre2PpS3rUQbDiaySgeVOG3f6JYfL6uPG5d1OM4Q4pzZC/fxKjizy+QhQIG7xWT
	 3u2/a2abnbML4KeLnIpn7fOq1UrlSmlEKCioy4xNEksf9++q9NMh3/ld66m9VKSrcw
	 X/xOb+3HLTXGQ==
Date: Wed, 4 Dec 2024 09:08:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH 1/6] dt-bindings: nvmem: rmem: Add
 mobileye,eyeq5-bootloader-config
Message-ID: <173332492012.275936.4084895075135236476.robh@kernel.org>
References: <20241203-rmem-v1-0-24f4970cf14e@bootlin.com>
 <20241203-rmem-v1-1-24f4970cf14e@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203-rmem-v1-1-24f4970cf14e@bootlin.com>


On Tue, 03 Dec 2024 14:55:44 +0100, Théo Lebrun wrote:
> On Mobileye EyeQ5, the bootloader will put MAC addresses into memory.
> Declare that as reserved memory to be used by the kernel, exposing
> nvmem cells. That region has a 12-byte header and a 4-byte trailing CRC.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  Documentation/devicetree/bindings/nvmem/rmem.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


