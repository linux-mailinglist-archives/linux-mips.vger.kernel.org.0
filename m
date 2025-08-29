Return-Path: <linux-mips+bounces-10820-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D15B3B8E0
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 12:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46188A06AC0
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 10:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D167A30F819;
	Fri, 29 Aug 2025 10:31:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1373090FD;
	Fri, 29 Aug 2025 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463486; cv=none; b=MBOg+3sZLHJbj//rC4Zinde8WC0rOxzBBhyJvYvHCqJbwlbrIcmR13tKIakE7Q3fqhoE/AUEUd+DCVHkWdRg0H+jNQ5uoG5Hzsg3IXscxgjtDPVCinPTvPDOqI38+/J8nqgB8knfEL2ySTpKisxMU2bNJ/9qCFlvrvBL4azGrS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463486; c=relaxed/simple;
	bh=5O/OMg/yscyU4l71hz/hXav+xWxEkW7Z3EH8WoYSPCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnI4MkUWRkQBy5DVmJdcoQkSfORhEytrwMFrVIDxja3cQeMLmehBGeWKORA5Ue6ieeAuwUTKe/c3N/q2/PLr/NNkZoVLGHmK/L8dtP/jUK34uqdJBGpRBfvvTQdFZW40/G0akFgDloNyx0ZoZFch/oMVgXy8A87Jh595U2hpHbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1urwO1-0004Fa-00; Fri, 29 Aug 2025 12:31:13 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id D1062C08C5; Fri, 29 Aug 2025 12:22:40 +0200 (CEST)
Date: Fri, 29 Aug 2025 12:22:40 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Brian Masney <bmasney@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Alchemy: convert from round_rate() to
 determine_rate()
Message-ID: <aLF_cFrbfaouDQ8O@alpha.franken.de>
References: <20250810-mips-round-rate-v1-1-54e424c520dd@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-mips-round-rate-v1-1-54e424c520dd@redhat.com>

On Sun, Aug 10, 2025 at 06:30:23PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> appended to the "under-the-cut" portion of the patch.
> 
> Note that prior to running Coccinelle, alchemy_clk_aux_roundr() was
> renamed to alchemy_clk_aux_round_rate(). A few minor style cleanups
> were also done by hand.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> [...]
> https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/
> ---
>  arch/mips/alchemy/common/clock.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

