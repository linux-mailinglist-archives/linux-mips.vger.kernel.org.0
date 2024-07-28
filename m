Return-Path: <linux-mips+bounces-4566-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EA393E898
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jul 2024 18:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D2351F21964
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jul 2024 16:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA51251C4A;
	Sun, 28 Jul 2024 16:26:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF9558ABC;
	Sun, 28 Jul 2024 16:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722183985; cv=none; b=gm4gdbFM45yZk+Zs40cd3PGFiaNSs93P5koP4q434FYh89SmjJCNqOz5nWS1WzONj0msxnwXWA3xCUYgLzCcglFhVYyFXn4OlyLlyoeEjrRwng/D1ttQNk2IJk/PviriSew/bwegbRFTBPOwGyYGcAQiRmX3Ct9SoKpdmycoP3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722183985; c=relaxed/simple;
	bh=PXrsrHGj7NpsS3ZTS81j2yssV8sqJxIgCxeT/WbUVcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPzAN7fhDQ7vnr2X5dv6xFxCYBhJPBMfr5DQEVIPNkT9z98PhFnChrtJ0NTVQIb3ak6weXNMR2UiRwn1S6V6CpYaVUs0oV5p3//7qylrFNB26HEs+Zzi4mQaMHGBQ34FUo4pXjZ808QYPRuR1EUc36YDr4TcEUm80EbmgXNMqnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=176.9.242.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 6D459100DA1A1;
	Sun, 28 Jul 2024 18:26:19 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 3D7B216805; Sun, 28 Jul 2024 18:26:19 +0200 (CEST)
Date: Sun, 28 Jul 2024 18:26:19 +0200
From: Lukas Wunner <lukas@wunner.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, Stefan Berger <stefanb@linux.ibm.com>,
	linux-crypto@vger.kernel.org
Subject: Re: Mips handling of signed integer overflows
Message-ID: <ZqZxK0fWpVxemcuu@wunner.de>
References: <Zp5nGEBD41jBnw6B@wunner.de>
 <alpine.DEB.2.21.2407221532520.51207@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2407221532520.51207@angie.orcam.me.uk>

On Mon, Jul 22, 2024 at 03:59:00PM +0100, Maciej W. Rozycki wrote:
> On Mon, 22 Jul 2024, Lukas Wunner wrote:
> > I assume this means that the compiler uses non-trapping instructions
> > for addition/subtraction on Mips.  Consequently, calling die_if_kernel()
> > from do_ov() in arch/mips/kernel/traps.c should no longer be necessary
> > as it can never happen.
> > 
> > Can you confirm or deny this?
[...]
>  MIPS C compilers have never produced trapping addition/subtraction 
> instructions, which have been reserved for use by other programming 
> languages.  And GCC specifically has never produced these instructions for 
> any of the languages supported, there are no patterns in the MIPS backend 
> defined that would produce these instructions.  The only way to encounter 
> one of them in the execution stream is by means of handcoded assembly.
[...]
>  Did I answer your question?

Yes thank you this helps greatly.

Lukas

