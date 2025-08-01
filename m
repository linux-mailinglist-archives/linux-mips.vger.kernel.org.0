Return-Path: <linux-mips+bounces-9969-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25697B1840B
	for <lists+linux-mips@lfdr.de>; Fri,  1 Aug 2025 16:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3F311C26CFA
	for <lists+linux-mips@lfdr.de>; Fri,  1 Aug 2025 14:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3DB26FD9D;
	Fri,  1 Aug 2025 14:39:08 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C8D26E6FF;
	Fri,  1 Aug 2025 14:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754059148; cv=none; b=RkhGsLxpY3Dipdntg5FRpCF1AKX8T0eEyNx8QDS7qpe2uKggjDnvcyhlhqhSOtZX3oMUjqY7KVCN0wXF3K6Mr5CW8wGjeKXRfvRlCPvZBARHdPd+wWPyiY3fjpjUx0ENVq5qXTL3+a4eBIqov41X1fD62NBX6mWw0EoJI3LNKhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754059148; c=relaxed/simple;
	bh=IcezTalOWFZQSNIiHJiqCX6sCIDcVXeYSjmRMAwhAV8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GWno3/zTHiiCZdGNDLGJzNklgYZSexsKB+J+lQP6nhuug612UM9g+Ye42b+ELIsmoo/A6hD2xoJyqMbBLOVo7nOBGA1oXzq/VqmCDqTcL2dIcl7OewICyAqxWZHCiO2NfuGAIki59izrIIixIGvTt9sRnbSGNv9YbXqvZxEvmbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id AFFE692009C; Fri,  1 Aug 2025 16:38:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id AAF1792009B;
	Fri,  1 Aug 2025 15:38:57 +0100 (BST)
Date: Fri, 1 Aug 2025 15:38:57 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2] tty: serial: ip22zilog: Use platform device for
 probing
In-Reply-To: <20250725134018.136113-1-tsbogend@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2508011536550.5060@angie.orcam.me.uk>
References: <20250725134018.136113-1-tsbogend@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Jul 2025, Thomas Bogendoerfer wrote:

> After commit 84a9582fd203 ("serial: core: Start managing serial controllers
> to enable runtime PM") serial drivers need to provide a device in
> struct uart_port.dev otherwise an oops happens. To fix this issue
> for ip22zilog driver switch driver to a platform driver and setup
> the serial device in sgi-ip22 code.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---

 Shouldn't this be backported as a fatal regression?

  Maciej

