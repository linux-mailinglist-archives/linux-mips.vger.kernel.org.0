Return-Path: <linux-mips+bounces-5813-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C97996A2B
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2024 14:37:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 056F128639E
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2024 12:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1EE19413C;
	Wed,  9 Oct 2024 12:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YaRGcAan"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0AA1E4AE;
	Wed,  9 Oct 2024 12:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728477462; cv=none; b=Th/YUFSXooXiiD1NeKRVEpklny/tbjwXJ48G/t81rviWyjvb+08BUWGJnVXUaKi3vii5LBHZ/EuTdZMxjPll/OWTD09U0gP5/xsR+Gtg3DADZRq6XaFtOGYu+klIP5Ye2vjGAveEA+G0lu4Jr3hrauwizIgP4beHqRM6qgNy/38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728477462; c=relaxed/simple;
	bh=SiPDqZbxdSHfqnUOudAIzwHzWZ2S9RZMyYHTMYzP3+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3aWXm96pUKGXXPyyYB0y68w2qGs7Dq3A2uve1tFNnXPGjcAofEyNGvbQRExy2sCaN86zioRbHKDtelBzEUQvtzatku2oCCE2PGus33dLN1G28GGOCNAx4ecxdqapys51srSIkXUY2CImGfaX7E+KixrjGzRJDWwWBh1TYkrr1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YaRGcAan; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1073AC4CEC5;
	Wed,  9 Oct 2024 12:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728477461;
	bh=SiPDqZbxdSHfqnUOudAIzwHzWZ2S9RZMyYHTMYzP3+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YaRGcAanTwjPEkDoyGR9D6z5u3sMlPha6DWGOE3lb0ty7pGXzFuMMuNwq9OzbFlq7
	 8m3XnrP2/LEeJqq3rNLC4xqZDt+1+t/wszAoZQEq9XuPA7AAoCMeBnb+m/ystzAut9
	 a/woHoyBuGKKxKUIc5zsamSBMZibvU/tfJrmQnuCIp3VcV+twrS3tX+u4HjGIqFm03
	 MIoVvCvAeeSCRsqCBwpGYn4xxuLInE1TXkTf73VDTzb7p58euLetE1oowAAllyDOgC
	 i/S8jJUzMsbp4BjSmw3CC4woc4DTRhu2CLQNkBsoKfnqtsEgxPP9khl542ZmvL7Y+8
	 JcavTl2PwmUbA==
Date: Wed, 9 Oct 2024 13:37:35 +0100
From: Simon Horman <horms@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, kda@linux-powerpc.org, arnd@arndb.de,
	tsbogend@alpha.franken.de, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
	pctammela@mojatatu.com, victor@mojatatu.com,
	coelacanthushex@gmail.com, jhs@mojatatu.com, shannon.nelson@amd.com,
	sd@queasysnail.net, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next] eth: remove the DLink/Sundance (ST201) driver
Message-ID: <20241009123735.GR99782@kernel.org>
References: <20241008154824.1448370-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008154824.1448370-1-kuba@kernel.org>

On Tue, Oct 08, 2024 at 08:48:24AM -0700, Jakub Kicinski wrote:
> Konstantin reports the maintainer's address bounces.
> There is no other maintainer and the driver is quite old.
> There is a good chance nobody is using this driver any more.
> Let's try to remove it completely, we can revert it back in
> if someone complains.
> 
> Link: https://lore.kernel.org/20240925-bizarre-earwig-from-pluto-1484aa@lemu/
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


