Return-Path: <linux-mips+bounces-6002-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E4099B501
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2024 15:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 521D31F21C6E
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2024 13:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C62514D457;
	Sat, 12 Oct 2024 13:09:57 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96ED21474B8;
	Sat, 12 Oct 2024 13:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728738597; cv=none; b=nVhUSqoa46WZxT/CtjMzgZvmP4VzWSSk0hcwd/18hyFvtSrP9jYuLHxEHL1sJmbOiWuboeus4wuuCi+JAKYGrOitRc4Zb2+P+nBEtKtOFhgCEjGVukHDchpwUV4YM1DRyp/xs356j9f7WJ//zlVXMXexNrZTn71XFlET8lOUsUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728738597; c=relaxed/simple;
	bh=rk7cM+I/bC7XdvvRLM2pCNrgl+qpW/UahFwahds+XGY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ew9P0m4W42jKU+P6IMRqJCD6y1JGvyFHr+sQIjpLs8/4kCSrLmtIpOQ47m13D+9CP+Xi3XMvtGBRB0W4w5VeEa/lZ0P6tgef2kxNNZ9DcAyqiUxAH90P48VIeK73DkyT7Qn/zHf50Il8hszrCUkGOhP529UCVDSflcGzOy7c+wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 7D86792009C; Sat, 12 Oct 2024 15:09:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 72B0192009B;
	Sat, 12 Oct 2024 14:09:46 +0100 (BST)
Date: Sat, 12 Oct 2024 14:09:46 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jonas Gorski <jonas.gorski@gmail.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: asm: fix warning when disabling MIPS_FP_SUPPORT
In-Reply-To: <20241012-mips-fcr31-warning-v1-1-bac1d869d775@gmail.com>
Message-ID: <alpine.DEB.2.21.2410121408320.40463@angie.orcam.me.uk>
References: <20241012-mips-fcr31-warning-v1-1-bac1d869d775@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 12 Oct 2024, Jonas Gorski wrote:

> Fix this by providing an empty body for __sanitize_fcr31() like one is
> defined for __mips_mt_fpaff_switch_to().

Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>

  Maciej

