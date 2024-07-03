Return-Path: <linux-mips+bounces-4107-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81285926492
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 17:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D4B2281A75
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 15:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0293417FAD4;
	Wed,  3 Jul 2024 15:13:08 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2939180A8C;
	Wed,  3 Jul 2024 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720019587; cv=none; b=kfjrZFZ+SmPmenHWvVeAOpzDwBfl+h5mogJ9upihEMEwuc/GpsHwLuMIq/xRvQ47Jk2fSVy1V42FXqtG7xLN6InsYW3t80C0sVUm8C/UPvM11wN/tcfeT2FQetC1gb+p2F28hBgQVfp9uxmzR8zM8OUD5HDBYzl2c6gj33ajbQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720019587; c=relaxed/simple;
	bh=0BJr0XI6mAaHzmUHZcGXPiiFlw7kDDa7xgjNkKNbqMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pcle5qluKpFZbwLccg/qxY/DM+GbSAsWJlM+7qkUOA34ttFbhHohnCWuN8HqjFlvXRTXpCDcyeegAOmfYHTB1bDWztu8F+rHYtj4QT3jcS/7mzjsC33iCzPBUJ/AI7CZVA6veGLmSmsrR+82CvJ2NmogbnoFiECisAAPSdynUpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sP1eq-0000BH-00; Wed, 03 Jul 2024 17:12:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 72759C0411; Wed,  3 Jul 2024 17:04:49 +0200 (CEST)
Date: Wed, 3 Jul 2024 17:04:49 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] MIPS: smp: Make IPI interrupts scalable
Message-ID: <ZoVokcDYqZnuqd2X@alpha.franken.de>
References: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com>
 <20240616-b4-mips-ipi-improvements-v1-1-e332687f1692@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240616-b4-mips-ipi-improvements-v1-1-e332687f1692@flygoat.com>

On Sun, Jun 16, 2024 at 10:03:05PM +0100, Jiaxun Yang wrote:
> Define enum ipi_message_type as other architectures did to
> allow easy extension to number of IPI interrupts, fiddle
> around platform IPI code to adopt to the new infra, add
> extensive BUILD_BUG_ON on IPI numbers to ensure future
> extensions won't break existing platforms.
> 
> IPI related stuff are pulled to asm/ipi.h to avoid include
> linux/interrupt.h in asm/smp.h.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/cavium-octeon/smp.c   | 109 ++++++++++++-----------------------
>  arch/mips/include/asm/ipi.h     |  34 +++++++++++
>  arch/mips/include/asm/smp-ops.h |   8 +--
>  arch/mips/include/asm/smp.h     |  42 ++++++--------
>  arch/mips/kernel/smp-bmips.c    |  43 +++++++-------
>  arch/mips/kernel/smp-cps.c      |   1 +
>  arch/mips/kernel/smp.c          | 124 ++++++++++++++++++++--------------------
>  arch/mips/loongson64/smp.c      |  51 +++++++++--------
>  arch/mips/mm/c-octeon.c         |   2 +-
>  arch/mips/sgi-ip27/ip27-smp.c   |  15 +++--
>  arch/mips/sgi-ip30/ip30-smp.c   |  15 +++--
>  arch/mips/sibyte/bcm1480/smp.c  |  19 +++---
>  arch/mips/sibyte/sb1250/smp.c   |  13 +++--
>  13 files changed, 236 insertions(+), 240 deletions(-)

you are touching a lot of platforms, how many did you test ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

