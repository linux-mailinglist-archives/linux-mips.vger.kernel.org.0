Return-Path: <linux-mips+bounces-12386-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B9EC9671E
	for <lists+linux-mips@lfdr.de>; Mon, 01 Dec 2025 10:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BB6C24E2391
	for <lists+linux-mips@lfdr.de>; Mon,  1 Dec 2025 09:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C05303A27;
	Mon,  1 Dec 2025 09:45:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF693019BD;
	Mon,  1 Dec 2025 09:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764582309; cv=none; b=g9uJTNRIDojsAf2Uk7g+RN5sCsNEjv7N1Z32J3NKjVc9UHwO+CpU+FOZgX5A2tpD2vwnaVhsWcFcu3xAQ8sPvoVRjcpl/OZNRfzLtXTGxmfCPgtLwmxv+2fVkQfVn3+5+II4lXyIJ4RfAxp48Ap/mFoeshoj0erPoqiRlaiIVGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764582309; c=relaxed/simple;
	bh=FqTqFJSA5qPDLgfkXGAilixcN3pn3gq5tHWX+PoRrXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JS0Z9ezjR+gRBM2WE1xE+Uw8znPKJ2eMkGheTJmuRwoDPsl4a5R7wS/bDx8OY9mZi0AOCekCzB+rGjsMW15hjbcaDji+8uSN70bc+Ii+0C0u6iDCyhLOqxOPFyuV4FbK7Ffq2RHwVydUV/yaOQVXc+4SWs8XQO8uW9RX+bzV7y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vQ0Sn-0002fu-00; Mon, 01 Dec 2025 10:44:57 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 189F5C07B3; Mon,  1 Dec 2025 10:42:10 +0100 (CET)
Date: Mon, 1 Dec 2025 10:42:10 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: keguang.zhang@gmail.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: configs: loongson1: Update defconfig
Message-ID: <aS1i8mcfxWf5LIz_@alpha.franken.de>
References: <20251116-loongson1_defconfig-v1-1-e1d546e00bb4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251116-loongson1_defconfig-v1-1-e1d546e00bb4@gmail.com>

On Sun, Nov 16, 2025 at 06:08:33PM +0800, Keguang Zhang via B4 Relay wrote:
> From: Keguang Zhang <keguang.zhang@gmail.com>
> 
> Update loongson1_defconfig to reflect recent Kconfig changes:
> - Replace CONFIG_MTD_NAND_LOONGSON1 with CONFIG_MTD_NAND_LOONGSON,
>   since commit 7a1e3a452a57 ("mtd: rawnand: loongson1: Rename the
>   prefix from ls1x to loongson").
> - Enable CONFIG_ETHTOOL_NETLINK, since commit 9ff2aa4206ef ("net:
>   ethtool: mm: extract stmmac verification logic into common library")
>   makes STMMAC_ETH depend on it.
> 
> In addition:
> - Enable CONFIG_JUMP_LABEL to allow optimized static branch handling.
> - Disable unnecessary options.
> - Enable CONFIG_TEST_DHRY as a module.
> 
> Fixes: 7a1e3a452a57 ("mtd: rawnand: loongson1: Rename the prefix from ls1x to loongson")
> Fixes: 9ff2aa4206ef ("net: ethtool: mm: extract stmmac verification logic into common library")
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
>  arch/mips/configs/loongson1_defconfig | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

