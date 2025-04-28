Return-Path: <linux-mips+bounces-8862-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63959A9F7C9
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 19:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1CAF169852
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 17:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC6D28CF71;
	Mon, 28 Apr 2025 17:56:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7AC4AEE2;
	Mon, 28 Apr 2025 17:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745863006; cv=none; b=DXVtop7i1tQfr66C3iastjCq6DZJyptHKEkv22w01pXC30gnVOVLpku4ica/05UGGuFpmoV5GRAb+B+IDNZfPqMIKKCYTiLtLKO5DjauqdAvcY20r0BdaSmLvAQ6Kg42DRZ9pUm3bnGlW3rH8BGu4QKJ06oyGXxYABJozGqauFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745863006; c=relaxed/simple;
	bh=5jBCL2eS98IiGi6f4BGEsDcJUQXrxV+Po99NJPqxytQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Kud/eSt2mb1M88ILb8dOIpLTuYcDJPrN8J6c/qSBrig2gePbfyiWOXZIXCBblAsvZ/vqaHxho887fZzlqHGRGmyJsfnaPmsHM9DJ/u3+IPyMVOhywr/kM9Bqf+C32458XA/wGI48mFrq7oyYn/eOv2uxvwRMgFXMGBTCL9XF2Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id C168492009C; Mon, 28 Apr 2025 19:56:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id BA8AA92009B;
	Mon, 28 Apr 2025 18:56:40 +0100 (BST)
Date: Mon, 28 Apr 2025 18:56:40 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Marco Crivellari <marco.crivellari@suse.com>, 
    Huacai Chen <chenhuacai@kernel.org>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Frederic Weisbecker <frederic@kernel.org>, 
    Anna-Maria Behnsen <anna-maria@linutronix.de>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v7 2/2] MIPS: Move r4k_wait() to .cpuidle.text section
In-Reply-To: <aA9XNgh7qGRZ5HBY@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2504281547020.31828@angie.orcam.me.uk>
References: <20250403161143.361461-1-marco.crivellari@suse.com> <20250403161143.361461-3-marco.crivellari@suse.com> <CAAhV-H4dQ8hRfBm2JWmgMzYH5tuy4ph6hyOSXQBLOvtCQ+K9dQ@mail.gmail.com> <alpine.DEB.2.21.2504280426010.31828@angie.orcam.me.uk>
 <CAAhV-H4WTrYecBj0wev8AUi_of_qAnvHCk4heTU5P_3pMZv4fA@mail.gmail.com> <CAAofZF4J6H5jgqKu=KUowBrwfHJyGEzL5ThC_DOs-XPdgm497A@mail.gmail.com> <aA9XNgh7qGRZ5HBY@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Apr 2025, Thomas Bogendoerfer wrote:

> > If it sounds good also to Maciej, I will submit the new version with the
> > space before "ax" (and of course, the ".previous").
> 
> save your time, this is already applied and I won't rebase the branch
> just because of this minor bisection problem.

 For the record we actually have 121 cases without a space vs 4 with one, 
so formatting is a non-issue here in my view.

  Maciej

