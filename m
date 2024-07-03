Return-Path: <linux-mips+bounces-4127-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EBC926A31
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 23:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E5B82850A6
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 21:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABBC190694;
	Wed,  3 Jul 2024 21:26:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5536218F2CC;
	Wed,  3 Jul 2024 21:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720041987; cv=none; b=I913rMYtH+BXc9D00AUVsSGT141qp5c0/1vHYANsMyyy9lT+EpNLo5cyHqw3w2TZO6NgnTd9x9KOKceFbkmwxp1vZ8VzWTfQTErZNHi2NiUOvGurc3LYW/UoPNfg5CZj1qExq4tNvxRfFUBc4w5Sy1sab5j1/jB0h8x1V0WmsWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720041987; c=relaxed/simple;
	bh=Fs6SHOQyWt/sTTN7ao19Ti4e/qXUBL66vJvUwotoTSU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ooh+YeMA/nrQddWUADlDL1B2fh7Cz8HqgR6BXvYckLjnBDq15GJZDJBPDnF57qQIyS/Oult1/Ml1qjDCpF9GF0lTc551TbblZiQGxsLUcCXqokB3+J5eZsCOdmqIk2Sw/HrrZlLx5uV891tzcmn0DLJdBjpQpbKUbyNcqVcr720=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 08E7892009C; Wed,  3 Jul 2024 23:26:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id EFEFF92009B;
	Wed,  3 Jul 2024 22:26:21 +0100 (BST)
Date: Wed, 3 Jul 2024 22:26:21 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Florian Fainelli <florian.fainelli@broadcom.com>, 
    Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
    Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
    Serge Semin <fancer.lancer@gmail.com>, 
    "paulburton@kernel.org" <paulburton@kernel.org>, 
    "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] MIPS: smp: Make IPI interrupts scalable
In-Reply-To: <7a822a33-dd67-4827-bbd0-01e75e203951@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2407032204331.38148@angie.orcam.me.uk>
References: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com> <20240616-b4-mips-ipi-improvements-v1-1-e332687f1692@flygoat.com> <ZoVokcDYqZnuqd2X@alpha.franken.de> <7a822a33-dd67-4827-bbd0-01e75e203951@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 Jul 2024, Jiaxun Yang wrote:

> It has been tested on MIPS Boston I6500, malta SOC-It, Loongson-2K,

 SOC-it (or SOC-it 101 to be precise) is the name of a bus controller:

System controller/revision =    MIPS SOC-it 101 OCP / 1.3   SDR-FW-4:1

used across numerous platforms from the M4K core onwards, UP, MT, or MP.  
I think it would make sense if you revealed the processor type instead.

> I don't really know broadcom platforms and SGI platforms well so
> changes to those platforms are kept minimal (no functional change).

 Technically I could run it on my SB1250, but I'm too overloaded now to 
commit to any timescale.  Sorry.

  Maciej

