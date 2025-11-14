Return-Path: <linux-mips+bounces-12251-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C043C5E1AB
	for <lists+linux-mips@lfdr.de>; Fri, 14 Nov 2025 17:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21D47425ECC
	for <lists+linux-mips@lfdr.de>; Fri, 14 Nov 2025 15:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30E2BA3D;
	Fri, 14 Nov 2025 15:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Y6nENrEz"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EDEDDC3
	for <linux-mips@vger.kernel.org>; Fri, 14 Nov 2025 15:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763135582; cv=none; b=dMulk8Lg2gQuASGcdG9sk5O6pB4Mm7Uhc518spTYqUFYa9t9GDKQIwMfgEQ4q8JrNh5LDUifPfayQbTGCrt/RNbeiDUhTYAZDca0CvYy/kmH/I6H54XP1kqU9PzRny5IvIR2+3PMncpZnejyY+Qsxm5asI6nzkUolUGMnXyvnyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763135582; c=relaxed/simple;
	bh=OtkvQawlvaLA53HOpYqn/YTAHyA9enKQN4NaUUGO7kc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qHPeHcyREAhv5KTxVUk79Plyp3gzhgKbVjgJPthQdsCrWAiZzFtMvC9yPKtE7qLNcjUrUg5p2ZpSf8CancOqPBDXR6YZWL3d1maMorgmv6exPjqGUGHZwgR0VEg1S4RAE698QkQUY3/QGnpOujdZeKg1GERDi+gnqVIoNnZbhO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Y6nENrEz; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0B4C21A1A99;
	Fri, 14 Nov 2025 15:52:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6D146060E;
	Fri, 14 Nov 2025 15:52:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBBF710371C28;
	Fri, 14 Nov 2025 16:52:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763135576; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JQSd1KsrSpMHJVFfVPczCP360X+S7DkkJ1m3ffPCtwQ=;
	b=Y6nENrEzPJPv7ILXydL1UXjZ+ck9C63v3NJfv46ZQ1pOuJp6S3nOyWfxghk3KRfKAxC7D3
	NEK4uVOGwnzbTtxr3DWFgOKPNH2KcLYt7Fx3sUcRUVRaS6Mgx3ImENX0hHUsYmNFcyRBqu
	QLDB1j0ce1R+qDnEgdEpuDM9Wa3Lt+E7dD+IuoJSH/gN+0GM1DShBg6cLyH/SrcGN2FqG6
	w6DYJ2Yqa2DLQI1uM7d/iXcMwXOx4xVEsXasNA7IrToPmXKvpo02qnpZpTGADXMFS1QuFN
	yxyZ53Fqz7vfLoQ/SGVopH4EREcQI4lMtFl+/nvP79zWsi3gR+ZlGxtyG1Xx/Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, =?utf-8?Q?Th?=
 =?utf-8?Q?=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] MIPS: Fix HOTPLUG_PARALLEL dependency
In-Reply-To: <aRH4osz_OFxx8QZc@alpha.franken.de>
References: <20251027-mips_paralell_hotplug-v1-1-01b6cd13ee85@bootlin.com>
 <87v7jirnj0.fsf@BLaptop.bootlin.com> <aRH4osz_OFxx8QZc@alpha.franken.de>
Date: Fri, 14 Nov 2025 16:52:54 +0100
Message-ID: <87seegr4q1.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Thomas Bogendoerfer <tsbogend@alpha.franken.de> writes:

> On Mon, Nov 10, 2025 at 03:05:23PM +0100, Gregory CLEMENT wrote:
>> Hello Thomas,
>>=20
>> > With MIPS, it is possible to have SMP enabled without HOTPLUG_CPU
>> > selected. However, in kernel/cpu.c, some code that uses
>> > HOTPLUG_PARALLEL also requires HOTPLUG_CPU to be selected. Therefore,
>> > we should fix the HOTPLUG_PARALLEL dependency to depend on
>> > HOTPLUG_CPU, not just SMP.
>> >
>> > Reported-by: kernel test robot <lkp@intel.com>
>> > Closes: https://lore.kernel.org/oe-kbuild-all/202510270120.21wA1aX1-lk=
p@intel.com/
>> > Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>>=20
>> Do you have any comments about this fix?
>
> all good from my side, does it need to go via mips-fixes ?

This fixes a build failure that occurs only in unusual kernel
configurations, so from my point of view, it is not critical.

Gregory

>
> Thomas.
>
> --=20
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 ]

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

