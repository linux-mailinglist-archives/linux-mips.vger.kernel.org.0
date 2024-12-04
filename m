Return-Path: <linux-mips+bounces-6867-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 809079E3E9F
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 16:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B102280DDE
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 15:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71E820C03E;
	Wed,  4 Dec 2024 15:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oz2e3Lkb"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F7A209F5B;
	Wed,  4 Dec 2024 15:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733327222; cv=none; b=YcN82A0pGZMuUFTCMyUZqtfmitiL10+HwEaeo7eOvtqSM5a9fYt2tt1C4ByRCsUT0CyEObfAdblSfYJjRr/pErvOUSNSAHsA9+kARuL+rIoBlGbUYJhsvcCIa88ItzMjum1y1jNwlA4Q5rMixv0KAH8nvt2OElTWrx0nQ+vzIfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733327222; c=relaxed/simple;
	bh=FwNFQcl4cgd3/BwuxEZQH+GmcGB9xhfUvptIiI1iUn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fguSIJRN3/nAam3C5WXvL+NBUKYx0t0vYqa8cyt+uENaeSiwDElw/ELqcii7cbFbd/1iBnPpefZornYHx8Oe5/ZHl/8CEopPh5pqXeMF3EpC9Lp/IUXxup5S6AeTzmhNwLQN2B8/Ulq8sHTPCeM+JjTs2gYtWpcnm84hHtjhT6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oz2e3Lkb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28323C4CECD;
	Wed,  4 Dec 2024 15:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733327222;
	bh=FwNFQcl4cgd3/BwuxEZQH+GmcGB9xhfUvptIiI1iUn8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Oz2e3LkbDWJn054d6nimwFMrWTvws2toPLQrKw+FYQPxTTGgE+mrb3IMSXJUVRP2s
	 9sn4fq58ZRqGjARX31SZohWRWvQJt7CHLCSOoPNw2pwnitL9N+MOXKcYONClYyuUw0
	 ybJm2KvSOinaMEYOCUZoPZhZh9UrPTXG7RFFZmAGez6uldHB5++YNwy9nI5I2wdTmz
	 Ujx37wKDpTlaIEZwQHv5ECCd8dtPCL0MJg35XJc66Ysb7qcjIpN1iO88lYYrwc98wD
	 eEo7WamLigJa07u3F7beSx6Uu60g9Gn+aYVp08ECerXSdYMdlWoUakfnWkBSjUro4l
	 tKLGfEr4bgtRg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id B2E62CE0843; Wed,  4 Dec 2024 07:47:01 -0800 (PST)
Date: Wed, 4 Dec 2024 07:47:01 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Guenter Roeck <linux@roeck-us.net>, LKML <linux-kernel@vger.kernel.org>,
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, Paul Burton <paulburton@kernel.org>
Subject: Re: [PATCH v2] tracing: Remove definition of trace_*_rcuidle()
Message-ID: <000a4736-bf65-4fe2-a764-e383927bb59e@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20241003181629.36209057@gandalf.local.home>
 <bddb02de-957a-4df5-8e77-829f55728ea2@roeck-us.net>
 <20241203155542.462b1b21@gandalf.local.home>
 <ee401848-f7a1-4877-b896-36bec32ca985@roeck-us.net>
 <20241203220153.3f81f12b@gandalf.local.home>
 <60749a43-17ad-4491-a13f-a2db7b6cb00c@paulmck-laptop>
 <20241204093356.2d578657@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204093356.2d578657@gandalf.local.home>

On Wed, Dec 04, 2024 at 09:33:56AM -0500, Steven Rostedt wrote:
> On Tue, 3 Dec 2024 21:01:59 -0800
> "Paul E. McKenney" <paulmck@kernel.org> wrote:
> 
> > > Paul?  
> > 
> > Looks plausible to me, though I don't understand why the introduction
> > of trace() doesn't permit removal of the corresponding current code.
> > (Or did I miss a previous patch that did just that?)
> > 
> 
> I removed the trace_*_rcuidle() code, but this file still used it. I didn't
> realize that removing the trace_*_rcuidle() in this file would break other
> architectures.
> 
> This patch is a work around to not need to re-introduce the
> trace_*_rcuidle() code.

Works for me!

Acked-by: Paul E. McKenney <paulmck@kernel.org>

							Thanx, Paul

