Return-Path: <linux-mips+bounces-6728-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EBE9C5D72
	for <lists+linux-mips@lfdr.de>; Tue, 12 Nov 2024 17:37:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55103B3E36E
	for <lists+linux-mips@lfdr.de>; Tue, 12 Nov 2024 15:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25CA2022D9;
	Tue, 12 Nov 2024 15:09:21 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C45200C8D;
	Tue, 12 Nov 2024 15:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424161; cv=none; b=ftKsOALZq7NbUTDBeQJn9ILtBBCfGbqkySzqO3yI0my3GUiS9mmoFF4a6+We7pOu6B6smLszGb0+zpkGhRhbtWxqAoqaYxjJKWIhnwUxT0qhDOEGVA0HwejNAXc6jQWcGtZLO9TFBH5mYqV1X22xdEreYDMW/ewagr9pSuo9uK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424161; c=relaxed/simple;
	bh=yC7qNkZa2EQhkOswYkNu3xJNB7x6A6biSjIrvj5GG6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4Glf+Pt96tXbcI+LWfIRQXn3WGykc+PoDNtSUiBmdZu8npx4BHxqg3gPTIFijyfXXfHX0FFM3ueaT7SBT0N7BNHKVZyaXFhMBolXSr5X28oS2WnyZixzMBWvIQvBe+GhGsyQ+gemYN8EvXbVXgqmrhlSmxevqZpAOhGN4Gs0Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tAsVf-0004rX-00; Tue, 12 Nov 2024 16:08:51 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 2D528C014F; Tue, 12 Nov 2024 15:58:23 +0100 (CET)
Date: Tue, 12 Nov 2024 15:58:23 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: WangYuli <wangyuli@uniontech.com>
Cc: dhowells@redhat.com, jlayton@kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, chenhuacai@kernel.org,
	kernel@xen0n.name, jiaxun.yang@flygoat.com,
	guanwentao@uniontech.com, zhanjun@uniontech.com,
	xuerpeng@uniontech.com, maqianga@uniontech.com,
	baimingcong@uniontech.com
Subject: Re: [PATCH 0/2] MIPS: loongson3_defconfig: Enable blk_dev_nvme by
 default
Message-ID: <ZzNtD+b4zgfdFUe7@alpha.franken.de>
References: <324362BC443F16F8+cover.1730638429.git.wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <324362BC443F16F8+cover.1730638429.git.wangyuli@uniontech.com>

On Sun, Nov 03, 2024 at 09:00:03PM +0800, WangYuli wrote:
> A significant number of 3A4000 machines come with NVMe drives
> pre-installed, so we should support it in its defconfig.
> 
> To avoid confusion, update defconfig beforehand.
> 
> WangYuli (2):
>   MIPS: loongson3_defconfig: Update configs dependencies
>   MIPS: loongson3_defconfig: Enable blk_dev_nvme by default
> 
>  arch/mips/configs/loongson3_defconfig | 32 ++++++++-------------------
>  1 file changed, 9 insertions(+), 23 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

