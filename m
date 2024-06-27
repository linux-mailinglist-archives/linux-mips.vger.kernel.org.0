Return-Path: <linux-mips+bounces-3992-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C13F091AFD9
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 21:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 697DE1F230FD
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 19:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD06119A28C;
	Thu, 27 Jun 2024 19:51:33 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2AF2D047;
	Thu, 27 Jun 2024 19:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719517893; cv=none; b=LGeGA/ye/2P6rKOnOySF4SP4yqIIDFjRkpxOMX7AK/J4+hHLXUY5QGBWmHsHf7cheBa5OAbXkRDvH2VO8uOEjpJQW1R0ugviVDwWhbv/SND3geVm7/XcK+GjR+v6Hn+UsJmgqnymvTLgTZO/wbvmCTe7ykCLSg3pUY8Gp8/xguo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719517893; c=relaxed/simple;
	bh=70LhU90qdQV39rroTRoNGijMZG/8DrhJZReHncgOsp0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JhbvJ9GsNj8VNEHtbPLrnlCVsi+skvXmOpQ4IqhvWHQCPJOq7fR/4J9CQgWsJKrVKdFRUtGRwh4FyBW6XWCf45vaReoC6JIHqQmAAMau6vBLBsEbd+PiJSYzhSM1hxliIpTuF033TNrHOS2ZqWHRTvFKDn7eXD9TS5S7I141QoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id C47C292009C; Thu, 27 Jun 2024 21:51:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id BE4A592009B;
	Thu, 27 Jun 2024 20:51:22 +0100 (BST)
Date: Thu, 27 Jun 2024 20:51:22 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
    linux-kernel@vger.kernel.org, 
    "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH fixes 3/4] MIPS: cps-vec: Replace MT instructions with
 macros
In-Reply-To: <394042b6-37ef-4011-b799-454036d8bc34@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2406272046020.43454@angie.orcam.me.uk>
References: <20240616-mips-mt-fixes-v1-0-83913e0e60fc@flygoat.com> <20240616-mips-mt-fixes-v1-3-83913e0e60fc@flygoat.com> <Zn0qG5tsMBYcSWW+@alpha.franken.de> <394042b6-37ef-4011-b799-454036d8bc34@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Jun 2024, Jiaxun Yang wrote:

> > how about simply enforcing the need for a correct toolchain instead
> > of making the code ugly ?
> 
> Unfortunately, MT for microMIPS which I'm trying to bring up is only in
> binutils master, it's not in any binutils release yet.

 It's not yet in binutils master either.  Has there been any actual chip 
taped out with this instruction subset supported?

  Maciej

